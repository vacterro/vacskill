<p align="center">
  <img src="assets/SAIPEN_design1.png" alt="SAIPEN Guide Title" width="800"/>
</p>

# SAIPEN Guide (Norsk)

SAIPEN er en minnenotatbok i mappen `.saipen/` for AI-agenter.

## Hurtigstart

1. **Installer én gang per maskin:**
```bash
git clone https://github.com/vacterro/saipen
cd saipen
powershell -ExecutionPolicy Bypass -File .\bootstrap\inject.ps1     # Windows
bash bootstrap/inject.sh                                            # macOS / Linux
```

2. **Start prosjekt:**
> `saipen set`

3. **Arbeid:**
> `saipen`

## Kommandoer

| Kommando | Handling |\n|---|---|\n| `saipen set` | Initaliser minnemappe `.saipen/` |\n| `saipen continue` | Gjenoppta arbeid fra notater |\n| `saipen stop` | Lagre fremdrift & stopp |\n| `saipen status` | Les tavle & status |\n| `saipen goal <text>` | Bytt til nytt mål |\n| `saipen clean` | Dyp repository-opprydding |\n| `saipen translate` | Isolert 22-språklig oversettelsesbygg |\n| `saipen ship` | Utløs lanseringsflyt |
