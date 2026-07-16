# vacskill -- cross-agent project memory protocol

**v5.1.0** | [Changelog](CHANGELOG.md) | plain markdown | zero deps | MIT

Listen up. This is a **protocol**, not a damn skill. It's the shared language. Lets any AI model open `.vacskill/`, see the state, read the truth, figure out the next step -- and pick up where the last idiot agent left off.

Think `.git`, but for agent sessions.

```
  Agent A ---\
  Agent B ----+---> .vacskill/ ---> week later: completely different model
  Agent C ---/      (the truth)
```

## Why zero amnesia

Models come and go. GPT today, Claude tomorrow, a toaster next year. The **memory stays**. Memory owns the project; the model is just a temp worker holding a shovel. Do the job, leave the record.

```
your-project/.vacskill/
  STATE.md        where we are + EXACT next command. No guessing.
  BOARD.md        tickets with needs: deps -- the boss.
  LOG.md          journal: every run, every decision, one line.
  KNOWLEDGE/      what is TRUE -- outlives every model.
```

Journal = what HAPPENED. Knowledge = what is TRUE. Chat = nothing. Chat is bullshit, it disappears. That single rule is why handoffs survive.

## Architecture -- 2-tier for token efficiency

Cold start loads ~110 lines (~1,200 tokens). Phase rules load on demand. Don't waste tokens reading shit you don't need right now.

```
vacskill/                   <- distributable unit
  PROTOCOL.md               boot protocol -- always loaded (~110 lines)
  phases/                   lazy-loaded per STATE.phase:
    init.md                   first-time setup
    plan.md                   ticket planning
    scout.md                  codebase reconnaissance
    build.md                  implementation
    verify.md                 verify + debug
    review.md                 review gates
    ship.md                   publish
    hunt.md                   autonomous bug sweep
  SKILL.md                  thin entry for skill-reading platforms
  STYLE.md                  voice (взбешённый дед с района, compressed)
  UI.md                     Win95 dark golden -- loaded only for UI work
adapters/                   per-model bridges, ~10 lines each
templates/                  fresh .vacskill/ boilerplate
style/                      optional voices: corporate, concise
schemas/                    frozen until orchestrator exists
inject.ps1 / inject.sh      one-shot installer
```

**How it works:**
1. Agent loads `PROTOCOL.md` (boot rules, memory layout, iron rules).
2. Agent reads `.vacskill/STATE.md` for current phase.
3. Agent loads `phases/<phase>.md`. Only rules for that phase.
4. Agent executes. Checkpoints after every single action.

BUILD session never parses SHIP rules. SCOUT never loads HUNT.
**Result: 60% fewer tokens per session vs monolithic v4.** Fucking efficient.

Every adapter ends same way: *"Everything else: follow PROTOCOL.md."*
95% model-independent.

## Three doctrines

- **Checkpoint as you go** -- dying agents get no goodbye turn. Worst crash loses one ticket. `git status` shows even that.
- **Board picks the task** -- `needs:` DAG, top unblocked ticket. Period. No "I felt like polishing the README".
- **Capability negotiation** -- no git? No SHIP. No terminal? MANUAL-VERIFY. Protocol degrades, agent never fakes. Fake it and you're out.

## Install

Stop crying, run three commands:
```bash
git clone https://github.com/vacterro/vacskill
cd vacskill
powershell -ExecutionPolicy Bypass -File .\inject.ps1     # Windows
bash inject.sh                                             # macOS / Linux
```

Injector finds every agent on the machine -- Claude Code, OpenCode, Codex, Gemini/Antigravity, Aider, generic `~/.agents` -- wires the protocol in. Idempotent. Re-run after `git pull`.

No install? Paste one line:
    Read <clone>/vacskill/PROTOCOL.md + <clone>/vacskill/STYLE.md and follow them.

## Use

| You say | What happens |
|---|---|
| `vacskill build me X` | notebook born, tickets planned, work starts |
| `vacskill` / `VACSKILL SET` | continues from notebook; empty board -> hunts bugs |
| `vacskill fix THING` | reproduce -> root cause -> regression test |
| `vacskill status` | state + numbers, touches nothing |
| `vacskill stop` | checkpoint, safe to walk away |
| `vacskill ship` | review gate -> 100% green -> your GitHub, tagged |

Every ticket: SCOUT -> BUILD -> VERIFY (honest conf: high/med/low).
REVIEW guards diff. Red never ships. Every loop has hard cap. Stop spinning and burning tokens at 3am.

## Supported platforms

Adapters: Claude Code, OpenCode, Codex CLI, Gemini/Antigravity, Aider, OpenAI, DeepSeek, Qwen. Plus generic paste-and-go. 

## Editing the protocol

Boot PROTOCOL.md stays <=120 lines. Phase files stay focused. New rule evicts stale one. Voice in STYLE.md, theme in UI.md, platform quirks in adapters/.
Improvements from real usage pain only -- speculative features are fat, not muscle.

MIT. Take it, wire it, let your robots talk to each other.