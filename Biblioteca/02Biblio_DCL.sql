
-- Crea un usuario: usuario1 cuya password deba cambiarla, acceso desde cualquier ubicación
create user 'usuario1'@'%' identified by '9876'; -- password expire;

-- Crea el permiso que le permita consultar toda las tablas de la bd biblioteca.
grant select on Biblioteca.* to 'usuario1'@'%';
flush privileges;

-- Crea un usuario: usuario2 cuya password nunca expire, acceso desde localhost
create user 'usuario2'@'localhost' identified by '9876' password expire never; 

-- Crea el permiso de consulta, inserción, modificado y borrado de datos de todas las tablas bd.
grant select, insert, update, delete on *.* to 'usuario2'@'localhost';
flush privileges;

-- Crea un usuario: usuario3 cuya password expire dentro de 2 dias, acceso desde localhost
create user 'usuario3'@'localhost' identified by '9876' password expire interval 2 day; 
flush privileges;

-- Crea el permiso de creación de objetos en la bd de biblioteca
grant create on biblioteca.* to 'usuario3'@'localhost';
flush privileges;

-- Crea un usuario: usuario3 acceso desde la ip 172.19.27.149
create user 'usuario3'@'10.0.2.15' identified by '9876'; 
-- Crea el permiso de creación, actualizacion, y borrado de objetos en la bd de biblioteca


-- Actualiza la pass del usuario4 para que la deba cambiar


-- Crea un usuario: superusuario acceso desde cualquier ubicación.
-- Crea con todos los privilegios de la tabla biblioteca


-- crea acceso al usuario usuario4 desde otra IP.

-- Borra el privilegio de creación del usuario usuario3

-- Borra el privilegio de modificación y borrado asociado al usuario4

-- Borra todos los u