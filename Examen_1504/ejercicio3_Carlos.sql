use Ejercicio1_Carlos;

-- a)	Crea un usuario ej3_usu1 que accede localmente con contraseña (12345) que expire y deba cambiarla cuando inicie sesión.
create user 'ej3_usu1'@'localHost' identified by '12345' password expire;
flush privileges;

-- b)	Da permisos DDL a ej3_usu1 para crear, modificar y borrar objetos de toda la base de datos elegida(*). 
grant create, drop, alter on Ejercicio1_Carlos.* to 'ej3_usu1'@'localHost';
flush privileges;

-- c)	Revoca el permiso de borrar dado a ej3_usu1.
revoke drop on Ejercicio1_Carlos.* from 'ej3_usu1'@'localHost';
flush privileges;

-- d)	Crea un usuario ej3_usu2 que accede desde cualquier ubicación con contraseña (12345) y que la contraseña no expire nunca.
create user 'ej3_usu2'@'%' identified by '12345';
flush privileges;

-- e)	Da permisos a ej3_usu2 para consultar (DML) todas las tablas de la base de datos elegida (*)
grant select, insert, update on Ejercicio1_Carlos.* to  'ej3_usu2'@'%';
flush privileges;

-- f)	Borra los usuarios creados en el script.
drop user 'ej3_usu1'@'localHost';
flush privileges;
drop user 'ej3_usu2'@'%';
flush privileges;

select * from mysql.user;
-- comprobamos que se ha borrado correctamente.




