# Política de Seguridad

## Alcance

SAIPEN es una especificación más un pequeño conjunto de scripts locales de instalación/exportación (`bootstrap/inject.ps1`/`.sh`, `uninstall.ps1`/`.sh`, `export.ps1`/`.sh`). No ejecuta un servidor, no recopila telemetría y no transmite ningún dato a ninguna parte. Todo lo que hacen los scripts son escrituras en el sistema de archivos local en archivos que usted ya controla (su propio `~/.claude`, `~/.gemini`, `.saipen/` del proyecto, etc.), cada uno protegido por una copia de seguridad automática `.bak` antes de la primera modificación.

Las dos únicas cosas que realmente ameritan un reporte de seguridad son:
1. Un script de inicio (bootstrap) haciendo algo en su sistema de archivos o historial de git más allá de lo que describen sus propios comentarios/README.
2. La propia regla de higiene de secretos del protocolo (RFC.md § 1.1 -- nunca escribir claves de API, tokens, contraseñas en `STATE.md`/`BOARD.md`/`LOG.md`/`KNOWLEDGE/`/`kitchen/`) que tenga una brecha real que causaría que un agente que sigue SAIPEN filtre un secreto en un archivo comprometido (committed).

## Versiones Soportadas

Solo la última versión etiquetada en `main` tiene soporte. Esta es una especificación de protocolo, no un servicio de larga duración -- no hay rama LTS.

## Reportar una Vulnerabilidad

Abra un issue en GitHub. Si el reporte involucra un problema real y actualmente explotable (no hipotético), márquelo como un aviso privado/de seguridad a través de la pestaña **Security** de este repositorio ("Report a vulnerability") en lugar de un issue público, para que no sea visible públicamente antes de que se publique una solución.

Incluya: qué script o regla de RFC, el escenario concreto y qué sucede realmente frente a lo que debería suceder. El mismo estándar de evidencia que cualquier otro reporte de error (ver `CONTRIBUTING.md`).
