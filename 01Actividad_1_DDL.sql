CREATE DATABASE IF NOT EXISTS Actividad_1;
USE Actividad_1;
-- PRODUCTO(codigo, nombre, precio)
DROP TABLE producto;

CREATE TABLE Producto (
    codigo INT PRIMARY KEY, -- es unica y not null
    nombre VARCHAR(150) not null,
    precio DOUBLE not null
);

CREATE TABLE Cliente (
    cliente_ID VARCHAR(150) PRIMARY KEY,
    Dni VARCHAR(9) NOT NULL,
    nombre VARCHAR(150),
    apellido1 VARCHAR(100),
    apellido2 VARCHAR(100) NOT NULL
);

