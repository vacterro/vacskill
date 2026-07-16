# Board
## DOING
- [/] T-042 Restructure PROTOCOL.md into boot loader + lazy phases/ modules | files: vacskill/PROTOCOL.md, vacskill/phases/*.md | verify: boot <=100 lines + phase files exist + all rules preserved | needs:
## TODO
- [ ] T-043 Compress boot protocol with caveman density -- drop articles, tables over prose | files: vacskill/PROTOCOL.md | verify: line count <=80, key grep PASS | needs: T-042
- [ ] T-044 README.md update -- reflect 2-tier architecture, token efficiency pitch, ASP positioning | files: README.md | verify: no garbled chars, render check | needs: T-042
- [ ] T-045 Update SKILL.md adapter to reference phases/ loading | files: vacskill/SKILL.md | verify: phases/ mention present | needs: T-042
- [ ] T-046 Sync local skill copies (plugin dir) with repo | files: skill plugin copies | verify: diff clean | needs: T-042 T-043 T-044 T-045
- [ ] T-047 SHIP v5.0.0 -- bump VERSION + CHANGELOG + commit + tag + push | files: VERSION, CHANGELOG.md | verify: git tag v5.0.0 + push PASS | needs: T-046
## DONE
- [x] T-041 SHIP v4.1.0 (verified: git push main 6ad68fe, tag v4.1.0 pushed PASS, conf: high)
- [x] T-038 FIX encoding corruption PROTOCOL.md + README.md + CHANGELOG.md (verified: BOM=0 ctrl=0, conf: high)
