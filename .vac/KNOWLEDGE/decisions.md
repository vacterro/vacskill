# Decisions

- Protocol/personality split (v2.0.0): SKILL.md = cold workflow, STYLE.md =
  voices, UI.md = theme. Reason: long mixed prompts drift — every extra
  personality rule lowers compliance with workflow rules. Load STYLE with
  SKILL; UI only for UI work.
- Phases PLAN→SCOUT→BUILD→VERIFY→REVIEW→SHIP (v2.0.0): SCOUT mandatory
  before BUILD (most agent errors = invented architecture instead of read);
  VERIFY (works?) split from REVIEW (well made?).
- KNOWLEDGE/ over fat LOG (v2.0.0): LOG = time-ordered journal only;
  durable truth lives in architecture/conventions/decisions/traps files.
- FreeBuff-class readers (~/.agents/skills): need lowercase dir + real copy,
  skip junctions and uppercase names. Injector copies, never links there.
