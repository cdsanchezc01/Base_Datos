-- Creamos la BD
CREATE DATABASE pubs;

-- Usamos la BD
USE pubs;

CREATE TABLE PUB (
    cod_pub char(10),
    nombre varchar (50) NOT NULL,
    licencia_fiscal char (10) NOT NULL,
    domicilio varchar (150),
    fecha_apertura date NOT NULL,
    horario char (4) NOT NULL,
    cod_localidad SMALLINT NOT NULL,
    CONSTRAINT PK_PUB PRIMARY KEY (cod_pub),
    CONSTRAINT CHK_HORARIO CHECK (horario IN ('HOR1', 'HOR2', 'HOR3'))
);

CREATE TABLE TITULAR (
    dni_titular CHAR (9),
    nombre varchar (150) NOT NULL,
    domicilio varchar (150),
    cod_pub char(10) NOT NULL,
    CONSTRAINT PK_TITULAR PRIMARY KEY (dni_titular)
);

CREATE TABLE EMPLEADO (
    dni_empleado CHAR (9),
    nombre varchar (150) NOT NULL,
    domicilio varchar (150),
    CONSTRAINT PK_EMPLEADO PRIMARY KEY (dni_empleado)
);

CREATE TABLE EXISTENCIAS (
    cod_articulo CHAR (10),
    nombre varchar (150) NOT NULL,
    cantidad int NOT NULL,
    precio double NOT NULL,
    cod_pub char(10) NOT NULL,
    CONSTRAINT PK_EXISTENCIA PRIMARY KEY (cod_articulo),
    CONSTRAINT CHK_PRECIO CHECK (precio > 0)
);

CREATE TABLE LOCALIDAD (
    cod_localidad SMALLINT,
    nombre varchar (150) NOT NULL,
    CONSTRAINT PK_LOCALIDAD PRIMARY KEY (cod_localidad)
);

CREATE TABLE PUB_EMPLEADO (
    cod_pub char(10),
    dni_empleado CHAR (9),
    funcion CHAR (9),
    CONSTRAINT PK_PUB_EMPLEADO PRIMARY KEY (cod_pub, dni_empleado, funcion),
    CONSTRAINT CHK_FUNCION CHECK (funcion IN ('CAMARERO', 'SEGURIDAD', 'LIMPIEZA'))
);

-- FKs
ALTER TABLE PUB ADD CONSTRAINT FK_PUB_LOCALIDAD FOREIGN KEY (cod_localidad) REFERENCES LOCALIDAD (cod_localidad);
ALTER TABLE TITULAR ADD CONSTRAINT FK_TITULAR_PUB FOREIGN KEY (cod_pub) REFERENCES PUB (cod_pub);
ALTER TABLE EXISTENCIAS ADD CONSTRAINT FK_EXISTENCIAS_PUB FOREIGN KEY (cod_pub) REFERENCES PUB (cod_pub);
ALTER TABLE PUB_EMPLEADO ADD CONSTRAINT FK_PUB_EMPLEADO_PUB FOREIGN KEY (cod_pub) REFERENCES PUB (cod_pub);
ALTER TABLE PUB_EMPLEADO ADD CONSTRAINT FK_PUB_EMPLEADO_EMPLEDO FOREIGN KEY (dni_empleado) REFERENCES EMPLEADO (dni_empleado);


-- Mostramos la tablas creadas deben ser 6
SHOW TABLES;

