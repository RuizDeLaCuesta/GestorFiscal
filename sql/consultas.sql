-- ============================================================
-- GestorFiscal — Script 03: Consultas
-- Autor: Alejandro Pérez Ruiz de la Cuesta
-- Módulo: Bases de Datos (0484) — 1º DAM 2025/26
-- ============================================================

USE gestorfiscal;

-- ------------------------------------------------------------
-- CONSULTA 1: Listado completo de facturas con nombre del cliente
-- Muestra todas las facturas junto con el nombre y NIF del cliente
-- ------------------------------------------------------------
SELECT
    f.numero,
    c.nombre        AS cliente,
    c.nif,
    f.fecha_emision,
    f.estado,
    f.base_imponible,
    f.iva,
    f.total
FROM FACTURA f
JOIN CLIENTE c ON f.id_cliente = c.id_cliente
ORDER BY f.fecha_emision DESC;

-- ------------------------------------------------------------
-- CONSULTA 2: Facturas pendientes de cobro (estado = 'emitida')
-- Útil para el control de cobros del autónomo
-- ------------------------------------------------------------
SELECT
    f.numero,
    c.nombre        AS cliente,
    c.email,
    f.fecha_emision,
    f.fecha_vencimiento,
    f.total
FROM FACTURA f
JOIN CLIENTE c ON f.id_cliente = c.id_cliente
WHERE f.estado = 'emitida'
ORDER BY f.fecha_vencimiento ASC;

-- ------------------------------------------------------------
-- CONSULTA 3: Detalle completo de una factura con sus líneas
-- Muestra el desglose de la factura FAC-2025-001
-- ------------------------------------------------------------
SELECT
    f.numero,
    c.nombre            AS cliente,
    lf.descripcion,
    lf.cantidad,
    lf.precio_unitario,
    lf.subtotal
FROM LINEA_FACTURA lf
JOIN FACTURA f ON lf.id_factura = f.id_factura
JOIN CLIENTE c ON f.id_cliente  = c.id_cliente
WHERE f.numero = 'FAC-2025-001';

-- ------------------------------------------------------------
-- CONSULTA 4: Total facturado por cliente
-- Agrupa las facturas pagadas o emitidas por cliente
-- ------------------------------------------------------------
SELECT
    c.nombre                    AS cliente,
    c.tipo,
    COUNT(f.id_factura)         AS num_facturas,
    SUM(f.base_imponible)       AS total_base,
    SUM(f.iva)                  AS total_iva,
    SUM(f.total)                AS total_facturado
FROM CLIENTE c
JOIN FACTURA f ON c.id_cliente = f.id_cliente
WHERE f.estado IN ('emitida', 'pagada')
GROUP BY c.id_cliente, c.nombre, c.tipo
ORDER BY total_facturado DESC;

-- ------------------------------------------------------------
-- CONSULTA 5: Gastos deducibles agrupados por categoría
-- Permite calcular cuánto se puede deducir por tipo de gasto
-- ------------------------------------------------------------
SELECT
    cat.nombre          AS categoria,
    COUNT(g.id_gasto)   AS num_gastos,
    SUM(g.importe)      AS total_importe,
    SUM(g.iva)          AS total_iva
FROM GASTO g
JOIN CATEGORIA cat ON g.id_categoria = cat.id_categoria
WHERE cat.deducible = TRUE
GROUP BY cat.id_categoria, cat.nombre
ORDER BY total_importe DESC;

-- ------------------------------------------------------------
-- CONSULTA 6: Búsqueda de clientes por tipo
-- Filtra autónomos o empresas según necesidad
-- ------------------------------------------------------------
SELECT
    id_cliente,
    nombre,
    nif,
    email,
    telefono,
    tipo
FROM CLIENTE
WHERE tipo = 'autonomo'
ORDER BY nombre ASC;

-- ------------------------------------------------------------
-- CONSULTA 7: Resumen fiscal trimestral (IVA repercutido vs soportado)
-- Compara el IVA cobrado en facturas con el IVA pagado en gastos
-- Útil para preparar el modelo 303 de Hacienda
-- ------------------------------------------------------------
SELECT
    'IVA repercutido (facturas emitidas/pagadas)' AS concepto,
    SUM(iva) AS total_iva
FROM FACTURA
WHERE estado IN ('emitida', 'pagada')

UNION ALL

SELECT
    'IVA soportado (gastos deducibles)' AS concepto,
    SUM(g.iva) AS total_iva
FROM GASTO g
JOIN CATEGORIA cat ON g.id_categoria = cat.id_categoria
WHERE cat.deducible = TRUE;
