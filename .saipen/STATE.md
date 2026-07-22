---
phase: DONE
task: none
next_action: "v7.35.0 shipped -- user caught a conformance bug in a different project (FastPrompter: subs spawned at root-level subs/, not extensions/subs/) that surfaced a bigger question -- consolidated the whole file model under one .saipen/ roof. New attachment point for a consuming project: .saipen/extensions/<name>/ (was root extensions/<name>/) and .saipen/saitranslate/ (was root .saitranslate/). The SAIPEN home's own top-level extensions/ is unchanged -- that's the shipped library, a different thing from where a consuming project attaches its copy. Legacy root-level locations recognized as equivalent, migrate when convenient, never maintain both. Every RFC section, phase doc, and example-extension doc updated; this repo's own .saitranslate/ migrated via git mv. No open tickets. Board empty -- bare `saipen` auto-transitions to HUNT per RFC § 2.1."
blocker: none
saipen_version: 7
saipen_home: "V:\\___VAC\\__K\\__CODE\\_AI_STUFF_AGENTIC\\_SAIPEN"
agent: claude-sonnet-5
requires:
  - filesystem
  - git
mode: full
goal_mode: false
updated: 2026-07-23T01:40:00Z
---



