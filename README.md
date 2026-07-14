# VACSKILLS — One Skill, Any Agent

**v1.0.0** · [Changelog](CHANGELOG.md) · Windows-first, plain markdown, zero dependencies

Hit a usage limit on one AI agent → open another → say `VACSKILL SET` →
work continues exactly where it stopped. Claude Code, OpenCode, Gemini,
Codex, Aider — one brain, interchangeable hands.

Whole system = **2 files**:

```
_VACSKILLS\
  VAC\SKILL.md   the system: commands, memory, work loop, quality gates
  VAC\UI.md      mandatory UI theme (Win95 dark golden, Verdana no-AA)
```

Plus per-project memory that VAC creates itself:

```
<project>\.vac\
  STATE.md   where work stands + handoff + next action   (rewritten)
  BOARD.md   tickets: TODO / DOING / DONE                (rewritten)
  LOG.md     decisions, runs, verdicts — append-only     (never rewritten)
```

## The idea

Agents are interchangeable workers; **`.vac/` is the shared brain.** Every
agent reads STATE before working and writes STATE before stopping. So when
Claude Code hits its limit, you open OpenCode or Gemini, say `VACSKILL SET`,
and it announces "Resume T-004. Next: …" and keeps going. No re-explaining,
ever.

## Install

**Claude Code** (native skill, run once):
```powershell
$dst="$env:USERPROFILE\.claude\skills"
New-Item -ItemType Directory -Force $dst | Out-Null
cmd /c mklink /J "$dst\VAC" "V:\___VAC\__K\__CODE\_AI_STUFF_AGENTIC\_VACSKILLS\VAC"
```
Junction = edit source once, everything updates.

**OpenCode** — reads project `AGENTS.md` natively; the block VAC writes on
init is enough. Nothing to install.

**Gemini CLI / AI Pro** — reads `GEMINI.md`; VAC creates it on init. For
chat-only Gemini paste the fallback line below.

**Anything else (OpenRouter tools: Cline, Aider, custom)** — universal
fallback, works on any agent with file access:
```
Read V:\___VAC\__K\__CODE\_AI_STUFF_AGENTIC\_VACSKILLS\VAC\SKILL.md and follow it.
```

## How to use — scenarios

**Start anything new**
> `vac build a Premiere automation panel`
VAC creates `.vac/`, writes pointer files, plans tickets to BOARD, starts
working them: BUILD → CHECK per ticket, SHIP gate at the end.

**Leaving / limit approaching**
> `vac stop`
Handoff written into STATE.md. Agent tells you: *Saved. On any agent say:
VACSKILL SET.* (Good agents do this automatically when context runs low.)

**Continue on another agent / another day**
> `VACSKILL SET`
Reads memory, re-verifies stale claims, announces resume point, works on.
Same phrase everywhere — Claude Code, OpenCode, Gemini.

**Bug**
> `vac fix login crashes on empty email`
Straight to CHECK/debug: reproduce → hypothesis in LOG → root-cause fix →
regression test → proof in LOG.

**Before merging / delivering**
> `vac ship`
Diff review: correctness → security → reliability → maintainability.
P0/P1 fixed on the spot. 100% green → publishes to `github.com/vacterro`:
README refreshed to beautiful, version bumped smallest-step
(3.1.0 → 3.1.0a micro / 3.2.1 little / 3.2.0 minor), tiny CHANGELOG line,
commit + push. Red never ships.

**Where are we?**
> `vac status`
Reads memory, reports phase / board / blockers. Changes nothing.

**Tiny tweak**
Just ask normally. VAC skips ceremony for ≤2-file obvious changes — edit,
verify, one LOG line.

**Any UI work**
Automatic: UI.md theme enforced — dark golden Win95, Verdana forced
non-antialiased, pixel bevels, zero animation, 640×480-compact. Canonical
ref: `_ref\vintage\SKILL.md`.

**Chat style**
Automatic caveman on every platform: compressed terse output, ~65% fewer
tokens, technical substance intact. Code/commits/README stay normal prose.
Off: "stop caveman".

## Rules for editing this system

- One skill. Resist splitting; add a section, not a file.
- Operational text only — if the model already knows it, don't write it.
- Every instruction imperative and checkable. Verification beats narration.
- Memory writes are part of work, not paperwork after it.
