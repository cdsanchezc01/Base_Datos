use FormatExBD;

-- Consulta todos los alumnos de la plataforma ordenados por nombre
select nombre 
from alumno
order by nombre;

-- Consulta todos los profesores de la plataforma ordenados por DNI
select concat_ws(' ', nombre, prApellido, sgApellido) as nombre_completo 
from profesor
order by dni;

-- Consulta todos los ciclos existentes ordenados por familia descendente
select nombre 
from ciclo
order by cod_familia desc;

-- Consulta todos los ciclos existentes cuya sigla empiece por D
select nombre 
from ciclo 
where sigla like 'D%';

-- Selecciona todos los profesores del departamento de Informática.
-- Join
select p.*  
from profesor p
join departamento d on p.cod_dpto = d.cod_dpto
where d.nombre = 'Informatica';

-- SUb select Fijate es  como 2 cosultas en 1 
select p.*  
from profesor p
where p.cod_dpto = (select d.cod_dpto from departamento d where d.nombre = 'Informatica');


-- Muestra el nombre completo de los profesores que no tienen un segundo apellido.
select concat_ws(' ', nombre, prApellido, sgApellido) as nombre_completo
from profesor
where sgApellido is null;

-- Lista los módulos impartidos en el ciclo DAM.
select m.nombre as nombre_modulo 
from modulo m
join ciclo c on m.cod_ciclo = c.cod_ciclo
where c.sigla = 'DAM';   -- Recuerda preguntar por que se pone eso del DAM

-- Encuentra los profesores que no están asignados a ningún departamento.
select p.*
from profesor p
join departamento d on p.cod_dpto = d.cod_dpto
where d.cod_dpto is null;

-- Muestra los nombres de los profesores junto con el nombre de su departamento.
select p.nombre as nombre_profesor, 
p.prApellido as apellido_profesor,
d.nombre as departamento
from profesor p
join departamento d on p.cod_dpto = d.cod_dpto;

-- Cuenta el número de profesores por departamento. Debe aparecer el nombre del departamento y total de profesores.
select d.nombre as nombre_departamento, count(p.dni) as total_profesores
from profesor p
join departamento d on p.cod_dpto = d.cod_dpto
group by d.nombre;

-- De la consulta anterior, solo obten el que más numero de profesores tienen.
-- ni idea

-- Encuentra el nombre y apellidos de los profesores que imparten módulos en el primer curso.

select distinct concat_ws(' ', p.nombre, p.prApellido, p.sgApellido) as Nombre_Completo
from profesor p
join contrato c  on p.dni = c.dni_profesor
join contrato_modulo cm on c.cod_contrato = cm.cod_contrato
join modulo m on cm.cod_contrato = m.cod_modulo
where m.curso = '1';

-- Lista todos los módulos bilingües.
select * 
from modulo
where bilingue = 'S'; 

-- Muestra los módulos que tienen más de 200 horas.
select * 
from modulo
where numHoras > 200;

-- Encuentra el nombre y apellidos de los profesores que no tienen asignado un correo electrónico.
select concat_ws(' ', nombre, prApellido, sgApellido) as nombre_completo
from profesor 
where mail is null;

-- Muestra el nombre del ciclo y el nombre de la familia correspondiente.
select c.nombre as nombre_ciclo, 
f.nombre as nombre_familia
from ciclo c
join familia f on c.cod_familia = f.cod_familia;

-- Lista los nombres de los módulos y las notas obtenidas por los alumnos.
select m.nombre as nombre_modulo, c.nota as notas_obtenidas
from modulo m
join calificacion c on m.cod_modulo = c.cod_modulo;

-- Lista los nombres de los módulos, el nombre del alumno y las notas.
select m.nombre as nombre_modulo, concat_ws(' ', a.nombre, a.prApellido, a.sgApellido) as nombre_completo, c.nota as alumno_nota
from modulo m
join calificacion c on m.cod_modulo = c.cod_modulo
join matricula ma on c.matricula = ma.matricula
join alumno a on ma.dni_alumno = a.dni;

-- Encuentra el nombre del profesor que imparte el módulo con el código 3.
select p.nombre as nombre_profesor -- Falta el nom completo
from profesor p 
join contrato c on p.dni = c.dni_profesor
join contrato_modulo cm on c.cod_contrato = cm.cod_contrato
join modulo m on cm.cod_modulo = m.cod_modulo
where m.cod_modulo = '3';
-- Muestra el nombre del profesor director de cada departamento.
-- Lista los nombres de los alumnos que nacieron después del año 2000.
-- Cuenta el numero de módulos impartidos por cada profesor.
-- Muestra el número total de horas de cada ciclo. Debe mostrar el ciclo y las horas totales.
-- Lista los módulos ordenados por nombre.
-- Encuentra el nombre y apellidos de los profesores que imparten módulos en el segundo curso.
-- Muestra el número de módulos impartidos en cada ciclo. Debe aparecer el ciclo y el total de módulos.
-- Encuentra los alumnos que la ultima titulacion sea 'CFGM'.
-- Encuentra los alumnos que la ultima titulacion sea 'CFGM' o 'BACH'. Ordena por ultima titulacion
-- Cuenta el numero de alumnos existentes por cada ultima titulacion.
-- Lista los módulos que tienen una nota superior a 8.
-- Muestra el nombre y apellidos de los profesores que tienen un correo electrónico.
-- Lista los nombres de los profesores que imparten módulos en el ciclo DAM.
-- Muestra el nombre completo del profesor que tiene el contrato con el código 5.
-- Lista los módulos y las notas obtenidas por los alumnos en orden descendente de nota.
-- Calcula la media de todas las calificaciones existentes.
-- Calcula la media por módulo
-- Calcula la media por matricula.