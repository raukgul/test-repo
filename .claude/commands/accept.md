---
description: Run the acceptance checklist for one feature mechanically and close it. Usage — /accept <feature>
argument-hint: <feature>
---
Feature: $ARGUMENTS

Run each check and show me the evidence, not a claim.
1. AC coverage: list every AC-n in docs/sdd/<feature>-sdd.md with the test name(s) containing it. An AC with none fails.
2. Tests: run the full suite fresh with the command in CLAUDE.md. Paste the summary line.
3. Lint and format: run the command in CLAUDE.md. Paste the result.
4. Stubs: run `grep -rnE "TODO|FIXME|XXX|HACK|not implemented|NotImplemented|unimplemented" <source dirs>` excluding test and docs directories. Show the output. It must be empty.
5. Decisions: list the build-time decisions visible in this feature's commits. Each hard-to-reverse one must have an ADR. Name them.
6. Scope: compare SDD section 7 against the diff since the review-clear commit. Anything built outside scope is a finding.

If every check passes: tick the boxes in SDD section 8, set `Status: Accepted`, move the STATUS.md row to the Done table with today's date, commit `docs(<feature>): accepted`.
If any check fails: tick nothing. List the failures with their evidence and stop. The next action is to fix them under /build.
