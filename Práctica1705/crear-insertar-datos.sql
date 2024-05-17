CREATE DATABASE ClubArenasDB;
USE ClubArenasDB;

CREATE TABLE persona (
    dni VARCHAR(9) NOT NULL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    apellido1 VARCHAR(100) NOT NULL,
    apellido2 VARCHAR(100),
    fecha_nacimiento DATE,
    telefono CHAR(13),
    email VARCHAR(100),
    fecha_ultima_visita TIMESTAMP NOT NULL
);

CREATE TABLE socio (
    dni VARCHAR(9) NOT NULL PRIMARY KEY,
    cuota DECIMAL(4 , 2 ) NOT NULL,
    fecha_alta DATE NOT NULL,
    fecha_baja DATE,
    CONSTRAINT fk_socio_persona FOREIGN KEY (dni)
        REFERENCES persona (dni)
);

CREATE TABLE instructor (
    id INT AUTO_INCREMENT PRIMARY KEY,
	dni VARCHAR(9) NOT NULL,
    nombre VARCHAR(100) NOT NULL,
    apellido1 VARCHAR(100) NOT NULL,
    apellido2 VARCHAR(100),
    telefono CHAR(13),
    email VARCHAR(100),
    jefe_instructor_id INT,
    fecha_contrato DATE NOT NULL,
    salario_mensual DECIMAL(6 , 2 ) NOT NULL,
    FOREIGN KEY (jefe_instructor_id)
        REFERENCES Instructor (id)
        ON DELETE SET NULL ON UPDATE CASCADE
);


CREATE TABLE animal (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    raza VARCHAR(50),
    peso DECIMAL (7,2) not null,
    fecha_nacimiento DATE,
    fecha_adquisicion DATE NOT NULL,
    fecha_defuncion DATE
);


CREATE TABLE monta (
    monta_id INT AUTO_INCREMENT PRIMARY KEY,
    id_animal INT NOT NULL,
    dni_persona VARCHAR(9) NOT NULL,
    id_instructor INT,
    fecha_monta DATETIME NOT NULL,
    duracion INT NOT NULL,
    FOREIGN KEY (ID_ANIMAL)
        REFERENCES Animal (ID),
    FOREIGN KEY (ID_INSTRUCTOR)
        REFERENCES Instructor (ID),
    FOREIGN KEY (dni_persona)
        REFERENCES Persona (DNI)
);


