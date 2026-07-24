# Sikkerhedspolitik

## Omfang

SAIPEN er en specifikation plus et lille sæt lokale installations-/eksportscripts (`bootstrap/inject.ps1`/`.sh`, `uninstall.ps1`/`.sh`, `export.ps1`/`.sh`). Den kører ikke en server, indsamler ikke telemetri, og overfører ikke nogen data nogen steder hen. Alt, hvad scripts gør, er lokale filsystemskrivninger til filer, du allerede kontrollerer (dine egne `~/.claude`, `~/.gemini`, projekt `.saipen/`, osv.), som hver især er beskyttet af en automatisk `.bak` backup, før den første ændring foretages.

De to ting, der faktisk er værd at lave en sikkerhedsrapport over:
1. Et bootstrap-script der gør noget ved dit filsystem eller din git-historik udover hvad dets egne kommentarer/README beskriver.
2. Protokollens egen regel for hemmelighedshygiejne (RFC.md § 1.1 -- skriv aldrig API-nøgler, tokens, adgangskoder i `STATE.md`/`BOARD.md`/`LOG.md`/`KNOWLEDGE/`/`kitchen/`) der har en reel mangel, som ville få en agent, der følger SAIPEN, til at lække en hemmelighed til en committet fil.

## Understøttede Versioner

Kun den seneste taggede udgivelse på `main` understøttes. Dette er en protokolspecifikation, ikke en langlivet tjeneste -- der er ingen LTS-gren.

## Rapportering af en Sårbarhed

Åbn et GitHub issue. Hvis rapporten involverer et virkeligt problem, der i øjeblikket kan udnyttes (ikke hypotetisk), så marker det som en privat/sikkerhedsadvisory via dette repositorys **Security** fane ("Report a vulnerability") i stedet for et offentligt issue, så det ikke er offentligt synligt før en rettelse er udgivet.

Inkluder: hvilket script eller RFC-regel, det konkrete scenarie, og hvad der faktisk sker vs. hvad der burde ske. Samme bevisstandard som enhver anden fejlrapport (se `CONTRIBUTING.md`).
