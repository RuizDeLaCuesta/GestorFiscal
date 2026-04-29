Portfolio — Tributia
El proyecto
Tributia es una aplicación de gestión fiscal para autónomos y PYMEs desarrollada como Proyecto Intermodular de 1º DAM (2025/26).
Resuelve un problema concreto: un autónomo necesita controlar su facturación, sus gastos deducibles y calcular el IVA trimestral. Tributia centraliza todo eso en una base de datos relacional con consultas que responden directamente a esas preguntas.
Repositorio: github.com/RuizDeLaCuesta/GestorFiscal

Qué incluye
Base de datos
5 tablas relacionadas entre sí:

CLIENTE — autónomos y empresas a los que se factura
FACTURA — facturas emitidas con control de estado (borrador, emitida, pagada, anulada)
LINEA_FACTURA — desglose de cada factura en líneas de concepto
CATEGORIA — categorías de gastos con flag de deducibilidad fiscal
GASTO — gastos registrados con justificante

Diagrama E/R
El diseño de la base de datos está documentado en un diagrama Entidad-Relación que muestra las 5 entidades, sus atributos, claves primarias, claves foráneas y las cardinalidades de cada relación.

Scripts SQL
01_create_tables.sql ->   Creación de la base de datos y las 5 tablas con todas sus restricciones
02_insert_data.sql -> 5 clientes, 6 facturas, 9 líneas, 6 categorías y 10 gastos de ejemplo03_consultas.sql -> 7 consultas reales con SELECT, JOIN, GROUP BY, WHERE y UNION

Consultas destacadas
La consulta más relevante desde el punto de vista fiscal es el resumen de IVA trimestral, que compara el IVA cobrado en facturas con el IVA pagado en gastos deducibles — la base del modelo 303 que todo autónomo presenta a Hacienda:
SELECT 'IVA repercutido' AS concepto, SUM(iva) AS total_iva
FROM FACTURA WHERE estado IN ('emitida', 'pagada')
UNION ALL
SELECT 'IVA soportado' AS concepto, SUM(g.iva)
FROM GASTO g
JOIN CATEGORIA cat ON g.id_categoria = cat.id_categoria
WHERE cat.deducible = TRUE;

Tecnologías utilizadas

MySQL 8 — sistema gestor de base de datos
SQL — DDL para la estructura, DML para los datos y consultas
draw.io — diseño del diagrama E/R
MySQL Workbench — entorno de pruebas
Git + GitHub — control de versiones


Qué he aprendido
Este proyecto ha sido mi primera experiencia diseñando una base de datos real desde cero. Lo más valioso ha sido aprender a pensar antes de escribir: definir las entidades, las relaciones y los tipos de datos correctos antes de tocar SQL.
También he aprendido por qué importan cosas que antes eran abstractas — usar DECIMAL en lugar de FLOAT para importes, separar las líneas de factura en su propia tabla para cumplir la 1FN, o usar ENUM para campos con valores cerrados. Decisiones de diseño pequeñas que tienen un impacto real en la calidad de los datos.
Desde mi perspectiva, lo más interesante ha sido ver cómo una base de datos bien estructurada puede responder preguntas de negocio concretas con una sola consulta SQL. Eso conecta directamente con el análisis financiero y el trabajo con datos que me interesa desarrollar profesionalmente.
