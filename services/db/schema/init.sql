-- Schema inicial de la base de datos para dls-comedor-industrial
-- Este script se ejecuta automáticamente al crear el contenedor de PostgreSQL.
-- Los modelos de Odoo crean sus propias tablas mediante el ORM;
-- este archivo contiene extensiones, esquemas auxiliares o datos de configuración.

-- Extensión para UUIDs (útil para integraciones externas)
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

-- Extensión para búsqueda de texto completo en español
CREATE EXTENSION IF NOT EXISTS "unaccent";

-- Esquema auxiliar para datos de integración (biometría, RFID, etc.)
-- Los módulos Odoo usarán el esquema 'public' por defecto.
CREATE SCHEMA IF NOT EXISTS integracion;

COMMENT ON SCHEMA integracion IS 'Esquema para datos de integración con sistemas externos (RFID, biometría)';

-- Tabla de log de accesos (pre-Odoo, para integración futura)
CREATE TABLE IF NOT EXISTS integracion.log_acceso (
    id          BIGSERIAL PRIMARY KEY,
    empleado_ref VARCHAR(64) NOT NULL,          -- ID externo del empleado (tarjeta/huella)
    dispositivo VARCHAR(128),                   -- Identificador del dispositivo lector
    timestamp   TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    procesado   BOOLEAN NOT NULL DEFAULT FALSE, -- True cuando Odoo lo procesó
    payload     JSONB,                          -- Datos crudos del dispositivo
    CONSTRAINT chk_empleado_ref_not_empty CHECK (empleado_ref <> '')
);

CREATE INDEX IF NOT EXISTS idx_log_acceso_procesado
    ON integracion.log_acceso (procesado)
    WHERE procesado = FALSE;

CREATE INDEX IF NOT EXISTS idx_log_acceso_timestamp
    ON integracion.log_acceso (timestamp DESC);

COMMENT ON TABLE integracion.log_acceso IS 'Log de eventos de acceso desde dispositivos externos, pendientes de procesar por Odoo';
