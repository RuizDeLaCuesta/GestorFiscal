Documentación del diseño de la base de datos — Tribut*ia*
Descripción general
Tribut*ia* es una aplicación de gestión fiscal para autónomos y PYMEs. Su base de datos centraliza toda la información necesaria para controlar la actividad económica del negocio: clientes, facturación, gastos deducibles y categorías de gasto.
El diseño parte de un análisis de las necesidades reales de un autónomo en España: emitir facturas, registrar gastos, calcular el IVA a declarar y tener visibilidad sobre su situación fiscal trimestral.

Decisiones de diseño
Por qué estas cinco entidades
La base de datos está formada por cinco tablas que cubren los dos flujos principales de la aplicación:
Flujo de ingresos: CLIENTE → FACTURA → LINEA_FACTURA
Un cliente recibe una o varias facturas. Cada factura se desglosa en líneas independientes, lo que permite facturar varios conceptos en un mismo documento sin repetir los datos de cabecera. Esta separación es imprescindible para respetar la Primera Forma Normal (1FN).
Flujo de gastos: CATEGORIA → GASTO
Los gastos se agrupan por categorías (alquiler, suministros, dietas, formación...) para poder filtrar cuáles son fiscalmente deducibles y cuáles no. Esta distinción es clave para calcular la base imponible real del autónomo.
Tipos de datos

DECIMAL(10,2) para todos los importes monetarios. Se descartó FLOAT porque introduce errores de redondeo inaceptables en contextos financieros.
ENUM para campos con valores cerrados como estado (borrador, emitida, pagada, anulada) y tipo de cliente (autonomo, empresa). Esto garantiza integridad de datos sin necesitar tablas auxiliares.
DATE para fechas, sin componente horario, ya que la aplicación trabaja con fechas de emisión y vencimiento, no con marcas de tiempo.
BOOLEAN para el campo deducible de CATEGORIA, que actúa como filtro rápido en las consultas fiscales.

Integridad referencial
Todas las relaciones están implementadas con claves foráneas explícitas:

FACTURA.id_cliente → CLIENTE.id_cliente con ON DELETE RESTRICT: no se puede eliminar un cliente que tenga facturas asociadas.
LINEA_FACTURA.id_factura → FACTURA.id_factura con ON DELETE CASCADE: si se elimina una factura, sus líneas se eliminan automáticamente.
GASTO.id_categoria → CATEGORIA.id_categoria con ON DELETE RESTRICT: no se puede eliminar una categoría que tenga gastos asociados.


Integración con una aplicación Java
Esta base de datos está diseñada para ser consumida desde una aplicación Java de escritorio. La integración se haría mediante JDBC (Java Database Connectivity), el estándar de Java para conectarse a bases de datos relacionales.
El flujo de conexión sería el siguiente:
java// Ejemplo de conexión JDBC a la base de datos gestorfiscal
String url = "jdbc:mysql://localhost:3306/gestorfiscal";
String user = "root";
String password = "contraseña";

Connection conn = DriverManager.getConnection(url, user, password);
Cada tabla de la base de datos correspondería a una clase Java (modelo):
Tabla SQLClase JavaCLIENTECliente.javaFACTURAFactura.javaLINEA_FACTURALineaFactura.javaCATEGORIACategoria.javaGASTOGasto.java
Las consultas del archivo 03_consultas.sql se ejecutarían desde Java usando PreparedStatement para evitar inyecciones SQL, y los resultados se mapearían a objetos Java mediante ResultSet.

Consultas clave de la aplicación
La base de datos incluye siete consultas que cubren las operaciones principales de la aplicación:

Listado de facturas con cliente — vista principal de la aplicación
Facturas pendientes de cobro — control de tesorería
Detalle de una factura con líneas — vista de detalle al abrir una factura
Total facturado por cliente — análisis de rentabilidad por cliente
Gastos deducibles por categoría — análisis de estructura de costes
Búsqueda de clientes por tipo — filtrado de autónomos vs empresas
Resumen IVA repercutido vs soportado — preparación del modelo 303 trimestral

Esta última consulta es especialmente relevante desde el punto de vista fiscal: permite al autónomo saber en todo momento cuánto IVA debe ingresar a Hacienda (diferencia entre IVA cobrado e IVA pagado).
