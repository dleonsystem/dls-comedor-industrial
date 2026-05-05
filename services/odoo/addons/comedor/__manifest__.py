# -*- coding: utf-8 -*-
# Módulo Odoo: comedor
# Gestión integral de comedores industriales

{
    "name": "DLS Comedor Industrial",
    "version": "18.0.0.1.0",
    "category": "Industries",
    "summary": "Gestión de menús, raciones y control de acceso para comedores industriales",
    "description": """
        Módulo principal para la gestión de comedores industriales:
        - Planificación de menús semanales
        - Control de raciones por empleado y turno
        - Registro de accesos (RFID / biometría)
        - Reportes de consumo y costo
    """,
    "author": "dleonsystem",
    "website": "https://github.com/dleonsystem/dls-comedor-industrial",
    "license": "LGPL-3",
    "depends": [
        "base",
        "mail",
        "hr",
    ],
    "data": [
        "security/ir.model.access.csv",
        "views/menu_views.xml",
        "views/racion_views.xml",
        "views/menu_items.xml",
    ],
    "demo": [],
    "installable": True,
    "application": True,
    "auto_install": False,
}
