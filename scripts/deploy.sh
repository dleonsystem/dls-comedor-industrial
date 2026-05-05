#!/usr/bin/env bash
# scripts/deploy.sh — Script de despliegue a GCP (staging / producción)
# Uso: bash scripts/deploy.sh [staging|production]
# Requiere: gcloud CLI autenticado, Docker, variables de entorno configuradas
set -euo pipefail

ENVIRONMENT="${1:-staging}"
PROJECT_ID="${GCP_PROJECT_ID:-}"
REGION="${GCP_REGION:-us-central1}"
IMAGE_NAME="gcr.io/${PROJECT_ID}/dls-comedor-industrial"
GIT_SHA=$(git rev-parse --short HEAD)
IMAGE_TAG="${IMAGE_NAME}:${GIT_SHA}"

echo "🚀 Desplegando a ${ENVIRONMENT} — commit ${GIT_SHA}"

# Validaciones
if [ -z "$PROJECT_ID" ]; then
  echo "❌ GCP_PROJECT_ID no está configurado."
  exit 1
fi

if [[ "$ENVIRONMENT" != "staging" && "$ENVIRONMENT" != "production" ]]; then
  echo "❌ Entorno inválido: '${ENVIRONMENT}'. Usa 'staging' o 'production'."
  exit 1
fi

# 1. Build de la imagen Docker
echo "📦 Construyendo imagen Docker..."
docker build -t "${IMAGE_TAG}" .
docker tag "${IMAGE_TAG}" "${IMAGE_NAME}:latest-${ENVIRONMENT}"

# 2. Push al registro de GCP
echo "⬆️  Subiendo imagen a GCR..."
docker push "${IMAGE_TAG}"
docker push "${IMAGE_NAME}:latest-${ENVIRONMENT}"

# 3. Desplegar en Cloud Run
echo "☁️  Desplegando en Cloud Run (${REGION})..."
gcloud run deploy "comedor-odoo-${ENVIRONMENT}" \
  --image "${IMAGE_TAG}" \
  --region "${REGION}" \
  --project "${PROJECT_ID}" \
  --platform managed \
  --allow-unauthenticated \
  --set-env-vars "APP_ENV=${ENVIRONMENT}"

echo ""
echo "✅ Despliegue a ${ENVIRONMENT} completado."
echo "🔗 URL: $(gcloud run services describe comedor-odoo-${ENVIRONMENT} \
  --region ${REGION} --project ${PROJECT_ID} --format 'value(status.url)')"
