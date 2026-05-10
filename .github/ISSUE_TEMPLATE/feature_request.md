---
name: ✨ Solicitud de funcionalidad
about: Propón una nueva funcionalidad o mejora
title: "[FEAT] <descripción breve de la funcionalidad>"
labels: ["enhancement", "triage"]
assignees: ""
---

## Resumen

<!-- Describe la funcionalidad que propones en 1-2 oraciones. -->

## Trazabilidad

- ID de iniciativa / épica: <!-- ej. EPIC-001 -->
- Fase RUP: <!-- Inception | Elaboration | Construction | Transition -->
- Semana / iteración: <!-- ej. Semana 1 / Iteración 01 -->
- Responsable funcional: <!-- nombre o rol -->
- Responsable técnico: <!-- nombre o rol -->

## Alcance (MVP)

### In (sí entra)

- 
- 

### Out (no entra)

- 
- 

## Problema que resuelve

<!--
  ¿Qué problema o necesidad motiva esta solicitud?
  Ej.: "Actualmente es imposible exportar el reporte de raciones en PDF, lo que obliga a..."
-->

## Solución propuesta

<!--
  Describe cómo debería funcionar la nueva característica.
  Sé tan específico como sea posible:
  - Flujo de usuario / pantallas
  - Datos de entrada y salida
  - Reglas de negocio
-->

## Alternativas consideradas

<!--
  ¿Consideraste otras formas de resolver el problema?
  ¿Por qué prefieres la solución propuesta?
-->

## Criterios de aceptación

<!--
  Lista las condiciones que deben cumplirse para considerar la feature completada.
  Usa el formato Given / When / Then si es posible.
-->

- [ ] Dado que… cuando… entonces…
- [ ] Dado que… cuando… entonces…

## Matriz de ingeniería (obligatorio)

### Hechos confirmados

- 

### Hallazgos

- 

### Supuestos

- 

### Riesgos

- 

### Recomendaciones

- 

## Evidencia esperada de cierre

- [ ] PR vinculado a este issue
- [ ] Evidencia de pruebas funcionales y/o técnicas
- [ ] Documentación actualizada (si aplica)
- [ ] Entrada en `CHANGELOG.md` (si aplica)

## Módulo / componente afectado

- [ ] `services/odoo/addons/comedor` — Módulo principal Odoo
- [ ] `services/db` — Base de datos / migraciones
- [ ] `services/api` — API auxiliar
- [ ] `infra/` — Infraestructura / Docker / GCP
- [ ] `docs/` — Documentación
- [ ] Otro: <!-- especifica -->

## Prioridad sugerida

- [ ] 🔴 Alta — bloquea procesos críticos del negocio
- [ ] 🟠 Media — mejora significativa de productividad
- [ ] 🟡 Baja — nice-to-have

## Referencias / mockups

<!--
  Agrega capturas de pantalla, diagramas, mockups, links a documentos, etc.
-->

## ¿Requiere ADR?

<!--
  Si la funcionalidad implica una decisión arquitectónica relevante,
  propón un ADR en docs/decisions/ junto con este issue.
-->

- [ ] Sí, propongo un ADR: `docs/decisions/ADR-XXX-<titulo>.md`
- [ ] No aplica

## Checklist antes de enviar

- [ ] Busqué en los issues existentes y no encontré un duplicado.
- [ ] La funcionalidad está alineada con los objetivos del proyecto.
- [ ] Definí criterios de aceptación claros y verificables.
