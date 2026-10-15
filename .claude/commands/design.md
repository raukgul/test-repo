---
description: Design one feature — write its mini-SDD and run one skeptic review until buildable. Usage — /design <feature>
argument-hint: <feature>
---
Feature: $ARGUMENTS

Design produces documents only. Do not create or edit any source, test, or config file in this command.

## 1. Ground
Read docs/brief.md, every ADR in docs/adr/, docs/STATUS.md, and any existing SDD this feature touches. If an ADR this feature needs does not exist, stop and tell me to run /decide first.

## 2. Author
Write docs/sdd/<feature>-sdd.md from docs/sdd/000-template.md. Hold the altitude:
- PIN exactly: intent; every contract (API or CLI shapes, schema as DDL or the words "no schema change", file and message formats, error cases); invariants; acceptance criteria; anything two features share.
- DELEGATE everything else (internal structure, naming, helpers) as one line each under Delegated decisions, with the constraint that bounds it.
- The line: an open choice that affects a contract, an invariant, or an acceptance criterion is never delegable. Resolve it in the SDD, or ask me.
- Acceptance criteria are given/when/then with exact values. Reject your own "works correctly", "handles X properly", "should".
- Any branching logic is a table, a state machine, or pseudocode. Not prose.
Target 2–6KB. Commit: `docs(<feature>): SDD draft`.

## 3. Review
Dispatch ONE fresh subagent (Agent tool, general-purpose) with the SDD path and only this mandate. Do not pass it your own reasoning.
> You are a skeptical builder who must implement this SDD tomorrow without asking anyone anything. Read docs/sdd/<feature>-sdd.md and the ADRs it cites. Return, quoting the SDD line for each: (1) every open choice that affects a contract, an invariant, or an acceptance criterion; (2) every acceptance criterion you could not write a test for as written; (3) every Delegated decision whose constraint would not actually stop you doing it wrong; (4) anything that contradicts a cited ADR. If your lists are empty on a non-trivial SDD, justify why.

## 4. Converge
Fix every finding in the SDD. Re-run step 3 at most once more. If findings remain after two rounds, list them to me as decisions and stop; do not loop again.
When the reviewer's lists are empty: set the SDD header to `Review: clear on <date>` and `Status: Review clear`, commit `docs(<feature>): SDD review clear`, and update the STATUS.md row to Stage Build with Next action `run /build <feature>`.
