<p align="center">
  <img src="assets/SAIPEN_design1.png" alt="SAIPEN Guide Title" width="800"/>
</p>

# SAIPEN Gids (Nederlands)

SAIPEN is een geheugennotitieblok in de map `.saipen/` voor AI-agente.

## Snelstart

1. **Eenmalig installeren per machine:**
```bash
git clone https://github.com/vacterro/saipen
cd saipen
powershell -ExecutionPolicy Bypass -File .\bootstrap\inject.ps1     # Windows
bash bootstrap/inject.sh                                            # macOS / Linux
```

2. **Project starten:**
> `saipen set`

3. **Werken:**
> `saipen`

## Commando's

| Commando | Actie |\n|---|---|\n| `saipen set` | Geheugenmap `.saipen/` initialiseren |\n| `saipen continue` | Werk hervatten vanuit notities |\n| `saipen stop` | Voortgang opslaan & stoppen |\n| `saipen status` | Bord & status lezen |\n| `saipen goal <text>` | Draaien naar nieuw doel |\n| `saipen clean` | Diepe opschoning van repository |\n| `saipen translate` | Geïsoleerde vertaling build voor 22 talen |\n| `saipen ship` | Release flow activeren |
