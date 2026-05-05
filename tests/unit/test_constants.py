"""Pruebas unitarias para el paquete shared/constants."""

import pytest

from packages.shared.constants import ESTADOS_MENU, TURNOS


class TestTurnos:
    """Pruebas unitarias para las constantes de turnos."""

    def test_turnos_contiene_tres_elementos(self) -> None:
        assert len(TURNOS) == 3

    def test_turno_matutino_existe(self) -> None:
        assert "matutino" in TURNOS

    def test_turno_vespertino_existe(self) -> None:
        assert "vespertino" in TURNOS

    def test_turno_nocturno_existe(self) -> None:
        assert "nocturno" in TURNOS

    def test_valores_son_strings_no_vacios(self) -> None:
        for key, value in TURNOS.items():
            assert isinstance(value, str), f"Turno '{key}' debe ser str"
            assert value.strip(), f"Turno '{key}' no debe estar vacío"


class TestEstadosMenu:
    """Pruebas unitarias para las constantes de estados de menú."""

    def test_estados_contiene_tres_elementos(self) -> None:
        assert len(ESTADOS_MENU) == 3

    def test_estado_borrador_existe(self) -> None:
        assert "borrador" in ESTADOS_MENU

    def test_estado_confirmado_existe(self) -> None:
        assert "confirmado" in ESTADOS_MENU

    def test_estado_cerrado_existe(self) -> None:
        assert "cerrado" in ESTADOS_MENU

    @pytest.mark.parametrize("estado", ["borrador", "confirmado", "cerrado"])
    def test_valor_estado_es_string_no_vacio(self, estado: str) -> None:
        assert isinstance(ESTADOS_MENU[estado], str)
        assert ESTADOS_MENU[estado].strip()
