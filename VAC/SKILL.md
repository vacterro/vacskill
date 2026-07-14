---
name: VAC
description: >
  Unified cross-agent work system. Use on "VACSKILL SET", "vac", "vac <goal>",
  "vac stop", "vac status", "vac ship", when resuming earlier work, or any
  multi-step coding task in a project containing .vac/. One loop
  (PLAN → BUILD → CHECK → SHIP) with persistent .vac/ memory so any agent —
  Claude Code, OpenCode, Gemini, OpenRouter tools — continues another agent's
  work seamlessly. For UI work also read UI.md next to this file (mandatory
  Win95 dark golden theme, Verdana non-antialiased).
---

# VAC — One System

Any agent, any platform, same three memory files, same loop. Hit a limit on
one agent → say `VACSKILL SET` on another → it resumes exactly where work
stopped.

## Commands

| Say | Effect |
|---|---|
| `VACSKILL SET` / `vac` | Resume from `.vac/` (init if missing). Board empty/finished → HUNT |
| `vac <goal>` | Init if needed, plan the goal, start working |
| `vac stop` | Write handoff, tell user the switch phrase |
| `vac status` | Report state, change nothing |
| `vac ship` | SHIP gate on diff → if 100% green: version + changelog + push to GitHub |
| `vac fix <symptom>` | Jump straight to CHECK/debug |

## Talk style — caveman (automatic, every platform)

Active whole session while VAC runs. Compress chat, never substance:

- Drop articles, filler (just/really/basically), pleasantries ("Sure!",
  "happy to"), hedging. Fragments OK. Short synonyms: fix, not "implement
  a solution for".
- No tool-call narration, no decorative tables/emoji, no long log dumps —
  quote shortest decisive line only.
- Keep exact: technical terms, code, API/CLI names, commit keywords, error
  strings. Never invent abbreviations (cfg/impl/fn) — tokenizer saves
  nothing, reader pays.
- Preserve user's language: user writes Russian → caveman Russian.
- Written artifacts stay NORMAL: code, comments, commits, PRs, README,
  CHANGELOG, `.vac/` files. Caveman compresses chat only.
- Drop caveman when clarity critical: security warnings, destructive-action
  confirmations, multi-step sequences where compression risks misread.
  Resume after.
- Shape: `[thing] [action] [reason]. [next step].`
  Example: `Bug in auth middleware. Expiry check uses < not <=. Fix, then
  smoke test.`
- Off switch: user says "stop caveman" / "normal mode".

## Memory — 3 files in `.vac/` at project root

**Iron rule: read STATE before work, write STATE + BOARD before stopping.
Memory not written = work not done.** Chat history is not memory; `.vac/` is.

**Checkpoint rule — write as you go, death comes without warning.** Dying
agent gets no goodbye turn, so never save writing for the end:
- after EVERY finished ticket: tick BOARD + rewrite STATE `next_action`
- after every run/decision: LOG line immediately
- before any long or risky operation: STATE `next_action` = that operation
Worst crash then loses only the current in-flight ticket, and `git status`
shows its uncommitted edits.

`STATE.md` (rewrite each session):
```md
---
phase: PLAN | BUILD | CHECK | SHIP | DONE | BLOCKED
task: T-003
next_action: "<exact command/step a cold agent runs first>"
blocker: none
agent: <claude-code | opencode | gemini | other>
updated: <ISO date>
---
## Handoff
Done: <what + how verified>
In flight: <task + exact stopping point>
Warnings: <traps, half-applied changes, env quirks>
```

`BOARD.md` (rewrite): sections `## DOING` `## TODO` `## DONE`, tickets:
`- [ ] T-003 <verb+object> | files: <paths> | verify: <exact command>`
(`[P]` = parallelizable, `| ui` = UI.md applies). DONE items keep
`(verified: <check> PASS)`.

`LOG.md` (append-only, never rewrite): one line per event:
`- <date> [T-###] DEC: chose X over Y because Z`
`- <date> [T-###] RUN: <command> -> PASS/FAIL <decisive detail>`
`- <date> [T-###] H: <hypothesis> -> confirmed/rejected <evidence>`

## Switch protocol

**Resume** (`VACSKILL SET`): read STATE + BOARD + last ~20 LOG lines → files
changed since `updated`? re-verify claims before building on them → set
`agent:` to yourself → announce one line `Resume T-003. Next: <next_action>.`
→ continue in `phase`.

