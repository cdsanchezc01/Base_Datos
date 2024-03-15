create database Actividad;
use Actividad;

CREATE TABLE Cod_Postal (
    CP CHAR(5),
    localidad VARCHAR(100) NOT NULL,
    provincia VARCHAR(100) NOT NULL,
    CONSTRAINT PK_Cod_Postal PRIMARY KEY (CP)
);

create table Articulo(
	Ref varchar(150),
    nombre varchar(150) not null,
    precio float not null,
    CONSTRAINT PK_Articulo PRIMARY KEY (Ref)
);

CREATE TABLE Cliente (
    DNI VARCHAR(9),
    nombre VARCHAR(150) NOT NULL,
    ap1 VARCHAR(100) NOT NULL,
    ap2 VARCHAR(100) NOT NULL,
    calle VARCHAR(100) NOT NULL,
    CP CHAR(5) NOT NULL,
    CONSTRAINT PK_Cliente PRIMARY KEY (DNI)
);

CREATE TABLE Factura (
    ID_Factura INT,
    DNI VARCHAR(9) NOT NULL,
    fechaFactura DATE NOT NULL,
    totalFactura FLOAT NOT NULL,
    CONSTRAINT PK_Factura PRIMARY KEY (ID_Factura)
);

CREATE TABLE Factura_Articulo (
    ID_Factura INT,
    Ref VARCHAR(150),
    cantidad TINYINT UNSIGNED NOT NULL,
    CONSTRAINT PK_Factura PRIMARY KEY (ID_Factura , Ref)
);

alter table  Cliente add CONSTRAINT FK_Cliente FOREIGN KEY (CP) REFERENCES Cod_Postal (CP);
alter table Factura add CONSTRAINT FK_Factura FOREIGN KEY (DNI) REFERENCES Cliente (DNI);
alter table Factura add CONSTRAINT FK_Factura_Factura FOREIGN KEY (ID_Factura) REFERENCES Factura (ID_Factura);
alter table Factura_Articulo add CONSTRAINT FK_Factura_Articulo FOREIGN KEY (Ref) REFERENCES Articulo (Ref);
alter table Cliente add column tfno char(12);
desc cliente; /*Descripcion*/










