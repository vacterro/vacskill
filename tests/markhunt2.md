# Phase: MARKHUNT

Dry exhaustive audit. Record-only. Zero fix.

## 1. Trigger
Explicit command only: `saipen markhunt` or `markhunt`. No auto-fire. No GUI.

## 2. Zero-Mutation Law
Read-only. Zero file touch. Zero edit. Zero delete. Zero fix.
HUNT allows "obvious junk, delete free". MARKHUNT allows nothing.
Fix urge = kill it. If persistent, ticket under BLIND.

## 3. Exhaustion Law
Cap = ∞. No sample. No "good enough". No round-number exit.
HUNT stops at 5. MARKHUNT stops at empty surface only.
False exhaustion = audit failure.

## 4. Evidence Law
Hard cite per finding:
- `path:line:col`
- `command` + verbatim output
- `doc_quote` vs `code_reality` — both sides verbatim
No cite = no ticket. No vibe. Hallucination = stop.

## 5. Scope
Re-run all HUNT vectors uncapped. Plus minimum:

| Vector | Target |
|--------|--------|
| TEST | Fail, skip, mock-reality-gap, uncovered branch, flaky |
| COMMIT | Unverified, unsigned, fixup! in trunk, conflict markers |
| MARKER | TODO/FIXME/HACK stale >30d |
| SILENCE | Swallowed error, empty catch, ignored rejection, suppressed stderr |
| DRIFT | RFC≠code, README≠code, CONFORMANCE≠code, orphaned ref, stale claim |
| DEAD | Unreachable export, zombie dep, ghost import, dead store, unused param |
| SEC | Secret in tree, destructive gate missing, posture regression |
| DEBT | Half-pattern, copy-paste, abandoned abstraction, type hole, sync-in-async |
| BLIND | Normalized broken. "That's just how it is" = ticket. Over-capture > under-capture. |

## 6. Recording
BOARD.md append-only. Never reorder. Never edit existing.
Ticket format:
```markdown
- [ ] [MARKHUNT] <summary>
  - Evidence: <cite>
  - Vector: <TEST|COMMIT|MARKER|SILENCE|DRIFT|DEAD|SEC|DEBT|BLIND>
  - Related: <id|∅>
```
Group nits. One-ticket-per-nit = noise wall = forbidden.
Append failure = halt. Dropped finding = corrupted audit.

## 7. Completion
One Event Graph line, RFC § 1.2 exact:
```
- YYYY-MM-DD [E-###] [parent: E-###] RUN: markhunt -> N findings recorded
```
Malformed line = retry. Zero findings = log `N=0`.
→ DONE. MARKHUNT decides nothing. DONE owns queue.
