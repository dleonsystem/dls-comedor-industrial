# Semana 2 - Datos de Arranque del Piloto

## Contexto y objetivo

Definir, validar y cargar el conjunto minimo de datos maestros para operar el piloto sin bloqueos por calidad de datos.

## Hechos confirmados

1. El piloto de 200 comensales depende de datos maestros consistentes.
2. Las reglas operativas requieren entidades base: comensales, turnos, proveedores, ingredientes y platillos.
3. La trazabilidad debe quedar en Issue + PR + archivo versionado.

## Hallazgos

1. No existe aun una linea base formal de datos de arranque para Semana 2.
2. El riesgo de errores operativos por datos incompletos es alto si no se valida previamente.

## Supuestos

1. Negocio proveera fuentes iniciales de datos.
2. El equipo funcional validara consistencia y vigencia de catalogos.
3. Las cargas se realizan primero en entorno de prueba.

## Alcance de trabajo (Semana 2)

1. Definir dataset minimo de arranque:
   - Comensales y vigencia.
   - Turnos y politicas base.
   - Proveedores aprobados.
   - Ingredientes y unidades de medida.
   - Platillos/recetas base.
2. Definir reglas de calidad de datos (unicidad, obligatoriedad, formato).
3. Ejecutar corrida seca de carga en QA.
4. Publicar evidencia de validacion e incidencias.

## Criterios de aceptacion

1. Existe catalogo minimo aprobado por responsables funcionales.
2. Las validaciones de calidad de datos se ejecutan sin errores criticos.
3. Se documenta trazabilidad de origen y resultado de carga.
4. Se registra plan de correccion para hallazgos no criticos.

## Riesgos

1. Duplicidad de registros de comensales.
2. Inconsistencia en unidades de ingredientes.
3. Falta de vigencia o contrato en datos de servicio.

## Recomendaciones

1. Definir version del dataset (v1, v2) y fecha de corte.
2. Validar campos criticos antes de cualquier carga masiva.
3. No promover a produccion sin corrida seca aprobada.

## Estado y proximo paso

- Estado: Listo para ejecucion en Semana 2.
- Proximo paso: crear issue de carga y validacion con evidencia adjunta.
