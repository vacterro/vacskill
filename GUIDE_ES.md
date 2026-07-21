<p align="center">
  <img src="assets/SAIPEN_design1.png" alt="SAIPEN Guide Title" width="800"/>
</p>

# Guía SAIPEN (Español)

Escucha, novato. El problema es simple: tus agentes de IA tienen la memoria de un pez rojo.

**SAIPEN** es un cuaderno resistente dentro de la carpeta `.saipen/` de tu proyecto.

## Inicio Rápido

1. **Instalar una vez por máquina:**
```bash
git clone https://github.com/vacterro/saipen
cd saipen
powershell -ExecutionPolicy Bypass -File .\bootstrap\inject.ps1     # Windows
bash bootstrap/inject.sh                                            # macOS / Linux
```

2. **Iniciar proyecto:**
> `saipen set`

3. **Trabajar:**
> `saipen`

## Comandos

| Comando | Acción |\n|---|---|\n| `saipen set` | Inicializar carpeta de memoria `.saipen/` |\n| `saipen continue` | Reanudar trabajo desde notas |\n| `saipen stop` | Guardar progreso y detener |\n| `saipen status` | Leer tablero y estado |\n| `saipen goal <text>` | Pivotar hacia nuevo objetivo |\n| `saipen clean` | Limpieza profunda del repositorio |\n| `saipen translate` | Construcción aislada de traducción en 22 idiomas |\n| `saipen ship` | Desencadenar flujo de lanzamiento |
