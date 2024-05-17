create database Accidente;
use Accidente;

CREATE TABLE Lugar (
    id_lugar INT UNSIGNED AUTO_INCREMENT,
    cord_x VARCHAR(150) NOT NULL,
    cord_y VARCHAR(150) NOT NULL,
    tipo VARCHAR(100) NOT NULL,
    CONSTRAINT PK_Lugar PRIMARY KEY (id_lugar)
);

CREATE TABLE Via_Urbana (
    id_lugar INT UNSIGNED AUTO_INCREMENT,
    direccion VARCHAR(100) NOT NULL,
    cp CHAR(5) NOT NULL,
    CONSTRAINT PK_Via_Urbana PRIMARY KEY (id_lugar)
);

CREATE TABLE Cod_Postal (
    cp CHAR(5),
    provincia VARCHAR(100) NOT NULL,
    localidad VARCHAR(100) NOT NULL,
    CONSTRAINT PK_Cod_Postal PRIMARY KEY (cp)
);

CREATE TABLE Carretera (
    id_lugar INT UNSIGNED AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    tipo_carretera ENUM('Autopista', 'Autovia', 'Doble sentido'),
    CONSTRAINT PK_Carretera PRIMARY KEY (id_lugar)
);

CREATE TABLE Accidente (
    id_accidente INT UNSIGNED AUTO_INCREMENT,
    id_lugar INT UNSIGNED,
    desperfecto VARCHAR(100) NOT NULL,
    id_agente INT UNSIGNED,
    CONSTRAINT PK_Accidente PRIMARY KEY (id_accidente)
);

CREATE TABLE Vehiculo (
    matricula CHAR(6),
    modelo VARCHAR(100) NOT NULL,
    id_marca INT UNSIGNED AUTO_INCREMENT,
    CONSTRAINT PK_Vehiculo PRIMARY KEY (matricula)
);

CREATE TABLE Marca (
    id_marca INT UNSIGNED AUTO_INCREMENT,
    nombre_marca VARCHAR(100) NOT NULL,
    CONSTRAINT PK_Marca PRIMARY KEY (Marca)
);

CREATE TABLE Damnificado (
    id_dam INT UNSIGNED AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    ap1 VARCHAR(100) NOT NULL,
    ap2 VARCHAR(100) NOT NULL,
    tfno CHAR(12) NOT NULL,
    edad TINYINT UNSIGNED NOT NULL,
    id_accidente INT UNSIGNED AUTO_INCREMENT,
    gravedad ENUM('leve', 'grave', 'muerto') NOT NULL,
    matricula CHAR(6) NOT NULL,
    modo VARCHAR(150) NOT NULL,
    CONSTRAINT PK_Damnificado PRIMARY KEY (id_dam)
);

CREATE TABLE Agente_Traf (
    id_agente INT UNSIGNED AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    ap1 VARCHAR(100) NOT NULL,
    ap2 VARCHAR(100) NOT NULL,
    cuerpo ENUM('Trafico', 'Rural', 'USECIC', 'G.R.S') NOT NULL,
    tfno CHAR(12) NOT NULL,
    id_agjefe INT UNSIGNED,
    CONSTRAINT PK_Agente_Traf PRIMARY KEY (id_agente)
);

CREATE TABLE ACC_Vehi (
    id_acc INT UNSIGNED AUTO_INCREMENT,
    matricula CHAR(6),
    estado VARCHAR(100) NOT NULL,
    CONSTRAINT PK_ACC_Vehi PRIMARY KEY (id_acc , matricula)
);

CREATE TABLE Test (
    id_test INT UNSIGNED AUTO_INCREMENT,
    resultado ENUM('positivo', 'negativo') NOT NULL,
    fecha TIMESTAMP NOT NULL,
    tipo ENUM('saliva', 'sangre') NOT NULL,
    id_dam INT UNSIGNED AUTO_INCREMENT,
    id_agente INT UNSIGNED AUTO_INCREMENT,
    CONSTRAINT PK_Test PRIMARY KEY (id_test)
);

CREATE TABLE Sanitario (
    num_colegiado INT UNSIGNED,
    nif CHAR(9) UNIQUE NOT NULL,
    nombre VARCHAR(100) NOT NULL,
    ap1 VARCHAR(100) NOT NULL,
    ap2 VARCHAR(100) NOT NULL,
    CONSTRAINT PK_Sanitario PRIMARY KEY (num_colegiado)
);

CREATE TABLE Ambulancia (
    matricula CHAR(6),
    empresa VARCHAR(150) NOT NULL,
    tipo VARCHAR(100) NOT NULL,
    CONSTRAINT PK_Ambulancia PRIMARY KEY (matricula)
);

CREATE TABLE Dam_Amb_Sani (
    id_dam INT UNSIGNED AUTO_INCREMENT,
    num_colegiado INT UNSIGNED,
    matricula CHAR(6) NOT NULL,
    fecha_asistencia TIMESTAMP NOT NULL,
    CONSTRAINT PK_Dam_Amb_Sani PRIMARY KEY (id_dam , num_colegiado)
);





	





















