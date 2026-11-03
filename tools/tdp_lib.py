#!/usr/bin/env python3
"""TDP (UDP 20002) frame builder/parser for TP-Link Deco research.

Usage:
  python tdp_lib.py discover --target <ip>
  python tdp_lib.py raw --target <ip> --opcode 0xC401 --json '{"params":{...}}'

Frame format: see docs/tdp-protocol.md. Requires no third-party deps.
"""
import argparse, json, socket, struct, sys, zlib

CRC_MAGIC = bytes.fromhex("5a6b7c8d")  # CRC field placeholder during compute


def build(opcode: int, body: bytes = b"", opaque_id: int = 0, status: int = 0) -> bytes:
    hdr = struct.pack("!BBHHBBII", 2, 0, opcode, len(body), 0, status, opaque_id, 0)
    pkt = hdr + body
    crc = zlib.crc32(pkt[:12] + CRC_MAGIC + pkt[16:], 0) & 0xFFFFFFFF
    return pkt[:12] + struct.pack("!I", crc) + pkt[16:]


def parse(pkt: bytes) -> dict:
    if len(pkt) < 16:
        raise ValueError("short frame")
    ver, b1, op, blen, b6, status, oid, crc = struct.unpack_from("!BBHHBBII", pkt)
    calc = zlib.crc32(pkt[:12] + CRC_MAGIC + pkt[16:], 0) & 0xFFFFFFFF
    return {
        "version": ver, "opcode": op, "body_length": blen, "status": status,
        "opaque_id": oid, "crc_ok": crc == calc,
        "length_ok": len(pkt) == 16 + blen,
        "body": pkt[16:16 + blen],
    }


def transact(target: str, port: int, opcode: int, body: bytes, timeout: float = 4.0):
    s = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
    s.settimeout(timeout)
    s.sendto(build(opcode, body), (target, port))
    try:
        pkt, addr = s.recvfrom(4096)
        return parse(pkt)
    finally:
        s.close()


def main():
    ap = argparse.ArgumentParser()
    sub = ap.add_subparsers(dest="cmd", required=True)

    d = sub.add_parser("discover", help="unauthenticated discover/read (0x0001)")
    d.add_argument("--target", required=True)
    d.add_argument("--port", type=int, default=20002)

    r = sub.add_parser("raw", help="send arbitrary TDP frame")
    r.add_argument("--target", required=True)
    r.add_argument("--port", type=int, default=20002)
    r.add_argument("--opcode", required=True, help="e.g. 0xC401")
    r.add_argument("--json", default="{}")

    a = sub.add_parser("parse", help="parse hex frame from stdin")
    args = ap.parse_args()

    if args.cmd == "discover":
        res = transact(args.target, args.port, 0x0001, b"{}")
        print(json.dumps({"meta": {k: v for k, v in res.items() if k != "body"},
                          "payload": res["body"].decode(errors="replace")}, indent=2))
    elif args.cmd == "raw":
        res = transact(args.target, args.port, int(args.opcode, 0), args.json.encode())
        print(json.dumps({k: (v.decode(errors="replace") if k == "body" else v)
                          for k, v in res.items()}, indent=2))
    elif args.cmd == "parse":
        pkt = bytes.fromhex(sys.stdin.read().strip())
        print(json.dumps({k: (v.hex() if k == "body" else v)
                          for k, v in parse(pkt).items()}, indent=2))


if __name__ == "__main__":
    main()
