# TDP (TP-Link Discovery Protocol) over UDP 20002 — X20 v3 fw 1.1.8

Reverse-engineered from `tmpsvr` (MIPS32 LE, SHA-256
`60c6eb19079af64de9d420355a94a93e75241b3190537b139d6dc52bc594a598`) +
`lib/sync-server/scripts/probe`. All offsets are UDP payload offsets.

## Frame layout (16-byte header + body)

```
 0      1      2 3        4 5        6      7      8..11        12..15      16..
+------+------+----------+----------+------+------+------------+-----------+--------+
| ver  | b1   | opcode   | bodylen | b6   | stat | opaque_id  | CRC32     | body   |
| =2   |  -   | BE16     | BE16     |  -   | =0   | BE32 echo | BE32      | JSON   |
+------+------+----------+----------+------+------+------------+-----------+--------+
```

- Header byte order: network (big-endian); MIPS host code byte-swaps after CRC.
- Length check: `body_length + 16 == recvfrom() return`, buffer cap 1024 B
  (body ≤ 1008 B).
- Status byte must be 0 for requests; responses echo `opaque_id`.
- CRC covers the **entire UDP payload** with bytes 12..15 temporarily replaced
  by `5A 6B 7C 8D` (not zeroed!). zlib-compatible CRC-32/ISO-HDLC.

## Static opcode table (UDP side)

| opcode | controller/form | auth reached? |
|--------|-----------------|---------------|
| 0x0001 | discover / read | none — full device JSON |
| 0xC401 | discover / sync_config | group_hid CRC + AES secret |
| 0xC402 | discover / sync_config_emmc | current-group only |
| 0xD401 | (referenced, no body in static Lua) | whitelist-gated historically |
| 0xD402 | discover / sync_master_check | group key + preconfig gating |

Runtime opcodes are a *routing* table (`/var/run/lookup_op*` — which node
handles what), **not** new handlers; TCP/TMP has ~503 opcodes but listens on
127.0.0.1:20002 only (SSH-forwarded between nodes).

## sync_config (0xC401) auth chain

```
outer: params.group_hid == crc32(current_gid) or crc32(default_gid)
       (crc32 = nixio.bin.crc32, signed int32 in JSON)
inner: params.secret = openssl enc -aes-256-cbc -k <group.key> -a -A
       decrypt → JSON → group_id must string-equal selected gid
```

- Default group material: gid + RSA-512 key from `product-info` / decrypted
  `fw_data/profile` (AES-256-CBC, built-in key `2EB38F7E...`, IV `360028C9...`,
  zlib-compressed XML inside).
- Firmware OpenSSL is **1.0.2d** — EVP_BytesToKey(MD5) KDF. Modern OpenSSL 3.x
  produces incompatible ciphertext; use 1.0.2 or a compatible KDF.
- Post-decrypt errors are indistinguishable ("group id mismatched" covers
  decrypt failure, JSON failure, gid mismatch) → no padding oracle.

## discover/read (0x0001) response (no auth)

```json
{"result":{"mac":"...","tmp_port":[20001],"hardware_version":"3.0",
 "group_name":"<b64>","owner":"<md5-ish>","device_id":"...","group_id":"<md5>",
 "role":"master|slave","channel_2g":"...","device_model":"X20",
 "factory_default":false},"error_code":0}
```

## Probe cadence (sync-server)

- normal interval 600 s; boost 10 s × up to 12 rounds (global budget)
- boost triggers include link-state changes (awnd) → 1905.1 announcement
  injection reliably provokes boost mode
- probe is always sent to the **br-lan broadcast** address; replies must go to
  the request's source port with echoed opaque_id

## Reference client

`tools/tdp_lib.py` (build/parse/send), `tools/probe_responder.py` (virtual
unbound node), `tools/inject1905.py` (L2 announcement forge).
