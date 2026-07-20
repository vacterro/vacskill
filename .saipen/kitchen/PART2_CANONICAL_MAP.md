# PART2_CANONICAL_MAP.md

T-100 output. Scratch/evidence file, not normative -- do not cite as spec.
No file duplicates found anywhere in the working tree for any of the 8
named files; the "multiple README.md" hits are distinct, legitimately-
scoped files (extension examples, test fixtures), not variants of root
README.md. Canonicalization has nothing to reconcile -- every file below
already has exactly one copy. What follows is checklist-vs-grep evidence
per Section 1, not a conflict resolution.

| File | Canonical path | Status | Evidence |
|---|---|---|---|
| RFC.md | `saipen/RFC.md` | Full -- all 27 checklist items confirmed present via direct grep (root location §1.1, kitchen secrets x2, destructive-ops floor, WAIT form + 4 categories, task MAY none, blocker non-empty, updated UTC, saipen_version, schema_version migration, BOARD skeleton, verify field, cyclic/dangling needs, escaped pipe, LOG skeleton, E-### rules, parent-link rule, 14-phase enum, transition table, VERIFY alignment, saipen validate + saipen ship commands, extension discovery incl. degrade/BLOCK, goal_mode counters + safety valve + waypoint-not-exit). | grep counts all >= 1, see command log this ticket. |
| SPEC.md | `SPEC.md` | Canonical location, checklist mostly satisfied (requires shell x1, EXAMPLE hook wording x2, architecture-tree entries x12) -- **one real gap survives**: line 96 still reads "SAIPEN MUST remain immutable" verbatim, the exact ambiguous phrasing Section 1 / T-111 item 4 flags for replacement. An earlier session edit (extensions/multi-agent/ ship) added a clarifying sentence *after* this line but never touched the phrase itself. | `grep -n "MUST remain immutable" SPEC.md` -> 1 hit, line 96. Tracked as T-111 remaining work, not fixed in this read-only ticket. |
| CONFORMANCE.md | `saipen/CONFORMANCE.md` | Full -- dangling-needs, phase enum, transition-table reference, TEST-001 WAIT clarification, and the scenario table all present; table row count confirmed exactly 18. | `grep -c "^\| [0-9]* \|"` -> 18. |
| GUIDE.md | `GUIDE.md` | Full -- all 10 commands present, including the `set`/`init` alias spelled out explicitly ("type `saipen set` (or `saipen init`)"). | Per-command grep loop: 10/10 OK. |
| GUIDE_EN.md | `GUIDE_EN.md` | Canonical location, 9/10 commands present -- **`saipen init` alias is never mentioned**, only `saipen set`. Not a missing command (init is an alias, not a separate command), but an asymmetry against GUIDE.md's own more complete phrasing. | Per-command grep loop: MISSING "saipen init". Tracked as T-113 remaining work. |
| GUIDE_RU.md | `GUIDE_RU.md` | Same as GUIDE_EN.md -- same single gap. | Same grep result. Tracked as T-113. |
| README.md | `README.md` | Full for T-100's own scope -- badge (`v7.21.0`) currently matches `VERSION` (`7.21.0`), and has since v7.17.0's automated validator self-check. T-101 additionally wants a textual pre-push checklist *inside ship.md itself* (agent-facing, not just the automated check) -- not yet present. | `cat VERSION` = 7.21.0; `grep "v7\." README.md` = `**v7.21.0**`. Match confirmed. ship.md-side checklist addition tracked as T-101 remaining work. |
| phases/ship.md | `saipen/phases/ship.md` | Canonical location, core elements present (first-publish WAIT line, version-bump step) -- T-101/T-106 want additional specific text not yet added: an explicit pre-push README/CHANGELOG/tag consistency checklist, a "PUBLISH is the action inside SHIP, not a separate phase" clarification, and an explicit no-publish-mode push reminder. | `grep -c "WAIT: confirm repo name"` = 1; `grep -c "Version bump"` = 1. Neither of T-101/T-106's *new* text exists yet -- confirmed absent, tracked as remaining work for those tickets. |

## Summary

No canonicalization work needed -- zero duplicate/conflicting file
variants exist. What Part 2's later tickets (T-101, T-106, T-111, T-113)
will actually do is closing specific, already-identified content gaps in
otherwise-canonical files, not choosing between competing copies.
