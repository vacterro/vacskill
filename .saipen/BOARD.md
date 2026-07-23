# Board
## DOING

## TODO
- [ ] T-153 [P2] doc-sync: backfill missing command coverage in guides (validate, plan, status, goal, stop, ship absent in most) across GUIDE.md + guides/GUIDE_*.md; per-file voice preserved, no persona flattening | verify: grep each command across every guide file OR the guide explicitly points to RFC §1.10 as the full list; deliberately deferred in v7.50.0 (LOG E-666), audit5 #13 re-raised it
- [ ] T-158 [P2] ergonomics: saipen/BOOT.md -- ~30-line ultra-cold-start loader (STATE -> BOARD -> LOG tail -> execute next_action -> load phase doc on demand); RFC stays the full reference, BOOT is the fast path a cold agent reads first | verify: BOOT.md exists <=40 lines, TEST-001 still passes reading only BOOT + STATE + BOARD + LOG tail
- [ ] T-159 [P2] ergonomics: auto human-digest -- saipen ship/stop writes .saipen/kitchen/digest.md (3 lines: done / remaining / awaiting-decision) so the human reads one file instead of scrolling LOG | verify: ship.md + §1.10 stop write digest.md; present after a ship
- [ ] T-160 [P3] BLOCKED-triage nudge: a hunt.md/clean.md rule -- a BLOCKED ticket stale N passes with no activity auto-escalates to next_action WAIT with the concrete yes/no question, not "sort it out" | verify: rule present in hunt.md or clean.md
- [ ] T-161 [P3] DISCUSS-before-touch: command-surface compression (saipen x <sub>, or --flags) -- big normative change to §1.10 + all guides; weigh hard against "don't breed complexity" first | verify: explicit do/reject decision recorded before any edit
- [ ] T-162 [P2] feedback channel: optional human_note: field in STATE.md -- one line the agent reads on continue ("last time you did X, don't"); not a ticket, not a goal, just a nudge | verify: state.schema.json allows it as optional, §1.2 + continue behavior read it
## DONE
- [x] T-149 [MARKHUNT] goal_tickets semantics clarified: counts VERIFY-passes, deliberate + conservative (fails safe, valve trips early not late) -- RFC §2.4
- [x] T-150 [MARKHUNT] parallel TRANSLATE deletes its own saitranslate/STATE.md on completion -- translate.md §4
- [x] T-151 [MARKHUNT] kitchen crash-integrity: file truncated mid-write = debris, restart that scratch clean, not resume -- RFC §1.2
- [x] T-152 [MARKHUNT] doc-explicitness: hunt no-git skip (#2) + verify: field usage (#6) made explicit; #1/#3/#5 WONTFIX-by-design; #4 already shipped v7.51.0
## BLOCKED
- [ ] T-136 [P3] design-debt (was mislabeled [P0] for 8 versions -- corrected): MARKHUNT has no external completeness self-test | blocker: needs real design, not a rush -- HUNT has a hash-match skip check, MARKHUNT's progress file is self-reported with no cross-verification. NOT blocking anything (MARKHUNT works and is used), so this is P3 design-debt, never a bleeding P0 | verify: design a manifest-driven closure check (what's recorded, what VALIDATE cross-checks it against) before implementing -- see T-158-style ergonomics batch, not urgent
