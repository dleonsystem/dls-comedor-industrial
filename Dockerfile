# Dockerfile — Odoo 18 personalizado para dls-comedor-industrial
# Imagen base oficial de Odoo 18
ARG ODOO_VERSION=18.0
FROM odoo:${ODOO_VERSION}

LABEL maintainer="dleonsystem <dev@dleonsystem.com>" \
      description="DLS Comedor Industrial — Odoo 18 con módulos personalizados" \
      org.opencontainers.image.source="https://github.com/dleonsystem/dls-comedor-industrial"

# ── Variables de build ────────────────────────────────────────────
ARG ODOO_ADDONS_PATH=/mnt/extra-addons

# ── Instalar dependencias del sistema adicionales ─────────────────
USER root
RUN apt-get update && apt-get install -y --no-install-recommends \
    # Utilidades
    curl \
    git \
    # Para módulos con dependencias nativas
    libpq-dev \
    && rm -rf /var/lib/apt/lists/*

# ── Copiar requirements adicionales de módulos personalizados ─────
COPY services/odoo/requirements.txt /tmp/odoo-extra-requirements.txt
RUN pip install --no-cache-dir -r /tmp/odoo-extra-requirements.txt

# ── Copiar módulos Odoo personalizados ────────────────────────────
COPY services/odoo/addons/ ${ODOO_ADDONS_PATH}/

# ── Copiar configuración de Odoo ──────────────────────────────────
COPY services/odoo/config/odoo.conf /etc/odoo/odoo.conf

# ── Permisos ──────────────────────────────────────────────────────
RUN chown -R odoo:odoo ${ODOO_ADDONS_PATH} /etc/odoo/odoo.conf

USER odoo

# ── Puerto de la interfaz web ─────────────────────────────────────
EXPOSE 8069 8072

# ── Healthcheck ───────────────────────────────────────────────────
HEALTHCHECK --interval=30s --timeout=10s --start-period=60s --retries=3 \
    CMD curl -f http://localhost:8069/web/health || exit 1

CMD ["odoo"]
