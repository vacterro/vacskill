# Board
## DOING

## TODO
- [ ] T-168 [P1] saitranslate README/doc drift: bundle has TWO systems -- flat README_XX (v7.55) + subdirs XX/{README,RFC,SPEC,STYLE,CONTRIBUTING,...} (full doc-set, RFC_XX 72KB heavily drifted). Re-scan exact drift, update canonical system for 32 langs + Дед, priority EN/RU/EE/JA -- fabricate nothing (translate.md §2/§3). RUN AS A DEDICATED/PARALLEL saitranslate INSTANCE, not the main agent under limits | verify: 32+Дед current and spot-checked
- [ ] T-169 [P2] saitranslate reconcile: pick the canonical structure (flat README_XX vs the fuller subdirs XX/) and remove the other -- a real quality call, done inside the T-168 dedicated run | needs: T-168 | verify: single consistent structure in saitranslate/kitchen
## DONE
- [x] T-136 CLOSED (was P3 design-debt, 8 versions): MARKHUNT got a manifest-driven closure self-test in markhunt.md (vectors 5/5, cursor:done, head_end==HEAD, findings==[MARKHUNT] tickets) before DONE + enriched auditable completion line; CONFORMANCE row 37 + stub. No validate.py change (self-enforced, no ceremony)
- [x] T-167 saitranslate carve-out fix: removed 28 flat GUIDE_XX (duplicated hand-maintained guides/)
## BLOCKED
