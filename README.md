# Deco X20 v3 Home Mesh Research

Authorized security audit of my own home network: TP-Link Deco X20 (hardware v3,
firmware 1.1.8 Build 20240119) mesh system, plus adjacent ISP gateway analysis.

**Status: software attack surface fully exhausted; root blocked by design.
Hardware (UART) phase pending device arrival.**

## Repo layout

```
docs/        Protocol documents & campaign report (sanitized)
analysis/    Static-analysis notes & decompiled Lua (from offline review)
tools/       Sanitized, parameterized research scripts
```

## Key findings (TL;DR)

| # | Finding | Severity |
|---|---------|----------|
| 1 | UDP 20002 `discover/read` (opcode 0x0001) returns full device inventory **without authentication**: MAC, owner hash, group_id, channels, role, firmware | Info disclosure |
| 2 | Default group key = **RSA-512** private key embedded verbatim in the firmware `product-info` and (encrypted) profile; factorable in hours on a laptop (corroborates CVE-2026-15469 family for X20) | High |
| 3 | Node join flow (`lib/sync-server/scripts/request`) SSH client **skips `ssh_is_server_known()`** in password mode — TOFU-style trust on the mesh control channel | Medium |
| 4 | `d402/sync_master_check` → `pre_config_kick_mac()` concatenates MAC fields into `/bin/sh -c` **without validation**; reachable in principle but gated by group key + non-empty preconfig list (retail builds ship empty) | Conditional injection |
| 5 | IEEE 1905.1 vendor frames (OUI 00:1d:0f) broadcast topology + group identifier in cleartext at ~1 frame/s; injecting forged announcements boosts master probe frequency 30x (discovery-layer spoofing works) | Medium |
| 6 | Web UI login lockout (`luci-attempts`) is per-endpoint persistent (survives reboot); `form=login` returns 403 after ~5 failures while `keys`/`auth` stay 200 | DoS-ish, low |

## What blocked root (the interesting part)

Everything management-related anchors to the **runtime group key** — a fresh
RSA key generated at mesh creation (`group-key` init script → `dropbearkey`),
stored in the encrypted `group-info` flash partition, and doubling as both the
sync AES passphrase and the SSH client identity (`load_group_key()` loads it as
dropbear key + authorized material).

Extraction paths all dead-end remotely:
- The 512-bit key we factored is the **host** key, not the group key.
- Join flow (which distributes the group key over SSH) requires either the App
  owner tapping "add device" or a carrier preconfig (`PRECONF_GID`) that retail
  units do not carry.
- `sync_config` inner check rejects default-group requests once a current group
  exists ("bind not reply to unbind").

**Conclusion: next step is physical (UART on a second-hand unit) → dump
`group-info` partition → replay knowledge against live units.**

## Hardware phase cheat-sheet

| Item | Value |
|---|---|
| FCC ID | `2AXJ4X20V3` (TP-Link Corp, 2022-03-13, SoC: MT7621AT) |
| UART pads | TP1=TX, TP2=RX, TP3=VCC(leave floating), TP4=GND |
| Levels | 3.3V TTL, 115200 8N1, no flow control |
| U-Boot break | spam `t` or `4` during boot |
| Reference port | openwrt/openwrt PR #16581 (initramfs via tftpboot+bootm) |

## Tooling usage

All scripts are parameterized — no real IPs/MACs/keys baked in:

```bash
# Enumerate any Deco on the LAN (no auth needed)
python tools/discover.py --target 192.168.0.222

# Build/send arbitrary TDP frames
python tools/tdp_lib.py --help

# Decrypt firmware profile (built-in AES key)
python tools/profile_decrypt.py --profile fw_data/profile

# Monitor gateway MQTT telemetry
python tools/mqtt_monitor.py --host 192.168.0.1
```

## Ethics / scope

All testing performed on equipment I own or have authorization to test
(rented property, own devices). Neighbor-identifying data (nearby SSIDs/MACs)
is excluded from this repo. Vendor disclosure for findings 1–3 pending
drafting.
