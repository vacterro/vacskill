<!-- TRANSLATED TO BG -->
# Security Policy

## Scope

SAIPEN is a specification plus a small set of local install/export
scripts (`bootstrap/inject.ps1`/`.sh`, `uninstall.ps1`/`.sh`,
`export.ps1`/`.sh`). It does not run a server, does not collect
telemetry, and does not transmit any data anywhere. Everything the
scripts do is local filesystem writes to files you already control
(your own `~/.claude`, `~/.gemini`, project `.saipen/`, etc.), each
guarded by an automatic `.bak` backup before the first modification.

The two things actually worth a security report:
1. A bootstrap script doing something to your filesystem or git history
   beyond what its own comments/README describe.
2. The protocol's own secrets-hygiene rule (RFC.md § 1.1 -- never write
   API keys, tokens, passwords into `STATE.md`/`BOARD.md`/`LOG.md`/
   `KNOWLEDGE/`/`kitchen/`) having a real gap that would cause an
   agent following SAIPEN to leak a secret into a committed file.

## Supported Versions

Only the latest tagged release on `main` is supported. This is a
protocol specification, not a long-lived service -- there is no LTS
branch.

## Reporting a Vulnerability

Open a GitHub issue. If the report involves a real, currently-exploitable
problem (not a hypothetical), mark it as a private/security advisory via
this repository's **Security** tab ("Report a vulnerability") instead of
a public issue, so it isn't publicly visible before a fix ships.

Include: which script or RFC rule, the concrete scenario, and what
actually happens vs. what should happen. Same evidence standard as any
other bug report (see `CONTRIBUTING.md`).
