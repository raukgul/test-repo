---
description: Start the session. Read the handoff and the board, show where things are, ask which entry point to take. Do nothing else first.
---
1. Read docs/RESUME.md and docs/STATUS.md in full.
2. Run `git status --short` and `git log --oneline -5`. If the working tree is dirty or HEAD differs from what RESUME.md describes, say so first: the note may be stale.
3. If the date on line 1 of docs/RESUME.md is older than the last commit date, the previous session ended without /wrap. Offer to rebuild RESUME.md from `git log` and `git diff` before anything else.
4. Print the board: the STATUS.md table as-is, then RESUME.md's "State in one line", then its "Next session" list.
5. Ask me which entry point to take, using the lettered options from the Resume Prompt.
6. Take no other action until I answer.
