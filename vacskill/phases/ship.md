# Phase: REVIEW + SHIP

## REVIEW -- is it well made?

On wave/ship diff (`git diff main...` or files changed since STATE.updated).
Prove suspicions with trace/repro. Findings = file:line + what breaks.

- **P0 correctness** -- broken logic, unhandled paths, off-by-one, races, data loss.
- **P1 security** -- string SQL, shell=True, eval, HTML injection, hardcoded secrets
  (-> env var, tell user to rotate), missing authz, weak hashing.
- **P2 reliability** -- silent catches, missing timeouts, leaks, unbounded growth.
- **P3** -- duplication 3+, dead code, missing tests.

P0/P1: fix now. P2/P3: new tickets.
Verdict -> LOG: `DEC: SHIP` / `SHIP after FIXES` / `NO -- BLOCKER`.
**Cap: LOG has a verdict on this finding -> NO + ticket, stop cycling.**

## SHIP -> PUBLISH

Only on `vacskill ship`, or repo has `origin` AND LOG shows prior ship.
Never auto-publish unopted project. Needs 100% green.

1. README beautiful: pitch, features, install, usage, version + changelog link.
2. Version bump (micro -> 3.2.1, feature -> 3.2.0, breaking -> major).
3. .gitignore covers junk + secrets. Empty tmp/, strip debug prints.
4. CHANGELOG.md newest-top. Push.
5. `git tag -a vVERSION -m "line"` + push tags.
6. First publish: confirm name + public/private with user.
7. LOG: `RUN: ship vX.Y.Z -> pushed HASH`.