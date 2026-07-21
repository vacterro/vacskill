# schemas/ -- state.schema.json is live, the rest reference

JSON Schemas for STATE/BOARD/LOG. `state.schema.json` is machine-read:
`tools/validate.py` (the canonical validator, v7.24.0) checks STATE.md's
frontmatter against it directly -- required fields, enums, types. Editing
that schema changes what validation enforces; it is the single source of
truth for STATE's field list, keep it in lockstep with RFC.md § 1.2.

`board.schema.json` / `log.schema.json` remain descriptive reference only
(they describe a parsed representation; the validator checks the raw
Markdown grammar natively). Do not extend them speculatively -- the
Markdown files in `templates/` are the living spec for those two.
