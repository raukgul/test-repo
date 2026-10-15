---
description: Build one feature from its SDD alone — tests from the acceptance criteria, one review. Usage — /build <feature>
argument-hint: <feature>
---
Feature: $ARGUMENTS

## 0. Preconditions
docs/sdd/<feature>-sdd.md exists and its header says `Review: clear`. If not, stop and tell me to run /design. Read the SDD and every ADR it cites. The SDD is the only specification; the brief and ADRs are context.

## 1. Tests first, from the criteria
For every AC-n write at least one test whose name contains `AC-n` and asserts the exact values the criterion states. No implementation yet. Commit: `test(<feature>): acceptance tests from SDD`.

## 2. Implement
Translate the SDD.
- Contracts exactly as pinned. Delegated decisions within their constraints.
- If the SDD is silent on something that affects a contract, an invariant, or an acceptance criterion: STOP, tell me, and we amend the SDD before continuing. Never invent it.
- No TODO/FIXME/XXX, no empty bodies, no hardcoded returns, no "not implemented". If you cannot finish a piece, say so. Do not stub it.
- A decision that would take more than an hour to reverse gets an ADR now, via /decide, before you continue.
- Run the tests after each meaningful step. Commit at each green point: `feat(<feature>): <what>`.

## 3. Review
When all tests pass, dispatch ONE fresh subagent (Agent tool, general-purpose) with the SDD path, the diff since the SDD review-clear commit, and only this mandate:
> Review this change against docs/sdd/<feature>-sdd.md. Report with file:line: (1) any contract, invariant, or acceptance criterion the code does not honor; (2) any acceptance criterion with no test, or a test that does not assert its exact values; (3) stubs, TODOs, swallowed errors, hardcoded returns; (4) any delegated decision whose constraint is violated; (5) the two things most likely to break first in real use. No style comments unless they hide a defect.

## 4. Fix and hand over
Fix every defect finding. Re-run all tests fresh, not from cache. Set the SDD `Status: Built`, commit, and update the STATUS.md row to Stage Accept with Next action `run /accept <feature>`. Anything the reviewer raised outside this feature's scope goes under STATUS.md "Found, not scheduled".
