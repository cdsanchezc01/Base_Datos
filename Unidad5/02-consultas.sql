use unidad5;

select * from departamento;


select edificio from departamento;


select distinct edificio from departamento;


select edificio 'SEDES', nombre from departamento;
select edificio 'SEDES', nombre as 'Nombre departamento' from departamento;

-- Error Code: 1054. Unknown column 'edificiosss' in 'field list'
-- select edificiosss from departamento;

-- Error Code: 1146. Table 'unidad5.departamentossssss' doesn't exist
-- select edificio from departamentossssss;


select departamento.edificio from departamento;


select * from departamento where id = 4;


select * from departamento where id = 4 or id = 2;
select * from departamento where id in (2, 4);


select * from departamento where nombre = 'IT' or nombre = 'Finanzas';
select * from departamento where nombre in ('IT', 'Finanzas');


select * from departamento where edificio like '%C' and nombre = 'Ventas';


select nombre, ape1, ape2 from empleado order by nombre, ape1 desc;

select nombre, salario, (salario / 2) 'mitad salario',  5/2 as division, 'FIJO' as 'Tipo contrato' 
from empleado
where departamento_id = 1;


select concat (nombre, ' ', ape1, '-', 'OTRA COSA'), concat (ape1, ' ', nombre), nombre, ape1 
from empleado;


select concat_ws (' ', nombre, ape1, 'OTRA COSA', 5)
from empleado;


select concat_ws ('.', id, nombre, ape1, ape2, salario, fecha_contratacion, departamento_id, jefe_id, comision)
from empleado;


select UPPER(nombre), upper('eva')  from empleado;


select LOWER(nombre), LOWER('eva')  from empleado;


select reverse(lower(nombre)) 'palíndromo'
from empleado 
where nombre = reverse(nombre);


select upper(left (ape1, 2)) from empleado;
select left (upper(ape1), 2) from empleado;


select concat (upper(left(ape2,2)), upper(left(ape1,2)), upper(left(nombre,2)))
from empleado;


-- Cuando te juntas con un nulo te vuelves nulo
select concat (upper(left(ape2,2)), upper(left(ape1,2)), upper(left(nombre,2)))
from empleado;


-- Por ahora así pero esto no debe hacerse de esta forma...
SELECT 
    CONCAT(UPPER(LEFT(IFNULL(ape2, ''), 2)),
            UPPER(LEFT(ape1, 2)),
            UPPER(LEFT(nombre, 2))) 'alias'
FROM
    empleado
WHERE
    CHAR_LENGTH(CONCAT(UPPER(LEFT(IFNULL(ape2, ''), 2)),
                    UPPER(LEFT(ape1, 2)),
                    UPPER(LEFT(nombre, 2)))) = 4;


select ape1, upper(right(ape1,2)) '2caracteres'
from empleado;


select nombre, replace(nombre, 'Departamento nuevo', 'Departamento viejo') as renombrado 
from departamento;


select nombre, ape1, ape2 from empleado where ape2 is null;


select nombre, ape1, ape2 from empleado where ape2 is not null;



-- nuevo ejercicio

-- Contar el número total de empleados.
select count(*) as empleado from empleado;

-- Encontrar la edad máxima entre los empleados.
select max(edad) as edad_maxima from empleado;

-- Encontrar la edad mínima entre los empleados.
select min(edad) as edad_minima from empleado;

-- Calcular el salario promedio de los empleados. Redondeado a 2 decimales.
select round(avg(salario),2) as salario_promedio from empleado;

-- Contar el número de empleados por departamento. Si el departamento es nulo, poner 'Sin Dpto'
-- select departamento, count(*) as numero_empleados from empleadon

-- Encontrar el salario máximo por departamento. Si el departamento es nulo, poner 'Sin Dpto'
select departamento,
case 
when departamento is null then 'Sin Dpto'
else departamento
end as departameto,
max(salario) as salario_maximo
from empleados
group by departemento;

-- Encontrar el salario mínimo por departamento. Si el departamento es nulo, poner 'Sin Dpto'


-- Calcular el salario promedio por departamento. Si el departamento es nulo, poner 'Sin Dpto'. Redondeado a 2 decimales


