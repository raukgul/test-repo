# Starter kit — design-decides-build-executes, personal scale

Copy this tree into a blank repo. Needs `git`, `jq`, and Claude Code.

   cp -r starter-kit/. ~/my-project/ && cd ~/my-project && git init && chmod +x .claude/hooks/*.sh

What is here:

- `CLAUDE.md` — the operating contract Claude reads every session. Fill the two placeholders after session 1.
- `docs/brief.md` — template for the project brief (session 1, by interview).
- `docs/adr/000-template.md` — ADR template. One per hard-to-reverse decision.
- `docs/sdd/000-template.md` — mini-SDD template. One per feature.
- `docs/STATUS.md` — the board. One row per feature.
- `docs/RESUME.md` — the handoff. Rewritten by `/wrap` at every session end.
- `.claude/commands/` — the six rituals: `/resume` `/decide` `/design` `/build` `/accept` `/wrap`. The STATUS/RESUME structure lives inside `/wrap`.
- `.claude/hooks/` — three scripts: block stubs, block secrets, session-start staleness notice. `settings.json` wires them.

Session 1: open Claude Code in the repo and type `/resume`. It will route you into the brief interview. Write no code in session 1.

Do not add more harness until an incident earns it.