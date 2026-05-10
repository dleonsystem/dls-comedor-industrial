# Semana 1 - Documento de Alcance MVP (In/Out)

## Objetivo

Definir y aprobar el alcance funcional inicial del MVP para operar un comedor industrial con 200 comensales, usando Odoo como nucleo transaccional.

## Hechos confirmados

1. El proyecto opera sobre Odoo 18, Python y PostgreSQL.
2. La Fase 1 esta definida como Odoo sin Node.
3. El objetivo operativo inmediato es estabilizar la operacion para 200 comensales.

## Hallazgos

1. No existia un artefacto versionado de alcance In/Out para consulta transversal.
2. El alcance funcional completo del negocio supera lo actualmente implementado.

## Supuestos

1. La operacion inicial se ejecuta en un comedor/sede.
2. Existen dos contratos en contexto de licitacion.
3. Se cuenta con responsables funcional y tecnico para aprobar alcance.

## Alcance In (si entra)

1. Alta y vigencia de comensales.
2. Validacion de servicio por turno.
3. Bloqueo de doble consumo por ventana definida.
4. Manejo de invitados con autorizacion.
5. Registro de merma en almacen, cocina y linea.
6. Compras basicas y recepcion.
7. Cierre diario operativo.

## Alcance Out (no entra)

1. Microservicio Node para validacion edge.
2. Integraciones complejas no criticas para piloto.
3. Multi-sede productiva.
4. Pronostico avanzado con IA.
5. Escalamiento productivo a 2000 comensales (solo preparacion tecnica).

## Riesgos

1. Cambios de alcance sin control formal.
2. Retrabajo por requisitos ambiguos.
3. Priorizacion incorrecta del backlog.

## Recomendaciones

1. Aprobar este alcance en comite funcional-tecnico al cierre de Semana 1.
2. Cualquier cambio fuera del In/Out debe abrir issue de control de cambio.
3. Mantener foco en operacion piloto antes de ampliar alcance.

## Criterios de aceptacion

1. Documento revisado por negocio y tecnologia.
2. Secciones In/Out sin ambiguedad.
3. Riesgos y supuestos explicitamente aceptados.

## Estado y proximo paso

- Estado: Borrador listo para validacion.
- Proximo paso: Aprobacion formal y vinculacion con issue/PR de Semana 1.
