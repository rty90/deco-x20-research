"""Read-only conversion of Lua 5.1 LNUM chunks for static decompilation.

Original files are never modified. Instruction bytes are copied unchanged.
Only the LNUM header flag and tag-9 int32 constants are normalized.
"""
from pathlib import Path
import hashlib
import struct
import sys


def normalize(data):
    assert data[:12] == bytes.fromhex('1b4c75615100010404040804'), data[:12].hex()
    pos = 12
    out = bytearray(data[:11] + b'\0')
    functions = integers = 0
    code_hash = hashlib.sha256()

    def take(n):
        nonlocal pos
        assert 0 <= n <= len(data) - pos, (pos, n, len(data))
        value = data[pos:pos+n]
        pos += n
        return value

    def copy(n):
        value = take(n)
        out.extend(value)
        return value

    def count():
        value = struct.unpack('<I', copy(4))[0]
        assert value <= len(data), (pos, value)
        return value

    def string():
        copy(count())

    def function():
        nonlocal functions, integers
        functions += 1
        string()
        copy(12)  # line bounds and four one-byte function flags
        instructions = copy(count() * 4)
        code_hash.update(instructions)
        for _ in range(count()):
            tag = take(1)[0]
            if tag == 9:
                value = struct.unpack('<i', take(4))[0]
                out.extend(b'\x03' + struct.pack('<d', value))
                integers += 1
            else:
                out.append(tag)
                if tag == 0:
                    pass
                elif tag == 1:
                    copy(1)
                elif tag == 3:
                    copy(8)
                elif tag == 4:
                    string()
                else:
                    raise ValueError((pos, tag))
        for _ in range(count()):
            function()
        copy(count() * 4)
        for _ in range(count()):
            string()
            copy(8)
        for _ in range(count()):
            string()

    function()
    assert pos == len(data), (pos, len(data))
    return out, functions, integers, code_hash.hexdigest()


if __name__ == '__main__':
    source, target = map(Path, sys.argv[1:3])
    assert source.resolve() != target.resolve()
    data = source.read_bytes()
    converted, functions, integers, code_hash = normalize(data)
    target.parent.mkdir(parents=True, exist_ok=True)
    target.write_bytes(converted)
    print(f'{source.name}: source_sha256={hashlib.sha256(data).hexdigest()} '
          f'functions={functions} int_constants={integers} '
          f'unchanged_instructions_sha256={code_hash}')
