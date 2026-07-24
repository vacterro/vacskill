# Sikkerhetspolicy

## Omfang

SAIPEN er en spesifikasjon pluss et lite sett med lokale installasjons-/eksportskript (`bootstrap/inject.ps1`/`.sh`, `uninstall.ps1`/`.sh`, `export.ps1`/`.sh`). Den kjører ikke en server, samler ikke inn telemetri, og overfører ingen data noen steder. Alt skriptene gjør er lokale filsystemskrivinger til filer du allerede kontrollerer (din egen `~/.claude`, `~/.gemini`, prosjektets `.saipen/`, etc.), hver beskyttet av en automatisk `.bak` sikkerhetskopi før den første endringen.

De to tingene som faktisk er verdt en sikkerhetsrapport:
1. Et bootstrap-skript som gjør noe med filsystemet ditt eller git-historikken din
   utover det dets egne kommentarer/README beskriver.
2. Protokollens egen regel for hemmelighets-hygiene (RFC.md § 1.1 -- skriv aldri
   API-nøkler, tokens, passord inn i `STATE.md`/`BOARD.md`/`LOG.md`/
   `KNOWLEDGE/`/`kitchen/`) som har et reelt hull som vil forårsake at en
   agent som følger SAIPEN lekker en hemmelighet inn i en forpliktet (committed) fil.

## Støttede Versjoner

Kun den siste taggede utgivelsen på `main` støttes. Dette er en protokollspesifikasjon, ikke en langvarig tjeneste -- det er ingen LTS-gren.

## Rapportere et Sårbarhet

Åpne en GitHub-sak (issue). Hvis rapporten involverer et reelt problem som kan utnyttes akkurat nå (ikke et hypotetisk et), merk det som en privat/sikkerhetsrådgivning (security advisory) via
dette depotets **Security**-fane ("Report a vulnerability") i stedet for
en offentlig sak, slik at det ikke er offentlig synlig før en fiks rulles ut.

Inkluder: hvilket skript eller RFC-regel, det konkrete scenariet, og hva
som faktisk skjer i motsetning til hva som burde skje. Samme bevisstandard som enhver
annen feilrapport (se `CONTRIBUTING.md`).
