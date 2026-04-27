-- ============================================================
-- GestorFiscal — Script 02: Inserción de datos de ejemplo
-- Autor: Alejandro Pérez Ruiz de la Cuesta
-- Módulo: Bases de Datos (0484) — 1º DAM 2025/26
-- ============================================================

USE gestorfiscal;

-- ------------------------------------------------------------
-- Categorías de gastos
-- ------------------------------------------------------------
INSERT INTO CATEGORIA (nombre, descripcion, deducible) VALUES
    ('Alquiler',       'Alquiler de oficina o local de trabajo',        TRUE),
    ('Suministros',    'Electricidad, agua, internet y teléfono',       TRUE),
    ('Material',       'Material de oficina y consumibles',             TRUE),
    ('Dietas',         'Comidas y desplazamientos por trabajo',         TRUE),
    ('Formacion',      'Cursos, libros y suscripciones profesionales',  TRUE),
    ('Otros',          'Gastos no clasificados en otras categorías',    FALSE);

-- ------------------------------------------------------------
-- Clientes
-- ------------------------------------------------------------
INSERT INTO CLIENTE (nombre, nif, email, telefono, direccion, tipo) VALUES
    ('Laura Martínez García',    '12345678A', 'laura@lauramg.es',      '600111222', 'Calle Mayor 5, Madrid',          'autonomo'),
    ('Obras y Reformas SL',      'B98765432', 'admin@obrasyref.com',   '910333444', 'Avda. Industria 22, Valencia',   'empresa'),
    ('Pedro Sánchez Ruiz',       '87654321B', 'pedro@psanchez.com',    '622555666', 'Calle Colón 8, Sevilla',         'autonomo'),
    ('Diseño Digital SAU',       'A11223344', 'info@diseniodigital.es','933777888', 'Passeig de Gràcia 100, Barcelona','empresa'),
    ('Ana Torres Vidal',         '55667788C', 'ana@anatorres.net',     '611999000', 'Calle San Juan 3, Alicante',     'autonomo');

-- ------------------------------------------------------------
-- Facturas
-- ------------------------------------------------------------
INSERT INTO FACTURA (id_cliente, numero, fecha_emision, fecha_vencimiento, estado, base_imponible, iva, total) VALUES
    (1, 'FAC-2025-001', '2025-01-10', '2025-02-10', 'pagada',   1500.00, 315.00, 1815.00),
    (1, 'FAC-2025-002', '2025-02-15', '2025-03-15', 'pagada',    800.00, 168.00,  968.00),
    (2, 'FAC-2025-003', '2025-03-01', '2025-04-01', 'emitida',  3200.00, 672.00, 3872.00),
    (3, 'FAC-2025-004', '2025-03-20', '2025-04-20', 'borrador',  600.00, 126.00,  726.00),
    (4, 'FAC-2025-005', '2025-04-05', '2025-05-05', 'emitida',  2100.00, 441.00, 2541.00),
    (5, 'FAC-2025-006', '2025-04-18', NULL,         'borrador',  450.00,  94.50,  544.50);

-- ------------------------------------------------------------
-- Líneas de factura
-- ------------------------------------------------------------
INSERT INTO LINEA_FACTURA (id_factura, descripcion, cantidad, precio_unitario, subtotal) VALUES
    -- FAC-2025-001
    (1, 'Desarrollo web — fase 1',     1, 1200.00, 1200.00),
    (1, 'Consultoría técnica (5h)',     5,   60.00,  300.00),
    -- FAC-2025-002
    (2, 'Mantenimiento mensual web',   1,  800.00,  800.00),
    -- FAC-2025-003
    (3, 'Instalación eléctrica',       1, 2500.00, 2500.00),
    (3, 'Material de obra',            1,  700.00,  700.00),
    -- FAC-2025-004
    (4, 'Redacción contenidos (10h)', 10,   60.00,  600.00),
    -- FAC-2025-005
    (5, 'Diseño de identidad corporativa', 1, 1500.00, 1500.00),
    (5, 'Manual de marca',                 1,  600.00,  600.00),
    -- FAC-2025-006
    (6, 'Sesión de fotografía (3h)',   3,  150.00,  450.00);

-- ------------------------------------------------------------
-- Gastos
-- ------------------------------------------------------------
INSERT INTO GASTO (id_categoria, concepto, fecha, importe, iva, justificante) VALUES
    (1, 'Alquiler oficina enero',       '2025-01-05',  500.00, 105.00, 'recibo-alq-ene25.pdf'),
    (1, 'Alquiler oficina febrero',     '2025-02-05',  500.00, 105.00, 'recibo-alq-feb25.pdf'),
    (2, 'Factura internet enero',       '2025-01-10',   49.90,  10.48, 'fact-inet-ene25.pdf'),
    (2, 'Factura electricidad enero',   '2025-01-20',   85.30,  17.91, 'fact-elec-ene25.pdf'),
    (3, 'Material de oficina',          '2025-01-25',   32.60,   6.85, 'ticket-papeleria.pdf'),
    (4, 'Comida con cliente Martínez',  '2025-02-12',   45.00,   9.45, 'ticket-restaurante.pdf'),
    (5, 'Curso SQL avanzado online',    '2025-03-01',  129.00,  27.09, 'factura-udemy.pdf'),
    (2, 'Factura internet febrero',     '2025-02-10',   49.90,  10.48, 'fact-inet-feb25.pdf'),
    (4, 'Desplazamiento a Barcelona',   '2025-04-06',   78.50,  16.49, 'ticket-tren.pdf'),
    (6, 'Gastos bancarios marzo',       '2025-03-31',   12.00,   0.00, 'extracto-banco.pdf');