**Stop** (`vac stop`, or ANY low-context signal — platform warning,
compaction notice, ~80% feel — stop early, never gamble the last tokens):
fill STATE handoff + `next_action` executable cold → tick BOARD → tell
user: `Saved. On any agent say: VACSKILL SET`.

**Crash recovery** (agent died without stop): resume works anyway from
checkpoints. STATE stale but LOG/BOARD newer → trust LOG tail + BOARD
DOING ticket. `git status` + diff reveal in-flight uncommitted work.
Re-verify that ticket's files before continuing; finish or reset it.
Handoff section = luxury; checkpoints = lifeline.

**Init** (no `.vac/`): create the 3 files; ensure project-root `AGENTS.md`
contains block (search `VAC:BEGIN` first, never duplicate). `<VAC_HOME>` =
absolute path of the folder containing THIS SKILL.md — resolve it when
writing the block, never leave the placeholder:
```md
<!-- VAC:BEGIN -->
## VAC protocol (any agent)
Memory: .vac/ here. Read .vac/STATE.md before work; update before stop.
On "VACSKILL SET": read <VAC_HOME>/SKILL.md and follow it.
UI work: also obey <VAC_HOME>/UI.md (Win95 dark golden, Verdana, no AA).
<!-- VAC:END -->
```
`CLAUDE.md` / `GEMINI.md` missing → create each: `Read AGENTS.md and obey its
VAC protocol block.`

## The loop

Size check first: **≤2 files + obvious change → skip ceremony, edit, verify,
one LOG line, done.** Otherwise:

### PLAN
1. Amplify intent ≤8 lines: what user implied — edge cases, callers,
   migrations, UI states. Safe defaults over interrogation.
2. Scout repo reality before planning: patterns, utils, test harness, build
   commands. Plans on imagined code are garbage.
3. Cut tickets to BOARD (format above): one goal each, independently
   verifiable, dependency order. >10 tickets → waves; detail current wave
   only, re-plan between waves.
4. STATE → BUILD, next_action = first step of T-001.

### HUNT (bare `vac`, no goal, board empty or all DONE)

Never idle, never invent busywork. Sweep in signal order, ticket each find:
1. Run the test suite → failures = tickets first.
2. `git log -5 --stat` → recent changes unverified in LOG → verify tickets.
3. Grep `TODO|FIXME|XXX|HACK` → stale ones = tickets.
4. Silent failure scan: empty `catch`/`except: pass`, ignored return codes,
   missing error paths on IO.
5. Symmetry gaps: save/load, undo/redo, import/export, start/stop,
   add/remove, encode/decode — one side exists, other missing = ticket.
6. Dead code, unused imports, stale configs.
Cap wave at ~5 tickets, board them with verify commands, start T-001.
Nothing found → LOG `RUN: hunt -> clean`, report clean, stop.

### BUILD (per ticket)
1. Read the ticket's files + one neighbor doing something similar; steal its
   naming, error style, imports. Existing util → use, don't rewrite.
2. Smallest safe change. Full code — no stubs, no TODO bodies, no `...`.
   Handle null/empty/error paths now.
3. Match repo style even if dated; modernizing = separate ticket.
4. Risky edit → LOG the rollback (`git stash`/copy/revert cmd) before editing.
5. Scope grows or neighbor found broken → new TODO ticket, keep moving.
6. UI touched → apply `UI.md` (same dir). Non-negotiable.

### CHECK (per ticket, before DONE)
1. Detect THIS repo's harness (package.json / Makefile / pytest / cargo /
   CI config). Never invent one.
2. Ladder — run strongest available: parse → import → unit test → minimal
   repro → smoke run. Ticket's `verify:` command minimum. LOG every result.
3. New nontrivial logic → add test in repo's style: happy path + the edge
   that bites (empty, boundary, error). Fixed bug → regression test that
   failed pre-fix.
4. GUI/env unverifiable → LOG `RUN: MANUAL-VERIFY <human steps + expected>`.
   Never fake a pass.
5. FAIL → debug sub-loop: reproduce exactly (quote one decisive error line) →
   cheap suspects first (`git log -5 --stat`, config, env, the file the
   trace names) → specific hypothesis to LOG → test it in reality → fix ROOT
   cause, not symptom → re-run repro must PASS. Rejected hypotheses stay in
   LOG; never re-test one without new evidence. 3+ dead hypotheses → STATE
   blocker = facts + dead ends, move to next unblocked ticket.
