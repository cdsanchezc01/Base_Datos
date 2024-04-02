use pubs;

-- Insertar datos en la tabla LOCALIDAD
INSERT INTO LOCALIDAD (cod_localidad, nombre) VALUES (1, 'Madrid');
INSERT INTO LOCALIDAD (cod_localidad, nombre) VALUES (2, 'Barcelona');
INSERT INTO LOCALIDAD (cod_localidad, nombre) VALUES (3, 'Sevilla');

-- Insertar datos en la tabla PUB
INSERT INTO PUB (cod_pub, nombre, licencia_fiscal, domicilio, fecha_apertura, horario, cod_localidad) VALUES ('PUB001', 'El Bar de Pepe', 'LF001', 'Calle Mayor 123', '2023-01-15', 'HOR1', 1);
INSERT INTO PUB (cod_pub, nombre, licencia_fiscal, domicilio, fecha_apertura, horario, cod_localidad) VALUES ('PUB002', 'La Taberna del Puerto', 'LF002', 'Avenida del Mar 456', '2022-12-05', 'HOR2', 2);
INSERT INTO PUB (cod_pub, nombre, licencia_fiscal, domicilio, fecha_apertura, horario, cod_localidad) VALUES ('PUB003', 'La Cervecería de Juan', 'LF003', 'Plaza Mayor 789', '2023-02-20', 'HOR3', 3);

-- Insertar datos en la tabla TITULAR
INSERT INTO TITULAR (dni_titular, nombre, domicilio, cod_pub) VALUES ('12345678Z', 'Juan Martínez', 'Calle Principal 456', 'PUB001');
INSERT INTO TITULAR (dni_titular, nombre, domicilio, cod_pub) VALUES ('98765432B', 'María López', 'Avenida Central 789', 'PUB002');
INSERT INTO TITULAR (dni_titular, nombre, domicilio, cod_pub) VALUES ('54321678C', 'Pedro Sánchez', 'Calle Secundaria 321', 'PUB003');

-- Insertar datos en la tabla EMPLEADO
INSERT INTO EMPLEADO (dni_empleado, nombre, domicilio) VALUES ('11122233X', 'Antonio Rodríguez', 'Calle Peatonal 789');
INSERT INTO EMPLEADO (dni_empleado, nombre, domicilio) VALUES ('44455566Y', 'Lucía Pérez', 'Avenida del Trabajo 456');
INSERT INTO EMPLEADO (dni_empleado, nombre, domicilio) VALUES ('77788899Z', 'David García', 'Plaza del Sol 123');

-- Insertar datos en la tabla EXISTENCIAS
INSERT INTO EXISTENCIAS (cod_articulo, nombre, cantidad, precio, cod_pub) VALUES ('ART001', 'Cerveza', 100, 1.5, 'PUB001');
INSERT INTO EXISTENCIAS (cod_articulo, nombre, cantidad, precio, cod_pub) VALUES ('ART002', 'Vino', 50, 10.75, 'PUB002');
INSERT INTO EXISTENCIAS (cod_articulo, nombre, cantidad, precio, cod_pub) VALUES ('ART003', 'Refresco', 200, 1.0, 'PUB003');

-- Insertar datos en la tabla PUB_EMPLEADO
INSERT INTO PUB_EMPLEADO (cod_pub, dni_empleado, funcion) VALUES ('PUB001', '11122233X', 'CAMARERO');
INSERT INTO PUB_EMPLEADO (cod_pub, dni_empleado, funcion) VALUES ('PUB002', '44455566Y', 'SEGURIDAD');
INSERT INTO PUB_EMPLEADO (cod_pub, dni_empleado, funcion) VALUES ('PUB003', '77788899Z', 'LIMPIEZA');
