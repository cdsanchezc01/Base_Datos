/*
BASE DE DATOS INICIAL
*/
-- 1 Crear la base de datos
drop database if exists bd_prueba;
 
create database if not exists BD_prueba; 

-- 2 Usar esa Bd
use BD_prueba; 

-- 3 Creamos una tabla usuando enteros 
-- ojo La ultima coma se quita porque no espera mas 
create table ENTERO (
	-- nombre columna y tipo
    ID int, -- -2147483648 a 2147483647, valor sin signo: 0 – 4294967295.
    edad tinyint, -- 128 a 127, valor sin signo: 0 a 255.
    punto smallint, -- -32768 a 32767, valor sin signo: 0 a 65535.
    sueldo mediumint, -- -8388608 a 8388607, valor sin signo: 0 a 16777215.
    superEntero bigint -- -9223372036854775808 a 9223372036854775807, valor sin signo: 0 a 18446744073709551615.
); 

create table DECIMALES(
	ID int,
    sueldo  decimal (8,2), -- 8 dígitos emn total de los cuales 2 estan reservados para la parte decimal.
    sueldo2 numeric (8,2),  --  Es lo mismo decimal que numeric.
    sueldo3 float,
    sueldo4 double
);

CREATE TABLE cadenas (
    ID INT,
    hijos CHAR(1),
    nombre VARCHAR(150),
    libro TEXT,
    titulo_libro TINYTEXT,
    libro_ext MEDIUMTEXT,
    super_libro LONGTEXT
);








