# Beveiligingsbeleid

## Bereik

SAIPEN is een specificatie plus een kleine set lokale installatie-/export-
scripts (`bootstrap/inject.ps1`/`.sh`, `uninstall.ps1`/`.sh`,
`export.ps1`/`.sh`). Het draait geen server, verzamelt geen
telemetrie, en verzendt geen gegevens ergens naartoe. Alles wat de
scripts doen, zijn lokale bestandssysteem-schrijfacties naar bestanden die u al beheert
(uw eigen `~/.claude`, `~/.gemini`, project `.saipen/`, enz.), elk
beveiligd door een automatische `.bak` back-up vóór de eerste wijziging.

De twee dingen die echt een beveiligingsrapportage waard zijn:
1. Een bootstrap-script dat iets met uw bestandssysteem of gitgeschiedenis doet
   buiten wat de eigen opmerkingen/README beschrijven.
2. Een echte tekortkoming in de regelgeving voor geheimenhygiëne van het protocol zelf (RFC.md § 1.1 -- schrijf nooit
   API-sleutels, tokens, wachtwoorden in `STATE.md`/`BOARD.md`/`LOG.md`/
   `KNOWLEDGE/`/`kitchen/`) waardoor een agent die SAIPEN volgt een geheim in een gecommit bestand zou kunnen lekken.

## Ondersteunde Versies

Alleen de nieuwste getagde release op `main` wordt ondersteund. Dit is een
protocolspecificatie, geen langlopende dienst -- er is geen LTS-
branch.

## Een Kwetsbaarheid Melden

Open een GitHub issue. Als het rapport betrekking heeft op een echt, momenteel exploiteerbaar
probleem (geen hypothetisch), markeer het dan als een privé/beveiligingswaarschuwing via
het tabblad **Security** ("Report a vulnerability") van deze repository in plaats van
een openbaar issue, zodat het niet openbaar zichtbaar is voordat er een fix is uitgebracht.

Vermeld: welk script of welke RFC-regel, het concrete scenario, en wat
er werkelijk gebeurt vs. wat er zou moeten gebeuren. Dezelfde bewijsstandaard als elke
andere foutrapportage (zie `CONTRIBUTING.md`).
