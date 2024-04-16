create database Festival;
use Festival;

CREATE TABLE Artista (
    id_Artista INT unsigned auto_increment,
    nom VARCHAR(255) NOT NULL,
    tipo ENUM('Solista', 'DJ', 'Banda', 'Orquesta') NOT NULL,
    CONSTRAINT PK_Artista PRIMARY KEY (id_Artista)
);

CREATE TABLE Festival (
    id_Festival INT unsigned auto_increment,
    nom VARCHAR(255) NOT NULL,
    descripcion TEXT,
    fecha_inicio DATE NOT NULL,
    fecha_fin DATE NOT NULL,
    CONSTRAINT PK_Festival PRIMARY KEY (id_Festival)
);

CREATE TABLE Escenario (
    id_Escenario INT UNSIGNED AUTO_INCREMENT,
    nom VARCHAR(255) NOT NULL,
    capacidad INT UNSIGNED NOT NULL,
    CONSTRAINT PK_Escenario PRIMARY KEY (id_Escenario)
);

CREATE TABLE Edicion (
    id_Edicion INT UNSIGNED AUTO_INCREMENT,
    id_Festival INT UNSIGNED,
    nom VARCHAR(255) NOT NULL,
    fecha DATE NOT NULL,
    ubicacion VARCHAR(255) NOT NULL,
    CONSTRAINT PK_Edicion PRIMARY KEY (id_Edicion)
); 

-- create table Actuacion();
-- create table Actuacion_Escenario();







