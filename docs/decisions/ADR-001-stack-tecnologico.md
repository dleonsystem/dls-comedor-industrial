# ADR-001: Stack tecnológico principal

| Campo       | Valor                              |
|-------------|-------------------------------------|
| **ID**      | ADR-001                             |
| **Título**  | Stack tecnológico principal         |
| **Estado**  | Aceptado                            |
| **Fecha**   | 2026-05-05                          |
| **Autores** | dleonsystem                         |
| **Revisores** | —                                 |

---

## Contexto

Se requiere construir un sistema ERP para la gestión de comedores industriales. El equipo cuenta con experiencia en Python, PostgreSQL y Odoo. El sistema debe ser escalable, mantenible por un equipo pequeño (1 dev + 1 QA + agentes IA) y desplegable en GCP.

---

## Decisión

Se adopta el siguiente stack tecnológico como estándar del proyecto:

| Capa            | Tecnología        | Versión mínima | Justificación                                               |
|-----------------|-------------------|:--------------:|-------------------------------------------------------------|
| ERP / Backend   | **Odoo**          | 18.0           | Framework ERP maduro con ORM, vistas, reportes y seguridad integrados |
| Lenguaje        | **Python**        | 3.11           | Lenguaje nativo de Odoo; amplio ecosistema y soporte LTS    |
| Base de datos   | **PostgreSQL**    | 16             | Motor relacional robusto, usado nativamente por Odoo         |
| Contenedores    | **Docker**        | 24.x           | Entorno reproducible para dev, staging y producción          |
| Orquestación    | **Docker Compose**| 2.x            | Suficiente para entorno local; GKE/Cloud Run en producción   |
| CI/CD           | **GitHub Actions**| —              | Nativo en GitHub, sin servidor adicional                    |
| Hosting         | **GCP**           | —              | Cloud SQL, Cloud Run, Secret Manager, Cloud Storage         |
| Linter/Formatter| **Ruff**          | 0.4+           | Reemplaza flake8 + isort + pyupgrade; muy rápido            |
| Tipado          | **mypy**          | 1.10+          | Análisis estático de tipos para Python                      |
| Pruebas         | **pytest**        | 8.0+           | Framework de pruebas estándar para Python                   |
| Seguridad       | **Bandit**        | 1.7+           | Análisis estático de seguridad para Python                  |
| Metodología     | **RUP**           | —              | Iteraciones formales con artefactos y revisiones estructuradas |
| Licencia        | **MIT**           | —              | Permite uso comercial y distribución libre                  |

---

## Alternativas consideradas

### Alternativa 1: Django + DRF (en lugar de Odoo)
- **Pros:** Mayor flexibilidad, más control sobre el modelo de datos.
- **Contras:** Requiere construir desde cero todos los módulos ERP (inventario, facturación, HR, etc.). Mayor tiempo de desarrollo y mantenimiento.
- **Resultado:** Descartado. Odoo provee el 80% de la funcionalidad requerida lista para usar.

### Alternativa 2: MySQL (en lugar de PostgreSQL)
- **Pros:** Amplia adopción.
- **Contras:** Odoo tiene soporte oficial sólo para PostgreSQL; características avanzadas (JSONB, full-text search) son superiores en PostgreSQL.
- **Resultado:** Descartado.

### Alternativa 3: Kubernetes (en lugar de Docker Compose para desarrollo)
- **Pros:** Consistencia entre dev y producción.
- **Contras:** Complejidad excesiva para un equipo de 2 personas en desarrollo local.
- **Resultado:** Descartado para desarrollo; GKE se evalúa para producción si Cloud Run resulta insuficiente.

### Alternativa 4: AWS (en lugar de GCP)
- **Pros:** Mayor cuota de mercado.
- **Contras:** El equipo tiene mayor experiencia con GCP; Cloud SQL para PostgreSQL es una solución gestionada excelente.
- **Resultado:** Descartado.

---

## Consecuencias

### Positivas
- El equipo puede ser productivo rápidamente con Odoo 18.
- PostgreSQL asegura integridad de datos y rendimiento.
- Docker garantiza entornos reproducibles en cualquier máquina.
- GitHub Actions integra CI/CD sin infraestructura adicional.
- Ruff + mypy + Bandit aseguran calidad y seguridad del código desde el inicio.

### Negativas / Riesgos
- Odoo puede limitar la flexibilidad arquitectónica (framework opinionado).
- Actualizaciones mayores de Odoo pueden requerir migración significativa de módulos.
- El equipo debe mantenerse actualizado con los cambios de la API de Odoo entre versiones.

### Neutras
- Se revisará la adopción de Redis para caché de sesiones en la fase Construction si el rendimiento lo requiere.
- La decisión sobre Cloud Run vs. GKE para producción se tomará en ADR-002.

---

## Referencias

- [Odoo 18 Developer Documentation](https://www.odoo.com/documentation/18.0/)
- [PostgreSQL 16 Release Notes](https://www.postgresql.org/docs/16/release-16.html)
- [Ruff Documentation](https://docs.astral.sh/ruff/)
- [GCP Cloud Run](https://cloud.google.com/run/docs)
