<p align="center">
  <img src="assets/SAIPEN_design1.png" alt="SAIPEN Guide Title" width="800"/>
</p>

# دليل SAIPEN (العربية)

SAIPEN هو دفتر ملاحظات في مجلد `.saipen/` لوكلاء الذكاء الاصطناعي.

## البداية السريعة

1. **التثبيت مرة واحدة لكل جهاز:**
```bash
git clone https://github.com/vacterro/saipen
cd saipen
powershell -ExecutionPolicy Bypass -File .\bootstrap\inject.ps1     # Windows
bash bootstrap/inject.sh                                            # macOS / Linux
```

2. **بدء المشروع:**
> `saipen set`

3. **العمل:**
> `saipen`

## الأوامر

| الأمر | الإجراء |\n|---|---|\n| `saipen set` | تهيئة مجلد الذاكرة `.saipen/` |\n| `saipen continue` | استئناف العمل من الملاحظات |\n| `saipen stop` | حفظ التقدم والتوقف |\n| `saipen status` | قراءة اللوحة والحالة |\n| `saipen goal <text>` | التحول إلى هدف جديد |\n| `saipen clean` | تنظيف عميق للمستودع |\n| `saipen translate` | بناء ترجمة معزول بـ 22 لغة |\n| `saipen ship` | بدء تدفق الإصدار |
