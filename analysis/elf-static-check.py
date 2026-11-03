"""Read-only ELF checks for the supplied Deco X20 v3 firmware image.

Uses only Python's standard library. Does not load/execute firmware code, make
network requests, modify the rootfs, or extract credentials. Addresses below
are tied to the recorded SHA-256 values; this is not a general disassembler.
"""

import argparse
import hashlib
import json
import struct
from pathlib import Path


class ELF32:
    def __init__(self, path):
        self.data = path.read_bytes()
        header = struct.unpack_from('<16sHHIIIIIHHHHHH', self.data)
        if header[0][:6] != b'\x7fELF\x01\x01' or header[2] != 8:
            raise ValueError('Expected ELF32 little-endian MIPS')
        self.ph = [struct.unpack_from('<IIIIIIII', self.data,
                   header[5] + i * header[9]) for i in range(header[10])]
        dyn = next(p for p in self.ph if p[0] == 2)
        self.tags = dict(struct.unpack_from('<II', self.data, i)
                         for i in range(dyn[1], dyn[1] + dyn[4], 8))
        self.symbols = {}
        for i in range(self.tags[0x70000011]):
            n, v, size, info, other, index = struct.unpack_from(
                '<IIIBBH', self.data, self.offset(self.tags[6]) + 16 * i)
            if n:
                name = self.string(self.tags[5] + n)
                self.symbols[name] = {'address': v, 'size': size, 'index': index}

    def offset(self, address):
        for p in self.ph:
            if p[0] == 1 and p[2] <= address < p[2] + p[4]:
                return p[1] + address - p[2]
        raise ValueError(f'Unmapped address {address:#x}')

    def word(self, address):
        return struct.unpack_from('<I', self.data, self.offset(address))[0]

    def string(self, address):
        offset = self.offset(address)
        end = self.data.index(0, offset)
        return self.data[offset:end].decode('ascii')

    def bal_target(self, address):
        word = self.word(address)
        if word >> 26 != 1 or (word >> 16) & 31 != 17:
            raise ValueError('Expected BAL/BGEZAL instruction')
        value = word & 65535
        signed = value if value < 32768 else value - 65536
        return address + 4 + 4 * signed

    def got_load_target(self, address):
        word = self.word(address)
        if word >> 26 != 35 or (word >> 21) & 31 != 28:
            raise ValueError('Expected LW through GP')
        value = word & 65535
        signed = value if value < 32768 else value - 65536
        return self.word(self.symbols['_gp']['address'] + signed)

    def opcode_table(self, address):
        entries = []
        for i in range(1024):
            entry = [self.word(address + 16 * i + j) for j in (0, 4, 8, 12)]
            if entry[0] == 0:
                return entries
            entries.append(entry)
        raise ValueError('Unterminated opcode table')


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('rootfs', type=Path, nargs='?', default=Path('F:/fw/x20_root'))
    args = parser.parse_args()
    expected = {
        'usr/bin/tmpsvr': '60c6eb19079af64de9d420355a94a93e75241b3190537b139d6dc52bc594a598',
        'usr/bin/tmpcli': 'f7e14c57d9f6a81b3a9f65454eff4b396eadb17f063c8d953c1da0397ecb45db',
        'usr/bin/tmp-luci': '08ee3bb84c39c1df9f7e43aabfa1f0f7a71757e9c066714bc157bbadf2730f84',
        'usr/lib/libtmpv2.so': 'b7d7cddd067c9fc4b1edf8b365c05502ed433780016cd0f8e1588bc54c8ccec0',
    }
    actual = {name: hashlib.sha256((args.rootfs / name).read_bytes()).hexdigest()
              for name in expected}
    if actual != expected:
        raise SystemExit('Input hash mismatch: addresses must not be reused for another image.')
    server = ELF32(args.rootfs / 'usr/bin/tmpsvr')
    client = ELF32(args.rootfs / 'usr/lib/libtmpv2.so')
    relay = server.symbols['relay_run']['address']
    if server.bal_target(0x4059b0) != relay or server.bal_target(0x408e84) != relay:
        raise SystemExit('Unexpected relay call target')
    # a1 is the operation table argument. The TMP ADDIU is in the BAL delay slot.
    checks = {
        0x40599c: 0x3c050042, 0x4059b4: 0x24a5fa80,
        0x408e70: 0x3c050042, 0x408e7c: 0x24a51a10,
    }
    if any(server.word(pc) != value for pc, value in checks.items()):
        raise SystemExit('Unexpected table argument instructions')
    tcp = server.opcode_table(0x41fa80)
    udp = server.opcode_table(0x421a10)
    requested = next(e for e in tcp if e[0] == 0xc505)
    if client.got_load_target(0x4bb4) != client.symbols['ssh_channel_open_forward']['address']:
        raise SystemExit('Unexpected SSH forwarding callee')
    # Remote host and port are a1/a2, per the libssh public API.
    ssh_checks = {0x4bc0: 0x24a5817c, 0x4bc4: 0x24064e22,
                  0x4bc8: 0x0320f809, 0x4f90: 0x24050002,
                  0x4fa0: 0x27a60020}
    if any(client.word(pc) != value for pc, value in ssh_checks.items()):
        raise SystemExit('Unexpected SSH argument instructions')
    result = {
        'scope': 'Offline static observations only; no firmware execution or device traffic',
        'sha256': actual,
        'server_symbols': {n: server.symbols[n] for n in
                           ['tmp_server_init', 'tdp_server_init', 'tmp_trans_feed',
                            'tdp_trans_feed', 'relay_run']},
        'shared_relay': {'address': hex(relay), 'tmp_call': '0x4059b0',
                         'tdp_call': '0x408e84',
                         'tmp_table': '0x41fa80', 'tdp_table': '0x421a10'},
        'tables': {'tmp_entry_count': len(tcp), 'tdp_entry_count': len(udp),
                   'requested_opcode': '0xc505',
                   'tmp_mapping': [server.string(v) for v in requested[1:]],
                   'tdp_contains_requested_opcode': any(e[0] == 0xc505 for e in udp)},
        'fallback_runtime_path': server.string(0x40f6e8),
        'protocol_environment': {'tmp': server.string(0x40c58c),
                                 'tdp': server.string(0x40f168)},
        'client_ssh': {'forward_call': '0x4bc8',
                       'remote_host': client.string(0x817c), 'remote_tcp_port': 20002,
                       'default_outer_port_string': client.string(0x82a0),
                       'runtime_outer_port_override': client.string(0x8248),
                       'port_option_call': '0x4f9c', 'port_option_number': 2},
        'limitations': ['No assertion about runtime listeners or AP-mode reachability',
                        'No assertion that static table absence excludes runtime RE-only dispatch',
                        'No credential extraction; no other opcode mappings are printed'],
    }
    print(json.dumps(result, ensure_ascii=False, indent=2))


if __name__ == '__main__':
    main()
