<p align="center">
  <img src="assets/SAIPEN_design1.png" alt="SAIPEN Guide Title" width="800"/>
</p>

# Przewodnik SAIPEN (Polski)

SAIPEN to notatnik pamięci w folderze `.saipen/` dla agentów AI.

## Szybki Start

1. **Zainstaluj raz na maszynę:**
```bash
git clone https://github.com/vacterro/saipen
cd saipen
powershell -ExecutionPolicy Bypass -File .\bootstrap\inject.ps1     # Windows
bash bootstrap/inject.sh                                            # macOS / Linux
```

2. **Uruchom w projekcie:**
> `saipen set`

3. **Praca:**
> `saipen`

## Polecenia

| Polecenie | Akcja |\n|---|---|\n| `saipen set` | Zainicjuj folder pamięci `.saipen/` |\n| `saipen continue` | Wznów pracę z notatek |\n| `saipen stop` | Zapisz postęp i zatrzymaj |\n| `saipen status` | Odczytaj tablicę i status |\n| `saipen goal <text>` | Przejdź do nowego celu |\n| `saipen clean` | Głębokie czyszczenie repozytorium |\n| `saipen translate` | Izolowana kompilacja tłumaczeń w 22 językach |\n| `saipen ship` | Uruchom przepływ wydania |
