#!/usr/bin/env bash
# VAC injector (macOS/Linux) — installs VAC as default on every agentic system found.
# Run from clone dir:  bash inject.sh
# Idempotent: re-run safe.

set -u
VAC_HOME="$(cd "$(dirname "$0")/VAC" 2>/dev/null && pwd)"
[ -f "$VAC_HOME/SKILL.md" ] || { echo "FATAL: VAC/SKILL.md not found"; exit 1; }

BLOCK="
<!-- VAC:BEGIN -->
## VAC protocol (global)
On \"VACSKILL SET\" / \"vac ...\" commands, or when project root contains .vac/:
read $VAC_HOME/SKILL.md + $VAC_HOME/STYLE.md and follow them.
Memory: .vac/ at project root - read .vac/STATE.md before work; checkpoint
BOARD + STATE after every ticket, LOG line after every run.
Path missing (new machine)? clone github.com/vacterro/vacskills.
UI work: also obey $VAC_HOME/UI.md (Win95 dark golden, Verdana, no AA).
<!-- VAC:END -->"

add_block() { # $1=file
  if [ -f "$1" ] && grep -q "VAC:BEGIN" "$1"; then echo "already"
  else mkdir -p "$(dirname "$1")"; printf '%s\n' "$BLOCK" >> "$1"; echo "block added"; fi
}
add_link() { # $1=target
  if [ -e "$1/SKILL.md" ]; then echo "already"
  elif [ -e "$1" ]; then echo "exists, not VAC - check manually"
  else mkdir -p "$(dirname "$1")"; ln -s "$VAC_HOME" "$1" && echo "symlink created" || echo "FAILED"; fi
}

echo "VAC injector (source: $VAC_HOME)"
echo "------------------------------------------------------------"
[ -d "$HOME/.claude" ]          && { printf '%-28s %s\n' "Claude Code skill"     "$(add_link "$HOME/.claude/skills/VAC")";
                                     printf '%-28s %s\n' "Claude Code CLAUDE.md" "$(add_block "$HOME/.claude/CLAUDE.md")"; } \
                                || printf '%-28s %s\n' "Claude Code" "not installed - skip"
[ -d "$HOME/.config/opencode" ] && { printf '%-28s %s\n' "OpenCode skill"        "$(add_link "$HOME/.config/opencode/skills/vac")";
                                     printf '%-28s %s\n' "OpenCode AGENTS.md"    "$(add_block "$HOME/.config/opencode/AGENTS.md")"; } \
                                || printf '%-28s %s\n' "OpenCode" "not installed - skip"
[ -d "$HOME/.codex" ]           && { printf '%-28s %s\n' "Codex skill"           "$(add_link "$HOME/.codex/skills/vac")";
                                     printf '%-28s %s\n' "Codex AGENTS.md"       "$(add_block "$HOME/.codex/AGENTS.md")"; } \
                                || printf '%-28s %s\n' "Codex" "not installed - skip"
[ -d "$HOME/.gemini" ]          && printf '%-28s %s\n' "Gemini GEMINI.md"        "$(add_block "$HOME/.gemini/GEMINI.md")" \
                                || printf '%-28s %s\n' "Gemini" "not installed - skip"
if [ -d "$HOME/.agents/skills" ]; then # copy, lowercase: these readers skip links/uppercase
  [ -L "$HOME/.agents/skills/VAC" ] && rm "$HOME/.agents/skills/VAC"
  mkdir -p "$HOME/.agents/skills/vac"
  cp "$VAC_HOME/SKILL.md" "$VAC_HOME/UI.md" "$VAC_HOME/STYLE.md" "$HOME/.agents/skills/vac/"
  printf '%-28s %s\n' "~/.agents skills" "copied as 'vac' (re-run after updates)"
else printf '%-28s %s\n' "~/.agents" "not installed - skip"; fi

if command -v aider >/dev/null 2>&1; then
  A="$HOME/.aider.conf.yml"
  if [ ! -f "$A" ]; then printf '# VAC protocol auto-loaded\nread:\n  - %s\n' "$VAC_HOME/SKILL.md" > "$A"; printf '%-28s %s\n' "Aider conf" "created"
  elif grep -q "VAC" "$A"; then printf '%-28s %s\n' "Aider conf" "already"
  elif ! grep -q "^read:" "$A"; then printf '\n# VAC protocol auto-loaded\nread:\n  - %s\n' "$VAC_HOME/SKILL.md" >> "$A"; printf '%-28s %s\n' "Aider conf" "read: appended"
  else printf '%-28s %s\n' "Aider conf" "has own read: - add manually: $VAC_HOME/SKILL.md"; fi
else printf '%-28s %s\n' "Aider" "not installed - skip"; fi

echo "------------------------------------------------------------"
echo "Done. Test: open any project in any agent, say: VACSKILL SET"
