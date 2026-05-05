#!/usr/bin/env bash
# scripts/setup.sh — Configuración inicial del entorno de desarrollo
# Uso: bash scripts/setup.sh
set -euo pipefail

echo "🚀 Configurando entorno de desarrollo — dls-comedor-industrial"

# 1. Verificar dependencias
command -v python3 >/dev/null 2>&1 || { echo "❌ Python 3 no encontrado. Instálalo primero."; exit 1; }
command -v docker >/dev/null 2>&1 || { echo "❌ Docker no encontrado. Instálalo primero."; exit 1; }
command -v docker compose >/dev/null 2>&1 || { echo "❌ Docker Compose no encontrado."; exit 1; }

echo "✅ Dependencias verificadas."

# 2. Crear .env si no existe
if [ ! -f .env ]; then
  cp .env.example .env
  echo "📄 Archivo .env creado desde .env.example. Edítalo con tus valores."
else
  echo "⚠️  El archivo .env ya existe. No se sobreescribió."
fi

# 3. Instalar dependencias Python de desarrollo
echo "📦 Instalando dependencias Python..."
python3 -m pip install --upgrade pip
python3 -m pip install -e ".[dev]"

# 4. Instalar hooks de pre-commit
echo "🔗 Instalando hooks de pre-commit..."
pre-commit install --install-hooks
pre-commit install --hook-type commit-msg

echo ""
echo "✅ Entorno configurado correctamente."
echo "👉 Siguiente paso: make up"
