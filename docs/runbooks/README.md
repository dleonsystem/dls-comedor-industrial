# Runbooks operativos — dls-comedor-industrial

Este directorio contiene los procedimientos operativos (runbooks) para operar, mantener y recuperar el sistema en producción.

## Índice

| Runbook | Descripción | Última revisión |
|---------|-------------|-----------------|
| [RB-001-despliegue.md](RB-001-despliegue.md) | Proceso de despliegue a producción | — |
| [RB-002-backup-restore.md](RB-002-backup-restore.md) | Backup y restauración de la BD | — |
| [RB-003-incidentes.md](RB-003-incidentes.md) | Gestión de incidentes | — |

> **Nota:** Los archivos de runbooks indicados arriba deben crearse según se completen los procesos operativos del sistema. Ver la sección de [Vacíos y riesgos](#vacíos-y-riesgos) abajo.

---

## ¿Qué es un Runbook?

Un runbook es un conjunto de instrucciones paso a paso para ejecutar una operación específica o responder a un incidente. Deben ser:

- **Accionables**: pasos claros y ejecutables.
- **Actualizados**: revisados tras cada incidente o cambio mayor.
- **Accesibles**: disponibles para el equipo de guardia.

---

## Convención de nombres

```
RB-NNN-titulo-en-kebab-case.md
```

Ejemplo: `RB-004-rotar-credenciales.md`

---

## Plantilla de runbook

```markdown
# RB-NNN: Título del runbook

| Campo | Valor |
|-------|-------|
| **ID** | RB-NNN |
| **Título** | ... |
| **Severidad aplicable** | P1 / P2 / P3 |
| **Tiempo estimado** | XX minutos |
| **Última revisión** | YYYY-MM-DD |
| **Autor** | ... |

## Descripción
Breve descripción del procedimiento y cuándo ejecutarlo.

## Prerrequisitos
- Acceso a GCP con rol X
- VPN activa
- ...

## Pasos

### 1. Verificar el estado del sistema
```bash
# comando
```

### 2. Ejecutar la acción
...

## Verificación post-ejecución
- [ ] Verificar que el servicio responde en health check
- [ ] Verificar logs sin errores

## Rollback
Pasos para revertir en caso de fallo...

## Contactos de escalación
- Tech Lead: @dleonsystem
```

---

## Vacíos y riesgos

Los siguientes runbooks **deben crearse** antes de ir a producción y **no pueden generarse automáticamente** — requieren decisión y documentación del equipo:

| Runbook | Riesgo de omitir |
|---------|-----------------|
| Despliegue a producción | Despliegues inconsistentes o rollbacks fallidos |
| Backup y restauración | Pérdida de datos irrecuperable ante fallo |
| Rotación de credenciales | Ventana de exposición ante compromiso de secretos |
| Gestión de incidentes P1 | Tiempo de respuesta y recuperación excesivo |
| Escalado manual | Sistema no disponible ante pico de demanda |
