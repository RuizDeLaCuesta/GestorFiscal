Presentación del Proyecto — Gestor Fiscal - Tribut*ia*

Qué es
Tribut*ia* es una aplicación de gestión fiscal diseñada para autónomos y pequeñas empresas. Centraliza en una base de datos estructurada toda la información necesaria para controlar la actividad económica del negocio: clientes, facturas emitidas, líneas de factura y gastos deducibles categorizados.
El proyecto cubre el ciclo completo de la facturación —desde el borrador hasta el pago— y permite calcular en cualquier momento el IVA repercutido frente al IVA soportado, que es la base del modelo 303 trimestral que todo autónomo en España está obligado a presentar.

Qué problema resuelve
Un autónomo que trabaja solo gestiona su actividad entre clientes, proyectos, facturas y gastos. Sin una herramienta adecuada, ese control acaba haciéndose en hojas de cálculo dispersas, correos sin archivar o directamente de memoria. El resultado es que llega el trimestre y no tiene visibilidad clara sobre cuánto ha facturado, cuánto puede deducir ni cuánto IVA debe ingresar a Hacienda.
Tribut*ia* resuelve ese problema con una base de datos bien diseñada y consultas que responden directamente a esas preguntas:

¿Qué facturas tengo pendientes de cobro?
¿Cuánto he facturado a cada cliente este trimestre?
¿Qué gastos puedo deducir y en qué categoría?
¿Cuánto IVA tengo que declarar?


Para quién está pensado
El usuario principal es un autónomo o micropyme sin departamento de administración: un diseñador freelance, un consultor independiente, un pequeño estudio de arquitectura o cualquier profesional que trabaje por cuenta propia y necesite llevar un control básico pero riguroso de su actividad fiscal.

Tecnologías utilizadas
TecnologíaUso en el proyectoMySQL 8Sistema gestor de base de datos relacionalSQL (DDL + DML)Creación de tablas, inserción de datos y consultasdraw.ioDiseño del diagrama Entidad-RelaciónGit + GitHubControl de versiones y documentación del proyectoMySQL WorkbenchEntorno de pruebas y ejecución de scripts
La base de datos está diseñada para integrarse con una aplicación Java de escritorio mediante JDBC, siguiendo el patrón de una clase Java por cada tabla del modelo relacional.

Qué he aprendido desarrollándolo
Este proyecto ha sido mi primera experiencia diseñando una base de datos desde cero para una aplicación real, y ha cambiado bastante cómo entiendo el trabajo con datos.
Lo más valioso ha sido aprender a pensar el diseño antes de escribir código: identificar las entidades, definir las relaciones, decidir los tipos de datos correctos y anticipar cómo se van a usar esos datos desde la aplicación. Errores como usar FLOAT para importes monetarios en lugar de DECIMAL, o no separar las líneas de factura en su propia tabla, son cosas que ahora entiendo por qué importan.
También he aprendido a trabajar con Git de forma progresiva, haciendo commits con sentido a medida que avanzaba, y a documentar las decisiones técnicas de forma que otro desarrollador pueda entender el proyecto sin necesidad de explicaciones adicionales.
Desde mi perspectiva, lo más interesante ha sido ver cómo una base de datos bien estructurada puede responder preguntas de negocio concretas —como el resumen de IVA trimestral— con una sola consulta SQL. Eso conecta directamente con el tipo de trabajo analítico que me interesa hacer en el sector financiero.
