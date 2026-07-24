# Politica di Sicurezza

## Ambito

SAIPEN è una specifica oltre a un piccolo set di script locali di installazione/esportazione (`bootstrap/inject.ps1`/`.sh`, `uninstall.ps1`/`.sh`, `export.ps1`/`.sh`). Non esegue un server, non raccoglie telemetria e non trasmette alcun dato da nessuna parte. Tutto ciò che gli script fanno sono scritture sul filesystem locale in file che tu già controlli (i tuoi `~/.claude`, `~/.gemini`, `.saipen/` del progetto, ecc.), ognuna protetta da un backup automatico `.bak` prima della prima modifica.

Le due cose che vale davvero la pena segnalare per la sicurezza:
1. Uno script di bootstrap che fa qualcosa al tuo filesystem o alla cronologia git oltre a ciò che i suoi stessi commenti/README descrivono.
2. La regola di igiene dei segreti del protocollo stesso (RFC.md § 1.1 -- non scrivere mai chiavi API, token, password in `STATE.md`/`BOARD.md`/`LOG.md`/`KNOWLEDGE/`/`kitchen/`) che ha una reale lacuna che causerebbe la perdita di un segreto in un file committato da parte di un agente che segue SAIPEN.

## Versioni Supportate

Solo l'ultima release taggata su `main` è supportata. Questa è una specifica di protocollo, non un servizio a lunga durata -- non esiste un ramo LTS.

## Segnalare una Vulnerabilità

Apri una issue su GitHub. Se la segnalazione riguarda un problema reale, attualmente sfruttabile (non ipotetico), contrassegnala come advisory privato/di sicurezza tramite la scheda **Security** di questo repository ("Report a vulnerability") invece di una issue pubblica, in modo che non sia visibile pubblicamente prima del rilascio di un fix.

Includi: quale script o regola RFC, lo scenario concreto e cosa succede effettivamente rispetto a cosa dovrebbe succedere. Lo stesso standard di prova di qualsiasi altra segnalazione di bug (vedi `CONTRIBUTING.md`).
