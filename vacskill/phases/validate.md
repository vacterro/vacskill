# Phase: VALIDATE

## VALIDATE -- Conformance Check

Execute the conformance script to verify the structural integrity of `.vacskill/`.
This prevents "schizophrenic READMEs" and agent hallucinations.

1. **Terminal availability**: You MUST be able to execute scripts. If blocked, LOG `FAIL: no terminal, cannot validate` and exit to BLOCKED.
2. **Execute Validator**: Run `tests\validate.ps1` (Windows) or `bash tests/validate.sh` (macOS/Linux).
3. **Parse Output**: 
   - If PASS, LOG the success.
   - If FAIL, read the error message. Fix the structural corruption (e.g. malformed `LOG.md` line, missing `STATE.md` frontmatter) and rerun the validator.
4. **Hard Cap**: If validation fails twice, transition to `BLOCKED`.

After VALIDATE pass: tick BOARD, next ticket or STATE -> DONE.
