# Makefile — dls-comedor-industrial
# Comandos de utilidad para el ciclo de desarrollo
# Uso: make <target>

.PHONY: help setup up down restart logs build test test-unit test-integration \
        coverage lint format typecheck security db-migrate db-shell odoo-shell \
        clean clean-all

# ── Variables ─────────────────────────────────────────────────────
COMPOSE        = docker compose
ODOO_SERVICE   = odoo
DB_SERVICE     = db
PYTHON         = python3
PRE_COMMIT     = pre-commit

# ── Ayuda ─────────────────────────────────────────────────────────
help:           ## Muestra esta ayuda
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | \
		awk 'BEGIN {FS = ":.*?## "}; {printf "  \033[36m%-20s\033[0m %s\n", $$1, $$2}'

# ── Setup inicial ─────────────────────────────────────────────────
setup:          ## Instala dependencias de desarrollo y hooks de pre-commit
	$(PYTHON) -m pip install --upgrade pip
	$(PYTHON) -m pip install -e ".[dev]"
	$(PRE_COMMIT) install --install-hooks
	$(PRE_COMMIT) install --hook-type commit-msg
	@echo "✅ Entorno de desarrollo listo."

# ── Docker Compose ────────────────────────────────────────────────
up:             ## Levanta todos los servicios en segundo plano
	$(COMPOSE) up -d

up-tools:       ## Levanta todos los servicios incluyendo herramientas (pgadmin)
	$(COMPOSE) --profile tools up -d

down:           ## Detiene y elimina los contenedores
	$(COMPOSE) down

restart:        ## Reinicia todos los servicios
	$(COMPOSE) restart

logs:           ## Muestra los logs en tiempo real
	$(COMPOSE) logs -f

logs-odoo:      ## Muestra logs sólo de Odoo
	$(COMPOSE) logs -f $(ODOO_SERVICE)

build:          ## Construye (o reconstruye) las imágenes Docker
	$(COMPOSE) build --no-cache

# ── Pruebas ───────────────────────────────────────────────────────
test:           ## Ejecuta toda la suite de pruebas
	$(PYTHON) -m pytest

test-unit:      ## Ejecuta sólo pruebas unitarias
	$(PYTHON) -m pytest tests/unit/ -v

test-integration: ## Ejecuta pruebas de integración (requiere servicios activos)
	$(PYTHON) -m pytest tests/integration/ -v

coverage:       ## Genera reporte de cobertura en HTML
	$(PYTHON) -m pytest --cov=services --cov-report=html
	@echo "📊 Reporte en: htmlcov/index.html"

# ── Calidad de código ─────────────────────────────────────────────
lint:           ## Ejecuta linter (ruff)
	ruff check services packages scripts tests

format:         ## Formatea el código (ruff format)
	ruff format services packages scripts tests

typecheck:      ## Verifica tipado estático (mypy)
	mypy services packages --config-file pyproject.toml

security:       ## Análisis de seguridad (bandit)
	bandit -c pyproject.toml -r services packages scripts

pre-commit:     ## Ejecuta todos los hooks de pre-commit
	$(PRE_COMMIT) run --all-files

# ── Base de datos ─────────────────────────────────────────────────
db-migrate:     ## Aplica migraciones pendientes de PostgreSQL
	$(COMPOSE) exec $(DB_SERVICE) psql \
		-U $$POSTGRES_USER -d $$POSTGRES_DB \
		-f /docker-entrypoint-initdb.d/migrate.sql

db-shell:       ## Abre psql en el contenedor de BD
	$(COMPOSE) exec $(DB_SERVICE) psql -U $$POSTGRES_USER -d $$POSTGRES_DB

db-backup:      ## Crea un backup de la BD
	$(COMPOSE) exec $(DB_SERVICE) pg_dump \
		-U $$POSTGRES_USER $$POSTGRES_DB \
		> backups/$$(date +%Y%m%d_%H%M%S)_comedor.sql
	@echo "💾 Backup creado en backups/"

# ── Odoo ──────────────────────────────────────────────────────────
odoo-shell:     ## Abre el shell de Odoo (odoo shell)
	$(COMPOSE) exec $(ODOO_SERVICE) odoo shell -d $$ODOO_DB

odoo-update:    ## Actualiza todos los módulos personalizados
	$(COMPOSE) exec $(ODOO_SERVICE) odoo -u comedor -d $$ODOO_DB --stop-after-init

odoo-install:   ## Instala el módulo comedor en la base de datos
	$(COMPOSE) exec $(ODOO_SERVICE) odoo -i comedor -d $$ODOO_DB --stop-after-init

# ── Limpieza ──────────────────────────────────────────────────────
clean:          ## Elimina artefactos de build y caché de Python
	find . -type d -name __pycache__ -exec rm -rf {} + 2>/dev/null || true
	find . -type f -name "*.pyc" -delete 2>/dev/null || true
	rm -rf .pytest_cache .mypy_cache .ruff_cache htmlcov .coverage coverage.xml

clean-all:      ## Limpieza completa incluyendo volúmenes Docker
	$(COMPOSE) down -v --remove-orphans
	$(MAKE) clean
	@echo "🧹 Limpieza completa realizada."
