use unidad5;
-- Total de empleados por departamento con más de 3 empleados
select departamento_id, count(*) as total_empleados
from empleado
group by departamento_id
having total_empleados > 3; 

-- Total de ventas realizadas por cada empleado con más de 5 ventas
select empleado_id, count(*) as total_ventas
from venta
group by empleado_id
having total_ventas > 5;

-- Cantidad de empleados externos por departamento
select departamento_id, count(*) as total_empleados_externos
from empleado_externo
group by departamento_id;

-- Total de ventas realizadas por cada empleado.
select empleado_id, count(*) as total_ventas
from venta 
group by empleado_id;

-- Total de importe de ventas realizadas por cada empleado mientras que dicho total sea superior a 1000
/*
 select empleado_id, sum(*) total_importe
 from venta
*/
-- Número de departamentos con más de 100 empleados
select departamento_id, count(*) as total_empleados
from empleado
group by departamento_id
having total_emppleados > 5;

-- Cantidad de empleados que ganan más de 40000 por departamento
select departamento_id, count(*) as total_empleados_mas_40000
from empleado
where salario > 40000
group by departamento_id;

-- Total de ventas realizadas en el año 2023 por cada empleado
select empleado_id, sum(total) as total_ventas_2023
from venta 
where year(fecha_venta) = 2023
group by empleado_id;
