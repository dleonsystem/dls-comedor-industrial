# Semana 2 - Plan QA y UAT del Piloto

## Contexto y objetivo

Definir y ejecutar validaciones QA/UAT por proceso para emitir recomendacion Go/No-Go del piloto con evidencia auditable.

## Hechos confirmados

1. El proyecto requiere decision basada en evidencia para avanzar sin friccion.
2. Los procesos criticos del piloto ya estan definidos en Semana 1.
3. El esquema de trazabilidad exige matriz de ingenieria y evidencia de cierre.

## Hallazgos

1. Aun no hay un plan QA/UAT consolidado por proceso en el repositorio.
2. La ausencia de UAT formal eleva riesgo de salida operativa con defectos criticos.

## Supuestos

1. Existe ambiente de prueba estable para ejecucion de casos.
2. Usuarios clave de operacion participaran en UAT.
3. QA documentara resultados por severidad e impacto.

## Alcance de trabajo (Semana 2)

1. Diseñar matriz de pruebas por proceso:
   - Alta comensal.
   - Validacion de servicio.
   - Registro de servicio.
   - Merma.
   - Compras.
   - Cierre diario.
2. Definir checklist UAT por rol (operador, supervisor, compras, cocina, administracion).
3. Registrar resultados, defectos y acciones correctivas.
4. Emitir recomendacion de readiness Go/No-Go.

## Criterios de aceptacion

1. Se ejecutan casos criticos por proceso con resultado registrado.
2. Los defectos criticos tienen plan de correccion.
3. Existe minuta de UAT con aprobacion funcional.
4. Se publica recomendacion Go/No-Go con riesgos residuales.

## Riesgos

1. Baja participacion de usuarios clave en UAT.
2. Casos de borde no probados en hora pico.
3. Defectos operativos detectados tarde.

## Recomendaciones

1. Priorizar pruebas por impacto en continuidad de servicio.
2. Ejecutar pruebas en ventana de simulacion de hora pico.
3. No pasar a piloto productivo con defectos criticos abiertos.

## Estado y proximo paso

- Estado: Listo para ejecucion en Semana 2.
- Proximo paso: abrir issue QA/UAT y planificar sesiones con negocio.
