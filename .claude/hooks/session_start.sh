#!/usr/bin/env bash
# SessionStart: warn when docs/RESUME.md is stale. Stdout is added to the session context.
cd "${CLAUDE_PROJECT_DIR:-.}" || exit 0

resume=docs/RESUME.md
[ -f "$resume" ] || { echo "NOTICE: docs/RESUME.md is missing. Run /pickup and offer to rebuild it."; exit 0; }

resume_date=$(head -1 "$resume" | grep -oE '[0-9]{4}-[0-9]{2}-[0-9]{2}')
last_commit=$(git log -1 --format=%cs 2>/dev/null)

if [ -z "$resume_date" ]; then
  echo "NOTICE: line 1 of docs/RESUME.md has no date. The note may be stale."
elif [ -n "$last_commit" ] && [[ "$resume_date" < "$last_commit" ]]; then
  echo "NOTICE: docs/RESUME.md is dated $resume_date but the last commit is $last_commit. The previous session probably ended without /wrap."
fi

if [ -n "$(git status --short 2>/dev/null)" ]; then
  echo "NOTICE: working tree is dirty."
fi
exit 0
