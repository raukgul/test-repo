#!/usr/bin/env bash
# PreToolUse (Edit|Write): reject stubs in source files. Exit 2 blocks the call.
exec python3 -I -c '
import json, re, sys

data = json.load(sys.stdin)
ti = data.get("tool_input", {})
path = ti.get("file_path", "")
text = ti.get("content") or ti.get("new_string") or ""

# Docs, tests, config of the harness and markdown may legitimately mention these words.
skip = re.search(r"(^|/)(docs|tests?|\.claude|\.git)/|(^|/)test_[^/]*$|_test\.[^/]+$|\.md$", path)
if skip:
    sys.exit(0)

pattern = re.compile(r"TODO|FIXME|XXX|HACK|not implemented|NotImplemented|unimplemented", re.I)
hits = [(i, l.strip()) for i, l in enumerate(text.splitlines(), 1) if pattern.search(l)]
if hits:
    print(f"Blocked: stub markers in {path}. No TODO/FIXME/XXX/HACK, no \"not implemented\". Finish the piece or tell the user it is not done.", file=sys.stderr)
    for i, l in hits[:5]:
        print(f"  line {i}: {l}", file=sys.stderr)
    sys.exit(2)
'
