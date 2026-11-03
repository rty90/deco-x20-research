"""Read Lua 5.1 LNUM prototype offsets and closure bindings, without executing Lua.

Does not print constant values or credentials. Offsets refer to the original file.
"""
import argparse
import hashlib
import json
import struct
from pathlib import Path


def inspect(path):
    data = path.read_bytes()
    if data[:12] != bytes.fromhex('1b4c75615100010404040804'):
        raise ValueError('Expected this firmware Lua 5.1 LNUM header')
    pos = 12
    rows = []

    def take(n):
        nonlocal pos
        if not 0 <= n <= len(data) - pos:
            raise ValueError(('Truncated chunk', pos, n))
        result = data[pos:pos+n]
        pos += n
        return result

    def number():
        return struct.unpack('<I', take(4))[0]

    def string():
        take(number())

    def function(name):
        offset = pos
        string()
        first, last = number(), number()
        nups, params, vararg, stack = take(4)
        count = number()
        code_offset = pos
        code = struct.unpack('<' + 'I' * count, take(4 * count))
        for _ in range(number()):
            tag = take(1)[0]
            if tag == 0:
                pass
            elif tag == 1:
                take(1)
            elif tag == 3:
                take(8)
            elif tag == 4:
                string()
            elif tag == 9:
                take(4)
            else:
                raise ValueError(('Unknown constant type', tag, pos))
        child_count = number()
        children = [function(f'{name}/f{i}') for i in range(child_count)]
        take(4 * number())
        for _ in range(number()):
            string()
            take(8)
        for _ in range(number()):
            string()
        closures = []
        pc = 0
        while pc < len(code):
            word = code[pc]
            if word & 63 == 34 and (word >> 14) & 511 == 0:
                # Lua 5.1 SETLIST with C=0 owns the following raw data word.
                pc += 2
                continue
            if word & 63 == 36:  # OP_CLOSURE, Lua 5.1
                a, bx = (word >> 6) & 255, word >> 14
                child = children[bx]
                bindings = []
                for j in range(child['upvalues']):
                    declaration = code[pc + 1 + j]
                    op, b = declaration & 63, (declaration >> 23) & 511
                    if op not in (0, 4):
                        raise ValueError(('Bad closure declaration', name, pc, op))
                    bindings.append({'upvalue': j,
                                     'from': 'parent_register' if op == 0 else 'parent_upvalue',
                                     'index': b})
                closures.append({'pc_1based': pc + 1,
                                 'file_offset': hex(code_offset + 4 * pc),
                                 'register': a, 'child': child['function'],
                                 'bindings': bindings})
                pc += child['upvalues']
            pc += 1
        row = {'function': name, 'prototype_offset': hex(offset),
               'code_offset': hex(code_offset), 'instruction_count': count,
               'upvalues': nups, 'source_line_metadata': [first, last],
               'closures': closures}
        rows.append(row)
        return row

    function('main')
    if pos != len(data):
        raise ValueError(('Trailing bytes', pos, len(data)))
    return {'path': str(path), 'sha256': hashlib.sha256(data).hexdigest(),
            'file_size': len(data), 'complete_parse': True,
            'functions': sorted(rows, key=lambda r: int(r['prototype_offset'], 16))}


if __name__ == '__main__':
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('source', type=Path)
    parser.add_argument('--select', action='append')
    args = parser.parse_args()
    report = inspect(args.source)
    if args.select:
        report['functions'] = [r for r in report['functions'] if r['function'] in args.select]
    print(json.dumps(report, ensure_ascii=False, indent=2))
