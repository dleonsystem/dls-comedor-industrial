# dls-comedor-industrial

> **ERP Comedor Industrial** — Sistema de gestión integral para comedores industriales, construido sobre Odoo 18, Python y PostgreSQL, orquestado con Docker y desplegado en GCP.

[![CI](https://github.com/dleonsystem/dls-comedor-industrial/actions/workflows/ci.yml/badge.svg)](https://github.com/dleonsystem/dls-comedor-industrial/actions/workflows/ci.yml)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)
[![Python 3.11+](https://img.shields.io/badge/python-3.11+-blue.svg)](https://www.python.org/)

---

## Tabla de contenidos

1. [Descripción](#descripción)
2. [Arquitectura](#arquitectura)
3. [Requisitos previos](#requisitos-previos)
4. [Instalación](#instalación)
5. [Uso](#uso)
6. [Estructura del repositorio](#estructura-del-repositorio)
7. [Variables de entorno](#variables-de-entorno)
8. [Pruebas](#pruebas)
9. [Contribución](#contribución)
10. [Changelog](#changelog)
11. [Licencia](#licencia)

---

## Descripción

**dls-comedor-industrial** es un monorepo que centraliza todos los componentes del sistema ERP para la gestión de comedores industriales:

- **Módulos Odoo 18** personalizados (menús, raciones, control de acceso, reportes).
- **Servicios de base de datos** PostgreSQL con migraciones versionadas.
- **Infraestructura como código** para GCP y Docker.
- **API auxiliar** para integraciones externas (tarjetas, biometría, etc.).

---

## Arquitectura

Consulta [`docs/architecture.md`](docs/architecture.md) para el diagrama completo.  
Las decisiones de diseño están documentadas como ADRs en [`docs/decisions/`](docs/decisions/).

---

## Requisitos previos

| Herramienta | Versión mínima |
|-------------|---------------|
| Docker      | 24.x          |
| Docker Compose | 2.x        |
| Python      | 3.11+         |
| Make        | 4.x           |
| Git         | 2.40+         |

---

## Instalación

```bash
# 1. Clonar el repositorio
git clone https://github.com/dleonsystem/dls-comedor-industrial.git
cd dls-comedor-industrial

# 2. Copiar y configurar variables de entorno
cp .env.example .env
# Edita .env con tus valores reales

# 3. Instalar hooks de pre-commit
make setup

# 4. Levantar el entorno de desarrollo
make up
```

---

## Uso

```bash
# Levantar todos los servicios
make up

# Ver logs en tiempo real
make logs

# Detener servicios
make down

# Ejecutar pruebas
make test

# Aplicar migraciones de BD
make db-migrate

# Acceder al shell de Odoo
make odoo-shell
```

La interfaz de Odoo estará disponible en: **http://localhost:8069**  
PgAdmin (opcional) en: **http://localhost:5050**

---

## Estructura del repositorio

```
dls-comedor-industrial/
├── .github/                  # Plantillas, workflows CI/CD y Dependabot
├── config/                   # Configuración por entorno
├── docs/                     # Documentación técnica y ADRs
├── infra/                    # Infraestructura como código (Docker, GCP)
├── packages/                 # Código/librerías compartidas entre servicios
├── scripts/                  # Scripts de utilidad (setup, deploy, seeds)
├── services/                 # Servicios del sistema
│   ├── db/                   # Migraciones, seeds y esquema de BD
│   └── odoo/                 # Módulos Odoo personalizados
├── tests/                    # Suite de pruebas global (integración, e2e)
├── .editorconfig
├── .env.example
├── .gitignore
├── .pre-commit-config.yaml
├── CHANGELOG.md
├── CODEOWNERS
├── CONTRIBUTING.md
├── docker-compose.yml
├── LICENSE
├── Makefile
├── pyproject.toml
└── README.md
```

---

## Variables de entorno

Copia `.env.example` a `.env` y ajusta cada valor.  
**Nunca** confirmes el archivo `.env` real en el repositorio.

```bash
cp .env.example .env
```

Consulta [`.env.example`](.env.example) para ver todas las variables disponibles.

---

## Pruebas

```bash
# Todas las pruebas
make test

# Solo pruebas unitarias
make test-unit

# Solo pruebas de integración
make test-integration

# Reporte de cobertura
make coverage
```

---

## Contribución

Lee [`CONTRIBUTING.md`](CONTRIBUTING.md) antes de abrir un PR.  
El proyecto sigue la metodología **RUP** con iteraciones versionadas y revisiones formales.

---

## Changelog

Todos los cambios notables se documentan en [`CHANGELOG.md`](CHANGELOG.md)  
siguiendo el formato [Keep a Changelog](https://keepachangelog.com/es/1.1.0/) y [SemVer](https://semver.org/).

---

## Licencia

Distribuido bajo la licencia **MIT**. Consulta el archivo [`LICENSE`](LICENSE) para más detalles.

Copyright © 2026 [dleonsystem](https://github.com/dleonsystem)
