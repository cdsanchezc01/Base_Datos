/*
BASE DE DATOS INIAL
*/
-- 1 Crear la base de datos 
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

insert into ENTERO (ID, edad, punto, sueldo, superEntero) value (1, 42, 1000, 60000, 754798257487598);

