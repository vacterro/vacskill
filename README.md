# VACSKILLS — One Skill, Any Agent

**v1.0.1** · [Changelog](CHANGELOG.md) · plain markdown · zero dependencies · MIT

Hit a usage limit on one AI agent → open another → say `VACSKILL SET` →
work continues exactly where it stopped. Claude Code, OpenCode, Gemini,
Codex, Aider — one brain, interchangeable hands.

Whole system = **2 files** (this repo, wherever you clone it):

```
vacskills/
  VAC/SKILL.md   the system: commands, memory, work loop, quality gates
  VAC/UI.md      mandatory UI theme (Win95 dark golden, Verdana no-AA)
  README.md      you are here
```

Plus per-project memory that VAC creates itself inside each project you
work on:

```
your-project/.vac/
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

Get it (anywhere you like — everything below works from any location):
```
git clone https://github.com/vacterro/vacskills
cd vacskills
```

**Claude Code** — link the skill once; edits to your clone apply instantly:

Windows (PowerShell, from the clone dir):
```powershell
$dst="$env:USERPROFILE\.claude\skills"
New-Item -ItemType Directory -Force $dst | Out-Null
cmd /c mklink /J "$dst\VAC" "$((Resolve-Path .\VAC).Path)"
```
macOS / Linux (from the clone dir):
```bash
mkdir -p ~/.claude/skills
ln -s "$(pwd)/VAC" ~/.claude/skills/VAC
```

**OpenCode** — supports the same trick into `~/.config/opencode/skills/vac`,
or skip: it reads the project `AGENTS.md` block that VAC writes on first
init. Zero setup either way.

**Codex CLI** — link into `~/.codex/skills/vac` the same way, or rely on
the `AGENTS.md` block.

**Gemini CLI / AI Pro** — reads `GEMINI.md`, which VAC creates per project
on init. Nothing global needed.

**Aider** — add to `~/.aider.conf.yml`:
```yaml
read:
  - /absolute/path/to/your/clone/VAC/SKILL.md
```

**Anything else** (Cline, OpenRouter wrappers, custom agents) — universal
fallback, works on any agent that can read files. Paste one line:
```
Read <path-to-your-clone>/VAC/SKILL.md and follow it.
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
Automatic: [VAC/UI.md](VAC/UI.md) theme enforced — dark golden Win95,
Verdana forced non-antialiased, pixel bevels, zero animation,
640×480-compact. Tokens + base CSS included, self-sufficient.

**Chat style**
Automatic caveman on every platform: compressed terse output, ~65% fewer
tokens, technical substance intact. Code/commits/README stay normal prose.
Off: "stop caveman".

## Rules for editing this system

- One skill. Resist splitting; add a section, not a file.
- Operational text only — if the model already knows it, don't write it.
- Every instruction imperative and checkable. Verification beats narration.
- Memory writes are part of work, not paperwork after it.
