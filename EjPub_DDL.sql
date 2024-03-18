create database EjPub;
use EjPub;

CREATE TABLE Pub (
    Cod_Pub INT,
    nombre VARCHAR(100) NOT NULL,
    licencia_fiscal VARCHAR(100) NOT NULL,
    domicilio VARCHAR(100),
    fecha_apertura DATE NOT NULL,
    horario TIME NOT NULL,
    cod_localidad TINYINT NOT NULL,
    CONSTRAINT PK_Pub PRIMARY KEY (Cod_Pub)
);
CREATE TABLE Titular (
    dni_titular VARCHAR(9),
    nombre VARCHAR(100) NOT NULL,
    domicilio VARCHAR(150),
    cod_pub TINYINT NOT NULL,
    CONSTRAINT PK_Titular PRIMARY KEY (dni_titular)
);

CREATE TABLE Empleado (
    dni_empleado VARCHAR(9),
    nombre VARCHAR(100) NOT NULL,
    domicilio VARCHAR(150),
    CONSTRAINT PK_Empleado PRIMARY KEY (dni_empleado)
);

CREATE TABLE Existencias (
    cod_articulo TINYINT,
    nombre VARCHAR(100) NOT NULL,
    cantidad INT NOT NULL,
    precio FLOAT NOT NULL,
    cod_pub TINYINT NOT NULL,
    CONSTRAINT PK_Existencias PRIMARY KEY (cod_articulo)
);

CREATE TABLE Localidad (
    cod_localidad TINYINT,
    nombre VARCHAR(100),
    CONSTRAINT PK_Localidad PRIMARY KEY (cod_localidad)
);

CREATE TABLE Pub_Empleado (
    cod_pub TINYINT,
    dni_empleado VARCHAR(9),
    funcion ENUM('CAMARERO', 'SEGURIDAD', 'LIMPIEZA'),
    CONSTRAINT PK_Pub_Empleado PRIMARY KEY (cod_pub , dni_empleado , funcion)
);



























