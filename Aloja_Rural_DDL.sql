create database Aloja_Rural;
use Aloja_Rural;

-- CODIGO_POSTAL (cp, localidad, provincia)
CREATE TABLE Cod_Postal (
    cp INT,
    localidad VARCHAR(100) NOT NULL,
    provincia VARCHAR(100) NOT NULL,
    CONSTRAINT PK_Cod_Postal PRIMARY KEY (cp)
);
-- ALOJAMIENTO (id, nombre, calle, num, cp, telefono, num_habitaciones, cod_emple_encargado)
CREATE TABLE Alojamiento (
    id INT AUTO_INCREMENT,
    nombre VARCHAR(150) NOT NULL,
    calle VARCHAR(100) NOT NULL,
    num TINYINT UNSIGNED,
    cp INT NOT NULL,
    num_habitaciones SMALLINT UNSIGNED,
    CONSTRAINT PK_Alojamiento PRIMARY KEY (id),
    CONSTRAINT CHK_num_habitaciones CHECK (num_habitaciones <= 200)
);
-- EMPLEADO (cod_empleado, NIF, nombre, ape1, ape2, id_alojamiento)
CREATE TABLE Empleado (
    cod_empleado INT UNSIGNED,
    nif VARCHAR(9) UNIQUE NOT NULL,
    nombre VARCHAR(150) NOT NULL,
    ap1 VARCHAR(100) NOT NULL,
    ap2 VARCHAR(100) NOT NULL,
    id_alojamiento INT NOT NULL,
    CONSTRAINT PK_Empleado PRIMARY KEY (cod_empleado)
);
-- HABITACION (id_alojamiento, numero, tipo, baño, precio)
create table Habitacion(
	id_alojamiento int,
    numero SMALLINT UNSIGNED,
    tipo enum ('Idividual', 'Doble', 'Triple'),
    baño tinyint default '1',
    constraint CHK_baño check (baño between 0 and 1),
    precio decimal(4,2) unsigned,  -- falta validacion
    constraint PK_Habitacion primary key(id_alojamiento)
);
-- ACTIVIDAD (cod_actividad, nombre, descripcion, dificultad)
CREATE TABLE Actividad (
    cod_actividad SMALLINT UNSIGNED AUTO_INCREMENT,
    nombre VARCHAR(150) NOT NULL,
    descripcion VARCHAR(100),
    dificultad ENUM('1', '2', '3', '4', '5', '6', '7', '8', '9', '10'),
    CONSTRAINT PK_Actividad PRIMARY KEY (cod_actividad)
);
-- ORGANIZA (id_alojamiento, cod_actividad, dia, hora_ini, hora_fin)
CREATE TABLE Organiza (
    id_alojamiento INT, -- falta res
    cod_actividad SMALLINT, -- falta res
    dia ENUM('L', 'M', 'X', 'J', 'V', 'S', 'D'),
    hora_ini TIME,
    hora_fin TIME,
    CONSTRAINT CHK_hora CHECK (hora_ini >= hora_fin),
    CONSTRAINT PK_Organiza PRIMARY KEY (id_alojamiento , cod_actividad)
);

-- creacion de FK

alter table Alojamiento add constraint FK_Alojamiento foreign key (id) references Cod_Postal(cp);
alter table Alojamiento add constraint FK_Alojamiento foreign key (id) references 
Empleado(cod_empleado) ON UPDATE CASCADE ON DELETE CASCADE;
alter table Empleado add constraint FK_Empleado foreign key (cod_empleado) references
 Alojamiento(id) ON UPDATE CASCADE ON DELETE CASCADE;
alter table Habitacion add constraint FK_Habitacion foreign key (id_alojamiento, numero) references Alojamiento(id);
alter table Organiza add constraint FK_Organiza foreign key (id_alojamiento,cod_actividad) references 
Alojamiento(id) ON UPDATE CASCADE ON DELETE CASCADE;
alter table Organiza add constraint FK_Organiza foreign key (id_alojamiento,cod_actividad) references Actividad(cod_actividad);
 










