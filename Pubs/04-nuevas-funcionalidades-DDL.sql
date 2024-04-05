use  pubs;

-- Añadir una columna llamada telefono a la tabla TITULAR de tipo char(13) no nulo.
alter table titular add column telefono char(13) not null;

-- Modificar la columna domicilio en la tabla EMPLEADO para no permitir nulos.
alter table empleado modify column domicilio  varchar(150) not null;

-- Eliminar la columna fecha_apertura de la tabla PUB.
alter table pub drop column fecha_apertura;

-- Añadir una restricción UNIQUE a la columna nombre en la tabla PUB.
alter table pub add constraint un_pub_nombre unique (nombre);

-- Renombrar la tabla EXISTENCIAS a INVENTARIO.
rename table EXISTENCIAS to INVENTARIO;

-- Renombrar la columna cod_articulo en la tabla INVENTARIO a codigo_producto.
alter table INVENTARIO rename column cod_articulo to  codigo_producto;

-- Crear una tabla duplicada de PUB llamada PUB_COPIA. Sólo estructura.
create table PUB_COPIA like PUB;

-- Añadir un índice idx_nombre_titular a la columna nombre en la tabla TITULAR.
create index idx_nombre_titular  on TITULAR(nombre);

-- Añadir una vista llamada INFO_EMPLEADO que muestre el nombre y domicilio de los empleados.
create view INFO_EMPLEADO as select nombre, domicilio from empleado;

-- Modificar la tabla PUB_EMPLEADO para cambiar el tipo de dato de la columna funcion a varchar(20).
alter table PUB_EMPLEADO modify column funcion varchar(20);

-- Eliminar la restricción CHK_PRECIO de la tabla INVENTARIO.
alter table INVENTARIO drop constraint CHK_PRECIO;

-- Añadir una nueva columna llamada fecha_contrato no nula a la tabla EMPLEADO. Por defecto hoy (CURRENT_DATE)
alter table EMPLEADO add column fecha_contrato date not null default (CURRENT_DATE);

-- Renombrar la tabla LOCALIDAD a COD_POSTAL.
rename table LOCALIDAD to COD_POSTAL;

-- Renombrar la columna dni_titular en la tabla TITULAR a codigo_titular.
alter table TITULAR rename column dni_titular to  codigo_titular;

-- Añade una columna nom_provincia no nula en la tabla COD_POSTAL.
alter table COD_POSTAL add column nom_provincia varchar(50) not null;

-- Añadir una nueva columna llamada tipo_contrato ('FIJO DISCONTINUO', 'INDEFINIDO', 'PRACTICAS') puede ser nulo a la tabla EMPLEADO.
alter table EMPLEADO add column tipo_contrato enum ('FIJO DISCONTINUO', 'INDEFINIDO', 'PRACTICAS');

-- Añade la restriccion en EMPLEADO para que el campo edad sea mayor de 18 y menor que 66.
alter table EMPLEADO add column edad tinyint unsigned;
alter table EMPLEADO add constraint CHK_EDAD check (edad between 19 and 65); -- Forma 1
alter table EMPLEADO add constraint CHK_EDAD check (edad > 18 and edad < 66); -- Forma 2

-- Modifica la restriccion anterior para que sea mayor igual a 18. ¿Puedes? 
  -- alter table EMPLEADO modify constraint CHK_EDAD check (edad between 19 and 65); -- Las constraint no sé pueden modificar, primero se borra y luego se crea de nuevo
  alter table EMPLEADO drop constraint CHK_EDAD; 
alter table EMPLEADO add constraint CHK_EDAD check (edad between 19 and 65);  
-- Modificar la longitud máxima de la columna nombre en la tabla TITULAR a varchar(100) not null.
alter table TITULAR modify column nombre varchar(100) not null;

-- Eliminar la restricción CHK_HORARIO de la tabla PUB.
alter table PUB drop constraint CHK_HORARIO;

-- Añadir una nueva restricción a la columna cantidad en la tabla INVENTARIO para asegurar que no sea negativa.
alter table INVENTARIO add constraint CHK_CANTIDAD check (cantidad > 0); -- Restriccion se pone con (cantidad > 0) no con unsigned

-- Renombrar la tabla PUB_EMPLEADO a ASIGNACION.
rename table PUB_EMPLEADO to ASIGNACION;

-- Renombrar la columna nombre en la tabla PUB a nombre_pub.
alter table PUB rename column nombre to nombre_pub;

-- Crear una tabla duplicada de TITULAR llamada TITULAR_COPIA. Con contenido. AS  crea la estructura y contenido y like solo estrucctura
create table TITULAR_COPIA as select * from TITULAR;

-- Añadir una vista llamada INFO_PUB que muestre el nombre y domicilio de los pubs.
create view INFO_PUB as select nombre_pub, domicilio from pub;

-- Modificar la tabla EMPLEADO para añadir una columna llamada salario de tipo decimal(10,2).
alter table EMPLEADO add column salario decimal(10,2);

-- Muestra las tablas de la BD
show tables;

-- Muestra la estructura de cada una de ellas.
desc asignacion;
describe empleado;
desc cod_postal;
desc info_empleado;
desc info_pub;
desc inventario;
desc pub;
desc pub_copia;
desc titular;
desc titular_copia;

-- DML: Consulta todos los datos de la vista INFO_PUB
select * from INFO_PUB;

-- Borra la vista INFO_PUB
drop view INFO_PUB;

-- Borra las tablas que son copias
drop table pub_copia;
drop table titular_copia;

-- Borra el índice idx_nombre_titular de la tabla TITULAR
drop index idx_nombre_titular on TITULAR;









