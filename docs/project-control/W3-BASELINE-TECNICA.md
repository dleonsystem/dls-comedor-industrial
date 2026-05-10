# Semana 3 - Baseline Tecnica de Implementacion y Operacion

## Contexto y objetivo

Establecer la baseline tecnica de corto plazo para ejecutar el piloto con control de riesgo, trazabilidad y consistencia entre desarrollo, QA y operacion.

## Hechos confirmados

1. El entorno base del proyecto opera con Odoo 18, PostgreSQL y Docker.
2. La estrategia de Fase 1 se mantiene sin microservicio Node.
3. Ya existen artefactos de alcance, procesos, KPIs, configuracion, datos y QA/UAT.

## Hallazgos

1. Falta consolidar una baseline tecnica operativa para alinear equipo Dev, QA y Ops.
2. Se requiere priorizar estabilidad y evidencia antes de escalar capacidad.

## Supuestos

1. El piloto se ejecuta en entorno controlado con datos validados.
2. Se aplican revisiones por PR con CI activo.

## Baseline tecnica (Semana 3)

### 1) Entornos

1. DEV: configuracion y pruebas funcionales tempranas.
2. QA: validacion integral por proceso y UAT.
3. PROD (piloto): despliegue controlado con checklist de salida.

### 2) Configuracion minima obligatoria

1. Variables de entorno auditadas y sin secretos en repositorio.
2. Checklist de modulos Odoo activados para piloto.
3. Politicas de acceso por rol y trazabilidad de cambios.

### 3) Calidad y seguridad

1. CI verde obligatorio antes de merge.
2. Evidencia de pruebas por proceso (QA/UAT).
3. Escaneo de seguridad y revision de dependencias activos.

### 4) Operacion y soporte

1. Cierre diario con evidencias de consumo, merma e incidencias.
2. Registro de incidentes y acciones correctivas.
3. Reporte semanal de KPIs y riesgos residuales.

### 5) Decision de escalamiento

1. Mantener Odoo-only mientras KPIs cumplan umbrales.
2. Evaluar arquitectura hibrida solo con evidencia de cuellos de botella.

## Criterios de aceptacion

1. Baseline validada por lider tecnico, QA y operacion.
2. Checklist de salida a piloto definido y firmado.
3. Plan de contingencia y rollback documentado para piloto.

## Riesgos

1. Desalineacion entre equipos por falta de punto de control tecnico unico.
2. Escalamiento prematuro sin evidencia de rendimiento.

## Recomendaciones

1. Ejecutar comite tecnico-funcional semanal con minuta.
2. Medir tendencia de KPIs y defectos para decision Go/No-Go.
3. Mantener cambios de arquitectura sujetos a ADR y evidencia.

## Estado y proximo paso

- Estado: listo para revision tecnica.
- Proximo paso: convertir baseline en checklist operativo de despliegue piloto.
