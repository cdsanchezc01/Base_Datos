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






