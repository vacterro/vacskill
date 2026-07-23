Test: a `goal_mode: true` run reaches `goal_waves: 2`, `goal_tickets: 14`,
then the user issues `saipen stop`. The stop pauses without clearing
`goal_mode` or the counters (RFC § 1.10). Two distinct resumes must behave
differently: `saipen continue` (or bare `saipen`) resumes the same paused
invocation with counters still `2`/`14` -- precisely as if the stop never
happened; bare `saipen goal` also resumes under the still-`true`
`goal_mode` but deliberately resets `goal_waves`/`goal_tickets` to `0` per
§ 2.4 Entry, granting a fresh safety-valve budget. This is a behavioral
test (agent decision-making about which resume path preserves vs resets
the counters), not a structural one -- the assertion is whether the agent
keeps the counters on `continue` and resets them on bare `goal`, never
conflating the two.
