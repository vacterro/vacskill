# vacskill -- cross-agent project memory protocol

**v5.2.0** | [Changelog](CHANGELOG.md) | plain markdown | zero deps | MIT

VACSKILL defines a portable, file-backed project session protocol for LLM agents. Implementations MAY vary. The on-disk contract MUST remain stable.

This protocol acts as a strict state machine, allowing disparate agents to collaborate, hand off state, and recover from crashes with zero amnesia by treating the `.vacskill/` directory as the single source of truth.

Think `.git`, but for agent sessions.

## Architecture

The protocol is strictly normative. The core rules are defined in `vacskill/PROTOCOL.md`, formatted as a formal RFC specification. 

We explicitly separate the **Core Protocol** from **Adaptive Extensions**.

```
vacskill/                   <- THE CORE (distributable unit)
  PROTOCOL.md               normative core specification (MUST/SHOULD/MAY)
  phases/                   strict state machine logic
    validate.md             conformance testing
    init.md / plan.md / scout.md / build.md / verify.md / review.md / ship.md
    hunt.md / done.md / blocked.md

extensions/                 <- THE ADAPTIVE LAYER
  adapters/                 per-model instruction bridges
  schemas/                  canonical file schemas
  templates/                fresh .vacskill/ boilerplate

tests/                      <- CONFORMANCE LAYER
  validate.ps1 / .sh        protocol self-check validator
  scenarios/                mock states (crash-recovery, claim-conflicts, etc.)

STYLE.md / UI.md            <- NON-NORMATIVE VOICE / THEME
inject.ps1 / inject.sh      <- INSTALLERS
```

## Install

Run three commands to inject the protocol into any agent on your machine:
```bash
git clone https://github.com/vacterro/vacskill
cd vacskill
powershell -ExecutionPolicy Bypass -File .\inject.ps1     # Windows
bash inject.sh                                             # macOS / Linux
```

No install? Paste one line to your agent:
    Read <clone>/vacskill/PROTOCOL.md + <clone>/vacskill/STYLE.md and follow them.

## Editing the protocol

If you intend to modify this protocol, read `vacskill/PROTOCOL.md` first. The core is governed by strict RFC semantics. Do not add marketing foam to the core spec. Changes MUST be reflected in `schemas/`.