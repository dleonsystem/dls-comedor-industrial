# Semana 1 - KPIs del Piloto (200 Comensales)

## Objetivo

Definir indicadores operativos y tecnicos para evaluar el piloto con datos y habilitar decisiones de escalamiento.

## Hechos confirmados

1. El piloto inicial se ejecuta con Odoo sin Node.
2. Se requiere evidencia cuantitativa para decidir continuidad de arquitectura.

## Hallazgos

1. No habia tablero base de KPIs versionado para Semana 1.
2. No estaban definidos umbrales de alerta y responsables por indicador.

## Supuestos

1. Se medira por turno y consolidado diario.
2. Las fuentes de datos provienen de registros operativos y sistema ERP.

## KPIs del piloto

| KPI | Formula | Meta inicial | Umbral alerta | Frecuencia | Responsable |
|---|---|---|---|---|---|
| Tiempo de validacion p95 | Percentil 95 del tiempo de autorizacion | <= 0.5 s | > 0.8 s | Diario por turno | Lider tecnico |
| Tasa de validacion exitosa | Validaciones OK / Total validaciones | >= 98% | < 95% | Diario | Operaciones |
| Bloqueo de doble consumo correcto | Bloqueos correctos / Intentos duplicados | >= 99% | < 97% | Diario | QA funcional |
| Tiempo promedio en fila | Minutos promedio de espera | <= 3 min | > 5 min | Diario (hora pico) | Supervisor |
| Precision consumo registrado | Consumos conciliados / Consumos observados | >= 99% | < 97% | Diario | Auditor operativo |
| Merma sobre produccion | Kg merma / Kg produccion | <= 8% | > 12% | Diario/Semanal | Jefe de cocina |
| Quiebre de stock critico | Eventos por dia sin insumo critico | 0 | >= 1 | Diario | Compras/Almacen |
| Cumplimiento cierre diario | Cierres realizados / Cierres programados | 100% | < 100% | Diario | Supervisor de turno |
| Incidencias criticas | Numero de incidencias severidad alta | 0-1 | >= 2 | Diario | PM/Operaciones |

## Riesgos

1. Decisiones sin datos por falta de medicion continua.
2. Deteccion tardia de cuellos de botella.

## Recomendaciones

1. Revisar KPIs en comite diario corto (15 min).
2. Disparar acciones correctivas cuando se active umbral alerta.
3. Consolidar reporte semanal para decision de Fase 2.

## Criterios de aceptacion

1. Cada KPI tiene formula, meta, umbral, frecuencia y responsable.
2. El tablero se usa durante el piloto real.
3. Existe reporte de cierre de semana con tendencias.

## Estado y proximo paso

- Estado: Borrador listo para validacion.
- Proximo paso: Aprobacion y arranque de captura diaria.
