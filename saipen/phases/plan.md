# Phase: PLAN

Amplify user intent into tickets. <=8 lines of analysis: edge cases,
callers, migrations, UI states. Safe defaults over interrogation.

Ticket shape: one goal, independently verifiable, `needs:` for deps.
Board order = execution order. >10 tickets: waves, detail current only.

**Size gate:** <=2 files + obvious change: skip PLAN, edit, verify, LOG, done.

After PLAN: STATE -> SCOUT for first ticket.
If `goal_mode: true` (RFC § 2.4): do not pause here -- proceed straight into
SCOUT. Also increment `goal_waves` by 1 (this PLAN run = a new wave) and
checkpoint STATE. Hits the 3-`goal_waves`/20-`goal_tickets` cap? STOP here
instead of continuing -- full BOARD/STATE checkpoint, report progress, wait
for the user to re-invoke `saipen goal`.