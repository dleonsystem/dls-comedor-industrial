# Arquitectura del sistema — dls-comedor-industrial

> **Versión:** 0.1.0 | **Última actualización:** 2026-05-05 | **Autor:** dleonsystem

---

## 1. Contexto y propósito

**dls-comedor-industrial** es un sistema ERP para la gestión integral de comedores industriales. Automatiza los procesos de planificación de menús, control de raciones, acceso de empleados, facturación y reportes, basándose en Odoo 18 como plataforma central.

---

## 2. Vistas de arquitectura (C4)

### 2.1 Contexto (Nivel 1)

```
┌─────────────────────────────────────────────────────────────────────┐
│                         Sistema ERP Comedor                         │
│                                                                     │
│  [Empleado] ──► [Odoo 18 UI]  ◄──  [Administrador]                 │
│                      │                                              │
│              [API auxiliar]  ◄──  [Sistemas externos]               │
│             (integraciones)        (biometría, RFID)                │
└─────────────────────────────────────────────────────────────────────┘
```

### 2.2 Contenedores (Nivel 2)

```
┌─────────────────────────────────────────────────────────────────────┐
│  Docker Network: comedor-net                                        │
│                                                                     │
│  ┌──────────────┐    ┌──────────────────┐    ┌──────────────────┐  │
│  │  Odoo 18     │    │   PostgreSQL 16   │    │   Nginx          │  │
│  │  :8069/:8072 │◄──►│   :5432          │    │   :80/:443       │  │
│  │              │    │                  │◄──►│   (prod only)    │  │
│  │  +Módulos    │    │  DB: comedor     │    │                  │  │
│  │  personalizad│    │                  │    └──────────────────┘  │
│  └──────────────┘    └──────────────────┘                          │
│                                                                     │
│  ┌──────────────┐    ┌──────────────────┐                          │
│  │  API Service │    │   Redis (caché)   │                          │
│  │  (futuro)    │    │   :6379          │                          │
│  └──────────────┘    └──────────────────┘                          │
└─────────────────────────────────────────────────────────────────────┘
```

### 2.3 Componentes principales (Nivel 3)

| Componente            | Tecnología     | Propósito                                     |
|-----------------------|----------------|-----------------------------------------------|
| `comedor.menu`        | Odoo Model     | Gestión de menús semanales                    |
| `comedor.racion`      | Odoo Model     | Registro de raciones por empleado/turno       |
| `comedor.empleado`    | Odoo Model     | Catálogo de empleados y departamentos         |
| `comedor.acceso`      | Odoo Model     | Control de acceso al comedor (RFID/biometría) |
| `comedor.reporte`     | Odoo Report    | Reportes en PDF/Excel                         |
| PostgreSQL            | RDBMS          | Persistencia de todos los datos               |
| Docker Compose        | Orquestación   | Entorno de desarrollo                         |
| GCP Cloud Run/GKE     | Hosting        | Producción y staging                          |

---

## 3. Decisiones de arquitectura

Las decisiones significativas están documentadas como ADRs en [`docs/decisions/`](decisions/):

| ADR | Título | Estado |
|-----|--------|--------|
| [ADR-001](decisions/ADR-001-stack-tecnologico.md) | Stack tecnológico principal | Aceptado |

---

## 4. Flujo de datos principal

```
Empleado presenta tarjeta RFID
        │
        ▼
API de acceso (futuro)
        │
        ▼
comedor.acceso.registrar_entrada()
        │
        ▼
Validación: ¿empleado activo? ¿turno válido? ¿ración disponible?
        │
   ┌────┴─────┐
   ▼          ▼
 OK          Error
   │          │
   ▼          ▼
Registrar   Log de
ración      rechazo
   │
   ▼
Actualizar contador de menú diario
   │
   ▼
Notificación (opcional) → Email / Slack
```

---

## 5. Infraestructura de despliegue

### Desarrollo
- Docker Compose local (`make up`)
- Volúmenes locales para datos y filestore

### Producción (GCP)
- **Cloud Run** o **GKE** para los contenedores Odoo
- **Cloud SQL** (PostgreSQL 16) para la base de datos
- **Cloud Storage** para filestore y backups
- **Secret Manager** para credenciales
- **Cloud Load Balancing** + **Cloud Armor** para acceso público
- **Artifact Registry** para imágenes Docker

```
Internet ──► Cloud Load Balancer ──► Cloud Run (Odoo)
                                          │
                                          ├──► Cloud SQL (PostgreSQL)
                                          ├──► Cloud Storage (filestore)
                                          └──► Secret Manager (secrets)
```

---

## 6. Seguridad

| Capa        | Medida                                                         |
|-------------|----------------------------------------------------------------|
| Aplicación  | Autenticación Odoo + 2FA, RBAC por grupos                      |
| Red         | VPC privada, firewall rules, Cloud Armor (WAF)                 |
| Datos       | Cifrado en tránsito (TLS 1.3) y en reposo (Cloud SQL)          |
| Secretos    | GCP Secret Manager, nunca en código ni en .env commiteado      |
| CI/CD       | Bandit + detect-secrets en pre-commit y CI                     |
| Dependencias| Dependabot + GitHub Security Advisories                        |

---

## 7. Observabilidad

| Herramienta         | Uso                                          |
|---------------------|----------------------------------------------|
| Cloud Logging       | Logs centralizados de Odoo y PostgreSQL       |
| Cloud Monitoring    | Métricas de CPU, memoria, latencia            |
| Cloud Trace         | Trazado distribuido de peticiones             |
| Odoo built-in logs  | Logs de operaciones de negocio                |

---

## 8. Riesgos y mitigaciones

| Riesgo                                    | Probabilidad | Impacto | Mitigación                                       |
|-------------------------------------------|:---:|:---:|--------------------------------------------------|
| Pérdida de datos por fallo de BD          | Bajo | Alto | Backups automáticos diarios a Cloud Storage      |
| Vulnerabilidad en dependencias            | Med  | Med  | Dependabot + análisis semanal                    |
| Rendimiento degradado con muchos usuarios | Med  | Med  | Workers de Odoo + caché Redis                    |
| Integración biométrica fallida            | Alto | Med  | Cola de mensajes + reintentos + log de rechazos  |

---

## 9. Documentos relacionados

- [`CONTRIBUTING.md`](../CONTRIBUTING.md) — Flujo de desarrollo
- [`docs/decisions/`](decisions/) — ADRs
- [`docs/runbooks/`](runbooks/) — Procedimientos operativos
- [`.env.example`](../.env.example) — Variables de entorno
