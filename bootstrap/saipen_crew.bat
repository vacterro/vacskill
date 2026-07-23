@echo off
REM saipen_crew.bat -- one click, three crew windows (Windows).
REM Opens three terminals at the project root, each showing the single command
REM to type into the agent-chat you start in that window. See extensions/subs/crew.md.
setlocal
set "PROJ=%~dp0.."

start "SAIPEN crew - MAIN (Core writer)"  cmd /k "cd /d "%PROJ%" && echo === MAIN / Core writer (mode: full) === && echo Start your agent in this window, then type: && echo     saipen continue && echo."
start "SAIPEN crew - saihunt (sensor)"    cmd /k "cd /d "%PROJ%" && echo === saihunt / bug sensor (read-only) === && echo Start your agent in this window, then type: && echo     saihunt && echo (spawns + adopts the role, then hunts on loop into its OUTBOX) && echo."
start "SAIPEN crew - saipython (fixer)"   cmd /k "cd /d "%PROJ%" && echo === saipython / tail fixer (read-only) === && echo Start your agent in this window, then type: && echo     saipython && echo (spawns + adopts the role, fixes in its pen, hands patches via OUTBOX) && echo."

echo Three crew windows opened. In the MAIN window collect the workers any time with: saipen sub collect
endlocal
