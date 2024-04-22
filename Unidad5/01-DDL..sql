-- Crear la base de datos

CREATE DATABASE unidad5;
-- Usar la base de datos

USE unidad5;

-- Crear la tabla de departamento

CREATE TABLE departamento (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    edificio VARCHAR(50)
);

-- Crear la tabla de empleado

CREATE TABLE empleado (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    ape1 VARCHAR(50) NOT NULL,
    ape2 VARCHAR(50),
    edad TINYINT UNSIGNED NOT NULL,
    salario DECIMAL(10 , 2 ) NOT NULL,
    fecha_contratacion DATE,
    departamento_id INT UNSIGNED,
    jefe_id INT UNSIGNED,
    comision DECIMAL(8 , 2 ) DEFAULT 0,
    CONSTRAINT FK_DEPARTAMENTO_ID FOREIGN KEY (departamento_id)
        REFERENCES departamento (id),
    CONSTRAINT FK_EMPLEADO_JEFE_ID FOREIGN KEY (jefe_id)
        REFERENCES empleado (id),
    CONSTRAINT CHK_EDAD_ACTIVA CHECK (edad BETWEEN 18 AND 65),
    CONSTRAINT CHK_SALARIO CHECK (salario > 0)
);

-- Crear la tabla producto	

CREATE TABLE venta (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    fecha_venta DATE NOT NULL,
    total DECIMAL(10 , 2 ) NOT NULL,
    empleado_id INT UNSIGNED,
    CONSTRAINT FK_EMPLEADO_ID FOREIGN KEY (empleado_id)
        REFERENCES empleado (id)
);