INSERT INTO persona (dni, nombre, apellido1, apellido2, fecha_nacimiento, telefono, email, fecha_ultima_visita) VALUES
('12345678A', 'Juan', 'Pérez', 'Gómez', '1980-01-15', '+34666000000', 'juan.perez@gmail.com', NOW()),
('23456789B', 'María', 'Martínez', null, '1990-02-20', '+34666000001', null, NOW()),
('34567890C', 'Carlos', 'García', 'Ruiz', '1975-03-25', null, 'carlos.garcia@gmail.com', NOW()),
('45678901D', 'Laura', 'Fernández', 'Díaz', '1985-04-30', '+34666000003', 'laura.fernandez@gmail.com', NOW()),
('56789012E', 'Ana', 'Martín', null, '1995-05-05', '+34666000004', null, NOW()),
('67890123F', 'Miguel', 'Hernández', 'Alonso', '1988-06-10', '+34666000005', 'miguel.hernandez@gmail.com', NOW()),
('78901234G', 'Sara', 'Gómez', 'Gil', '1992-07-15', '+34666000006', 'sara.gomez@gmail.com', NOW()),
('89012345H', 'David', 'Jiménez', 'Vega', '1981-08-20', null, null, NOW()),
('90123456I', 'Elena', 'Molina', 'Romero', '1978-09-25', '+34666000007', 'elena.molina@gmail.com', NOW()),
('01234567J', 'Pedro', 'Ortiz', null, '1991-10-30', null, 'pedro.ortiz@gmail.com', NOW()),
('11111111A', 'Alberto', 'Rodríguez', 'Hernández', '1982-11-15',  '+34666000008', 'alberto.rodriguez@hotmail.com', NOW()),
('22222222B', 'Cristina', 'Gómez', 'Martín', '1993-10-20',  '+34666000009', 'cristina.gomez@hotmail.com', NOW()),
('33333333C', 'Fernando', 'López', 'Díaz', '1984-09-25',  '+34666000010', 'fernando.lopez@hotmail.com', NOW()),
('44444444D', 'Isabel', 'García', 'Pérez', '1973-08-30',  '+34666000011', 'isabel.garcia@hotmail.com', NOW()),
('55555555E', 'Javier', 'Martínez', null, '1995-07-05', null, null, NOW()),
('66666666F', 'Marta', 'Fernández', 'Ruiz', '1986-06-10',  '+34666000012', 'marta.fernandez@hotmail.com', NOW()),
('77777777G', 'Nacho', 'Hernández', 'Jiménez', '1992-05-15',  '+34666000013', 'nacho.hernandez@hotmail.com', NOW()),
('88888888H', 'Olga', 'Sánchez', 'López', '1989-04-20', '+34666000014', 'olga.sanchez@hotmail.com', NOW()),
('99999999I', 'Pablo', 'Díaz', 'Gómez', '1975-03-25',  '+34666000015', 'pablo.diaz@hotmail.com', NOW()),
('00000000J', 'Raquel', 'Díaz', 'Gómez', '1981-02-28', '+34666000015', 'raquel.diaz@hotmail.com', NOW()),
('12121212K', 'Sergio', 'Navarro', 'Ramos', '1983-01-15', '+34666000016', 'sergio.navarro@hotmail.com', NOW()),
('13131313L', 'Teresa', 'Navarro', 'Ramos', '1990-12-20', '+34666000016', 'teresa.navarro@hotmail.com', NOW()),
('14141414M', 'Ulises', 'Suárez', 'Gil', '1988-11-25', '+34666000017', 'ulises.suarez@hotmail.com', NOW()),
('15151515N', 'Valeria', 'Ramos', 'Ibáñez', '1994-10-30', '+34666000018', 'valeria.ramos@hotmail.com', NOW()),
('16161616O', 'Wilson', 'Soto', null, '1987-09-05', '+34666000020', 'wilson.soto@hotmail.com', NOW()),
('17171717P', 'Ximena', 'Soto', null, '1991-08-10', '+34666000020', 'ximena.soto@hotmail.com', NOW()),
('18181818Q', 'Yago', 'Vidal', 'Vargas', '1980-07-15',  '+34666000022', 'yago.vidal@hotmail.com', NOW()),
('19191919R', 'Zoe', 'Campos', 'Flores', '1996-06-20',  '+34666000021', 'zoe.campos@hotmail.com', NOW()),
('20202020S', 'Héctor', 'Guzmán', 'Soler', '1985-05-25',  '+34666000023', 'hector.guzman@hotmail.com', NOW()),
('21212121T', 'Julia', 'Duarte', 'Navas', '1979-04-30',  '+34666000024', 'julia.duarte@hotmail.com', NOW());


INSERT INTO socio (dni, cuota, fecha_alta, fecha_baja) VALUES
('12345678A', 50.00, '2022-01-01', '2022-10-01'),
('23456789B', 55.00, '2021-02-01', NULL),
('34567890C', 60.00, '2021-03-01', NULL),
('45678901D', 65.00, '2022-04-01', '2022-12-21'),
('56789012E', 70.00, '2020-05-01', NULL),
('67890123F', 75.50, '2021-06-01', NULL),
('78901234G', 80.00, '2023-07-01', '2024-01-21'),
('89012345H', 85.00, '2021-08-01', NULL),
('90123456I', 90.00, '2024-01-01', NULL),
('01234567J', 95.00, '2022-10-01', '2023-07-11'),
('11111111A', 99.00, '2021-11-01', NULL),
('22222222B', 30.00, '2023-12-01', '2023-12-31'),
('33333333C', 50.00, '2024-01-01', NULL),
('44444444D', 60.00, '2024-02-01', NULL),
('55555555E', 58.00, '2024-03-01', NULL),
('66666666F', 98.00, '2024-04-01', NULL),
('77777777G', 58.50, '2024-05-01', NULL);


