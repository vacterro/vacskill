# Phase: MARKHUNT

Dry, exhaustive audit. Record only. Never fix.

## 1. Purpose

MARKHUNT exists to catch what normal HUNT misses:
- the obvious stuff everyone got blind to;
- cross-file drift;
- security regressions;
- architectural rot;
- half-finished logic;
- stale claims that survived too long.

This is an audit pass, not a repair pass.

## 2. Non-goals

MARKHUNT MUST NOT:
- edit files;
- delete files;
- patch bugs;
- refactor code;
- “just clean one small thing”;
- downgrade into HUNT or BUILD behavior.

If it needs fixing, it becomes a ticket. That’s it.

## 3. Core rule

**Dry means dry.**

Finding something and fixing it in the same pass kills audit value. So:
- observe;
- prove;
- record;
- stop.

## 4. Scope

MARKHUNT checks everything HUNT checks, but without the cap:
- failing tests;
- unverified commits;
- stale TODO / FIXME / HACK;
- silent failures;
- dead code;
- symmetry gaps.

Then it goes wider:
- doc drift between README / RFC / phase docs / CONFORMANCE / code;
- security posture and weakened gates;
- architectural debt;
- copy-paste logic that should have been unified;
- familiarity blindness.

## 5. Evidence rule

No evidence, no finding.

Every ticket MUST point to something real:
- file:line;
- command output;
- exact contradiction between docs and behavior;
- reproducible mismatch.

If it cannot be cited, it does not exist.

## 6. Recording rule

Every finding becomes a TODO ticket on `BOARD.md`.

Use a visible audit tag in the ticket line:
- `[MARKHUNT]` prefix.

Keep related findings together.
Do not spam one ticket per tiny nit.

Append only.
Do not reshuffle existing work.

## 7. Audit shape

A MARKHUNT pass follows this loop:

1. scan the surface;
2. verify the claim;
3. collect evidence;
4. group related drift into one ticket;
5. append ticket;
6. continue until the surface is actually exhausted.

No sampling.
No fixed cap.
No “good enough”.

## 8. Completion

When done:
- write one LOG event line;
- report how many findings were recorded;
- transition to `DONE`.

MARKHUNT does not choose the next work item.
It only makes sure nothing stays invisible.

## 9. Output contract

A valid MARKHUNT result must answer:
- what is broken or stale;
- where it is;
- why it matters;
- what ticket was created.

If the answer is vague, the audit failed.

## 10. Bottom line

MARKHUNT is the outside eye.
It exists because familiarity lies.

