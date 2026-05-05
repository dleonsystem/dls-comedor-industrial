# Índice de ADRs (Architecture Decision Records)

Este directorio contiene las decisiones de arquitectura significativas del proyecto **dls-comedor-industrial**, documentadas siguiendo el formato [MADR](https://adr.github.io/madr/).

## ¿Qué es un ADR?

Un ADR es un documento corto que captura una decisión arquitectónica importante, su contexto, las alternativas consideradas y sus consecuencias. El objetivo es que el equipo (y futuras personas que se incorporen) pueda entender **por qué** el sistema está construido como está.

## Registro de decisiones

| ID | Título | Estado | Fecha |
|----|--------|--------|-------|
| [ADR-001](ADR-001-stack-tecnologico.md) | Stack tecnológico principal | Aceptado | 2026-05-05 |

## Estados posibles

- **Propuesto** — En discusión, pendiente de aprobación.
- **Aceptado** — Aprobado y en vigor.
- **Deprecado** — Reemplazado por una decisión más reciente.
- **Supersedido** — Ver el ADR que lo reemplaza.

## Cómo crear un nuevo ADR

1. Crea un archivo con el nombre `ADR-NNN-titulo-en-kebab-case.md` (ej. `ADR-002-estrategia-cache.md`).
2. Usa la plantilla de `ADR-001` como base.
3. Abre un PR hacia `develop` con el nuevo ADR.
4. Vincula el ADR al issue o PR que motivó la decisión.
5. Una vez aprobado el PR, cambia el estado a **Aceptado**.