INSERT INTO instructor (dni, nombre, apellido1, apellido2, telefono, email, jefe_instructor_id, fecha_contrato, salario_mensual) VALUES
('11223344A', 'Luis', 'Castro', 'Muñoz', '+34666000025', 'luis.castro@picadero.com', NULL, '2020-01-15', 1500.00),
('22334455B', 'Patricia', 'Ibáñez', 'López', '+34666000026', 'patricia.ibanez@picadero.com', 1, '2019-02-20', 1600.00),
('33445566C', 'Javier', 'Santos', 'Pérez', '+34666000027', 'javier.santos@picadero.com', 1, '2018-03-25', 1700.00),
('44556677D', 'Beatriz', 'Suárez', 'Martínez', '+34666000028', 'beatriz.suarez@picadero.com', 2, '2017-04-30', 1800.00),
('55667788E', 'Manuel', 'Reyes', 'García', '+34666000029', 'manuel.reyes@picadero.com', 3, '2016-05-05', 1900.00),
('66778899F', 'Clara', 'Fernández', 'Ramos', '+34666000030', 'clara.fernandez@picadero.com', 4, '2015-06-10', 2000.00),
('77889900G', 'Pablo', 'López', 'Navarro', '+34666000031', 'pablo.lopez@picadero.com', 5, '2014-07-15', 2100.00),
('88990011H', 'Lorena', 'Martín', 'Gómez', '+34666000032', 'lorena.martin@picadero.com', 6, '2013-08-20', 2200.00),
('99001122I', 'Alberto', 'Soto', 'Hernández', '+34666000033', 'alberto.soto@picadero.com', 7, '2012-09-25', 2300.00),
('00112233J', 'Mónica', 'Ruiz', 'Díaz', '+34666000034', 'monica.ruiz@picadero.com', 8, '2011-10-30', 2400.00),
('33445577A', 'Victor', 'Muñoz', 'García', '+34666000035', 'victor.munoz@picadero.com', NULL, '2010-01-15', 2500.00),
('44556688B', 'Sara', 'Jiménez', 'Santos', '+34666000036', 'sara.jimenez@picadero.com', 1, '2009-02-20', 2600.00),
('55667799C', 'Adrián', 'Pérez', 'Suárez', '+34666000037', 'adrian.perez@picadero.com', 2, '2008-03-25', 2700.00),
('66778800D', 'Carmen', 'Sánchez', 'Reyes', '+34666000038', 'carmen.sanchez@picadero.com', 3, '2007-04-30', 2800.00),
('77889911E', 'David', 'Gómez', 'Fernández', '+34666000039', 'david.gomez@picadero.com', 4, '2006-05-05', 2900.00),
('88990022F', 'Isabel', 'Díaz', 'López', '+34666000040', 'isabel.diaz@picadero.com', 5, '2005-06-10', 3000.00),
('99001133G', 'Marcos', 'Martínez', 'Navarro', '+34666000041', 'marcos.martinez@picadero.com', 6, '2004-07-15', 3100.00),
('00112244H', 'Rocío', 'Ruiz', 'Ibáñez', '+34666000042', 'rocio.ruiz@picadero.com', 7, '2003-08-20', 3200.00),
('11223355I', 'Sergio', 'García', 'Hernández', '+34666000043', 'sergio.garcia@picadero.com',null, '2002-09-25', 3300.00),
('22334466J', 'Paula', 'Navarro', 'Ramos', '+34666000044', 'paula.navarro@picadero.com', null, '2001-10-30', 3400.00),
('33445577K', 'Tomás', 'Ortega', 'Suárez', '+34666000045', 'tomas.ortega@picadero.com', null, '2000-11-15', 3500.00);


