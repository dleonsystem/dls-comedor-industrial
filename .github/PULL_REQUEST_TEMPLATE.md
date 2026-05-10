## Descripción

<!-- Describe los cambios realizados y el problema que resuelven. -->

Closes #<!-- número del issue -->

## Trazabilidad

- Issue relacionado: #<!-- número -->
- Fase RUP: <!-- Inception | Elaboration | Construction | Transition -->
- Semana / iteración: <!-- ej. Semana 1 / Iteración 01 -->
- Alcance afectado (In/Out): <!-- breve resumen -->

## Tipo de cambio

- [ ] 🐛 `fix` — Corrección de bug
- [ ] ✨ `feat` — Nueva funcionalidad
- [ ] 🔧 `chore` — Mantenimiento / dependencias
- [ ] 📚 `docs` — Documentación
- [ ] ♻️  `refactor` — Refactorización
- [ ] ✅ `test` — Añadir / actualizar pruebas
- [ ] 🔒 `security` — Parche de seguridad
- [ ] ⚡ `perf` — Mejora de rendimiento
- [ ] 🚀 `ci` — Cambios en CI/CD

## Cambios realizados

<!--
  Lista los cambios principales. Sé específico.
  Ej.:
  - Añadido modelo `comedor.racion` con campos X, Y, Z
  - Actualizada vista de formulario del menú semanal
  - Añadida migración `services/db/migrations/0002_add_racion.sql`
-->

- 
- 

## Matriz de ingeniería

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

## Pruebas realizadas

- [ ] Pruebas unitarias pasan (`make test-unit`)
- [ ] Pruebas de integración pasan (`make test-integration`)
- [ ] Pruebas manuales realizadas en entorno de desarrollo
- [ ] No aplica (cambio de documentación / configuración)

Describe brevemente las pruebas manuales:

```
Escenario: ...
Pasos: ...
Resultado: ...
```

## Capturas de pantalla (si aplica)

<!-- Añade screenshots de cambios en la UI de Odoo -->

## Checklist de calidad

- [ ] Mi código sigue los estándares definidos en `CONTRIBUTING.md`.
- [ ] El linter pasa sin errores (`make lint`).
- [ ] El tipado estático no presenta errores (`make typecheck`).
- [ ] No introduje secretos, credenciales ni datos sensibles.
- [ ] Actualicé `CHANGELOG.md` si el cambio es notable para usuarios.
- [ ] La documentación relevante está actualizada.
- [ ] Los commits siguen el formato de Conventional Commits.

## Impacto en base de datos

- [ ] No hay cambios en BD
- [ ] Incluye migración nueva en `services/db/migrations/`
- [ ] Requiere ejecución manual de script (documentado en el PR)

## Impacto en Odoo

- [ ] No hay cambios en módulos Odoo
- [ ] Requiere actualización del módulo (`make odoo-update`)
- [ ] Requiere reinicio del servidor Odoo

## Notas para el revisor

<!-- Cualquier contexto adicional que el revisor deba conocer. -->

## Criterio de cierre

- [ ] El alcance comprometido en el issue quedó cubierto
- [ ] La evidencia presentada permite auditoría y trazabilidad
- [ ] Se documentaron riesgos residuales y acciones pendientes
