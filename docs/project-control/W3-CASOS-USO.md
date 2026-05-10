# Semana 3 - Casos de Uso Prioritarios (Piloto 200 Comensales)

## Contexto y objetivo

Definir casos de uso operativos priorizados para convertir alcance y procesos en ejecucion controlada de sprint, con criterios de aceptacion verificables.

## Hechos confirmados

1. Semana 1 y Semana 2 ya estan integradas en `main` con trazabilidad por PR.
2. El piloto de Fase 1 continua con estrategia Odoo-only.
3. Los procesos criticos del piloto estan definidos: alta, validacion, servicio, merma, compras y cierre diario.

## Hallazgos

1. Falta consolidar casos de uso formalizados por actor para guiar backlog funcional.
2. Se requiere pasar de definicion de proceso a criterios Given/When/Then por escenario.

## Supuestos

1. Operaciones valida escenarios por rol durante Semana 3.
2. Los casos de uso se ejecutaran en DEV/QA antes de piloto productivo.

## Casos de uso priorizados

### CU-301 Alta de comensal

- Actor principal: Administrador operativo.
- Precondicion: contrato vigente y datos de identidad completos.
- Flujo principal:
  1. Capturar identidad y vigencia.
  2. Asociar turno y politica de consumo.
  3. Activar comensal.
- Resultado esperado: comensal habilitado para validacion.

### CU-302 Validacion de servicio por turno

- Actor principal: Operador de linea.
- Precondicion: menu activo y comensal vigente.
- Flujo principal:
  1. Capturar identificador de comensal.
  2. Evaluar politicas por turno.
  3. Autorizar o rechazar servicio.
- Resultado esperado: respuesta en ventana objetivo del piloto.

### CU-303 Bloqueo de doble consumo

- Actor principal: Operador de linea.
- Precondicion: consumo previo registrado en ventana restringida.
- Flujo principal:
  1. Intento de nuevo acceso.
  2. Evaluacion de historial de consumo.
  3. Bloqueo con motivo.
- Resultado esperado: no se registra servicio duplicado.

### CU-304 Registro de merma por etapa

- Actor principal: Jefe de cocina / almacen.
- Precondicion: lote y etapa identificados.
- Flujo principal:
  1. Registrar cantidad y causa.
  2. Clasificar etapa (almacen/cocina/linea).
  3. Confirmar impacto.
- Resultado esperado: merma trazable para analitica de costo.

### CU-305 Cierre diario operativo

- Actor principal: Supervisor de turno.
- Precondicion: consumos y mermas del turno capturados.
- Flujo principal:
  1. Consolidar incidencias.
  2. Validar checklist de cierre.
  3. Emitir reporte diario.
- Resultado esperado: cierre firmado y auditable.

## Criterios de aceptacion

1. Cada CU tiene actor, precondicion, flujo y resultado esperado.
2. Cada CU tiene trazabilidad a proceso de Semana 1.
3. Los CU se usan para crear tareas de sprint (tecnicas y funcionales).

## Riesgos

1. Casos de borde no documentados para hora pico.
2. Ambiguedad de actor responsable en escenarios compartidos.

## Recomendaciones

1. Agregar escenarios alternos por CU durante refinamiento.
2. Vincular cada CU con caso de prueba QA/UAT.
3. Mantener versionado por semana para auditoria de alcance.

## Estado y proximo paso

- Estado: listo para revision funcional.
- Proximo paso: convertir CU-301..305 en backlog de iteracion con estimacion.
