USE ClubArenasDB;

/* Muestra el total de instructores que son jefes. */
select sum(i.jefe_instructor_id) as Total_jefes
from instructor i
where i.jefe_instructor_id is not null; -- !




/* 
Calcula el peso medio de los animales por raza. 
Debe aparecer la raza y el peso medio.
Ordena por raza ascendentemente.
*/
select a.raza,  round(avg(a.peso),2) as Peso_medio
from animal a
group by a.raza
order by a.raza asc;

/** 
Muestra el dni, nombre completo de los instructores y el de las personas. Para los instructores debe aparecer en la columna tipo 'Instructor' y para la persona 'Persona'.
Ordena por DNI
**/
select p.dni, concat_ws(' ', p.nombre, p.apellido1, p.apellido2) as Nombre_completo
from persona p
union  
select i.dni, concat_ws(' ', i.nombre, i.apellido1, i.apellido2) as Nombre_completo 
from instructor i;
-- order by p.dni, i.dni;


/* 
Cuenta el número de veces que han montado un animal por año, mes y raza.
Ordena por año y mes descendentemente.
*/
select  year(fecha_monta) as anio, count(month(fecha_monta)) as mes
from monta 
group by fecha_monta
order by fecha_monta desc;


/* Muestra el dni, nombre de las personas (sean socias o no), cuanta es su cuota por mes, la fecha de alta de socio. */
select p.dni, concat_ws(' ', p.nombre, p.apellido1, p.apellido2) as nombre_completo, s.cuota, s.fecha_alta
from persona p
join socio s on p.dni = s.dni;


/* Muestra el dni, nombre de las personas (sean socias o no), cuanta es su cuota por mes, la fecha de alta de socio, 
nombre del animal que ha montado, nombre completo del instructor y fecha de monta. Siempre que los animales se llamen
Corcel, Cobre, Trueno, Estrella y Nube. 
Ordena por dni de la persona */






/*
  Calcula el peso promedio de todos los animales que han sido montados por personas cuyo apellido1 es "Gómez".
  Redondea a 2 decimales.
*/
select  round(avg(a.peso), 2) as Peso_promedio
from animal a
join monta m on a.id = m.id_animal
join persona p on m.dni_persona = p.dni
where p.apellido1 like '%Gómez';

/* 
Mostrar el dni, nombre y apellido de las personas (nombre completo),
el nombre del caballo, la fecha de monta y los minutos (debe aparecer la "duración minutos", ejemplo "70 minutos") 
de las personas que son socios tienen una cuota de más de 70 euros. 
Ordena fecha de monta descendente y por dni ascendentemente
*/






/* 
Encuentra todos los instructores que no han sido asignados a ninguna monta. 
Debe mostrar el DNI, nombre, apellido1 y el salario anual (Teniendo en cuenta que tiene 14 pagas). 
Ordena por nombre de manera ascendente.
*/

select  i.dni,i.nombre,i.apellido1,(i.salario_mensual * 14) AS salario_anual
from instructor i
left join  monta m on i.dni = m.id_instructor
where m.id_instructor is null
order by i.nombre asc;

/* 
Lista los nombres y la raza de los animales que tienen una duración de monta mayor a la media de todas las montas realizadas. 
Quita duplicados.
Ordena de manera descendente por nombre
*/

select distinct a.nombre, a.raza
from animal a
join monta m on a.id = m.id_animal
order by a.nombre desc;

/* 
Muestra el identificador y nombre completo de los instructores y el id y nombre completo de su jefe.
Debe salir también los instructores que no tienen jefe.
Ordena por el nombre de los instructores jefes.
*/
select i.dni as instructor_dni, concat_ws(' ',i.nombre, i.apellido1, i.apellido2) as instructor, ins.dni as jefe_dni, concat_ws(' ',ins.nombre, ins.apellido1, ins.apellido2) as jefe
from instructor i
left join instructor ins on i.dni_jefe = ins.dni
order by ins.nombre asc;






/** 
	Muestra cuantos instructores tiene a cargo cada instructor.
    Muestra el DNI del instructor y el total de personas que lleva cada instructor
**/






/*
Muestra la información de las personas que son socias o lo han sido en algún momento. 
Mostrar DNI, nombre, apellido1 y forma de contacto: 
	Si tiene informado el tfno, el tfno
	Si no, el correo 
	si no, 'no tiene contacto',
la edad de la persona (trunca a la baja) y fecha de alta como socio.
Sólo debe sacar las personas cuyo año de nacimiento sea menor de 1990
Ordena por los socios más veteranos.
*/







/** 
Obtén las personas que no son socios actualmente (ya sea porque nunca lo haya sido o porque la fecha de baja esté informada).
Muestra el dni, nombre completo y la fecha de nacimiento en formato dd/MM/YYYY
**/






/** 
Cuenta las veces que ha montado una persona al mismo animal. 
Muestra el nombre y apellido completo de la persona, el nombre del animal y total de veces que ha montado a dicho animal.
Sólo debe sacar cuando el total de veces sea mayor o igual a 2
Ordena por nombre completo y nombre del animal.
**/








/* 
Extra:

Sobre esta consulta:
Muestra el dni, nombre de las personas (sean socias o no), cuanta es su cuota por mes, la fecha de alta de socio, 
nombre del animal que ha montado, nombre completo del instructor y fecha de monta. Siempre que los animales se llamen
Corcel, Cobre, Trueno, Estrella y Nube. 
Saca todos tengan o no instructor.


Cuenta por DNI los registros seleccionados en la consulta anterior, debe salir el DNI y el total mientras sea 2 o 3 el total de registros 
*/



