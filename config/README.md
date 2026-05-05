# Configuración por entorno — dls-comedor-industrial

Este directorio contiene archivos de configuración específicos por entorno.

## Estructura

```
config/
└── environments/
    ├── development.env.example   # Variables específicas de desarrollo
    ├── staging.env.example       # Variables específicas de staging
    └── production.env.example    # Variables específicas de producción
```

## Uso

Los archivos `.env.example` de este directorio **complementan** el `.env.example` raíz
con valores específicos de cada entorno. Nunca incluir los archivos `.env` reales.

En GCP, los secretos de producción se gestionan con **Secret Manager** y se inyectan
como variables de entorno en Cloud Run o GKE.
