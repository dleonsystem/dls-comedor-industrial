# Semana 3 - Catalogo de Reglas de Negocio Priorizadas

## Contexto y objetivo

Definir reglas de negocio verificables para controlar operacion, costo y cumplimiento del piloto de comedor industrial.

## Hechos confirmados

1. El piloto inicia con 200 comensales y objetivo de escalamiento.
2. El control de consumo por turno y mermas es critico para rentabilidad.
3. Se requiere trazabilidad de decisiones para licitacion y auditoria.

## Hallazgos

1. Existen reglas funcionales en narrativa, pero falta catalogo priorizado con criterio testeable.
2. Se requiere separar reglas operativas de reglas de excepcion.

## Supuestos

1. Las politicas de contrato se aplican por turno operativo.
2. Operaciones validara excepciones (invitados, contingencias, reprocesos).

## Reglas de negocio (prioridad alta)

### BR-301 Servicio por turno

- Regla: un comensal solo puede consumir el numero de servicios permitido en su turno vigente.
- Verificacion: consulta de consumo previo en ventana configurada.
- Excepcion: autorizacion de supervisor con motivo registrado.

### BR-302 Bloqueo de doble consumo

- Regla: intento repetido dentro de ventana restringida debe ser rechazado.
- Verificacion: estado `rechazado` con motivo `doble_consumo`.
- Excepcion: reproceso autorizado por incidente tecnico.

### BR-303 Vigencia de comensal

- Regla: solo comensales vigentes y activos pueden recibir servicio.
- Verificacion: validacion de fecha de vigencia y estado activo.
- Excepcion: habilitacion temporal con folio de autorizacion.

### BR-304 Invitados

- Regla: invitados requieren autorizacion previa, cupo disponible y motivo.
- Verificacion: registro de invitado asociado a responsable.
- Excepcion: contingencia operativa documentada.

### BR-305 Registro obligatorio de merma

- Regla: toda merma debe registrar cantidad, etapa y causa.
- Verificacion: no permitir cierre de turno con merma incompleta.
- Excepcion: incidente de captura, sujeto a regularizacion en cierre.

### BR-306 Cierre diario obligatorio

- Regla: cada turno debe cerrar con conciliacion de consumo, merma e incidencias.
- Verificacion: checklist completo y firma de supervisor.
- Excepcion: contingencia de sistema con plan de recuperacion.

## Reglas de soporte (prioridad media)

1. BR-307 Proveedor solo del padron aprobado.
2. BR-308 Insumos criticos con stock minimo y alerta.
3. BR-309 Trazabilidad de cambios en datos maestros.

## Criterios de aceptacion

1. Cada regla incluye validacion y excepcion.
2. Reglas de prioridad alta quedan asociadas a casos de prueba.
3. Se definen responsables de aprobacion funcional por regla.

## Riesgos

1. Excepciones excesivas debilitan control de negocio.
2. Falta de gobernanza sobre cambios de reglas.

## Recomendaciones

1. Controlar cambios via issue de politica y aprobacion dual (funcional/tecnica).
2. Priorizar automatizacion de BR-301..306 en iteraciones siguientes.
3. Revisar indicadores de incumplimiento por regla en comite semanal.

## Estado y proximo paso

- Estado: listo para validacion funcional y QA.
- Proximo paso: mapear BR-301..306 a casos de prueba UAT.