INSERT INTO Animal (nombre, raza, peso, fecha_nacimiento, fecha_adquisicion, fecha_defuncion) VALUES
('Tornado', 'Pura Raza Española', 500.50, '2015-05-01', '2016-01-15', '2024-01-01'),
('Relámpago', 'Árabe', 480.75, '2016-06-10', '2017-02-20', NULL),
('Estrella', 'Frisón', 550.30, '2014-03-25', '2015-03-30', NULL),
('Luna', 'Lusitano', 550.30, '2017-07-15', '2018-01-10', NULL),
('Ciclón', 'Pura Sangre Inglés', 460.00, '2018-02-20', '2019-04-20', NULL),
('Fénix', 'Mustang', 460.00, '2019-08-15', '2020-09-25', NULL),
('Pegaso', 'Árabe', 700.25, '2013-11-11', '2014-12-05', NULL),
('Centella', 'Knabstrupper', 490.50, '2020-01-01', '2021-02-15', NULL),
('Sombra', 'Quarter Horse', 520.75, '2012-05-20', '2013-06-30', NULL),
('Trueno', 'Criollo', 510.00, '2021-09-09', '2022-11-05', NULL),
('Nube', 'Andaluz', 460.00, '2010-04-25', '2011-05-15', '2020-03-10'),
('Tormenta', 'Mustang', 495.60, '2011-07-18', '2012-08-20', NULL),
('Brisa', 'Árabe', 460.00, '2013-10-30', '2014-11-22', NULL),
('Neblina', 'Clydesdale', 680.30, '2014-02-02', '2015-03-03', NULL),
('Rayo', 'Pony Shetland', 220.75, '2015-11-11', '2016-12-12', NULL),
('Viento', 'Lipizzano', 540.60, '2016-03-03', '2017-04-04', NULL),
('Sol', 'Lipizzano', 510.50, '2018-08-08', '2019-09-09', NULL),
('Estrella Fugaz', 'Mustang', 550.10, '2019-12-12', '2020-01-01', NULL),
('Galaxia', 'Oldenburg', 590.75, '2017-06-06', '2018-07-07', '2019-10-01'),
('Luz', 'Silla Argentino', 520.35, '2020-10-10', '2021-11-11', NULL),
('Cometa', 'Árabe', 480.85, '2015-01-01', '2016-02-02', NULL),
('Destello', 'Paso Fino', 460.25, '2016-02-02', '2017-03-03', NULL),
('Aurora', 'Pinto', 470.50, '2017-03-03', '2018-04-04', NULL),
('Meteorito', 'Lipizzano', 520.75, '2018-04-04', '2019-05-05', NULL),
('Ébano', 'Falabella', 250.20, '2019-05-05', '2020-06-06', NULL),
('Corcel', 'Knabstrupper', 510.95, '2020-06-06', '2021-07-07', NULL),
('Marfil', 'Akhal-Teke', 450.75, '2021-07-07', '2022-08-08', NULL),
('Plata', 'Árabe', 460.00, '2011-08-08', '2012-09-09', '2021-12-01'),
('Cobre', 'Knabstrupper', 540.80, '2012-09-09', '2013-10-10', NULL),
('Oro', 'Lipizzaanimalno', 500.25, '2013-10-10', '2014-11-11', NULL);



