# GestorFiscal --> Tribut_ia_

Software de gestión y automatización fiscal para autónomos y PYMEs.

> Proyecto Intermodular — 1º DAM 2025/26 · Alejandro Pérez Ruiz de la Cuesta

---

## ¿Qué es este proyecto?

Tribut_ia_ es una aplicación de escritorio pensada para que autónomos y pequeñas empresas puedan gestionar su actividad fiscal de forma sencilla: emitir facturas, registrar gastos deducibles y tener siempre visible cuánto IVA han cobrado y cuánto han pagado.

El problema que resuelve es concreto: un autónomo que trabaja solo no tiene tiempo ni conocimientos contables para llevar un control riguroso de su fiscalidad. Tribut_ia_ centraliza toda esa información en una base de datos estructurada y ofrece consultas útiles para preparar las declaraciones trimestrales.

A futuro, Tribut_ia_ incorporará un asistente de IA especializado en gestión y asesoría fiscal con capacidad de actuar como asesor privado del cliente de cara a dudas, modelos a presentar, trámites fiscales y/o burocráticos on-line... 
Además, la creación de una nueva sección de tesorería en la que poder conectar cuentas bancarias de profesionales y empresas y ofrecer previsión y predicción de gastos, deducciones, sanciones y optimizaciones mediante modelos predictivos de machine learning y quantum finance básicos (regresión lineal, XGBoost...).
Por último, se hará una última versión de la startup en la que se recopilarán accesos directos a portales mercados financieros y noticias mediante scrapping y se harán recomendaciones en tiempo real, diarias, semanales, mensuales y anuales de inversión en base a las predicciones de capital disponible después de impuestos del propio profesional o empresa. Para invertir, se dará acceso directo vía API y paneles embebidos a plataformas tales como eToro, Revolut o MyInvestor.


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
