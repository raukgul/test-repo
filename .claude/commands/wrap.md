---
description: End the session. Rewrite docs/RESUME.md in full and update the touched docs/STATUS.md rows. Owns the structure of both files.
---
1. Read the date on line 1 of docs/RESUME.md. Run `git status --short`, `git log --oneline --since="<that date>"`, and the test command from CLAUDE.md if one is defined.
2. If anything is half done, ask me at most two questions to pin the exact file, location, and next command. Do not guess. Never write "was in the middle of".
3. Rewrite docs/RESUME.md COMPLETELY (replace, never append) with exactly this structure. Keep every heading even when its content is "Nothing." The first line must be honest: name red tests, uncommitted files, and anything broken before anything that went well.

   # Resume YYYY-MM-DD
   **State in one line:** <honest>

   ## Resume Prompt
   <a fenced block under 25 lines: tell the next session to read this file and STATUS.md first; restate the two to four facts it would otherwise lose; lettered entry points A, B, C; end by asking which to take>

   ## Where things are
   <branch, HEAD short sha, pushed or not; each uncommitted file and whether it is safe to commit; test result and the sha it was run at>

   ## This session shipped
   <one line per commit: sha, subject, plus the why when the diff does not say it>

   ## Half done
   <file, function or line, exact next command — or "Nothing.">

   ## Open questions
   <decisions only I can make, each with what it blocks — or "None recorded.">

   ## Brittle or expiring
   <running processes, test data that must not ship, branches that will need rebasing, tokens that expire — or "Nothing.">

   ## Next session, in priority order
   <at most three items, each with an effort estimate>

4. Update docs/STATUS.md:
   - For every row touched this session: Stage, Next action, Updated. Next action starts with a verb and names a file or command.
   - Anything I noticed but did not do goes under "Found, not scheduled".
   - Any question I deferred goes under "Decisions I owe myself" with what it blocks.
   - A feature that passed /accept this session is already in the Done table; confirm it is.
5. Show me both files in full. Do not commit; I will.
