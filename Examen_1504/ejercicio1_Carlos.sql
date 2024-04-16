create database Ejercicio1_Carlos;
use Ejercicio1_Carlos;

CREATE TABLE Tienda (
    cif CHAR(9),
    nombre VARCHAR(100) NOT NULL,
    telefono TINYINT(12) UNSIGNED NOT NULL,
    CONSTRAINT PK_Tienda PRIMARY KEY (cif)
);
/*
TIENDA ( CIF, nombre, telefono)
•	CIF: 9 caracteres alfanuméricos. 
•	telefono: debe permitir el prefijo (longitud 12). Ej: +34666555444. Obligatorio
*/
CREATE TABLE Empleado (
    nif CHAR(9),
    nombre VARCHAR(100) NOT NULL,
    ape1 VARCHAR(100) NOT NULL,
    ape2 VARCHAR(100),
    telefono TINYINT(12) UNSIGNED NOT NULL,
    fecha_incorporacion TIMESTAMP NOT NULL,
    cif_tienda CHAR(9) NOT NULL,
    CONSTRAINT PK_Empleado PRIMARY KEY (nif)
);
/*
EMPLEADO ( NIF, nombre, ape1, ape2*, telefono, fecha_incorporacion, CIF_tienda )
•	NIF: 9 caracteres alfanuméricos. 
•	ape2: Opcional.
•	telefono: debe permitir el prefijo (longitud 12). Ej: +34666555444. Obligatorio
•	fecha_incorporacion: Fecha. Obligatorio.
*/

CREATE TABLE tienda_Articulo (
    cif_tienda CHAR(9),
    id_articulo INT UNSIGNED,
    stock TINYINT UNSIGNED NOT NULL,
    CONSTRAINT PK_Tienda_Articulo PRIMARY KEY (cif_tienda , id_articulo)
); 
/* 
TIENDA_ARTICULO ( CIF_tienda, id_articulo, stock )
•	stock: Entero pequeño positivo. Obligatorio.
*/
CREATE TABLE Articulo (
    id INT UNSIGNED AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    descripcion VARCHAR(150) NOT NULL,
    precio DECIMAL(8 , 2 ) UNSIGNED NOT NULL,
    CONSTRAINT PK_Articulo PRIMARY KEY (id)
    -- constraint CH_Precio check (<0)
);

/* 
ARTICULO ( ID, nombre, descripcion, precio )
•	ID: Entero positivo. Incrementable automáticamente.
•	precio: Permite decimales. Longitud 8 con 2 decimales. Restricción mayor que 0.
*/

CREATE TABLE Cliente (
    id INT UNSIGNED AUTO_INCREMENT,
    nif CHAR(9) UNIQUE NOT NULL,
    nombre VARCHAR(100) NOT NULL,
    ape1 VARCHAR(100) NOT NULL,
    ape2 VARCHAR(100),
    telefono TINYINT(12) UNSIGNED NOT NULL,
    sexo ENUM('H', 'M') NOT NULL,
    CONSTRAINT PK_Cliente PRIMARY KEY (id)
);
/*
CLIENTE ( ID, NIF, nombre, ape1, ape2*, telefono, sexo)
•	ID: Entero positivo. Incrementable automáticamente.
•	NIF: 9 caracteres alfanuméricos. Es AK. Obligatorio.
•	ape2: Opcional.
•	telefono: debe permitir el prefijo (longitud 12). Ej: +34666555444. Obligatorio
•	sexo: Sólo debe permitir 'H' o 'M'. Obligatorio.
*/

CREATE TABLE Factura (
    cif_tienda CHAR(9),
    num_factura INT UNSIGNED NOT NULL,
    total_factura DECIMAL(10 , 2 ) NOT NULL,
    fecha_hora DATETIME NOT NULL,
    id_cliente INT UNSIGNED NOT NULL,
    CONSTRAINT PK_Factura PRIMARY KEY (cif_tienda , num_factura)
     -- constraint CH_factura check (<0)
);

/*
FACTURA ( CIF_tienda, num_factura, total_factura, fecha_hora, ID_cliente )
•	num_factura: Entero positivo.
•	total_factura: Permite decimales. Longitud 10 con 2 decimales. Restricción mayor que 0. Obligatorio.
•	fecha_hora: Debe almacenar la fecha y hora de la compra. Obligatorio
*/

CREATE TABLE Factura_Ampliada (
    cif_tienda CHAR(9),
    num_factura INT UNSIGNED NOT NULL,
    nif_empleado CHAR(9),
    cupon_descuento CHAR(10),
    CONSTRAINT PK_Factura_Ampliada PRIMARY KEY (cif_tienda , num_factura)
);

/*
FACTURA_AMPLIADA (CIF_tienda, num_factura, NIF_empleado*, cupon_descuento*)
•	cupon_descuento: 10 caracteres alfanuméricos. Opcional
•	NIF_empleado* Opcional.
*/

-- ---------------------------FK--------------------
alter table empleado add constraint FK_Empleado_Tienda foreign key (cif_tienda) references Tienda(cif); 

alter table tienda_articulo add constraint FK_TiendaArti_Tienda foreign key (cif_tienda) references Tienda(cif); 

alter table factura add constraint FK_Factura_Tienda foreign key (cif_tienda) references Tienda(cif); 

alter table factura_ampliada add constraint FK_FacturaAmpli_Empleado foreign key (nif_empleado) references Empleado (nif);

alter table tienda_articulo add constraint FK_TiendaArti_Articulo foreign key (id_articulo) references Articulo (id);

alter table factura add constraint FK_Factura_Cliente foreign key (id_cliente) references Cliente(id);

alter table factura_ampliada add constraint FK_FacturaAmpli_Factura foreign key (cif_tienda,num_factura) references Factura(cif_tienda,num_factura);
