-- Calcular el total de comisiones por departamento. Si el departamento es nulo, poner 'Sin Dpto'


-- Encontrar el salario máximo de los empleados por departamento, siempre que el departamento no sea nulo. Ordenar de mayor a menor salario.


-- Modifica la anterior consulta para sacar solo los 3 departamentos que mas ganan.


-- Encontrar el salario máximo de los empleados por departamento, siempre que el departamento no sea nulo. Solo debe obtener aquellos máximos mayores de 50000. Ordenar de mayor a menor salario.


-- Consulta de empleados obteniendo su nombre_completo y salario. Siempre que el salario sea mayor de 25000 ordena por nombre_completo.
select concat(nombre,' ', ape1, ' ', ifnull(ape2, ' ')) as nombre_completo, salario from empleado where salario > 2500 order by nombre_completo;

-- Consulta de empleados obteniendo su nombre_completo, edad, salario, siempre que estos tenga edad entre 20-30 años y su salario oscile entre 25000-32000 ordena de manera descendente por salario. Con between.
select concat(nombre,' ', ape1, ' ', ifnull(ape2, ' ')) as nombre_completo, edad, salario from empleado where edad;

-- Consulta de empleados obteniendo su nombre_completo, edad, salario, siempre que estos tenga edad entre 20-30 años y su salario oscile entre 25000-32000 ordena de manera descendente por salario. Sin between.
select concat(nombre,' ', ape1, ' ', ifnull(ape2, ' ')) as nombre_completo, edad, salario from empleado where edad;

-- Consulta todos los empleados (tanto internos como externos) mostrando nombre + 1 apellido + 2 apellido (en una columna llamada nombre completo), fecha_contratacion o subcontratacion, y tipo ('Interno o Subcontratado'). Quitando repetidos.
-- Ordena por nombre_completo




-- Consulta todos los empleados (tanto internos como externos) mostrando nombre + 1 apellido + 2 apellido (en una columna llamada nombre completo), fecha_contratacion o subcontratacion, y tipo ('Interno o Subcontratado'). Con repetidos.
-- Ordena por nombre_completo




-- Consulta los años que lleva cada empleado externo trabajando, mostrar el id, nombre, apellido1, fecha_subcontratacion y num años. Trunca a la baja el numero de años.
SELECT 
    id_empleado,
    nombre,
    apellido1,
    fecha_subcontratacion,
    YEAR(CURRENT_DATE) - YEAR(fecha_subcontratacion) AS num_anios
FROM empleados_externos;




-- Partiendo de la consulta anterior obten el que mas tiempo lleva trabajando. Solo debe devolver un registro

SELECT id_empleado, nombre, apellido1, fecha_subcontratacion, YEAR(CURRENT_DATE) - YEAR(fecha_subcontratacion) AS num_anios FROM empleados_externos ORDER BY num_anios DESC LIMIT 1;



-- Consulta cuantos empleados por departamento existen que tenga un salario de más de 40000 y que cobren comision.  Debe aparecer el id_departamento y el total por departamento
SELECT id_departamento, COUNT(*) AS total_empleados FROM nombre_de_tabla WHERE salario > 40000 AND comisiones IS NOT NULL GROUP BY id_departamento;




-- Consulta los datos de la venta realizada por el empleado 1 ordenados por fecha mas reciente




-- Consulta los datos la ultima venta realizada por el empleado 1



-- Consulta los datos de la ventas realizadas en abril



-- Consulta los datos la maxima venta realizada en abril



-- Cuenta el numero de ventas realizadas por el empleado 1



-- Obten los empleados externos que nacieron 1981 



-- Cuenta los empleados externos que nacieron en 1981



-- Obten los empleados externos que nacieron en noviembre



-- Obten maximo año de nacimiento de los empleados



-- Obten los nombres y apellidos de los empleados (1 columna), la edad y 
-- según el tramo de edad, es lo que debe valer plan:
-- > 55 = Plan mayores de 55
-- > 35 = Sin ventajas
-- Resto = Plan joven 







-- Haz lo mismo pero con los empleados externos.







-- Haz lo mismo con los empleados interno y externo en la misma consulta, diferenciando cuales son internos o externos mediante una nueva columna.













