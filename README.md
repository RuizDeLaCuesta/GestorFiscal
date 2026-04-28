# GestorFiscal --> Tribut*ia*

Software de gestión y automatización fiscal para autónomos y PYMEs.

> Proyecto Intermodular — 1º DAM 2025/26 · Alejandro Pérez Ruiz de la Cuesta

---

## ¿Qué es este proyecto?

Tribut*ia* es una aplicación de escritorio pensada para que autónomos y pequeñas empresas puedan gestionar su actividad fiscal de forma sencilla: emitir facturas, registrar gastos deducibles y tener siempre visible cuánto IVA han cobrado y cuánto han pagado.

El problema esencial que resuelve es concreto: un autónomo que trabaja solo no tiene tiempo ni conocimientos contables para llevar un control riguroso de su fiscalidad. Tribut*ia* centraliza toda esa información en una base de datos estructurada y ofrece consultas útiles para preparar las declaraciones trimestrales.

En esta primera etapa del proyecto, mientras forma parte de mi entrega intermodular de primer curso; sólo abarco las secciones respectivas a las asignaturas de Bases de datos, Entornos de desarrollo y Empleabilidad. Sin embargo, en próximas fases dispondrá de una aplicación de escritorio y/o web completas.
En un futuro no muy lejano, Tribut*ia* pasará de un simple programa para la gestión fiscal básica a una plataforma de optimización y apoyo fiscal y financiero completa e hiperutilitaria. 
Dentro de dichas versiones se verán elementos tales como:
 - ChatBot de IA generativa con acceso en tiempo real a tesorería, trimestres, facturas previsibles y tiempos de entrega de modelos
 - Panel de personalización mediante skills, artefactos, necesidades y objetivos personales y/o empresariales
 - Sistema de predicción responsable de gastos, ingresos y beneficios
 - Sistema de recomendación de inversión en mercados financieros basado en la información en tiempo real del panel de control y el sistema de predicción responsable
 - Panel para la administración y ejecución de dichas u otras inversiones en los mercados financieros

Para llevar estas funcionalidades acabo se emplearan las siguientes herramientas y sistemas digitales:
 - Desktop -> Java y otros
 - Web -> Next.js (desarrollo), Supabase (bbdd), Vercel (alojamiento), Hostinger (dominio y buzones correo), Cloudflare (seguridad y rendimiento en internet)
 - Pasarela de pagos -> Stripe
 - Chatbot -> Make.com + nodo Perplexity para investigación profunda + nodo Claude Haiku 3.5 para comunicación con usuario
 - Sistemas de predicción -> modelos predictivos de machine learning básicos (regresión lineal, XGBoost, Random Forest...)
 - Sistemas de recomendación -> N8N + nodo Perplexity para investigación profunda + nodo Claude Sonnet 4.6 para comunicación con usuario y elección basada en datos extraídos por el nodo Perplexity
 - Panel inversión -> Next.js + Vercel mediante APIs, webhooks y embed codes de eToro, Revolut o MyInvestor

---

## Tecnologías utilizadas

| Tecnología | Uso |
|---|---|
| MySQL 8 | Sistema gestor de base de datos |
| SQL (DDL + DML) | Creación de tablas, inserción de datos y consultas |
| draw.io | Diseño del diagrama Entidad-Relación |
| Git + GitHub | Control de versiones y repositorio del proyecto |
| MySQL Workbench | Entorno de pruebas y ejecución de scripts SQL |

---

## Estructura del repositorio

```
gestorfiscal/
├── README.md
├── diagramas/
│   └── diagrama-ER.png          # Diagrama Entidad-Relación completo
├── documentacion/
│   ├── modelo-relacional.md     # Modelo relacional con tablas, tipos y restricciones
│   ├── modelo-relacional.pdf    # Versión PDF del modelo relacional
│   └── empleabilidad/
│       ├── perfil-profesional.md
│       ├── investigacion-sector.md
│       ├── presentacion-proyecto.md
│       ├── portfolio.md
│       └── reflexion.md
└── sql/
    ├── 01_create_tables.sql     # Creación de la base de datos y tablas
    ├── 02_insert_data.sql       # Datos de ejemplo
    └── 03_consultas.sql         # Consultas reales de la aplicación
```

---

## Base de datos

La base de datos `gestorfiscal` tiene 5 tablas:

- **CLIENTE** — autónomos y empresas a los que se factura
- **FACTURA** — facturas emitidas con su estado (borrador, emitida, pagada, anulada)
- **LINEA_FACTURA** — desglose de cada factura en líneas de producto o servicio
- **CATEGORIA** — categorías de gastos (alquiler, suministros, dietas...)
- **GASTO** — gastos deducibles registrados con su justificante

El diagrama E/R y el modelo relacional completo están en la carpeta `/diagramas` y `/documentacion`.

---

## Cómo ejecutar los scripts SQL

### Requisitos

- MySQL 8 instalado
- MySQL Workbench o cualquier cliente SQL compatible

### Pasos

1. Abre MySQL Workbench y conéctate a tu instancia local
2. Abre el archivo `sql/01_create_tables.sql` y ejecútalo (`Ctrl+Shift+Enter`)
3. Abre `sql/02_insert_data.sql` y ejecútalo — inserta datos de ejemplo
4. Abre `sql/03_consultas.sql` y ejecútalo — muestra resultados de las consultas principales

Los scripts deben ejecutarse en ese orden. El primero crea la base de datos `gestorfiscal` desde cero.

---

## Consultas incluidas

| Consulta | Descripción |
|---|---|
| 1 | Listado de facturas con nombre del cliente |
| 2 | Facturas pendientes de cobro |
| 3 | Detalle de una factura con sus líneas |
| 4 | Total facturado por cliente |
| 5 | Gastos deducibles agrupados por categoría |
| 6 | Búsqueda de clientes por tipo |
| 7 | Resumen de IVA repercutido vs soportado (modelo 303) |

---

## Módulos del proyecto

Este repositorio forma parte del Proyecto Intermodular de 1º DAM e incluye entregables de tres asignaturas:

- **Bases de Datos** — diseño E/R, modelo relacional y scripts SQL (`/diagramas`, `/sql`, `/documentacion`)
- **Entornos de Desarrollo** — repositorio GitHub, historial de commits y documentación
- **Itinerario Personal para la Empleabilidad** — perfil profesional, investigación del sector y portfolio (`/documentacion/empleabilidad`)
