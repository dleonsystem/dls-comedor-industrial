# Semana 1 - Matriz de Procesos E2E

## Objetivo

Estandarizar los procesos criticos del piloto para operacion consistente, medible y auditable.

## Hechos confirmados

1. Los procesos criticos definidos para el arranque son: alta comensal, validacion, servicio, merma, compras y cierre diario.
2. El proyecto requiere trazabilidad de evidencias por proceso.

## Hallazgos

1. No existia una matriz E2E versionada en el repositorio.
2. La falta de estandar por proceso incrementa variabilidad entre turnos.

## Supuestos

1. Operacion por turnos matutino, vespertino y nocturno.
2. Cada proceso tiene responsable funcional asignado.

## Matriz de procesos

| Proceso | Objetivo | Responsable | Entrada | Salida | Regla critica | Evidencia |
|---|---|---|---|---|---|---|
| Alta comensal | Habilitar comensal para servicio | RRHH Operativo | Identidad, contrato, vigencia | Comensal activo/inactivo | Unicidad de identidad y vigencia valida | Registro de alta |
| Validacion | Autorizar/rechazar servicio | Operador de linea | Identificador + turno | Resultado de autorizacion | Maximo servicios por turno y vigencia activa | Log de validacion |
| Servicio | Registrar consumo autorizado | Operador de linea | Validacion aprobada | Consumo registrado | No registrar consumo duplicado | Folio/ticket de consumo |
| Merma | Capturar desperdicio | Almacen/Cocina | Cantidad, etapa, causa | Merma contabilizada | Causa obligatoria por merma | Bitacora de merma |
| Compras | Reabastecer insumos | Compras/Almacen | Stock minimo y demanda | Orden de compra y recepcion | Solo proveedor aprobado | OC y recepcion |
| Cierre diario | Consolidar operacion | Supervisor de turno | Consumo, merma, incidencias | Reporte diario de cierre | Cierre obligatorio por turno | Reporte firmado |

## Riesgos

1. Incidentes sin trazabilidad de responsable.
2. Falla de continuidad operativa por falta de estandar.

## Recomendaciones

1. Revisar cumplimiento de matriz al cierre de cada turno.
2. Usar la matriz como base de casos de prueba UAT.
3. Registrar desvio y accion correctiva en issue vinculado.

## Criterios de aceptacion

1. Los 6 procesos tienen responsable, entrada, salida y evidencia definida.
2. La matriz es aprobada por Operaciones y TI.
3. La matriz se usa como referencia oficial de piloto.

## Estado y proximo paso

- Estado: Borrador listo para validacion.
- Proximo paso: Validar en comite y publicar version aprobada.
