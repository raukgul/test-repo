# SDD — <feature>

Status: Draft | Review clear | Built | Accepted
Governing ADRs: <ADR-001, ADR-003>
Review: not run | clear on YYYY-MM-DD | N findings open

Altitude: PIN sections 2–5 exactly. DELEGATE the rest in section 6 with a bounding constraint.
Target 2–6KB. Past 10KB you are enumerating what you should be bounding.

## 1. Intent
<What this feature does and why, three sentences. Which brief capability it delivers.>

## 2. Contracts (pinned exactly)
Everything another part of the system, a user, or a file format depends on. Exact shapes, not descriptions.
### API / CLI surface
### Data — schema as DDL, or the words "no schema change"
### Events / files / messages
### Error cases
| Condition | Response or exit code | Message |
|---|---|---|

## 3. Invariants
Must always hold; each stated so a test could check it.
- INV-1:

## 4. Logic
A decision table, state machine, or pseudocode for anything that branches. Prose is not logic.
| Input state | Condition | Result |
|---|---|---|

## 5. Acceptance criteria
Given / when / then with exact values. Each gets at least one test named after it.
- AC-1: Given ..., when ..., then exactly ...
- AC-2:

## 6. Delegated decisions
Micro-choices the builder makes. Each carries the constraint that bounds it. An entry without a constraint is a gap, not a delegation.
- <choice> — constraint: <...>

## 7. Out of scope / dependencies
- Not in this feature:
- Needs:

## 8. Acceptance checklist (filled by /accept, never by hand)
- [ ] every AC has at least one test named after it
- [ ] full test suite passes, run fresh
- [ ] lint and format clean
- [ ] no TODO / FIXME / stub / not-implemented in non-test code
- [ ] every hard-to-reverse build-time decision has an ADR
- [ ] nothing built outside section 7
- [ ] STATUS.md row moved to Done