# Guía de Contribución — dls-comedor-industrial

¡Gracias por tu interés en contribuir! Este proyecto sigue la metodología **RUP (Rational Unified Process)** con iteraciones cortas y revisiones formales. Lée este documento antes de abrir un _issue_ o un _pull request_.

---

## Tabla de contenidos

1. [Código de conducta](#código-de-conducta)
2. [Metodología de trabajo (RUP)](#metodología-de-trabajo-rup)
3. [Flujo de ramas](#flujo-de-ramas)
4. [Proceso para contribuir](#proceso-para-contribuir)
5. [Estándares de código](#estándares-de-código)
6. [Mensajes de commit](#mensajes-de-commit)
7. [Revisiones y aprobaciones](#revisiones-y-aprobaciones)
8. [Reportar un bug](#reportar-un-bug)
9. [Proponer una nueva funcionalidad](#proponer-una-nueva-funcionalidad)
10. [Entorno de desarrollo local](#entorno-de-desarrollo-local)
11. [Trazabilidad de entregables](#trazabilidad-de-entregables)

---

## Código de conducta

Al participar en este proyecto aceptas mantener un ambiente respetuoso y profesional. Cualquier comportamiento inapropiado debe reportarse al responsable del repositorio.

---

## Metodología de trabajo (RUP)

El proyecto usa **cuatro fases RUP** mapeadas a milestones de GitHub:

| Fase          | Propósito                                           | Artefactos principales               |
|---------------|-----------------------------------------------------|--------------------------------------|
| **Inception** | Visión, alcance y viabilidad                        | Documento de visión, Caso de negocio |
| **Elaboration** | Arquitectura base, riesgos y plan de iteración   | ADRs, diagramas C4, prototipo        |
| **Construction** | Desarrollo iterativo e incremental              | Módulos, pruebas, CI verde           |
| **Transition** | Despliegue, capacitación y estabilización          | Manual de usuario, runbooks          |

Cada iteración dura **2 semanas** y produce un incremento funcional integrado y probado.

---

## Flujo de ramas

```
main          ← producción estable (protegida, sólo PRs)
develop       ← integración continua de features
feature/<ticket>-<descripcion-corta>   ← nuevas funcionalidades
fix/<ticket>-<descripcion-corta>       ← correcciones de bugs
hotfix/<ticket>-<descripcion-corta>    ← parches urgentes a main
release/<version>                      ← preparación de release
docs/<descripcion>                     ← sólo documentación
```

**Ejemplo:** `feature/CI-42-modulo-menu-semanal`

---

## Proceso para contribuir

1. **Abre un _issue_** usando la plantilla correspondiente (`bug_report` o `feature_request`).
2. **Espera asignación** — el equipo triagea issues en la reunión de inicio de iteración.
3. **Crea tu rama** desde `develop`:
   ```bash
   git checkout develop
   git pull origin develop
   git checkout -b feature/<ticket>-<descripcion>
   ```
4. **Implementa** los cambios siguiendo los estándares de código.
5. **Ejecuta las pruebas localmente**:
   ```bash
   make test
   make lint
   ```
6. **Confirma tus cambios** con mensajes convencionales (ver abajo).
7. **Abre un Pull Request** hacia `develop` usando la plantilla de PR.
8. **Espera revisión** de al menos **1 aprobación** antes de hacer merge.

---

## Estándares de código

- **Python**: PEP 8, tipado estático con `mypy`, formateado con `ruff format`.
- **SQL**: nombres en `snake_case`, siempre con comentarios en migraciones.
- **YAML/TOML**: indentación de 2 espacios (YAML) / 4 espacios (TOML).
- **Máximo de línea**: 88 caracteres (Python), 120 (demás archivos).
- Los hooks de `pre-commit` aplican estas reglas automáticamente — instálalos con `make setup`.

---

## Mensajes de commit

Seguimos **Conventional Commits** (`<tipo>(<ámbito>): <descripción>`):

| Tipo       | Cuándo usarlo                                  |
|------------|------------------------------------------------|
| `feat`     | Nueva funcionalidad                            |
| `fix`      | Corrección de bug                              |
| `docs`     | Cambios sólo en documentación                 |
| `style`    | Formato, espacios (sin cambio de lógica)       |
| `refactor` | Refactorización sin nueva feature ni bug fix   |
| `test`     | Añadir o corregir pruebas                      |
| `chore`    | Tareas de mantenimiento (CI, dependencias)     |
| `perf`     | Mejoras de rendimiento                         |
| `ci`       | Cambios en archivos de CI/CD                   |
| `revert`   | Revertir un commit anterior                    |

**Ejemplo:**
```
feat(odoo/comedor): agregar módulo de control de raciones

Implementa el modelo `comedor.racion` con campos de producto, cantidad
y empleado. Incluye vistas de lista y formulario.

Closes #42
```

---

## Revisiones y aprobaciones

- Todo PR requiere al menos **1 revisión aprobada**.
- Los PRs hacia `main` requieren **2 aprobaciones** (incluyendo el tech lead).
- Los checks de CI deben estar en verde antes del merge.
- El autor del PR **no puede aprobarse a sí mismo**.
- Usa comentarios de revisión constructivos y con ejemplos cuando sea posible.

---

## Reportar un bug

Usa la plantilla `.github/ISSUE_TEMPLATE/bug_report.md`. Incluye siempre:
- Versión del sistema / rama afectada.
- Pasos para reproducir.
- Comportamiento esperado vs. actual.
- Logs relevantes (sin datos sensibles).

---

## Proponer una nueva funcionalidad

Usa la plantilla `.github/ISSUE_TEMPLATE/feature_request.md`. Describe:
- El problema que resuelve.
- La solución propuesta.
- Alternativas consideradas.
- Si aplica, una propuesta de ADR en `docs/decisions/`.

---

## Entorno de desarrollo local

```bash
# Requisitos: Docker 24+, Docker Compose 2+, Python 3.11+, Make

# 1. Clonar y entrar al directorio
git clone https://github.com/dleonsystem/dls-comedor-industrial.git
cd dls-comedor-industrial

# 2. Configurar variables de entorno
cp .env.example .env

# 3. Instalar pre-commit y dependencias de desarrollo
make setup

# 4. Levantar el entorno
make up

# 5. Verificar que todo está en verde
make test
make lint
```

---

## Trazabilidad de entregables

Todo avance funcional, técnico u operativo debe dejar evidencia auditable.

Cadena mínima obligatoria:

1. **Issue**: abrir un issue usando plantilla (`feature_request` o `bug_report`) con alcance `In/Out`, criterios de aceptación y riesgos.
2. **Rama**: crear rama con convención definida (`feature/`, `fix/`, `docs/`, etc.) y asociarla al issue.
3. **Commits atómicos**: un cambio lógico por commit, usando Conventional Commits y referencia al issue cuando aplique.
4. **PR**: abrir PR con plantilla completa, incluyendo evidencia de pruebas y matriz de ingeniería.
5. **Revisión**: aprobación requerida y CI en verde antes de merge.
6. **Registro**: actualizar `CHANGELOG.md` y documentación relacionada cuando aplique.

Para control de proyecto, cada entregable debe distinguir explícitamente:

- **Hechos confirmados**
- **Hallazgos**
- **Supuestos**
- **Riesgos**
- **Recomendaciones**

Si un cambio no deja esta cadena completa, no se considera cerrado desde la perspectiva de ingeniería y trazabilidad.
