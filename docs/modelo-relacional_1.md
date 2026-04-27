# Modelo Relacional — GestorFiscal

---

## Tablas

### CATEGORIA

| Campo        | Tipo         | Restricciones                |
|--------------|--------------|------------------------------|
| id_categoria | INT          | PK, NOT NULL, AUTO_INCREMENT |
| nombre       | VARCHAR(100) | NOT NULL                     |
| descripcion  | VARCHAR(200) |                              |
| deducible    | BOOLEAN      | NOT NULL, DEFAULT FALSE      |

**Clave primaria:** `id_categoria`

---

### CLIENTE

| Campo      | Tipo                       | Restricciones                |
|------------|----------------------------|------------------------------|
| id_cliente | INT                        | PK, NOT NULL, AUTO_INCREMENT |
| nombre     | VARCHAR(100)               | NOT NULL                     |
| nif        | VARCHAR(20)                | NOT NULL, UNIQUE             |
| email      | VARCHAR(100)               | NOT NULL                     |
| telefono   | VARCHAR(20)                |                              |
| direccion  | VARCHAR(200)               |                              |
| tipo       | ENUM('autonomo','empresa') | NOT NULL                     |

**Clave primaria:** `id_cliente`

---

### FACTURA

| Campo             | Tipo                                          | Restricciones                      |
|-------------------|-----------------------------------------------|------------------------------------|
| id_factura        | INT                                           | PK, NOT NULL, AUTO_INCREMENT       |
| id_cliente        | INT                                           | FK → CLIENTE(id_cliente), NOT NULL |
| numero            | VARCHAR(20)                                   | NOT NULL, UNIQUE                   |
| fecha_emision     | DATE                                          | NOT NULL                           |
| fecha_vencimiento | DATE                                          |                                    |
| estado            | ENUM('borrador','emitida','pagada','anulada') | NOT NULL, DEFAULT 'borrador'       |
| base_imponible    | DECIMAL(10,2)                                 | NOT NULL                           |
| iva               | DECIMAL(10,2)                                 | NOT NULL                           |
| total             | DECIMAL(10,2)                                 | NOT NULL                           |

**Clave primaria:** `id_factura`
**Clave foranea:** `id_cliente` → `CLIENTE(id_cliente)`

---

### LINEA_FACTURA

| Campo           | Tipo          | Restricciones                       |
|-----------------|---------------|-------------------------------------|
| id_linea        | INT           | PK, NOT NULL, AUTO_INCREMENT        |
| id_factura      | INT           | FK → FACTURA(id_factura), NOT NULL  |
| descripcion     | VARCHAR(200)  | NOT NULL                            |
| cantidad        | INT           | NOT NULL                            |
| precio_unitario | DECIMAL(10,2) | NOT NULL                            |
| subtotal        | DECIMAL(10,2) | NOT NULL                            |

**Clave primaria:** `id_linea`
**Clave foranea:** `id_factura` → `FACTURA(id_factura)`

---

### GASTO

| Campo        | Tipo          | Restricciones                          |
|--------------|---------------|----------------------------------------|
| id_gasto     | INT           | PK, NOT NULL, AUTO_INCREMENT           |
| id_categoria | INT           | FK → CATEGORIA(id_categoria), NOT NULL |
| concepto     | VARCHAR(200)  | NOT NULL                               |
| fecha        | DATE          | NOT NULL                               |
| importe      | DECIMAL(10,2) | NOT NULL                               |
| iva          | DECIMAL(10,2) | NOT NULL                               |
| justificante | VARCHAR(200)  |                                        |

**Clave primaria:** `id_gasto`
**Clave foranea:** `id_categoria` → `CATEGORIA(id_categoria)`

---

## Relaciones

| Relacion                | Tipo | Descripcion                                      |
|-------------------------|------|--------------------------------------------------|
| CLIENTE → FACTURA       | 1:N  | Un cliente puede tener muchas facturas emitidas  |
| FACTURA → LINEA_FACTURA | 1:N  | Una factura contiene una o mas lineas de detalle |
| CATEGORIA → GASTO       | 1:N  | Una categoria agrupa uno o mas gastos deducibles |

---

## Notas de diseno

- Se usa `DECIMAL(10,2)` para todos los importes monetarios para evitar errores de redondeo con `FLOAT`.
- El campo `tipo` de CLIENTE distingue entre autonomos y empresas, ya que las obligaciones fiscales difieren.
- El campo `estado` de FACTURA permite seguir el ciclo de vida completo de una factura.
- El campo `deducible` de CATEGORIA permite filtrar rapidamente los gastos que reducen la base imponible.
- `LINEA_FACTURA` existe como tabla separada para respetar la normalizacion (1FN): una factura puede tener N lineas sin repetir datos.
