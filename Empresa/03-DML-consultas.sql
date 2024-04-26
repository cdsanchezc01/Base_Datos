use empresaDB;

-- Obtener los CLIENTES ordenados alfabéticamente en orden descendente (z...a).
select nombre from cliente order by nombre desc;

-- Obtener los clientes de Sevilla.
select nombre from cliente where sevilla;

-- Obtener los clientes cuyo nombre terminen en "S.A.".
select nombre from cliente
where nombre = 'S.A.';

-- Obtener las localidades donde hay clientes.
select localidad from departamento where cliente is not null;

-- Obtener los pedidos que tengas más de 5 unidades.


-- Obtener los apellidos de los empleados junto con su salario anual( salario + comision en 14 pagas) ordenado de mayor a menor por este salario total.
-- Obtener el apellido y oficio en una única columna en minúsculas.
SELECT LOWER(CONCAT(apellido, ' - ', oficio)) AS apellido_oficio_minusculas FROM empleados;

-- Obtener el apellido y oficio en una única columna en mayúsculas.
-- Obtener los empleados cuyo director es Garrido.
SELECT * FROM empleados WHERE director = 'Garrido';

-- Obtener todos los empleados que son vendedores.
SELECT * FROM empleados WHERE cargo = 'vendedor';

-- Obtener los productos cuyo es tock es superior o igual a 25 ordenados por stock ascendientemente.
SELECT * FROM productos WHERE stock >= 25 ORDER BY stock ASC;

-- Obtener las tres primeras letras de cada localidad donde están los departamentos.
-- Devuelve un listado con dos columnas, donde aparezca en la primera columna el nombre y la localidad de los clientes y en la segunda, el nombre y la localidad con todos los caracteres invertidos
-- Devuelve un listado con dos columnas, donde aparezca en la primera columna el nombre y la localidad de los clientes en mayúscula y en la segunda, el nombre y la localidad con todos los caracteres invertidos en minúscula.
SELECT UPPER(nombre) AS nombre_mayuscula, LOWER(REVERSE(localidad)) AS localidad_invertida_minuscula FROM clientes;

-- Visualizar de alta de los empleados con el formato <día de la semana> - <dia> de <mes> de <año>.
-- Mostrar para cada empleado su apellido junto con el número de trienios que tiene(se tiene un trienio por cada tres años en la empresa)