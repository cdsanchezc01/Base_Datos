CREATE DATABASE IF NOT EXISTS Actividad_1;
USE Actividad_1;
-- PRODUCTO(codigo, nombre, precio)
DROP TABLE producto;

CREATE TABLE Producto (
    codigo INT PRIMARY KEY,
    nombre VARCHAR(150) NOT NULL,
    precio DOUBLE NOT NULL
);
drop TABLE if exists  Cliente;

CREATE TABLE Cliente (
    ID_Ciente INT,
    Dni VARCHAR(9) NOT NULL UNIQUE,
    nombre VARCHAR(150) NOT NULL,
    apellido1 VARCHAR(100) NOT NULL,
    apellido2 VARCHAR(100),
    CONSTRAINT PK_Cliente PRIMARY KEY (ID_Ciente),
    CONSTRAINT UQ_Cliente_Dni UNIQUE (Dni)
);

CREATE TABLE LIBRO (
    ID_Libro INT,
    contenido BLOB NOT NULL,
    CONSTRAINT PK_LIBRO PRIMARY KEY (ID_Libro)
    -- SE pone asi los primary key 
);
-- Recuerda los atributos discontinuos se quedan así porque admite nulos pero el normal se pone not null
-- Empleado (DNI, nombre, ap1, ap2, email, tlfo, fechaNac, rol, ultimoAcceso)
CREATE TABLE Empleado (
    DNI VARCHAR(9),
    nombre VARCHAR(150) NOT NULL,
    apellido1 VARCHAR(100) NOT NULL,
    apellido2 VARCHAR(100),
    telefono VARCHAR(12) NOT NULL,
    email VARCHAR(200),
    fecha_nacimiento DATE NOT NULL,
    rol ENUM('PJ', 'PS', 'AF', 'AP') NOT NULL,
    ultimo_acceso DATETIME NOT NULL,
    CONSTRAINT PK_Empleado PRIMARY KEY (DNI)
);


















