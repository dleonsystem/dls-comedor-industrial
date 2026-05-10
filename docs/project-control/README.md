# Control de Proyecto y Trazabilidad

Este directorio contiene artefactos versionados para control de alcance, avance y evidencia del proyecto.

## Objetivo

Mantener trazabilidad completa entre:

1. Requerimiento (Issue en GitHub).
2. Ejecucion (rama y commits atomicos).
3. Validacion (PR con evidencia y CI).
4. Documentacion de estado (archivos .md en este directorio).

## Convencion de archivos

- `W<semana>-<entregable>.md`
- Ejemplos:
  - `W1-MVP-ALCANCE.md`
  - `W1-MATRIZ-PROCESOS.md`
  - `W1-KPIS-PILOTO.md`

## Estado de avance (repositorio)

Ultima validacion: 2026-05-10

### Semana 1 (en `main`)

- `W1-MVP-ALCANCE.md`
- `W1-MATRIZ-PROCESOS.md`
- `W1-KPIS-PILOTO.md`

Evidencia de integracion:

- PR mergeado: `#7`.

### Semana 2 (en seguimiento por PR)

Estos entregables ya fueron preparados y estan en revision (aun no mergeados a `main`):

- PR `#8`: Configuracion base
  - https://github.com/dleonsystem/dls-comedor-industrial/pull/8
- PR `#9`: Datos de arranque
  - https://github.com/dleonsystem/dls-comedor-industrial/pull/9
- PR `#10`: QA/UAT
  - https://github.com/dleonsystem/dls-comedor-industrial/pull/10

Estado de merge reportado: `CLEAN` en los tres PRs.

## Estructura minima por artefacto

Cada documento debe incluir, como minimo:

1. Contexto y objetivo.
2. Hechos confirmados.
3. Hallazgos.
4. Supuestos.
5. Riesgos.
6. Recomendaciones.
7. Criterios de aceptacion.
8. Estado y proximo paso.

## Regla de oro

Si un avance no existe en Issue + PR + archivo .md versionado, no se considera trazable ni cerrado.
