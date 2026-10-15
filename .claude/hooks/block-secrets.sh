#!/usr/bin/env bash
# PreToolUse (Edit|Write|Bash): reject writing or staging secrets. Exit 2 blocks the call.
exec python3 -I -c '
import json, re, sys

data = json.load(sys.stdin)
ti = data.get("tool_input", {})

SECRET_FILE = re.compile(
    r"(^|/)(\.env(\..*)?|terraform\.tfstate(\.backup)?|[^/]*\.tfvars|[^/]*\.pem|[^/]*\.key|"
    r"[^/]*service[-_]?account[^/]*\.json|credentials[^/]*\.json|application_default_credentials\.json|id_rsa|id_ed25519)$"
)
ALLOWED = re.compile(r"\.(example|sample|template)$")
SECRET_CONTENT = re.compile(
    r"-----BEGIN [A-Z ]*PRIVATE KEY-----"
    r"|\"type\"\s*:\s*\"service_account\""
    r"|AKIA[0-9A-Z]{16}"
    r"|AIza[0-9A-Za-z_\-]{35}"
    r"|gh[pousr]_[0-9A-Za-z]{36,}"
)

def block(why):
    print(f"Blocked: {why}. Use Secret Manager, GitHub Actions secrets or workload identity instead.", file=sys.stderr)
    sys.exit(2)

if "command" in ti:
    cmd = ti["command"]
    if SECRET_CONTENT.search(cmd):
        block("command contains what looks like a credential")
    if re.search(r"\bgit\s+(add|commit\s+.*-a)", cmd):
        for tok in re.split(r"\s+", cmd):
            tok = tok.strip("\"\x27")
            if SECRET_FILE.search(tok) and not ALLOWED.search(tok):
                block(f"staging a secret-like file ({tok})")
else:
    path = ti.get("file_path", "")
    text = ti.get("content") or ti.get("new_string") or ""
    if SECRET_FILE.search(path) and not ALLOWED.search(path):
        block(f"{path} is a secret-like file; write a .example version instead")
    if SECRET_CONTENT.search(text):
        block(f"content for {path} looks like a credential")
'
