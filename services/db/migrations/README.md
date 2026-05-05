# Migraciones de base de datos

Este directorio contiene los scripts SQL de migración para cambios incrementales en el esquema de la base de datos.

## Convención de nombres

```
NNNN_descripcion-breve.sql
```

Ejemplo: `0001_add-index-log-acceso-timestamp.sql`

## Reglas

1. **Nunca modifiques** un script de migración ya aplicado en producción.
2. Cada script debe ser **idempotente** cuando sea posible (`CREATE TABLE IF NOT EXISTS`, `CREATE INDEX IF NOT EXISTS`, etc.).
3. Incluye siempre un comentario al inicio del script con: número, descripción, fecha y autor.
4. Los scripts deben aplicarse **en orden numérico**.
5. Para cambios destructivos (`DROP`, `ALTER`), incluye siempre el script de rollback correspondiente.

## Cómo aplicar migraciones

```bash
# En entorno local (con contenedores activos)
make db-migrate

# Manualmente
PGPASSWORD=$POSTGRES_PASSWORD psql \
  -h $POSTGRES_HOST -U $POSTGRES_USER -d $POSTGRES_DB \
  -f services/db/migrations/NNNN_descripcion.sql
```

## Registro de migraciones aplicadas

| Número | Descripción | Fecha | Autor |
|--------|-------------|-------|-------|
| — | — | — | — |
