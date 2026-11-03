# IEEE 1905.1 vendor frames (OUI 00:1d:0f) — neighbor_discover.ko / awnd

X20 v3 emits vendor CMDUs at ~1 frame/s per node (alternating
01:80:c2:00:00:13 multicast and ff:ff:ff:ff:ff:ff broadcast).

## Frame structure

```
Ethernet: dst=01:80:c2:00:00:13 / src=<node MAC> / ethertype 0x893a
CMDU (8B): 00 00 | 0004 (Vendor Specific) | MID=0 | flags=0xc0
Outer TLV: type 0x0b, len BE16, then OUI 00:1d:0f + subtype 0x01 + inner TLVs
Inner TLVs: type u8 + len u16 BE + value   (end marker: type 0x00, len 0)
CMDU total: 109 B for the standard announcement; EOM 00 00 00
```

## Inner TLV map (recovered from kernel module sender @ .text+0x31f0)

| type | len | field (from awnd log strings) | notes |
|------|-----|-------------------------------|-------|
| 0x0a | 6 | MAC (node identity) | |
| 0x03 | 1 | net_type | |
| 0x04 | 1 | weight | |
| 0x05 | 1 | level | |
| 0x06 | 6 | net_mac | |
| 0x07 | 16 | group identifier (raw bytes) | matches MD5-form group_id from discover |
| 0x0b | 4 | lanip | big-endian |
| 0x0c | 1 | server_detected | |
| 0x0d | 4 | server_touch_time | big-endian |
| 0x0f | 4 | dns | big-endian |
| 0x08 | 2 | ? | **little-endian value** |
| 0x09 | 2 | ? | **little-endian value** |
| 0x0e | 1 | mesh_type | |
| 0x00 | 0 | end | |

Gotchas: length fields are BE but 0x08/0x09 values are LE-written; MID is
always 0 (don't dedupe by MID alone); subtype 0x02 exists with a different
layout.

## Receiver path & observations

Kernel module `neighbor_discover.ko` filters ethertype 0x893a + CMDU 0x0004 +
OUI + subtype before parsing inner TLVs (entry .text+0x2978). Injecting forged
announcements (scapy, 2 s cadence) with a phantom node MAC/IP:

- master node probe frequency jumped 8 min → 16 s (30×, boost budget)
- sustained answering of probes is possible (46+ replies logged)
- no observable acceptance/ACK distinguishes "recorded in devlist" from
  "ignored" without App/ubus access

## Parser/forger

`tools/inject1905.py` (announcement forger), Wireshark display filter
`ieee1905` for passive analysis.
