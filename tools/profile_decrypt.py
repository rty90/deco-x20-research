#!/usr/bin/env python3
"""Decrypt TP-Link firmware profile (fw_data/profile) with the built-in key.

Pipeline: AES-256-CBC -> PKCS#7 unpad -> zlib -> XML text.
Key/IV are static per firmware family (extracted from luci.model.crypto).
"""
import argparse, zlib
from Crypto.Cipher import AES

BUILTIN_KEY = bytes.fromhex("2EB38F7EC41D4B8E1422805BCD5F740BC3B95BE163E39D67579EB344427F7836")
BUILTIN_IV = bytes.fromhex("360028C9064242F81074F4C127D299F6")


def decrypt(profile: bytes) -> str:
    plain = AES.new(BUILTIN_KEY, AES.MODE_CBC, BUILTIN_IV).decrypt(profile)
    pad = plain[-1]
    if 1 <= pad <= 16 and all(b == pad for b in plain[-pad:]):
        plain = plain[:-pad]
    for off in (0, 2):  # tolerate zlib header variants
        try:
            return zlib.decompress(plain[off:]).decode("utf-8", errors="replace")
        except zlib.error:
            continue
    raise ValueError("zlib stage failed")


if __name__ == "__main__":
    ap = argparse.ArgumentParser()
    ap.add_argument("--profile", required=True, help="path to fw_data/profile")
    ap.add_argument("-o", "--out", help="write decoded XML here (default stdout)")
    args = ap.parse_args()
    text = decrypt(open(args.profile, "rb").read())
    if args.out:
        open(args.out, "w", encoding="utf-8").write(text)
        print(f"wrote {len(text)} chars -> {args.out}")
    else:
        print(text)