6. Flaky (flips without code change) → find timing/state cause or quarantine
   with ticket. Never green on retry-luck.

### SHIP (gate before merge/deliver/DONE-phase)
1. Get real diff (`git diff main...` or files changed since STATE.updated).
2. Hunt in order, verify each suspicion with trace/repro before flagging:
   - **P0 correctness**: broken logic, unhandled paths, off-by-one, races,
     caller contract breaks, data loss.
   - **P1 security**: string-built SQL / `shell=True` / `eval` / HTML
     injection; user input into paths unnormalized; hardcoded secrets
     (`grep -riE "(api_key|secret|password|token)\s*[:=]"`) — found secret =
     move to env AND tell user to rotate, committed = burned; missing
     authz check siblings have; md5/sha1 for passwords; run `npm audit` /
     `pip-audit` when present.
   - **P2 reliability**: silent catches, missing timeouts, leaked handles,
     unbounded growth.
   - **P3 maintainability**: duplication 3+ → extract, dead code, missing
     tests. Flag only, don't churn.
3. Fix P0/P1 now (back through BUILD+CHECK). P2/P3 → tickets.
4. Verdict to LOG: `DEC: SHIP` / `DEC: SHIP after <fixes>` / `DEC: NO — <blocker>`.
   Findings = file:line + what breaks + failing input. Facts, never blame —
   other agents read this.
5. Verdict SHIP → PUBLISH below.

### PUBLISH — GitHub (github.com/vacterro)

Only a 100% bug-free state ships: every blocking ticket verified DONE, zero
unresolved FAIL in LOG, zero open P0/P1. Not met → fix first; never ship red.

1. **README.md beautiful — always, every ship.** Spec: title + one-line
   pitch, short feature list, install commands that actually work, usage
   example, screenshot/GIF when UI exists, version + changelog link. No
   walls of text, no stale info. Outdated README = P1 blocker.
2. **Version bump — keep numbers small** (`MAJOR.MINOR.PATCH[letter]`):
   - micro (typo, tweak, one-liner): letter → `3.1.0` → `3.1.0a` → `3.1.0b`
   - little change / small feature / fix set: patch → `3.2.1`
   - minor feature batch: minor → `3.2.0`
   - breaking / redesign: major → `4.0.0` (rare — don't inflate)
   Update version file (package.json / pyproject / VERSION) to match.
3. **Changelog tiny.** `CHANGELOG.md`, newest on top, 1-2 lines per version:
   `## 3.2.1 — <date>` + `- add export button; fix path handling`.
4. **Commit + push.** Commit message = the changelog line. Push to
   `github.com/vacterro/<repo>`.
5. **First publish of a repo:** confirm name + public/private with user,
   then `gh repo create vacterro/<name>` (or add remote). After that, ship
   without asking.
6. LOG: `RUN: ship v3.2.1 -> pushed <hash>`.

### Perf ticket (`| perf`)
Measure baseline number first (profiler/timer/EXPLAIN — LOG it) → fix top
proven bottleneck only (N+1, O(n²) on real n, serial IO, missing index,
loop re-compute) → re-measure same way, LOG `<x>% vs baseline` → gain <20%
and uglier code → revert, LOG why. Behavior identical always.

## Memory maintenance (when LOG >300 lines or state lies)

Compact LOG: keep every DEC, last RUN per task, all unresolved FAILs;
collapse repeat PASSes to one line + count; header `# compacted <date>`.
BOARD DONE >30 → oldest to `archive.md`. STATE contradicts files → rebuild
from BOARD + LOG evidence, mark `blocker: "STATE rebuilt <date>, verify"`.
Facts beat memory: reality wins, fix the files.

## Iron rules

1. Verify before report. Not run = not done.
2. Memory writes are part of the work, not paperwork after it.
3. `next_action` always executable by an agent with zero chat history.
4. No secrets in `.vac/` — it travels with the repo.
5. Destructive ops (delete, force-push, schema drop) → confirm with user
   unless ticket pre-authorizes.
6. Cooperative tone across agents: handoffs state facts + warnings; next
   agent never has to guess.
7. Stop on first unexplained error; evidence, not retry-spam.
