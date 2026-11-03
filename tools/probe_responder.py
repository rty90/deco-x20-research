#!/usr/bin/env python3
"""Virtual unbound-node responder for Deco probe (TDP sync_config broadcasts).

Answers every 0xC401 probe from the mesh master with a default-group-encrypted
"unbound X20" identity, emulating a factory-state satellite candidate.

Envelope requirements (learned the hard way):
  - reply to the request's SOURCE PORT (not 20002)
  - echo the request's opaque_id in the response header
  - header status = 0; JSON body = {"error_code": 0, "result": {"secret": ...}}
  - secret = OpenSSL-1.0.2 EVP_BytesToKey(MD5) AES-256-CBC of the node-info
    JSON with the DEFAULT GROUP KEY as -k passphrase
  - decrypted node-info must contain at least: group_id, config_version, ip,
    device_id, firmware_ver

Usage:
  python probe_responder.py --listen-port 20002 \
      --default-gid <uuid> --default-key <base64-key> \
      --my-mac AA:BB:CC:DD:EE:FF --my-ip <ip> [--openssl-bin openssl]
"""
import argparse, base64, json, socket, struct, subprocess, sys, time, zlib

CRC_MAGIC = bytes.fromhex("5a6b7c8d")


def build_response(opcode: int, body: bytes, echo_oid: int) -> bytes:
    hdr = struct.pack("!BBHHBBII", 2, 0, opcode, len(body), 0, 0, echo_oid, 0)
    pkt = hdr + body
    crc = zlib.crc32(pkt[:12] + CRC_MAGIC + pkt[16:], 0) & 0xFFFFFFFF
    return pkt[:12] + struct.pack("!I", crc) + pkt[16:]


def openssl_encrypt(plaintext: str, passphrase: str, openssl_bin: str) -> str:
    """Firmware uses OpenSSL 1.0.2 EVP_BytesToKey; a 1.0.2 binary or
    compatible KDF is required (OpenSSL 3.x default SHA-256 KDF differs)."""
    proc = subprocess.run(
        [openssl_bin, "enc", "-aes-256-cbc", "-k", passphrase, "-a", "-A"],
        input=plaintext.encode(), capture_output=True, timeout=15)
    if proc.returncode != 0:
        raise RuntimeError(proc.stderr.decode(errors="replace"))
    return proc.stdout.decode().strip()


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--listen-port", type=int, default=20002)
    ap.add_argument("--default-gid", required=True, help="default group UUID string")
    ap.add_argument("--default-key", required=True, help="default group key (base64)")
    ap.add_argument("--my-mac", required=True)
    ap.add_argument("--my-ip", required=True)
    ap.add_argument("--device-id", default="deadbeef" * 4)
    ap.add_argument("--firmware", default="1.1.8 Build 20240119 Rel.37701")
    ap.add_argument("--openssl-bin", default="openssl")
    args = ap.parse_args()

    node_info = json.dumps({
        "group_id": args.default_gid, "device_id": args.device_id,
        "device_model": "X20", "sync_version": 1, "role": "UNBIND",
        "mac": args.my_mac, "ip": args.my_ip, "config_version": 0,
        "firmware_ver": args.firmware, "pid": "",
    })
    secret = openssl_encrypt(node_info, args.default_key, args.openssl_bin)
    resp_body = json.dumps({"error_code": 0, "result": {"secret": secret}}).encode()

    s = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
    s.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)
    s.bind(("0.0.0.0", args.listen_port))
    s.settimeout(5)
    print(f"responder up on :{args.listen_port} (secret {len(secret)}B)", flush=True)

    n = 0
    while True:
        try:
            data, addr = s.recvfrom(4096)
            if len(data) < 16:
                continue
            ver, _, op, blen, _, st, oid, _ = struct.unpack_from("!BBHHBBII", data)
            if op == 0xC401 and blen > 100:  # a probe, not our own chatter
                s.sendto(build_response(0xC401, resp_body, oid), addr)
                n += 1
                print(f"{time.strftime('%H:%M:%S')} replied #{n} -> {addr[0]}:{addr[1]}", flush=True)
        except socket.timeout:
            pass
        except KeyboardInterrupt:
            print(f"\nstopped after {n} replies"); break


if __name__ == "__main__":
    main()
