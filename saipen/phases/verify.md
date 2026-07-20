# Phase: VERIFY

## VERIFY -- does it work?

`extensions/security/` present? Read it first -- its README states the
scanners/constraints this repo requires before REVIEW (RFC § 1.9). Absent:
skip, no overhead.

`mode: manual-verify` (RFC § 1.3, no shell on this host)? MUST NOT
auto-transition to REVIEW. Ask the user to run the `verify:` command
themselves and report the result: `next_action: WAIT: run '<verify:
command>' and report pass or fail`. Proceed only once they confirm.

Repo's own harness only (never invent one). Strongest available:
parse -> import -> unit -> repro -> smoke.
`verify:` is the minimum. LOG every result.
New nontrivial logic -> repo-style test.
Fixed bug -> regression test that failed pre-fix.
GUI/env unverifiable -> LOG `MANUAL-VERIFY STEPS + EXPECTED`, never fake.
Close with `conf:` -- high (tests green), med (smoke only), low (manual).

## Debug (on FAIL)

Reproduce exactly, quote decisive error line.
Cheap suspects first (git log, config, env, named file).
Hypothesis -> LOG -> test -> fix root cause, not symptom.
Rejected hypotheses stay logged; never re-test without new evidence.
**Cap: 3 dead hypotheses OR 2 failed fix cycles -> move THIS ticket to the
`## BLOCKED` section on `BOARD.md` with the facts + dead ends noted on it,
then check for another unblocked `TODO` ticket and work that instead.**
`STATE.phase: BLOCKED` (which loads
`phases/blocked.md` and stops for the user) is reserved for when no other
ticket on the board is workable -- one stuck ticket MUST NOT halt a session
that still has other work available, under `goal_mode` or otherwise.

After VERIFY pass: tick BOARD, next ticket or STATE -> REVIEW.
`goal_mode: true`? Increment `goal_tickets` by 1 and checkpoint STATE
(RFC § 2.4). That hits the 3-`goal_waves`/20-`goal_tickets` cap? STOP here
instead of continuing -- full BOARD/STATE checkpoint, report progress, wait
for the user to re-invoke `saipen goal`.
