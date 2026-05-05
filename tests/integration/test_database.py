"""
Pruebas de integración con PostgreSQL — dls-comedor-industrial.
Requiere las variables de entorno: POSTGRES_HOST, POSTGRES_PORT,
POSTGRES_DB, POSTGRES_USER, POSTGRES_PASSWORD.
"""

import os

import psycopg2
import pytest


def get_db_connection() -> "psycopg2.connection":
    """Crea y retorna una conexión a la base de datos de prueba."""
    return psycopg2.connect(
        host=os.environ.get("POSTGRES_HOST", "localhost"),
        port=int(os.environ.get("POSTGRES_PORT", "5432")),
        dbname=os.environ.get("POSTGRES_DB", "comedor_test"),
        user=os.environ.get("POSTGRES_USER", "comedor_user"),
        password=os.environ.get("POSTGRES_PASSWORD", "ci_password_test"),
        connect_timeout=5,
    )


@pytest.fixture(scope="module")
def db_connection():
    """Fixture de conexión a la base de datos para el módulo de pruebas."""
    conn = get_db_connection()
    yield conn
    conn.close()


class TestDatabaseConnection:
    """Verifica que la BD esté accesible y el esquema exista."""

    def test_conexion_exitosa(self, db_connection: "psycopg2.connection") -> None:
        """La base de datos debe aceptar conexiones."""
        assert db_connection.closed == 0, "La conexión debe estar abierta"

    def test_esquema_integracion_existe(self, db_connection: "psycopg2.connection") -> None:
        """El esquema 'integracion' debe existir tras aplicar init.sql."""
        with db_connection.cursor() as cur:
            cur.execute(
                "SELECT schema_name FROM information_schema.schemata "
                "WHERE schema_name = 'integracion'"
            )
            result = cur.fetchone()
        assert result is not None, "El esquema 'integracion' debe existir"

    def test_tabla_log_acceso_existe(self, db_connection: "psycopg2.connection") -> None:
        """La tabla integracion.log_acceso debe existir tras aplicar init.sql."""
        with db_connection.cursor() as cur:
            cur.execute(
                "SELECT table_name FROM information_schema.tables "
                "WHERE table_schema = 'integracion' AND table_name = 'log_acceso'"
            )
            result = cur.fetchone()
        assert result is not None, "La tabla 'integracion.log_acceso' debe existir"

    def test_insertar_log_acceso(self, db_connection: "psycopg2.connection") -> None:
        """Debe poder insertar un registro en integracion.log_acceso."""
        with db_connection.cursor() as cur:
            cur.execute(
                "INSERT INTO integracion.log_acceso (empleado_ref, dispositivo) "
                "VALUES (%s, %s) RETURNING id",
                ("EMP-001", "LECTOR-A1"),
            )
            row = cur.fetchone()
            db_connection.rollback()  # No persistir datos de prueba
        assert row is not None
        assert row[0] > 0