INSERT INTO Monta (id_animal, dni_persona, id_instructor, fecha_monta, duracion) VALUES (1, '12345678A', null, '2022-01-02 10:00:00', 64);
INSERT INTO Monta (id_animal, dni_persona, id_instructor, fecha_monta, duracion) VALUES (2, '23456789B', null, '2022-01-03 11:00:00', 49);
INSERT INTO Monta (id_animal, dni_persona, id_instructor, fecha_monta, duracion) VALUES (3, '34567890C', null, '2022-01-04 12:00:00', 30);
INSERT INTO Monta (id_animal, dni_persona, id_instructor, fecha_monta, duracion) VALUES (4, '45678901D', 4, '2022-01-05 13:00:00', 52);
INSERT INTO Monta (id_animal, dni_persona, id_instructor, fecha_monta, duracion) VALUES (5, '56789012E', 5, '2022-01-06 14:00:00', 40);
INSERT INTO Monta (id_animal, dni_persona, id_instructor, fecha_monta, duracion) VALUES (6, '67890123F', 6, '2022-01-07 15:00:00', 10);
INSERT INTO Monta (id_animal, dni_persona, id_instructor, fecha_monta, duracion) VALUES (10, '78901234G', 7, '2022-01-08 16:00:00', 55);
INSERT INTO Monta (id_animal, dni_persona, id_instructor, fecha_monta, duracion) VALUES (9, '89012345H', 8, '2022-01-09 17:00:00', 70);
INSERT INTO Monta (id_animal, dni_persona, id_instructor, fecha_monta, duracion) VALUES (9, '90123456I', null, '2022-01-10 18:00:00', 65);
INSERT INTO Monta (id_animal, dni_persona, id_instructor, fecha_monta, duracion) VALUES (10, '01234567J', 10, '2022-01-11 19:00:00', 75);
INSERT INTO Monta (id_animal, dni_persona, id_instructor, fecha_monta, duracion) VALUES (11, '11111111A', 11, '2020-01-12 20:00:00', 80);
INSERT INTO Monta (id_animal, dni_persona, id_instructor, fecha_monta, duracion) VALUES (12, '22222222B', 12, '2022-01-13 21:00:00', 85);
INSERT INTO Monta (id_animal, dni_persona, id_instructor, fecha_monta, duracion) VALUES (13, '33333333C', 13, '2022-01-14 22:00:00', 90);
INSERT INTO Monta (id_animal, dni_persona, id_instructor, fecha_monta, duracion) VALUES (3, '44444444D', null, '2022-01-15 23:00:00', 95);
INSERT INTO Monta (id_animal, dni_persona, id_instructor, fecha_monta, duracion) VALUES (3, '55555555E', null, '2022-01-16 10:00:00', 100);
INSERT INTO Monta (id_animal, dni_persona, id_instructor, fecha_monta, duracion) VALUES (16, '66666666F', null, '2022-01-17 11:00:00', 105);
INSERT INTO Monta (id_animal, dni_persona, id_instructor, fecha_monta, duracion) VALUES (17, '77777777G', 17, '2022-01-18 12:00:00', 110);
INSERT INTO Monta (id_animal, dni_persona, id_instructor, fecha_monta, duracion) VALUES (18, '88888888H', 18, '2022-01-19 13:00:00', 115);
INSERT INTO Monta (id_animal, dni_persona, id_instructor, fecha_monta, duracion) VALUES (19, '99999999I', 19, '2019-01-20 14:00:00', 120);
INSERT INTO Monta (id_animal, dni_persona, id_instructor, fecha_monta, duracion) VALUES (20, '00000000J', 20, '2022-01-21 15:00:00', 125);
INSERT INTO Monta (id_animal, dni_persona, id_instructor, fecha_monta, duracion) VALUES (21, '12121212K', 21, '2022-01-22 16:00:00', 130);
INSERT INTO Monta (id_animal, dni_persona, id_instructor, fecha_monta, duracion) VALUES (22, '13131313L', 2, '2022-01-23 17:00:00', 135);
INSERT INTO Monta (id_animal, dni_persona, id_instructor, fecha_monta, duracion) VALUES (23, '14141414M', 3, '2022-01-24 18:00:00', 140);
INSERT INTO Monta (id_animal, dni_persona, id_instructor, fecha_monta, duracion) VALUES (24, '15151515N', 4, '2022-01-25 19:00:00', 145);
INSERT INTO Monta (id_animal, dni_persona, id_instructor, fecha_monta, duracion) VALUES (25, '16161616O', 5, '2022-01-26 20:00:00', 150);
INSERT INTO Monta (id_animal, dni_persona, id_instructor, fecha_monta, duracion) VALUES (26, '17171717P', 6, '2022-01-27 21:00:00', 155);
INSERT INTO Monta (id_animal, dni_persona, id_instructor, fecha_monta, duracion) VALUES (27, '18181818Q', 7, '2022-01-28 22:00:00', 160);
INSERT INTO Monta (id_animal, dni_persona, id_instructor, fecha_monta, duracion) VALUES (28, '19191919R', 8, '2021-01-29 23:00:00', 165);
INSERT INTO Monta (id_animal, dni_persona, id_instructor, fecha_monta, duracion) VALUES (29, '20202020S', 9, '2022-01-30 10:00:00', 170);
INSERT INTO Monta (id_animal, dni_persona, id_instructor, fecha_monta, duracion) VALUES (30, '21212121T', 12, '2022-01-31 11:00:00', 175);
INSERT INTO Monta (id_animal, dni_persona, id_instructor, fecha_monta, duracion) VALUES (1, '55555555E', 1, '2023-05-01 09:00:00', 60);
INSERT INTO Monta (id_animal, dni_persona, id_instructor, fecha_monta, duracion) VALUES (6, '66666666F', 2, '2024-05-02 10:00:00', 45);
INSERT INTO Monta (id_animal, dni_persona, id_instructor, fecha_monta, duracion) VALUES (3, '77777777G', null, '2024-05-03 11:00:00', 30);
INSERT INTO Monta (id_animal, dni_persona, id_instructor, fecha_monta, duracion) VALUES (3, '88888888H', null, '2024-05-04 12:00:00', 60);
INSERT INTO Monta (id_animal, dni_persona, id_instructor, fecha_monta, duracion) VALUES (3, '99999999I', 5, '2024-05-05 13:00:00', 45);
INSERT INTO Monta (id_animal, dni_persona, id_instructor, fecha_monta, duracion) VALUES (3, '00000000J', 6, '2024-05-06 14:00:00', 30);
INSERT INTO Monta (id_animal, dni_persona, id_instructor, fecha_monta, duracion) VALUES (5, '12345678A', 11, '2024-05-01 09:00:00', 60);
INSERT INTO Monta (id_animal, dni_persona, id_instructor, fecha_monta, duracion) VALUES (8, '23456789B', 12, '2024-05-02 10:00:00', 45);
INSERT INTO Monta (id_animal, dni_persona, id_instructor, fecha_monta, duracion) VALUES (9, '34567890C', 13, '2024-05-03 11:00:00', 30);
INSERT INTO Monta (id_animal, dni_persona, id_instructor, fecha_monta, duracion) VALUES (10, '45678901D', 14, '2024-05-04 12:00:00', 60);
INSERT INTO Monta (id_animal, dni_persona, id_instructor, fecha_monta, duracion) VALUES (11, '56789012E', null, '2019-05-05 13:00:00', 45);
INSERT INTO Monta (id_animal, dni_persona, id_instructor, fecha_monta, duracion) VALUES (12, '67890123F', null, '2024-05-06 14:00:00', 30);
INSERT INTO Monta (id_animal, dni_persona, id_instructor, fecha_monta, duracion) VALUES (7, '78901234G', 8, '2024-01-08 16:00:00', 35);
INSERT INTO Monta (id_animal, dni_persona, id_instructor, fecha_monta, duracion) VALUES (8, '89012345H', 7, '2024-01-09 17:00:00', 70);
INSERT INTO Monta (id_animal, dni_persona, id_instructor, fecha_monta, duracion) VALUES (9, '90123456I', 9, '2024-01-10 18:00:00', 65);
INSERT INTO Monta (id_animal, dni_persona, id_instructor, fecha_monta, duracion) VALUES (6, '01234567J', 10, '2024-01-11 19:00:00', 85);
INSERT INTO Monta (id_animal, dni_persona, id_instructor, fecha_monta, duracion) VALUES (12, '22222222B', 12, '2024-01-13 21:00:00', 85);
INSERT INTO Monta (id_animal, dni_persona, id_instructor, fecha_monta, duracion) VALUES (13, '33333333C', null, '2024-01-14 22:00:00', 90);
INSERT INTO Monta (id_animal, dni_persona, id_instructor, fecha_monta, duracion) VALUES (26, '17171717P', 6, '2024-01-27 21:00:00', 155);
INSERT INTO Monta (id_animal, dni_persona, id_instructor, fecha_monta, duracion) VALUES (27, '18181818Q', null, '2024-01-28 22:00:00', 160);
INSERT INTO Monta (id_animal, dni_persona, id_instructor, fecha_monta, duracion) VALUES (29, '20202020S', 19, '2024-01-30 10:00:00', 170);
INSERT INTO Monta (id_animal, dni_persona, id_instructor, fecha_monta, duracion) VALUES (30, '21212121T', null, '2024-01-31 11:00:00', 175);
INSERT INTO Monta (id_animal, dni_persona, id_instructor, fecha_monta, duracion) VALUES (10, '01234567J', 3, '2024-01-12 19:00:00', 52);
INSERT INTO Monta (id_animal, dni_persona, id_instructor, fecha_monta, duracion) VALUES (12, '22222222B', 12, '2024-01-14 21:00:00', 85);
INSERT INTO Monta (id_animal, dni_persona, id_instructor, fecha_monta, duracion) VALUES (13, '33333333C', null, '2024-01-15 22:00:00', 90);
INSERT INTO Monta (id_animal, dni_persona, id_instructor, fecha_monta, duracion) VALUES (26, '17171717P', 6, '2024-01-26 21:00:00', 155);
INSERT INTO Monta (id_animal, dni_persona, id_instructor, fecha_monta, duracion) VALUES (27, '18181818Q', null, '2024-01-27 22:00:00', 50);
INSERT INTO Monta (id_animal, dni_persona, id_instructor, fecha_monta, duracion) VALUES (29, '20202020S', 9, '2024-01-29 10:00:00', 170);
INSERT INTO Monta (id_animal, dni_persona, id_instructor, fecha_monta, duracion) VALUES (30, '21212121T', null, '2024-01-10 11:00:00', 300);