Держи, kurat. Это уже не «аудит с настроением», а сухой налоговый инспектор с лопатой: только записывает, ничего не трогает, галлюцинации не жрёт, без доказательств билет не выдаёт.

Сохрани как:

```text
saipen/phases/markhunt.md
```

Но помни: `MARKHUNT` как фаза и команда **нелегален**, пока ты не пропишешь его в `RFC.md §1.6`, `RFC.md §1.10`, `CONFORMANCE.md` и `GUIDE.md`. Файл ниже специально сделан так, чтобы агент не мог тихо выдумать команду и начать творить хуйню.

---

```markdown
# PHASE: MARKHUNT
MODE: DRY_EXHAUSTIVE_AUDIT
TRIGGER: explicit `saipen markhunt` | bare `markhunt`
ENTRY: ANY phase, user command only.
EXIT: DONE | BLOCKED.
WRITE SCOPE: BOARD append, LOG append, STATE phase/next_action, `.saipen/kitchen/markhunt/*` only.
SOURCE CODE/DOCS: read-only.

---

## CONFORMANCE PREREQ

Before `STATE.phase: MARKHUNT` is legal, ALL MUST be true:

1. RFC §1.6 phase enum includes `MARKHUNT`.
2. RFC §1.6 transition table includes:

```text
MARKHUNT -> DONE | BLOCKED
```

3. RFC §1.6 states MARKHUNT is entered by explicit user command from ANY phase, same class as `CLEAN` / `TRANSLATE` / `VALIDATE`.
4. RFC §1.10 registers:

```text
saipen markhunt
bare markhunt
```

5. GUIDE command table lists `saipen markhunt`.
6. CONFORMANCE scenario table includes `markhunt-dry-audit` as behavioral coverage.

If ANY prerequisite missing:

```text
Agent MUST refuse MARKHUNT.
Agent MUST list recognized RFC §1.10 commands.
Agent MUST NOT enter MARKHUNT.
Agent MUST NOT invent phase behavior.
```

---

## IRON LAW

1. Record only.
2. NEVER fix.
3. NEVER edit source.
4. NEVER edit docs.
5. NEVER delete files.
6. NEVER delete "obvious junk".
7. NEVER rename/move/format/refactor.
8. NEVER modify existing tickets.
9. NEVER close tickets.
10. NEVER reprioritize BOARD.
11. NEVER put unvetted findings into pickable `## TODO`.
12. NEVER create ticket without reproducible evidence.
13. NEVER stop at arbitrary round number.
14. NEVER sample when surface can be exhausted.
15. NEVER treat MARKHUNT as HUNT, CLEAN, REVIEW, or BUILD.

MARKHUNT finds. MARKHUNT records. MARKHUNT leaves the scene exactly as it found it.

---

## RELATION TO OTHER PHASES

```text
HUNT:
  capped, cheap, frequent, 5 tickets max.
MARKHUNT:
  uncapped, exhaustive, explicit, record-only.

CLEAN:
  may remove obvious junk safely.
MARKHUNT:
  removes nothing.

REVIEW:
  may fix P0/P1 now.
MARKHUNT:
  fixes nothing now.

BUILD:
  changes code.
MARKHUNT:
  changes only audit records.
```

---

## ENTRY PROTOCOL

On explicit `saipen markhunt`:

1. Verify CONFORMANCE PREREQ.
2. Checkpoint current work per RFC §1.5.
3. If mid-edit in BUILD/VERIFY/etc:
   - checkpoint cleanly;
   - do NOT abandon ticket mid-edit;
   - leave existing BOARD ticket line unchanged.
4. Set STATE:

```yaml
phase: MARKHUNT
task: none
next_action: "saipen markhunt"
blocker: ""
```

5. LOG start event using RFC §1.2 skeleton:

```text
- DATE [E-###] [parent: E-###] DEC: markhunt.start surface=<git|files> mode=dry-exhaustive
```

6. Create/overwrite:

```text
.saipen/kitchen/markhunt/PROGRESS.md
```

---

## SURFACE DEFINITION

If git available:

```text
surface = git-tracked files.
```

Else:

```text
surface = all project files minus ignore patterns.
```

Always exclude:

```text
.git/
node_modules/
build/
dist/
coverage/
.saipen/recovery/
binary blobs
secret files
large generated artifacts
```

If surface cannot be enumerated safely:

```text
STATE.phase: BLOCKED
blocker: cannot enumerate audit surface safely
next_action: WAIT: define audit surface or confirm exclusions
```

---

## SCAN CATEGORIES

Run ALL categories. No cap. No sampling. Stop only when surface exhausted or budget checkpoint required.

### A. HUNT SIX, UNCAPPED

1. Failing tests/build/lint.
2. Commits unverified in LOG.
3. Stale TODO/FIXME/HACK.
4. Silent failures:
   - empty catch
   - ignored returns
   - missing IO error paths
   - swallowed promise rejections
5. Symmetry gaps:
   - save/load
   - undo/redo
   - import/export
   - start/stop
   - enable/disable
   - show/hide
6. Dead code/orphan files:
   - zero grep refs
   - not entrypoint/doc/config/generated

### B. CROSS-FILE CONSISTENCY

7. Doc drift:
   - README vs code
   - GUIDE vs RFC
   - phase docs vs RFC
   - CONFORMANCE vs validators
   - SPEC vs implementation
8. Stale claims:
   - old version badge
   - dead command names
   - removed features still documented
   - documented files missing
9. Orphan references:
   - broken links
   - dead anchors
   - missing cited files
   - phantom commands

### C. SECURITY POSTURE

10. Secrets:
   - hardcoded keys/tokens/passwords
   - secrets in kitchen/state/docs/tests/fixtures
11. Destructive gates:
   - force-push without confirmation
   - mass deletion without confirmation
   - schema drop without confirmation
12. Unsafe execution:
   - eval
   - shell=True
   - dynamic import of untrusted input
   - SQL string concat
   - HTML injection
13. Authz/auth gaps:
   - missing permission checks
   - weak hashing
   - trust boundary violations
14. Path risks:
   - traversal
   - unsafe temp paths
   - writes outside allowed dirs

### D. ARCHITECTURAL DEBT

15. Half-finished patterns.
16. Copy-pasted logic appearing >=3 times.
17. Abstractions declared but not followed.
18. Duplicate truth sources.
19. Layer violations:
   - UI owning domain truth
   - persistence leaking into view
   - phase docs overriding RFC silently
20. Temporary hacks aged into load-bearing lies.

### E. FAMILIARITY BLINDNESS

21. Normalized weirdness:
   - everyone stopped noticing it
   - no ticket explains why
   - behavior contradicts stated intent
22. Dead conventions:
   - rules nobody follows
   - old naming ghosts
   - unused config knobs
23. Phantom behavior:
   - commands promised but absent
   - flags parsed but ignored
   - settings displayed but not persisted
24. Test theater:
   - tests that cannot fail
   - assertions missing
   - mocked reality instead of behavior

---

## EVIDENCE STANDARD

No evidence = no ticket.

Every finding MUST have at least ONE reproducible fact:

```text
file:line
command + exit/output
quoted contradiction: doc says X, code says Y
```

Acceptable evidence examples:

```text
src/foo.ts:142 -- empty catch swallows write error
grep -R "sk-" src/ -> src/api.ts:88 contains token prefix
README.md says `saipen doctor`, RFC §1.10 has no `doctor`
npm test -> exit 1, failing suite tests/settings.test.ts
```

Suspicion without evidence:

```text
write to kitchen note only.
NO ticket.
```

---

## READ-ONLY COMMAND RULES

MAY run:

```text
grep
rg
git log
git diff
git status
cat
head
tail
ls
find
npm test -- --run
pytest -q
cargo test --no-run
```

ONLY if non-mutating.

MUST NOT run:

```text
git push
git reset --hard
git clean
rm
mv
npm publish
format/write commands
codemods
migrations
any command changing repo state
```

If a useful check mutates state:

```text
Do not run it.
Ticket it as needing safe verification.
```

---

## FINDING FLOW

For each evidence-backed finding:

1. Dedupe first.

```text
grep BOARD.md
grep LOG.md
grep .saipen/kitchen/markhunt/
```

If same root cause already ticketed:

```text
skip new ticket.
increment dupes count.
```

2. Group related findings.

```text
One ticket per root cause.
One ticket per fix surface when trivial nits share cause.
No one-ticket-per-atom noise.
```

3. Assign next monotonic `T-###`.

```text
IDs unique.
IDs never reused.
```

4. Write evidence file:

```text
.saipen/kitchen/markhunt/T-###.md
```

Evidence file shape:

```markdown
# T-###
category: <category>
severity: P0|P1|P2|P3
finding: <one line>

evidence:
- type: file|command|contradiction
  ref: <file:line or command>
  output: <short exact output>

related:
- <file:line>
- <file:line>

suggested_verify: <command or criterion>
```

5. Append ticket to `## BLOCKED` on BOARD.md:

```text
- [ ] T-### [MARKHUNT][P?] <category>: <short finding> | blocker: unvetted audit; evidence kitchen/markhunt/T-###.md | verify: <command or criterion>
```

Example:

```text
- [ ] T-101 [MARKHUNT][P1] security: hardcoded token prefix in src/api.ts | blocker: unvetted audit; evidence kitchen/markhunt/T-101.md | verify: grep -n "sk-" src/api.ts
```

6. Do NOT move ticket to TODO.
7. Do NOT remove blocker.
8. Do NOT start work on it.

---

## WHY BLOCKED, NOT TODO

MARKHUNT output is unvetted.

Unvetted findings MUST NOT feed Pick Rule.

Therefore:

```text
MARKHUNT findings land in ## BLOCKED.
blocker = unvetted audit; evidence path.
```

Triage is a separate human/explicit step:

```text
Human or explicit user instruction:
  move ticket from BLOCKED to TODO
  remove unvetted blocker
  keep or remove [MARKHUNT] tag per project taste
```

MARKHUNT itself never triages.

---

## PROGRESS / CRASH SAFETY

After each category, and immediately on context-budget warning, overwrite:

```text
.saipen/kitchen/markhunt/PROGRESS.md
```

Shape:

```markdown
# MARKHUNT_PROGRESS
updated: <ISO-8601 UTC>
cursor: partial|done
categories_done: <list>
next_category: <name|none>
paths_done: <count or list>
next_path: <path|none>
findings: <N>
blocked: <B>
dupes: <D>
budget_warning: yes|no
```

Rules:

```text
Overwrite, never append.
No history here.
History lives in LOG.md.
```

If successor arrives:

1. Read `STATE.md`.
2. See `phase: MARKHUNT`.
3. Read `.saipen/kitchen/markhunt/PROGRESS.md`.
4. Resume from `next_category` / `next_path`.
5. Do NOT restart from zero unless PROGRESS missing/corrupt.

---

## GOAL_MODE INTERACTION

MARKHUNT is explicit user command.

Under `goal_mode: true`:

```text
goal_mode remains true.
MARKHUNT MUST NOT increment goal_waves.
MARKHUNT MUST NOT increment goal_tickets.
MARKHUNT MUST NOT auto-execute findings.
MARKHUNT MUST NOT fall into HUNT/ADD automatically.
```

On completion under goal_mode:

```text
STATE.phase: DONE
next_action: saipen status
halt one turn for triage
```

This is a dry-audit brake, not a goal_mode exit.

User resumes with:

```text
saipen continue
saipen goal <text>
saipen stop
```

---

## COMPLETION: SURFACE EXHAUSTED

When all categories scanned and no unrecorded evidence remains:

1. LOG completion event using RFC §1.2 skeleton:

```text
- DATE [E-###] [parent: E-###] RUN: markhunt -> findings=<N> blocked=<B> dupes=<D> cursor=done
```

2. Set STATE:

```yaml
phase: DONE
task: none
next_action: "saipen status"
blocker: ""
```

3. Output terse summary:

```text
MARKHUNT DONE
findings=<N>
blocked=<B>
dupes=<D>
evidence=.saipen/kitchen/markhunt/
next=triage BLOCKED [MARKHUNT] tickets
```

4. Stop.

---

## COMPLETION: PARTIAL / BUDGET RISK

If context budget low, tool limit near, or crash risk:

1. Save PROGRESS.md with `cursor: partial`.
2. LOG:

```text
- DATE [E-###] [parent: E-###] RUN: markhunt -> findings=<N> blocked=<B> dupes=<D> cursor=partial
```

3. Set STATE:

```yaml
phase: MARKHUNT
task: none
next_action: "saipen markhunt"
blocker: ""
```

4. Output:

```text
MARKHUNT PARTIAL
cursor=partial
next_category=<name>
next_path=<path|none>
next=saipen markhunt
```

5. Stop.

---

## COMPLETION: UNSAFE / BLOCKED

If MARKHUNT cannot continue safely:

Examples:

```text
surface unreadable
state corrupt
evidence storage unwritable
destructive ambiguity
secret exposure requiring human rotation
```

Then:

```yaml
phase: BLOCKED
task: none
blocker: <facts>
next_action: "WAIT: <specific unblock question>"
```

LOG:

```text
- DATE [E-###] [parent: E-###] DEC: markhunt.blocked reason="<facts>"
```

Do not guess. Do not fix. Wait for facts.

---

## SEVERITY MODEL

Use severity in ticket tag and evidence file.

```text
P0: data loss, security breach, crash, corruption
P1: likely correctness/security failure
P2: reliability, maintainability, silent failure risk
P3: dead code, duplication, doc nit, convention drift
```

MARKHUNT does NOT act on severity.

Severity helps triage only.

---

## SECRET HYGIENE

MUST NOT write real secrets into:

```text
BOARD.md
LOG.md
STATE.md
KNOWLEDGE/
kitchen/markhunt/
```

Redact as:

```text
sk-***
token-***
password-***
```

If secret found:

```text
ticket it as P0/P1
redact value
tell user to rotate
never store real value
```

---

## ANTI-HALLUCINATION GATE

Before creating any ticket, ask:

```text
Can another agent reproduce this finding from evidence alone?
```

If no:

```text
NO TICKET.
```

Forbidden ticket sources:

```text
vibe
memory
assumption
"probably"
"seems like"
"might be"
"looks suspicious"
```

MARKHUNT is an auditor, not an anxious poet.

---

## NOISE CONTROL

Goal:

```text
BOARD stays a work list, not a wall of panic.
```

Rules:

```text
Group by root cause.
Group trivial nits by shared surface.
Skip exact duplicates.
Count duplicates.
Keep full evidence in kitchen/markhunt/.
Keep BOARD line short.
```

If 100 findings:

```text
Record all.
Group hard.
No silent dropping.
```

---

## FINAL INVARIANT

MARKHUNT is conformant only if after it runs:

```text
source unchanged
docs unchanged
existing tickets unchanged
findings recorded with evidence
unvetted findings not pickable
LOG has exact completion line
STATE has explicit next_action
successor can resume from kitchen progress
```

If any of these false:

```text
MARKHUNT failed.
```
```

---

Аудит молчит,  
Находки в BLOCKED ждут суда.  
Фикс не пройдёт.