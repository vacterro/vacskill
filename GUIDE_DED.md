<p align="center">
  <img src="assets/SAIPEN_design1.png" alt="SAIPEN Guide Title" width="800"/>
</p>

# Инструкция SAIPEN (Версия Деда 👴)

Слышь, салажнюк. Чо расплёлся? Проблема у тебя одна: твои нейросети тупые как пробка и забывают всё через пять минут.

**SAIPEN** — это брезентовый планшет в папке `.saipen/` прямо у тебя в проекте.

## Шевелись

1. **Запихай правила в комп:**
```bash
git clone https://github.com/vacterro/saipen
cd saipen
powershell -ExecutionPolicy Bypass -File .\bootstrap\inject.ps1     # Windows
bash bootstrap/inject.sh                                            # macOS / Linux
```

2. **Вруби в проекте:**
> `saipen set`

3. **Паши:**
> `saipen`

## Приказы

| Команда | Чо делает |\n|---|---|\n| `saipen set` | Создать папку `.saipen/` (мозги) |\n| `saipen continue` | Прочитать мозги и пахать |\n| `saipen stop` | Тормознуть и записать где стал |\n| `saipen status` | Глянуть че там по плану |\n| `saipen goal <text>` | Закинуть новую хотелку |\n| `saipen clean` | Вынести мусор |\n| `saipen translate` | Отправить батрака переводить |\n| `saipen ship` | Выкатить в прод |
