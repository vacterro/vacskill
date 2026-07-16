---
name: vacskill
description: >
  Cross-agent work protocol (v5). Trigger on "VACSKILL SET", "vacskill",
  "vac" (alias) and subcommands. 2-tier architecture: boot PROTOCOL.md
  (~110 lines) loads always; phases/ modules load on demand per STATE.
  Persistent .vacskill/ memory lets any agent continue another's work.
---

# vacskill -- skill adapter

Thin entry for skill-reading platforms. The system lives elsewhere:

1. **Read `PROTOCOL.md` here -- the boot protocol. Follow it.**
2. **Read `STYLE.md` here -- voices. Load both.**
3. **Phase modules in `phases/` -- loaded by boot per STATE.md phase.**
4. UI work: also read `UI.md` (Win95 dark golden, Verdana, no AA).

Platform notes:
- Native task lists mirror `.vacskill/BOARD.md`, never replace it.
- Prefer file tools over shell redirects -- UTF-8 no BOM.
- PROTOCOL.md decides. No rule here overrides it.