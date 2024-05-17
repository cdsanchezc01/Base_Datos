create database Actividad_02;

use Actividad_02;

-- Alumno(NIF, nombre, ap1, ap2)
CREATE TABLE Alumno (
    NIF VARCHAR(9),
    nombre VARCHAR(150) NOT NULL,
    ap1 VARCHAR(100) NOT NULL,
    ap2 VARCHAR(100) NOT NULL,
    instituto varchar(100) not null default 'IES Agustóbriga',
    CONSTRAINT PK_Alumno PRIMARY KEY (NIF)
);

-- Asignatura(IDasignatura, nomAsig, credito)
CREATE TABLE Asignatura (
    ID_Asignatura INT,
    nomAsig VARCHAR(100) NOT NULL,
    credito TINYINT UNSIGNED NOT NULL,
    CONSTRAINT PK_Asignatura PRIMARY KEY (ID_Asignatura)
);

CREATE TABLE Calificacion (
    NIF VARCHAR(9),
    ID_Asiganatura INT,
    fecha DATE,
    nota DECIMAL(4 , 2 ) UNSIGNED NOT NULL,
    CONSTRAINT PK_Calificacion PRIMARY KEY (NIF , ID_Asignatura , fecha),
    CONSTRAINT FK_NIF_NOTA_ALUMNO FOREIGN KEY (NIF) REFERENCES Alumno(NIF),
	CONSTRAINT FK_ID_Asig_Asig FOREIGN KEY (ID_Asignatura) REFERENCES Asignatura (ID_Asignatura)
);







