 -- Lista el nombre de todos los productos que hay en la tabla producto.

-- Lista los nombres y los precios de todos los productos de la tabla producto.

-- Lista todas las columnas de la tabla producto.
select * from producto;

--  Lista el nombre de los productos, el precio en euros y el precio en dólares estadounidenses (USD).
select nombre, precio from producto;

-- Lista el nombre de los productos, el precio en euros y el precio en dólares estadounidenses (USD). Utiliza los siguientes alias para las columnas: nombre de producto, euros, dólares.
select nombre, precio 'precio_euro', roud((precio*1.07), 2) 'precio_USD' from producto;

-- Lista los nombres y los precios de todos los productos de la tabla producto, convirtiendo los nombres a mayúscula.
select upper(nombre), precio from producto;
 
-- Lista los nombres y los precios de todos los productos de la tabla producto, convirtiendo los nombres a minúscula.
select lower(nombre), precio from producto;

-- Lista el nombre de todos los fabricantes en una columna, 
-- y en otra columna obtenga en mayúsculas los dos primeros caracteres del nombre del fabricante.
select nombre, upper(substring(nombre,1,2)) from fabricante;

-- Lista los nombres y los precios de todos los productos de la tabla producto, redondeando el valor del precio.
select nombre, round(precio) 'precio_ordenado' from producto;

-- Lista los nombres y los precios de todos los productos de la tabla producto, truncando el valor del precio para mostrarlo sin ninguna cifra decimal.
select nombre, floor(precio) 'precio_ordenado' from producto; -- redondeo a la baja
select nombre, ceil(precio) 'precio_ordenado' from producto; -- redondea al alza

-- Lista el identificador de los fabricantes que tienen productos en la tabla producto.
select id_fabricante from producto;

-- Lista el identificador de los fabricantes que tienen productos en la tabla producto, eliminando los identificadores que aparecen repetidos.
select distinct id_fabricante from producto;

-- Lista los nombres de los fabricantes ordenados de forma ascendente.
select nombre from fabricante order by nombre asc;

-- Lista los nombres de los fabricantes ordenados de forma descendente.
select nombre from fabricante order by nombre desc;

-- Lista los nombres de los productos ordenados en primer lugar por el nombre de forma ascendente y en segundo lugar por el precio de forma descendente.
select nombre, precio from producto order by nombre asc, precio desc;

-- Devuelve una lista con las 5 primeras filas de la tabla fabricante.
select * from fabricante limit 5;

-- Devuelve una lista con 2 filas a partir de la cuarta fila de la tabla fabricante. 
-- La cuarta fila también se debe incluir en la respuesta.
select * from fabricante limit 2 offset 3;

-- Lista el nombre y el precio del producto más barato. (Utilice solamente las cláusulas ORDER BY y LIMIT)
SELECT 
    nombre, precio
FROM
    producto
ORDER BY precio ASC
LIMIT 1;

-- Lista el nombre y el precio del producto más caro. (Utilice solamente las cláusulas ORDER BY y LIMIT)
SELECT 
    nombre, precio
FROM
    producto
ORDER BY precio desc
LIMIT 1;

-- Lista el nombre de todos los productos del fabricante cuyo identificador de fabricante es igual a 2.
SELECT 
    nombre
FROM
    producto
WHERE
    id_fabricante = 2;
    
-- Lista el nombre de los productos que tienen un precio menor o igual a 120€.
SELECT nombre
FROM producto
WHERE precio <= 120;

-- Lista el nombre de los productos que tienen un precio mayor o igual a 400€.
SELECT nombre
FROM producto
WHERE precio >= 400;

-- Lista el nombre de los productos que no tienen un precio mayor o igual a 400€.
SELECT nombre
FROM producto
WHERE precio < 400;

-- Lista todos los productos que tengan un precio entre 80€ y 300€. Sin utilizar el operador BETWEEN.
select nombre, precio
from producto 
where precio >= 80 and precio <= 300;

-- Lista todos los productos que tengan un precio entre 60€ y 200€. Utilizando el operador BETWEEN.
select *
from producto 
where precio between 60 and 200;

-- Lista todos los productos que tengan un precio mayor que 200€ y que el identificador de fabricante sea igual a 6.
select *
from producto
where precio > 200 and id_fabricante = 6; 

-- Lista todos los productos donde el identificador de fabricante sea 1, 3 o 5. Sin utilizar el operador IN.
select * 
from producto
where id_fabricante = 1 or id_fabricante = 3 or id_fabricante = 5;

-- Lista todos los productos donde el identificador de fabricante sea 1, 3 o 5. Utilizando el operador IN.
select * 
from producto
where id_fabricante in (1,3,5);

-- Lista el nombre y el precio de los productos en céntimos (Habrá que multiplicar por 100 el valor del precio). Cree un alias para la columna que contiene el precio que se llame céntimos.
select nombre, precio (precio*100) 'centimos'
from producto;

-- Lista los nombres de los fabricantes cuyo nombre empiece por la letra S.
select nombre 
from fabricante 
where left(nombre, 1) = 'S';

select nombre 
from fabricante 
where nombre like ('S%');  -- % cualquier caracter

-- Lista los nombres de los fabricantes cuyo nombre termine por la vocal e.
select nombre 
from fabricante 
where right(nombre, 1) = 'e';

-- Lista los nombres de los fabricantes cuyo nombre contenga el carácter w.
select nombre 
from fabricante 
where nombre like ('%w%') or nombre like ('%w') or nombre like ('w%');  -- % cualquier caracter

-- Lista los nombres de los fabricantes cuyo nombre sea de 4 caracteres.
select nombre 
from fabricante 
where char_length(nombre) = 4;  

-- Devuelve una lista con el nombre de todos los productos que contienen la cadena Portátil en el nombre.
select nombe from producto where nombre like '%portatil%';

-- Devuelve una lista con el nombre de todos los productos que contienen la cadena Monitor en el nombre 
-- y tienen un precio inferior a 215 €.
select nombe from producto where nombre like '%monitor%' and precio > 215;

-- Lista el nombre y el precio de todos los productos que tengan un precio mayor o igual a 180€. Ordene el resultado en primer lugar por el precio (en orden descendente) y en segundo lugar por el nombre (en orden ascendente).
select nombre
 from producto
 where precio >= 180 
 order by precio desc, nombre asc;