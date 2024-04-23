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
-- incrementamos el salario 
select nombre, salario, (salario / 2) 'mitad salario', 'FIJO' as 'Tipo contraro' from empleado where departamento_id = 1;

select concat(nombre,' ', ape1) from empleado;

select concat_ws ('-', nombre, ape1) from empleado;

-- mayusculas
select upper(nombre), upper('eva') from empleado;

select lower(nombre), lower('eva') from empleado;

-- Sacar los nombres que sean palindromos 
select reverse(lower(nombre)) 'palindromo' from empleado where nombre = reverse(nombre);

-- Te devulve 2 letras de ape1
select upper(left(ape1, 2)) from empleado; 
select left (upper(ape1),2) from empleado;

-- Que aparezca concatenado 2 del ape1 2 del ape1 y 2 del nombre. En mayus y en la misma columna
select concat (upper(left(ape2,2)), upper(left(ape1,2)), upper(left(nombre,2))) from empleado;

-- para quitar los nulos del ape2 que no es obligatorio en la tabla 
select concat (upper(left(ifnull(ape2,''),2)), upper(left(ape1,2)), upper(left(nombre,2))) 'alias' from empleado;  

select concat (upper(left(ifnull(ape2,''),2)), upper(left(ape1,2)), upper(left(nombre,2))) 'alias' from empleado
where char_length(concat (upper(left(ifnull(ape2,''),2)), upper(left(ape1,2)), upper(left(nombre,2))))=4;

select nombre, replace(nombre, 'Departamento nuevo', 'Departamento viejo') as renombrado from departamento;

select ape2 from empleado where ape2 = null;
  


	










