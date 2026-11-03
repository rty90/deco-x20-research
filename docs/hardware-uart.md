# X20 v3 UART cheat-sheet

| Item | Value |
|---|---|
| FCC ID | `2AXJ4X20V3` (grant 2022-03-13, TP-Link Corporation Limited) |
| SoC | MediaTek MT7621AT |
| Adapter | USB-TTL @ **3.3V** (CH340G fine; verify TX level, not just VCC pin) |
| Pads | TP1=TX, TP2=RX, TP3=VCC (leave floating), TP4=GND |
| Serial | 115200 8N1, HW/SW flow control off |
| U-Boot break | spam `t` (or `4`) from power-on |
| Safe bring-up | round 1: GND+adapterRX→TP1 only (listen); then add adapterTX→TP2 |
| Reference port | github.com/openwrt/openwrt PR #16581 (commit 66ebcd38) |

## Boot-day checklist

1. Photograph bottom label (VER 3.x + FCC ID) for the record.
2. Open case (expect clips; X60 notes: 4 top clips in, 2 screws, slide out).
3. Locate TP1–TP4 silkscreen; connect per table.
4. Capture full boot log (save to file BEFORE typing).
5. Cold boot spamming `t`; on prompt run `help`, `version`, `printenv`
   (record bootcmd/bootargs — do NOT `saveenv`).
6. Report env back for the bootargs-patch plan; OpenWrt initramfs via
   `tftpboot`+`bootm` only after env is understood.

## Post-root shopping list (on-device)

```sh
ubus call sync list '{}'        # devlist incl. our virtual node (did it land?)
uci show accountmgnt            # cloud account + shadow
cat /tmp/group-info*            # runtime group material
strings /dev/mtd* | grep -i gid # partition survey
dd if=/dev/mtdX of=/tmp/parts   # export group-info for offline analysis
```
