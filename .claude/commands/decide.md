---
description: Write an ADR for an architectural choice. Usage — /decide <topic>
argument-hint: <topic>
---
Topic: $ARGUMENTS

1. Reversibility test first: could this choice be undone in under an hour of work? If yes, say so and stop. It does not need an ADR. Note it under STATUS.md "Found, not scheduled" only if it is worth remembering.
2. Read docs/brief.md and every file in docs/adr/. If an existing ADR already decides or constrains this, say which and stop.
3. Ask me, one at a time, only the questions the brief and the repo cannot answer: options I have considered, what I lean toward and why, what I am afraid of.
4. Write docs/adr/NNN-<kebab-slug>.md from docs/adr/000-template.md with the next sequential number and Status: Proposed. The Constraints section must contain at least one MUST or NEVER a future review could check mechanically.
5. Show me the ADR. When I say accept: set Status to Accepted, update the Stack section of CLAUDE.md if the decision changes it, and update any STATUS.md row that was blocked on this decision.
