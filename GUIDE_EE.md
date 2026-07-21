<p align="center">
  <img src="assets/SAIPEN_design1.png" alt="SAIPEN Guide Title" width="800"/>
</p>

# SAIPEN Juhis (Eesti)

Kuula siia, algaja. Probleem on lihtne: sinu AI agentidel on kuldkala mälu. Eile veetsid pool päeva oma arhitektuuri selgitades ja täna avad uue vestluse ning see hakkab kõike nullist ehitama ja lollakaid küsimusi küsima.

**SAIPEN** on lihtsalt üks kuradi märkmik kaustas `.saipen/`.

## Lühijuhend

1. **Paigalda üks kord masina kohta:**
```bash
git clone https://github.com/vacterro/saipen
cd saipen
powershell -ExecutionPolicy Bypass -File .\bootstrap\inject.ps1     # Windows
bash bootstrap/inject.sh                                            # macOS / Linux
```

2. **Käivita projektis:**
> `saipen set`

3. **Tööta:**
> `saipen`

## Käsud

| Käsk | Tegevus |\n|---|---|\n| `saipen set` | Initsialiseeri mälukaust `.saipen/` |\n| `saipen continue` | Jätka tööd märkmete põhjal |\n| `saipen stop` | Salvesta progress ja peatu |\n| `saipen status` | Loe tahvlit ja olekut |\n| `saipen goal <text>` | Liigu uue eesmärgi juurde |\n| `saipen clean` | Puhasta repositoorium sügavalt |\n| `saipen translate` | Eraldatud 22-keelne tõlkeehitus |\n| `saipen ship` | Käivita väljalase |
