# Polityka Bezpieczeństwa

## Zakres

SAIPEN to specyfikacja plus mały zestaw lokalnych skryptów instalacyjnych/eksportujących
(`bootstrap/inject.ps1`/`.sh`, `uninstall.ps1`/`.sh`,
`export.ps1`/`.sh`). Nie uruchamia serwera, nie zbiera
telemetrii i nie przesyła żadnych danych nigdzie. Wszystko, co
robią skrypty, to lokalne zapisy w systemie plików na plikach, które już kontrolujesz
(twoje własne `~/.claude`, `~/.gemini`, projekt `.saipen/`, itp.), każdy
zabezpieczony automatyczną kopią zapasową `.bak` przed pierwszą modyfikacją.

Dwie rzeczy faktycznie warte zgłoszenia bezpieczeństwa:
1. Skrypt ładujący (bootstrap) robiący coś w twoim systemie plików lub historii git
   poza tym, co opisują jego własne komentarze/README.
2. Własna reguła higieny sekretów protokołu (RFC.md § 1.1 -- nigdy nie wpisuj
   kluczy API, tokenów, haseł do `STATE.md`/`BOARD.md`/`LOG.md`/
   `KNOWLEDGE/`/`kitchen/`) mająca rzeczywistą lukę, która spowodowałaby, że
   agent postępujący zgodnie z SAIPEN ujawniłby sekret w commitowanym pliku.

## Wspierane Wersje

Tylko najnowsze wydanie oflagowane (tagged release) na `main` jest wspierane. To jest
specyfikacja protokołu, a nie długoterminowa usługa -- nie ma gałęzi LTS.

## Zgłaszanie Podatności

Otwórz zgłoszenie (issue) na GitHub. Jeśli raport dotyczy rzeczywistego, obecnie możliwego do wykorzystania
problemu (nie hipotetycznego), oznacz go jako prywatny/biuletyn bezpieczeństwa (private/security advisory) za pośrednictwem
karty **Security** tego repozytorium ("Report a vulnerability") zamiast
publicznego zgłoszenia, aby nie był widoczny publicznie zanim poprawka zostanie wydana.

Dołącz: który skrypt lub reguła RFC, konkretny scenariusz oraz co
faktycznie się dzieje vs. co powinno się stać. Ten sam standard dowodowy co każde
inne zgłoszenie błędu (zobacz `CONTRIBUTING.md`).
