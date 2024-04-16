create database ejercicio2a_carlos;
use ejercicio2a_carlos;

CREATE TABLE Pokemon (
    codigo INT UNSIGNED,
    nombre VARCHAR(100) NOT NULL,
    tipo ENUM('electrico', 'fuego', 'agua', 'planta', 'hielo', 'bicho') NOT NULL,
    CONSTRAINT PK_Pokemon PRIMARY KEY (codigo)
);

/*
POKEMON ( codigo, nombre, tipo )
•	codigo: Entero positivo.
•	tipo: Puede ser 1 o más tipos a la vez: 'electrico', 'fuego', 'agua', 'planta', 'hielo', 'bicho'. Obligatorio.

*/
CREATE TABLE Captura (
    id INT UNSIGNED AUTO_INCREMENT,
    cod_pokemon INT UNSIGNED,
    mail_entrenador varchar(100) not null,
    poder SMALLINT UNSIGNED NOT NULL,
    sexo ENUM('H', 'M') NOT NULL,
    fecha_hora DATETIME NOT NULL,
    CONSTRAINT PK_Captura PRIMARY KEY (id),
    CONSTRAINT FK_Captura_Pokemon FOREIGN KEY (cod_pokemon)
        REFERENCES Pokemon (codigo)
);
/*
CAPTURA ( id, cod_pokemon, mail_entrenador, poder, sexo, fecha_hora )
•	Id: Entero positivo incrementable automáticamente.
•	poder: entero mediano positivo. Obligatorio. Crea restricción para que sea menor que 9999.
•	sexo: Solo admite 'F' o 'M'. Obligatorio
•	fecha_hora: Almacenar la fecha y hora. Obligatorio
*/
CREATE TABLE Entrenador (
    mail VARCHAR(20),
    nombre VARCHAR(100) NOT NULL,
    nivel TINYINT UNSIGNED NOT NULL,
    equipo VARCHAR(100),
    pwd VARCHAR(20) NOT NULL,
    pais VARCHAR(100) NOT NULL DEFAULT 'España',
    CONSTRAINT PK_Entrenador PRIMARY KEY (mail)
   -- CONSTRAINT FK_Entrenador_Captura FOREIGN KEY (mail_entrenador)
     --   REFERENCES Entrenador (mail)
);

/*
ENTRENADOR ( mail, nombre, nivel, equipo*, pwd, pais)
•	mail: cadena de caracteres de 20. 
•	nivel: entero pequeño positivo solo debe permitir números entre 0 – 200. Obligatorio
•	equipo: Opcional.
•	pwd: cadena de caracteres de 20. Obligatorio.
•	pais: Por defecto 'España'. Obligatorio.
*/







