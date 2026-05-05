# -*- coding: utf-8 -*-
"""Modelo: comedor.menu — Menú diario / semanal del comedor industrial."""

from odoo import api, fields, models
from odoo.exceptions import ValidationError


class ComedorMenu(models.Model):
    """Representa un menú planificado para una fecha determinada."""

    _name = "comedor.menu"
    _description = "Menú del Comedor"
    _order = "fecha desc"
    _rec_name = "nombre"

    nombre: str = fields.Char(
        string="Nombre del menú",
        required=True,
        size=128,
    )
    fecha: fields.Date = fields.Date(
        string="Fecha",
        required=True,
        index=True,
    )
    descripcion: str = fields.Text(
        string="Descripción",
    )
    raciones_disponibles: int = fields.Integer(
        string="Raciones disponibles",
        required=True,
        default=0,
    )
    raciones_servidas: int = fields.Integer(
        string="Raciones servidas",
        compute="_compute_raciones_servidas",
        store=True,
    )
    activo: bool = fields.Boolean(
        string="Activo",
        default=True,
    )
    state: str = fields.Selection(
        selection=[
            ("borrador", "Borrador"),
            ("confirmado", "Confirmado"),
            ("cerrado", "Cerrado"),
        ],
        string="Estado",
        default="borrador",
        required=True,
    )
    racion_ids = fields.One2many(
        comodel_name="comedor.racion",
        inverse_name="menu_id",
        string="Raciones registradas",
    )

    @api.depends("racion_ids")
    def _compute_raciones_servidas(self) -> None:
        """Calcula el total de raciones servidas para este menú."""
        for record in self:
            record.raciones_servidas = len(record.racion_ids)

    @api.constrains("raciones_disponibles")
    def _check_raciones_disponibles(self) -> None:
        """Valida que el número de raciones disponibles sea positivo."""
        for record in self:
            if record.raciones_disponibles < 0:
                raise ValidationError(
                    "El número de raciones disponibles no puede ser negativo."
                )

    def action_confirmar(self) -> None:
        """Confirma el menú para el día correspondiente."""
        self.write({"state": "confirmado"})

    def action_cerrar(self) -> None:
        """Cierra el menú al finalizar el servicio."""
        self.write({"state": "cerrado"})
