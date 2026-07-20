# Phase: PLAN

Amplify user intent into tickets. <=8 lines of analysis: edge cases,
callers, migrations, UI states. Safe defaults over interrogation.

Ticket shape: one goal, independently verifiable, `needs:` for deps.
Every ticket SHOULD carry `| verify: <command or criterion>` (RFC § 1.2)
when known -- pin down how it'll be checked while the goal is still
fresh, not as an afterthought during VERIFY.
Board order = execution order. >10 tickets: waves, detail current only.

**Size gate:** <=2 files + obvious change? Skip detailed PLAN analysis
only -- BUILD -> VERIFY -> REVIEW -> SHIP -> DONE still all apply exactly
as normal, no correctness gate skipped for being small. LOG the size-gate
decision. STATE -> SCOUT or BUILD per the normal phase docs, never
straight to DONE.

After PLAN: STATE -> SCOUT for first ticket.
If `goal_mode: true` (RFC § 2.4): do not pause here -- proceed straight into
SCOUT. Also increment `goal_waves` by 1 (this PLAN run = a new wave) and
checkpoint STATE. Hits the 3-`goal_waves`/20-`goal_tickets` cap? STOP here
instead of continuing -- full BOARD/STATE checkpoint, report progress, wait
for the user to re-invoke `saipen goal`.