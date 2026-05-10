# Semana 2 - Configuracion Funcional Base (Odoo)

## Contexto y objetivo

Configurar la base funcional del ERP para operar el piloto de 200 comensales en Fase 1 (sin Node), alineado al alcance de Semana 1.

## Hechos confirmados

1. La fase activa es Odoo-only para salida rapida del piloto.
2. El alcance, procesos y KPIs de Semana 1 ya estan definidos en esta carpeta.
3. El proyecto usa RUP con iteraciones cortas y control por PR.

## Hallazgos

1. El estado actual de implementacion funcional cubre una porcion parcial del dominio del comedor.
2. Falta evidencia consolidada de parametrizacion por modulo para operacion piloto.

## Supuestos

1. Se dispone de acceso a entorno de desarrollo y QA.
2. Operaciones y administracion participaran en validaciones funcionales.
3. Los modulos base de Odoo se instalaran segun priorizacion de piloto.

## Alcance de trabajo (Semana 2)

1. Configurar modulos base para piloto:
   - HR / asistencia operativa del staff.
   - Compras y proveedores.
   - Inventario y lotes.
   - MRP para recetas y produccion.
   - Contabilidad analitica por contrato.
2. Definir y aplicar checklist de configuracion por modulo.
3. Validar reglas de negocio minimas definidas en Semana 1.
4. Registrar evidencia funcional para revision en PR.

## Criterios de aceptacion

1. Existe checklist por modulo con estado completado o pendiente.
2. Las reglas criticas (servicio por turno, bloqueo duplicado, merma) quedan trazables.
3. Se documentan decisiones de configuracion y desviaciones detectadas.
4. Se publica evidencia de validacion funcional en PR.

## Riesgos

1. Parametrizacion incompleta de modulos criticos.
2. Desalineacion entre configuracion tecnica y reglas funcionales.
3. Retrabajo por falta de validacion temprana con operaciones.

## Recomendaciones

1. Ejecutar validaciones por proceso, no por modulo aislado.
2. Aplicar control de cambios: cualquier ajuste fuera de alcance debe abrir issue.
3. Mantener evidencia minima por cada bloque de configuracion.

## Estado y proximo paso

- Estado: Listo para ejecucion en Semana 2.
- Proximo paso: abrir issue de seguimiento y rama dedicada de documentacion/ejecucion.
