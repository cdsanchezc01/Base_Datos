use unidad5;

select * from departamento;

select edificio from departamento;

select distinct edificio from departamento; 

select edificio 'SEDES', nombre from departamento;

select edificio 'SEDES', nombre as 'Nombre departamento' from departamento;

-- Error Code: 1054. Unknown column 'edificiosss' in 'field list'
-- select edificiosss from departamento;

-- Error Code: 1146. Table 'unidad5.departamentosss' doesn't exist
-- select edificio from departamentosss;

select * from departamento where id = 4;

select * from departamento where id = 4 or id = 2;
select * from departamento where id in (2,4);  -- hacen lo mismo 

select * from departamento where nombre = 'IT' or nombre = 'Finanzas';

select * from departamento where edificio like '%C' and nombre = 'Ventas';

select nombre, ape1, ape2 from empleado order by nombre, ape1 desc;

	










