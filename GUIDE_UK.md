<p align="center">
  <img src="assets/SAIPEN_design1.png" alt="SAIPEN Guide Title" width="800"/>
</p>

# Гід SAIPEN (Українська)

Слухай сюди, салага. Проблема проста: твої AI-агенти мають пам'ять як у золотої рибки.

**SAIPEN** — це блокнот у папці `.saipen/` прямо в твоєму проекті.

## Швидкий старт

1. **Встановити один раз на машину:**
```bash
git clone https://github.com/vacterro/saipen
cd saipen
powershell -ExecutionPolicy Bypass -File .\bootstrap\inject.ps1     # Windows
bash bootstrap/inject.sh                                            # macOS / Linux
```

2. **Запустити в проекті:**
> `saipen set`

3. **Працювати:**
> `saipen`

## Команди

| Команда | Дія |\n|---|---|\n| `saipen set` | Ініціалізувати папку пам'яті `.saipen/` |\n| `saipen continue` | Відновити роботу за нотатками |\n| `saipen stop` | Зберегти прогрес та зупинити |\n| `saipen status` | Прочитати дошку та статус |\n| `saipen goal <text>` | Перейти до нової мети |\n| `saipen clean` | Глибоке очищення репозиторію |\n| `saipen translate` | Ізольована збірка перекладів на 22 мови |\n| `saipen ship` | Запустити реліз |
