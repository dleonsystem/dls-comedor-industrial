# Changelog

Todos los cambios notables en este proyecto se documentan en este archivo.

El formato sigue [Keep a Changelog](https://keepachangelog.com/es/1.1.0/)
y este proyecto adhiere a [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

---

## [Unreleased]

### Added
- Estructura inicial de monorepo con convenciones RUP.
- Configuración de CI/CD con GitHub Actions.
- Plantillas de issues y pull requests.
- Documentación de arquitectura y ADRs.
- Configuración de Docker y docker-compose para entorno de desarrollo.
- Hooks de pre-commit (ruff, mypy, bandit, detect-secrets).
- Archivo `.env.example` con todas las variables requeridas.
- Estandarización de trazabilidad en plantillas de issue y PR (matriz de ingeniería y cierre auditable).
- Sección de trazabilidad de entregables en `CONTRIBUTING.md`.
- Artefactos versionados de Semana 1 en `docs/project-control/` (alcance MVP, matriz de procesos y KPIs del piloto).

### Changed
- Se actualiza `docs/project-control/README.md` con estado real de avance: Semana 1 en `main` y Semana 2 en seguimiento por PRs `#8`, `#9` y `#10`.

---

## [0.1.0] — 2026-05-05

### Added
- Repositorio inicial con `README.md`, `LICENSE` (MIT) y `.gitignore`.

---

<!-- Tipos de cambio válidos:
  Added      — nuevas funcionalidades
  Changed    — cambios en funcionalidades existentes
  Deprecated — funcionalidades que serán eliminadas próximamente
  Removed    — funcionalidades eliminadas
  Fixed      — correcciones de bugs
  Security   — parches de seguridad
-->

[Unreleased]: https://github.com/dleonsystem/dls-comedor-industrial/compare/v0.1.0...HEAD
[0.1.0]: https://github.com/dleonsystem/dls-comedor-industrial/releases/tag/v0.1.0
