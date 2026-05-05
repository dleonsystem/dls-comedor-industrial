# -*- coding: utf-8 -*-
"""Modelo: comedor.racion — Registro de ración servida a un empleado."""

from odoo import api, fields, models
from odoo.exceptions import UserError, ValidationError


class ComedorRacion(models.Model):
    """Registra una ración servida a un empleado en un turno determinado."""

    _name = "comedor.racion"
    _description = "Ración del Comedor"
    _order = "fecha_hora desc"

    menu_id = fields.Many2one(
        comodel_name="comedor.menu",
        string="Menú",
        required=True,
        ondelete="restrict",
        index=True,
    )
    empleado_id = fields.Many2one(
        comodel_name="hr.employee",
        string="Empleado",
        required=True,
        ondelete="restrict",
        index=True,
    )
    fecha_hora: fields.Datetime = fields.Datetime(
        string="Fecha y hora",
        required=True,
        default=fields.Datetime.now,
    )
    turno: str = fields.Selection(
        selection=[
            ("matutino", "Matutino"),
            ("vespertino", "Vespertino"),
            ("nocturno", "Nocturno"),
        ],
        string="Turno",
        required=True,
    )
    notas: str = fields.Text(
        string="Notas",
    )

    @api.constrains("menu_id", "empleado_id")
    def _check_racion_unica_por_menu(self) -> None:
        """Valida que un empleado no reciba más de una ración por menú."""
        for record in self:
            duplicados = self.search_count(
                [
                    ("menu_id", "=", record.menu_id.id),
                    ("empleado_id", "=", record.empleado_id.id),
                    ("id", "!=", record.id),
                ]
            )
            if duplicados:
                raise ValidationError(
                    f"El empleado {record.empleado_id.name} ya tiene "
                    f"una ración registrada para el menú '{record.menu_id.nombre}'."
                )

    @api.model_create_multi
    def create(self, vals_list: list[dict]) -> "ComedorRacion":
        """Verifica disponibilidad de raciones antes de crear el registro."""
        for vals in vals_list:
            menu = self.env["comedor.menu"].browse(vals.get("menu_id"))
            if menu.state != "confirmado":
                raise UserError(
                    f"El menú '{menu.nombre}' no está confirmado. "
                    "No se pueden registrar raciones."
                )
            if menu.raciones_servidas >= menu.raciones_disponibles:
                raise UserError(
                    f"El menú '{menu.nombre}' ya no tiene raciones disponibles."
                )
        return super().create(vals_list)
