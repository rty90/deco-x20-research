# Campaign report — home mesh audit (sanitized)

**Scope**: own/authorized equipment only. Retail Deco X20 v3 ×2 (fw 1.1.8
Build 20240119), ISP gateway, LAN clients. All IPs below are RFC1918 and
retained for coherence; third-party identifiers (neighbor SSIDs/MACs) removed.

## Timeline & phases

1. **Discovery** — full /24 sweep, MAC OUI resolution, service fingerprinting:
   16 devices mapped; Deco units expose 80/443 (WebUI), 20001 (dropbear),
   UDP 20002 (tmpsvr/TDP); port 22 appears only during compat windows.
2. **Web UI** — login protocol fully reversed (RSA keys → auth handshake →
   AES+RSA-signed login). Password family, defaults, `test` account: all
   rejected; persistent per-endpoint lockout confirmed (reboot-surviving uci).
3. **Firmware** — official image unpacked (JFFS2 → full rootfs); QEMU chroot
   lab runs lua/dropbear/tmpsvr for offline experiments; profile decrypted
   with built-in AES key → default gid + RSA-512 key extracted.
4. **Crypto** — dropbear host key (RSA-512, shared by both units) factored via
   CADO-NFS (client/server run, 164M relations); host key ≠ group key — auth
   fails because authorized identity is the runtime group key.
5. **TDP** — protocol reversed end-to-end (see docs/tdp-protocol.md);
   discover/read unauthenticated; default-group crypto chain validated to the
   business layer ("bind not reply to unbind"); d402 injection chain mapped
   but gated.
6. **1905.1** — vendor announcement format recovered; injection provokes 30×
   probe boost; virtual-node responder built (correct response envelope:
   error_code 0 + result.secret, source-port reply, opaque_id echo).
7. **Adjacent surfaces** — gateway MQTT (mosquitto 2.0.14, unauth read of
   OpenSync telemetry incl. client tables), JWT branch probe (CVE-2026-19505
   not applicable — signature verified correctly on this build), nmap vuln
   scripts (two false positives on custom 404s, manually disproven).

## Blocking analysis (why no root)

All privileged operations anchor on the runtime group key (fresh RSA at mesh
creation, encrypted partition, dual-use sync+SSH). Remote extraction paths:
App-mediated join (no operator), carrier preconfig (absent in retail),
factorization (host key only). **Dead end is by design, not oversight.**

## Findings register

See README table. Items 1–3 are vendor-reportable; draft texts pending.

## Next phase (hardware)

Second-hand X20 v3 + CH340 (3.3V) → UART (TP1-TP4, 115200, spam `t`) →
U-Boot → OpenWrt initramfs in RAM (PR #16581) → dump group-info → replay.

## Artifacts

- `analysis/` — static-analysis markdown + decompiled Lua controllers
- `tools/` — sanitized, parameterized scripts
- Keys/real network fingerprints intentionally **not** committed.
