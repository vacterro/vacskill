# Säkerhetspolicy

## Omfattning

SAIPEN är en specifikation plus en liten uppsättning lokala installations-/exportskript (`bootstrap/inject.ps1`/`.sh`, `uninstall.ps1`/`.sh`, `export.ps1`/`.sh`). Det kör inte en server, samlar inte in telemetri och överför ingen data någonstans. Allt skripten gör är lokala filsystemskrivningar till filer du redan kontrollerar (dina egna `~/.claude`, `~/.gemini`, projektets `.saipen/`, etc.), var och en skyddad av en automatisk `.bak`-säkerhetskopia före den första ändringen.

De två saker som faktiskt är värda en säkerhetsrapport är:
1. Ett bootstrapskript som gör något med ditt filsystem eller git-historik utöver vad dess egna kommentarer/README beskriver.
2. Protokollets egna regel för hemlighetshygien (RFC.md § 1.1 -- skriv aldrig API-nycklar, tokens, lösenord i `STATE.md`/`BOARD.md`/`LOG.md`/`KNOWLEDGE/`/`kitchen/`) som har en verklig lucka som skulle få en agent som följer SAIPEN att läcka en hemlighet till en incheckad fil.

## Stödda versioner

Endast den senaste taggade utgåvan på `main` stöds. Detta är en protokollspecifikation, inte en långlivad tjänst -- det finns ingen LTS-gren.

## Rapportera en sårbarhet

Öppna ett GitHub-ärende. Om rapporten rör ett verkligt, för närvarande utnyttjbart problem (inte ett hypotetiskt), markera det som en privat/säkerhetsrådgivning (security advisory) via detta repots **Security**-flik ("Report a vulnerability") istället för ett offentligt ärende, så att det inte är offentligt synligt innan en fix släpps.

Inkludera: vilket skript eller RFC-regel, det konkreta scenariot och vad som faktiskt händer jämfört med vad som borde hända. Samma beviskrav som för andra felrapporter (se `CONTRIBUTING.md`).
