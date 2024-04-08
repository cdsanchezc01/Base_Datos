create database Biblioteca; 
use Biblioteca;

CREATE TABLE Autor (
    codigo INT,
    nombre VARCHAR(100) NOT NULL,
    CONSTRAINT PK_Autor PRIMARY KEY (codigo)
);

CREATE TABLE Escribe (
    autor VARCHAR(100),
    libro VARCHAR(100),
    CONSTRAINT PK_Escribe PRIMARY KEY (autor , libro)
);

CREATE TABLE Libro (
    codigo INT,
    titulo VARCHAR(100) NOT NULL,
    isbn CHAR(13) NOT NULL,
    editorial VARCHAR(100) NOT NULL,
    numPag INT NOT NULL,
    CONSTRAINT PK_Libro PRIMARY KEY (codigo)
); 

CREATE TABLE Ejemplar (
    libro VARCHAR(100),
    Cod_ejemplar INT,
    localizacion VARCHAR(150) NOT NULL,
    CONSTRAINT PK_Ejemplar PRIMARY KEY (libro , Cod_ejemplar)
);

CREATE TABLE Usuario (
    codigo INT,
    nombre VARCHAR(150) NOT NULL,
    direccion VARCHAR(150) NOT NULL,
    tlf INT NOT NULL,
    CONSTRAINT PK_Usuario PRIMARY KEY (codigo)
);

CREATE TABLE Prestamo (
    libro VARCHAR(100),
    ejemplar VARCHAR(100),
    usuario VARCHAR(100),
    fecha_prestamo DATE,
    fecha_devolucion DATE,
    CONSTRAINT PK_Prestamo PRIMARY KEY (libro , ejemplar , usuario)
);
-- CREACION DE FK --

alter table Escribe add constraint FK_Escribe foreign key (autor) references Autor (codigo);
alter table Escribe add constraint FK_Escribe foreign key (libro) references Libro (codigo);
alter table Ejemplar add constraint FK_Ejemplar foreign key (libro,Cod_ejemplar) references Libro (codigo);
alter table Prestamo add constraint FK_Prestamo foreign key (libro,ejemplar,usuario,fecha_prestamo) references Ejemplar (libro);
alter table Prestamo add constraint FK_Prestamo foreign key (libro,ejemplar,usuario,fecha_prestamo) references Usuario (codigo);















































create database Biblioteca; 
use Biblioteca;

CREATE TABLE Autor (
    codigo INT,
    nombre VARCHAR(100) NOT NULL,
    CONSTRAINT PK_Autor PRIMARY KEY (codigo)
);

CREATE TABLE Escribe (
    autor VARCHAR(100),
    libro VARCHAR(100),
    CONSTRAINT PK_Escribe PRIMARY KEY (autor , libro)
);

CREATE TABLE Libro (
    codigo INT,
    titulo VARCHAR(100) NOT NULL,
    isbn CHAR(13) NOT NULL,
    editorial VARCHAR(100) NOT NULL,
    numPag INT NOT NULL,
    CONSTRAINT PK_Libro PRIMARY KEY (codigo)
); 

CREATE TABLE Ejemplar (
    libro VARCHAR(100),
    Cod_ejemplar INT,
    localizacion VARCHAR(150) NOT NULL,
    CONSTRAINT PK_Ejemplar PRIMARY KEY (libro , Cod_ejemplar)
);

CREATE TABLE Usuario (
    codigo INT,
    nombre VARCHAR(150) NOT NULL,
    direccion VARCHAR(150) NOT NULL,
    tlf INT NOT NULL,
    CONSTRAINT PK_Usuario PRIMARY KEY (codigo)
);

CREATE TABLE Prestamo (
    libro VARCHAR(100),
    ejemplar VARCHAR(100),
    usuario VARCHAR(100),
    fecha_prestamo DATE,
    fecha_devolucion DATE,
    CONSTRAINT PK_Prestamo PRIMARY KEY (libro , ejemplar , usuario)
);
-- CREACION DE FK --

alter table Escribe add constraint FK_Escribe foreign key (autor) references Autor (codigo);
alter table Escribe add constraint FK_Escribe foreign key (libro) references Libro (codigo);
alter table Ejemplar add constraint FK_Ejemplar foreign key (libro,Cod_ejemplar) references Libro (codigo);
alter table Prestamo add constraint FK_Prestamo foreign key (libro,ejemplar,usuario,fecha_prestamo) references Ejemplar (libro);
alter table Prestamo add constraint FK_Prestamo foreign key (libro,ejemplar,usuario,fecha_prestamo) references Usuario (codigo);
























create database Biblioteca; 
use Biblioteca;

CREATE TABLE Autor (
    codigo INT,
    nombre VARCHAR(100) NOT NULL,
    CONSTRAINT PK_Autor PRIMARY KEY (codigo)
);

CREATE TABLE Escribe (
    autor VARCHAR(100),
    libro VARCHAR(100),
    CONSTRAINT PK_Escribe PRIMARY KEY (autor , libro)
);

CREATE TABLE Libro (
    codigo INT,
    titulo VARCHAR(100) NOT NULL,
    isbn CHAR(13) NOT NULL,
    editorial VARCHAR(100) NOT NULL,
    numPag INT NOT NULL,
    CONSTRAINT PK_Libro PRIMARY KEY (codigo)
); 

CREATE TABLE Ejemplar (
    libro VARCHAR(100),
    Cod_ejemplar INT,
    localizacion VARCHAR(150) NOT NULL,
    CONSTRAINT PK_Ejemplar PRIMARY KEY (libro , Cod_ejemplar)
);

CREATE TABLE Usuario (
    codigo INT,
    nombre VARCHAR(150) NOT NULL,
    direccion VARCHAR(150) NOT NULL,
    tlf INT NOT NULL,
    CONSTRAINT PK_Usuario PRIMARY KEY (codigo)
);

CREATE TABLE Prestamo (
    libro VARCHAR(100),
    ejemplar VARCHAR(100),
    usuario VARCHAR(100),
    fecha_prestamo DATE,
    fecha_devolucion DATE,
    CONSTRAINT PK_Prestamo PRIMARY KEY (libro , ejemplar , usuario)
);
-- CREACION DE FK --

alter table Escribe add constraint FK_Escribe foreign key (autor) references Autor (codigo);
alter table Escribe add constraint FK_Escribe foreign key (libro) references Libro (codigo);
alter table Ejemplar add constraint FK_Ejemplar foreign key (libro,Cod_ejemplar) references Libro (codigo);
alter table Prestamo add constraint FK_Prestamo foreign key (libro,ejemplar,usuario,fecha_prestamo) references Ejemplar (libro);
alter table Prestamo add constraint FK_Prestamo foreign key (libro,ejemplar,usuario,fecha_prestamo) references Usuario (codigo);
























