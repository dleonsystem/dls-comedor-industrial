"""Fixtures compartidas entre todas las pruebas."""

import pytest


@pytest.fixture
def turno_valido() -> str:
    """Retorna un turno válido para usar en pruebas."""
    return "matutino"


@pytest.fixture
def menu_data() -> dict:
    """Retorna datos base para crear un menú en pruebas."""
    return {
        "nombre": "Menú de prueba",
        "fecha": "2026-05-05",
        "raciones_disponibles": 100,
        "state": "borrador",
    }
