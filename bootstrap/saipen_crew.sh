#!/usr/bin/env sh
# saipen_crew.sh -- open three crew terminals at the project root (Unix/macOS).
# Each window shows the one command to type into the agent you start there.
# See extensions/subs/crew.md. Falls back to printing the commands if no
# terminal emulator is found.
PROJ="$(cd "$(dirname "$0")/.." && pwd)"

launch() { # $1=title  $2=hint line
  if command -v gnome-terminal >/dev/null 2>&1; then
    gnome-terminal --title="$1" --working-directory="$PROJ" -- sh -c "echo '$2'; exec sh"
  elif command -v konsole >/dev/null 2>&1; then
    konsole --new-tab -p tabtitle="$1" --workdir "$PROJ" -e sh -c "echo '$2'; exec sh" &
  elif command -v xterm >/dev/null 2>&1; then
    xterm -T "$1" -e "cd '$PROJ'; echo '$2'; exec sh" &
  elif [ "$(uname)" = "Darwin" ]; then
    osascript -e "tell application \"Terminal\" to do script \"cd '$PROJ'; echo '$2'\"" >/dev/null
  else
    echo "  [$1]  cd '$PROJ'  then type in your agent:  $2"
  fi
}

echo "saipen crew -- launching three windows (project: $PROJ)"
launch "SAIPEN MAIN"      "MAIN / Core writer  -> type: saipen continue"
launch "SAIPEN saihunt"   "saihunt / sensor    -> type: saihunt   (spawn+adopt, hunt on loop)"
launch "SAIPEN saipython" "saipython / fixer   -> type: saipython (spawn+adopt, fix in pen, OUTBOX)"
echo "Done. In MAIN, gather the workers any time with:  saipen sub collect"
