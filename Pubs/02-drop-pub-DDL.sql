USE PUBS;

/*
 Orden de creación podría haber sido:
 1º las que no dependen de nadie (no sale flechas)
 2ª el resto
 Una posibilidad sería con el siguiente orden:
 LOCALIDAD, EMPLEADO, PUB, TITULAR, EXISTENCIAS, PUB_EMPLEADO
 
 Para borrar hacemos el orden inverso:
 PUB_EMPLEADO, EXISTENCIAS, TITULAR, PUB, EMPLEADO, LOCALIDAD
 */
DROP TABLE PUB_EMPLEADO;
DROP TABLE EXISTENCIAS;
DROP TABLE TITULAR;
DROP TABLE PUB;
DROP TABLE EMPLEADO;
DROP TABLE LOCALIDAD;

-- Tiene que haber 0
SHOW TABLES;

DROP DATABASE PUBS;