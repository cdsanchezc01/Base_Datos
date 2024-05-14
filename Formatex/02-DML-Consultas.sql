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
select m.*
from modulo m
join ciclo c on m.cod_ciclo = c.cod_ciclo
where c.sigla = 'DAM';

-- Sub select ^
select *
from modulo 
where cod_ciclo = (select cod_ciclo from ciclo where sigla = 'DAM');
-- Consulta co-relacionada 
select m.*
from modulo m 
where exists (select cod_ciclo from ciclo c where sigla = 'DAM' and m.cod_ciclo = c.cod_ciclo);
-- Join con sub-select
select modulo.*, aux.nombre, aux.cod_familia
from modulo
	join (select cod_ciclo, nombre, cod_familia
		from ciclo 
        where sigla = 'DAM'
        ) aux on modulo.cod_ciclo = aux.cod_ciclo;
   

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
select d.nombre as nombre_departamento, count(p.dni) as total_profesores
from profesor p
join departamento d on p.cod_dpto = d.cod_dpto
group by d.nombre
order by total_profesores desc
limit 1;

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
where mail is  null;

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

-- Muestra el número total de horas de cada ciclo. Debe mostrar el ciclo y las horas totales.
select c.nombre as Nombre_ciclo, sum(m.numhoras) as Horas_totales 
from ciclo c
join modulo m on c.cod_ciclo = m.cod_ciclo
group by c.nombre;

-- Lista los módulos ordenados por nombre.
select nombre as Nombre_modulo
from modulo
order by nombre asc;

-- Encuentra el nombre y apellidos de los profesores que imparten módulos en el segundo curso.
select concat_ws(' ',p.nombre, p.prApellido, p.sgApellido) as nombre_completo, m.nombre as modulo
from profesor p
join contrato c on p.dni = c.dni_profesor
join contrato_modulo cm on c.cod_contrato = cm.cod_contrato
join modulo m on cm.cod_modulo = m.cod_modulo 
where m.curso = '2';

-- Muestra el número de módulos impartidos en cada ciclo. Debe aparecer el ciclo y el total de módulos.
SELECT c.nombre AS nombre_ciclo, COUNT(m.cod_modulo) AS total_modulos
FROM CICLO c
JOIN MODULO m ON c.cod_ciclo = m.cod_ciclo
GROUP BY c.nombre; -- duda


-- Encuentra los alumnos que la ultima titulacion sea 'CFGM'.
select nombre 
from alumno 
where ultima_titulacion = 'CFGM';

-- Encuentra los alumnos que la ultima titulacion sea 'CFGM' o 'BACH'. Ordena por ultima titulacion
select *
from alumno a
where a.ultima_titulacion = 'CFGM' or 'BACH'
order by ultima_titulacion;  -- no me va

-- Cuenta el numero de alumnos existentes por cada ultima titulacion.
select a.ultima_titulacion, count(*) as alumnos_existentes
from alumno a 
group by ultima_titulacion;

-- Lista los módulos que tienen una nota superior a 8.
select m.nombre as nombre_modulo, c.nota
from modulo m
join calificacion c on m.cod_modulo = c.cod_modulo
where nota > 8;

-- Muestra el nombre y apellidos de los profesores que tienen un correo electrónico.
select concat_ws(' ',p.nombre, p.prApellido, p.sgApellido) as Nombre_completo
from profesor p
where p.mail is null;

-- Lista los nombres de los profesores que imparten módulos en el ciclo DAM.
select distinct concat_ws(' ',p.nombre, p.prApellido, p.sgApellido) as Nombre_completo
from profesor p
join contrato c on p.dni = c.dni_profesor
join contrato_modulo cm on c.cod_contrato = cm.cod_contrato
join modulo m on cm.cod_modulo = m.cod_modulo 
join ciclo cic on m.cod_ciclo = cic.cod_ciclo
where cic.sigla = 'DAM';
-- Muestra el nombre completo del profesor que tiene el contrato con el código 5.
-- Lista los módulos y las notas obtenidas por los alumnos en orden descendente de nota.
-- Calcula la media de todas las calificaciones existentes.
-- Calcula la media por módulo
-- Calcula la media por matricula.

select  m.curso, cl.nombre as Nombre_modulo, concat_ws(' ', p.nombre, p.prApellido, p.sgApellido) as nombre_completo, count(cm.cod_modulo) as total_modulos
from profesor p
join contrato c on p.dni = c.dni_profesor
join contrato_modulo cm on cm.cod_contrato = c.cod_contrato
join modulo m on cm.cod_modulo = m.cod_modulo
join ciclo cl on m.cod_ciclo = cl.cod_ciclo
group by m.curso, cl.cod_ciclo, nombre_completo;  -- todo lo que agrupes hay que meterlo en el group by





