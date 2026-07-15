# VAC injector — installs VAC as default protocol on every agentic system found.
# Run from the clone dir:  powershell -ExecutionPolicy Bypass -File .\inject.ps1
# Idempotent: safe to re-run any time (skips what's already installed).

param([string]$VacHome = (Join-Path $PSScriptRoot "VAC"))

$ErrorActionPreference = "Continue"
try { $VacHome = (Resolve-Path $VacHome).Path } catch {
  Write-Host "FATAL: VAC folder not found at $VacHome" -ForegroundColor Red; exit 1
}
if (-not (Test-Path (Join-Path $VacHome "SKILL.md"))) {
  Write-Host "FATAL: SKILL.md missing in $VacHome" -ForegroundColor Red; exit 1
}

$block = @"

<!-- VAC:BEGIN -->
## VAC protocol (global)
On "VACSKILL SET" / "vac ..." commands, or when project root contains .vac/:
read $VacHome\SKILL.md + $VacHome\STYLE.md and follow them.
Memory: .vac/ at project root - read .vac/STATE.md before work; checkpoint
BOARD + STATE after every ticket, LOG line after every run.
Path missing (new machine)? clone github.com/vacterro/vacskills.
UI work: also obey $VacHome\UI.md (Win95 dark golden, Verdana, no AA).
<!-- VAC:END -->
"@

function Add-Block([string]$file) {
  if (Test-Path $file) {
    if (Select-String -Path $file -Pattern "VAC:BEGIN" -Quiet) { return "already" }
    Add-Content -Path $file -Value $block -Encoding utf8; return "block added"
  }
  $dir = Split-Path $file
  if (-not (Test-Path $dir)) { New-Item -ItemType Directory -Force $dir | Out-Null }
  Set-Content -Path $file -Value $block.TrimStart() -Encoding utf8
  return "file created"
}

function Add-Junction([string]$target) {
  if (Test-Path (Join-Path $target "SKILL.md")) { return "already" }
  if (Test-Path $target) { return "exists but not VAC - check manually" }
  $parent = Split-Path $target
  if (-not (Test-Path $parent)) { New-Item -ItemType Directory -Force $parent | Out-Null }
  cmd /c mklink /J "$target" "$VacHome" | Out-Null
  if (Test-Path (Join-Path $target "SKILL.md")) { return "junction created" }
  return "FAILED"
}

$h = $env:USERPROFILE
$report = New-Object System.Collections.ArrayList

# --- Claude Code ---
if (Test-Path "$h\.claude") {
  [void]$report.Add(@("Claude Code skill",      (Add-Junction "$h\.claude\skills\VAC")))
  [void]$report.Add(@("Claude Code CLAUDE.md",  (Add-Block   "$h\.claude\CLAUDE.md")))
} else { [void]$report.Add(@("Claude Code", "not installed - skip")) }

# --- OpenCode ---
if (Test-Path "$h\.config\opencode") {
  [void]$report.Add(@("OpenCode skill",     (Add-Junction "$h\.config\opencode\skills\vac")))
  [void]$report.Add(@("OpenCode AGENTS.md", (Add-Block   "$h\.config\opencode\AGENTS.md")))
} else { [void]$report.Add(@("OpenCode", "not installed - skip")) }

# --- Codex CLI ---
if (Test-Path "$h\.codex") {
  [void]$report.Add(@("Codex skill",     (Add-Junction "$h\.codex\skills\vac")))
  [void]$report.Add(@("Codex AGENTS.md", (Add-Block   "$h\.codex\AGENTS.md")))
} else { [void]$report.Add(@("Codex", "not installed - skip")) }

# --- Gemini CLI ---
if (Test-Path "$h\.gemini") {
  [void]$report.Add(@("Gemini GEMINI.md", (Add-Block "$h\.gemini\GEMINI.md")))
} else { [void]$report.Add(@("Gemini", "not installed - skip")) }

# --- Generic ~/.agents/skills (FreeBuff etc.) ---
# Copy, lowercase: these readers skip junctions and uppercase dirs.
if (Test-Path "$h\.agents\skills") {
  $old = "$h\.agents\skills\VAC"
  if ((Test-Path $old) -and (Get-Item $old -Force).LinkType) {
    cmd /c rmdir "$old" | Out-Null   # remove junction only, never a real dir
  }
  $dst = "$h\.agents\skills\vac"
  if (-not (Test-Path $dst)) { New-Item -ItemType Directory -Force $dst | Out-Null }
  Copy-Item (Join-Path $VacHome "SKILL.md"),(Join-Path $VacHome "UI.md"),(Join-Path $VacHome "STYLE.md") $dst -Force
  [void]$report.Add(@("~/.agents skills", "copied as 'vac' (re-run after updates)"))
} else { [void]$report.Add(@("~/.agents", "not installed - skip")) }

# --- Antigravity plugins (copy: IDE locks dirs, junction impossible while open) ---
$plugRoot = "$h\.gemini\config\plugins"
if (Test-Path $plugRoot) {
  Get-ChildItem $plugRoot -Directory | ForEach-Object {
    $skillsDir = Join-Path $_.FullName "skills"
    if (Test-Path $skillsDir) {
      $dst = Join-Path $skillsDir "VAC"
      if (-not (Test-Path $dst)) { New-Item -ItemType Directory -Force $dst | Out-Null }
      Copy-Item (Join-Path $VacHome "SKILL.md"),(Join-Path $VacHome "UI.md"),(Join-Path $VacHome "STYLE.md") $dst -Force
      [void]$report.Add(@("Antigravity [$($_.Name)]", "copied (re-run injector after VAC updates)"))
    }
  }
}

# --- Aider ---
$aider = "$h\.aider.conf.yml"
$skillPath = Join-Path $VacHome "SKILL.md"
if (Get-Command aider -ErrorAction SilentlyContinue) {
  if (-not (Test-Path $aider)) {
    Set-Content $aider "# VAC protocol auto-loaded`nread:`n  - $skillPath`n" -Encoding utf8
    [void]$report.Add(@("Aider conf", "created"))
  } elseif (Select-String -Path $aider -Pattern "VAC" -Quiet) {
    [void]$report.Add(@("Aider conf", "already"))
  } elseif (-not (Select-String -Path $aider -Pattern "^read:" -Quiet)) {
    Add-Content $aider "`n# VAC protocol auto-loaded`nread:`n  - $skillPath`n" -Encoding utf8
    [void]$report.Add(@("Aider conf", "read: appended"))
  } else {
    [void]$report.Add(@("Aider conf", "has own read: - add manually: $skillPath"))
  }
} else { [void]$report.Add(@("Aider", "not installed - skip")) }

# --- Report ---
Write-Host ""
Write-Host "VAC injector report (source: $VacHome)" -ForegroundColor Yellow
Write-Host ("-" * 60)
foreach ($r in $report) {
  $color = if ($r[1] -match "FAILED|manually") { "Red" }
           elseif ($r[1] -match "already|skip") { "DarkGray" } else { "Green" }
  Write-Host ("{0,-28} {1}" -f $r[0], $r[1]) -ForegroundColor $color
}
Write-Host ("-" * 60)
Write-Host "Done. Test: open any project in any agent, say: VACSKILL SET" -ForegroundColor Yellow
