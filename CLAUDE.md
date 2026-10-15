# test repo
A test project to practice setting up a project for working with Claude, and basic deployment to GCP using DevOps techniques with GitHub.

## Stack (each is an ADR in docs/adr/. Fill in as they are accepted)
- **Cloud vendor**: GCP
- **Compute**: Cloud Run
- **CI/CD**: GitHub Actions
- **Language**: Python for small apps.
- **IaC**: Terraform
- **Containers**: Docker

## Commands
- Test: `pytest`
- Lint and format: `ruff check . && ruff format --check . && terraform fmt -check -recursive && terraform validate && tflint && hadolint Dockerfile`
- Source dirs (for the /accept stub grep): `app/ terraform/ .github/`

## Process - four stages, one stage per session
- Decide: an ADR in docs/adr/ for anything hard to reverse. `/decide <topic>`
- Design: a mini-SDD at docs/sdd/<feature>-sdd.md plus one skeptic review. `/design <feature>`
- Build: code and tests from the SDD alone, plus one review. `/build <feature>`
- Accept: the checklist at the bottom of the SDD, run mechanically. `/accept <feature>`

The board is docs/STATUS.md. The handoff is docs/RESUME.md.

## Session discipline
- Start every session with `/pickup`. Do nothing before it.
- End every session with `/wrap`. It rewrites docs/RESUME.md and updates docs/STATUS.md.
- One stage of one feature per session when possible.
- Commit after every artifact lands. Uncommitted work does not survive a closed laptop.

## Non-negotiable
- No implementation code before the feature's SDD exists and its header says `Review: clear`. Design produces documents only.
- Build to the SDD. If the SDD is silent on something that affects a contract, an invariant, or an acceptance criterion, STOP and ask; never invent.
- No stubs: no TODO/FIXME/XXX, no empty bodies, no hardcoded returns, no "not implemented", no "later". A hook blocks these.
- Acceptance criteria are verifiable or they are not criteria. "Works correctly" is not a criterion.
- Tests come from the acceptance criteria: at least one test per AC, named after it.
- A decision made during Build that would take more than an hour to reverse gets an ADR in the same session.
- NEVER commit secrets: no service account keys, `*.tfvars` with credentials, or `.env` files.

## Behaviors
1. Surface assumptions out loud before acting on them.
2. Stop when confused. Ask. Confusion that is not surfaced becomes fabrication.
3. Push back on defects in the spec. Do not implement something you know is wrong.
4. Simplest correct approach. Complexity needs a concrete requirement that exists today.
5. Stay in scope. Fix what was asked; note the rest in docs/STATUS.md under "Found, not scheduled".
6. Understand before changing. Check `git log` before removing anything that looks unnecessary.
7. Verify, do not assume. Run the test. Read the output. "It compiles" is not "it works".

## Writing
Lead with the answer. No preamble, no closing offers. Code comments only when the why is invisible in the code.
