# Turvallisuuskäytäntö

## Laajuus

SAIPEN on spesifikaatio plus pieni joukko paikallisia asennus/vienti -skriptejä (`bootstrap/inject.ps1`/`.sh`, `uninstall.ps1`/`.sh`, `export.ps1`/`.sh`). Se ei aja palvelinta, ei kerää telemetriaa, eikä siirrä mitään dataa minnekään. Kaikki, mitä skriptit tekevät, on paikallisia tiedostojärjestelmän kirjoituksia tiedostoihin, joita jo hallitset (oma `~/.claude`, `~/.gemini`, projektin `.saipen/` jne.), joista jokaista suojaa automaattinen `.bak`-varmuuskopio ennen ensimmäistä muutosta.

Kaksi asiaa, joista todella kannattaa tehdä turvallisuusilmoitus:
1. Bootstrap-skripti, joka tekee tiedostojärjestelmällesi tai git-historiallesi jotain muuta kuin mitä sen omat kommentit/README kuvaavat.
2. Protokollan oma salaisuuksien hygienia -sääntö (RFC.md § 1.1 -- älä koskaan kirjoita API-avaimia, tokeneita tai salasanoja tiedostoihin `STATE.md`/`BOARD.md`/`LOG.md`/`KNOWLEDGE/`/`kitchen/`), jossa on todellinen aukko, joka aiheuttaisi SAIPENia seuraavan agentin vuotavan salaisuuden versiohallintaan (committed file).

## Tuetut versiot

Vain viimeisin tagattu julkaisu `main`-haarassa on tuettu. Tämä on protokollaspesifikaatio, ei pitkäikäinen palvelu -- LTS-haaraa ei ole.

## Haavoittuvuudesta ilmoittaminen

Avaa GitHub-issue (tiketti). Jos raportti koskee todellista, tällä hetkellä hyödynnettävissä olevaa ongelmaa (ei hypoteettista), merkitse se yksityiseksi/turvallisuustiedotteeksi (private/security advisory) tämän repon **Security** -välilehden kautta ("Report a vulnerability") julkisen issuen sijaan, jotta se ei ole julkisesti näkyvillä ennen korjauksen julkaisua.

Sisällytä mukaan: mikä skripti tai RFC-sääntö, konkreettinen skenaario ja mitä todellisuudessa tapahtuu vs. mitä pitäisi tapahtua. Sama todisteiden standardi kuin missä tahansa muussakin bugiraportissa (katso `CONTRIBUTING.md`).
