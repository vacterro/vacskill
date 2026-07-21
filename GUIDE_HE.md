<p align="center">
  <img src="assets/SAIPEN_design1.png" alt="SAIPEN Guide Title" width="800"/>
</p>

# מדריך SAIPEN (עברית)

SAIPEN הוא פנקס זיכרון בתיקייה `.saipen/` עבור סוכני AI.

## התחלה מהירה

1. **התקן פעם אחת לכל מחשב:**
```bash
git clone https://github.com/vacterro/saipen
cd saipen
powershell -ExecutionPolicy Bypass -File .\bootstrap\inject.ps1     # Windows
bash bootstrap/inject.sh                                            # macOS / Linux
```

2. **הפעל פרויקט:**
> `saipen set`

3. **עבודה:**
> `saipen`

## פקודות

| פקודה | פעולה |\n|---|---|\n| `saipen set` | אתחל תיקיית זיכרון `.saipen/` |\n| `saipen continue` | חדש עבודה מההערות |\n| `saipen stop` | שמור התקדמות ועצור |\n| `saipen status` | קרא את הלוח והמצב |\n| `saipen goal <text>` | עבור ליעד חדש |\n| `saipen clean` | ניקוי עמוק של המאגר |\n| `saipen translate` | בניית תרגום מבודדת ל-22 שפות |\n| `saipen ship` | הפעל תהליך שחרור |
