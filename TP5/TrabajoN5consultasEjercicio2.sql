DROP DATABASE IF EXISTS ventas;
CREATE DATABASE ventas CHARACTER SET utf8mb4;
USE ventas;
CREATE TABLE clientes (
id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(30) NOT NULL,
apellido VARCHAR(30) NOT NULL,
cuitcuil VARCHAR(20),
ciudad VARCHAR(100),
categoría INT UNSIGNED
);
CREATE TABLE vendedores (
id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(30) NOT NULL,
apellido VARCHAR(30) NOT NULL,
cuitcuil VARCHAR(20),
comisión FLOAT
);
CREATE TABLE pedidos (
id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
cantidad DOUBLE NOT NULL,
fecha DATE,
id_cliente INT UNSIGNED NOT NULL,
id_vendedor INT UNSIGNED NOT NULL,
FOREIGN KEY (id_cliente) REFERENCES clientes(id),
FOREIGN KEY (id_vendedor) REFERENCES vendedores(id)
);
INSERT INTO clientes VALUES
(1, 'Aarón', 'Rivero', '20-4148122-1', 'Garuhape',100),   (2, 'Adela', 'Salas', '27-42482596-3', 'Capiovi',200),
(3, 'Adolfo', 'Rubio', '23-37928596-3', 'Posadas',NULL),   (4, 'Adrián', 'Suárez', NULL, 'Jaén', 300),
(5, 'Marcos', 'Loyola', '24-42481327-3', 'Posadas',200),   (6, 'María', 'Santana', '27-38771523-1', 'Obera',100),
(7, 'Pilar', 'Ruiz', NULL, 'Sevilla', 300),   (8, 'Pepe', 'Ruiz', '20-27436152-2', 'Iguazu', 200),
(9, 'Guillermo', 'López', '20-42481328-1','Andresito', 225),   (10, 'Daniel', 'Santana', '20-40159624-3','Apostoles', 125);
INSERT INTO vendedores VALUES
(1, 'Daniel', 'Sáez', '24-38481296-3', 0.15),   (2, 'Juan', 'Gómez', '20-39231523-3', 0.13),
(3, 'Diego','Flores', '20-38481221-3', 0.11),   (4, 'Marta','Herrera', '27-40481736-1', 0.14),
(5, 'Antonia','Carretero', '20-31481370-7', 0.12),   (6, 'Manuel','Domínguez', '20-29876342-3', 0.13),
(7, 'Antonio','Vega', '20-32521596-3', 0.11),   (8, 'Alfredo','Ruiz', '20-42436477-3', 0.05);
INSERT INTO pedidos VALUES
(1, 150.5, '2020-10-05', 5, 2),   (2, 270.65, '2019-09-10', 1, 5),
(3, 65.26, '2022-10-05', 2, 1),   (4, 110.5, '2021-08-17', 8, 3),
(5, 948.5, '2021-09-10', 5, 2),   (6, 2400.6, '2021-07-27', 7, 1),
(7, 5760, '2018-09-10', 2, 1),   (8, 1983.43, '2021-10-10', 4, 6),
(9, 2480.4, '2019-10-10', 8, 3),   (10, 250.45, '2018-06-27', 8, 2),
(11, 75.29, '2021-08-17', 3, 7),   (12, 3045.6, '2022-04-25', 2, 1),
(13, 545.75, '2022-01-25', 6, 1),   (14, 145.82, '2022-02-02', 6, 1),
(15, 370.85, '2021-03-11', 1, 5),   (16, 2389.23, '2021-03-11', 1, 5),
(17, 275.93, '2021-08-17', 2, 5),   (18, 328.34, '2021-08-17', 1, 3),
(19, 1838.66, '2020-03-19', 3, 4),   (20, 2598.23, '2020-05-21', 5, 1);

-- 1. Devuelve un listado con todos los pedidos que se han realizado.
-- Los pedidos deben estar ordenados por la fecha de realización, mostrando en primer lugar los pedidos más recientes.
select * from pedidos order by id_cliente asc;

-- 2. Devuelve todos los datos de los dos pedidos de mayor valor.
select * from pedidos order by cantidad desc limit 2;

-- 3. Devuelve un listado con los identificadores de los clientes que han realizado algún pedido.
-- Tenga en cuenta que no debe mostrar identificadores que estén repetidos.
select p.id_cliente from pedidos as p inner join clientes as c on p.id_cliente = c.id group by id_cliente;

-- 4. Devuelve un listado de todos los pedidos que se realizaron durante el año 2022, cuya cantidad total sea superior a $500.
select * from pedidos where fecha like '2022%' and cantidad > 500 order by id_cliente asc;

-- 5. Devuelve un listado con el nombre y apellido de los vendedores que tienen una comisión entre 0.05 y 0.11.
select nombre, apellido from vendedores where comisión between 0.05 and 0.11 order by id;

-- 6. Devuelve el valor de la comisión de mayor valor que existe en la tabla vendedores.
select comisión from vendedores order by comisión desc limit 1;

-- 7. Devuelve el identificador, nombre y primer apellido de aquellos clientes cuyo cuitcuil no es NULL. 
-- El listado deberá estar ordenado alfabéticamente por apellido y nombre.
select id, nombre, apellido from clientes where cuitcuil != '' order by apellido asc;

-- 8. Devuelve un listado de los nombres de los clientes que empiezan por “A” y terminan por “n” y 
-- también los nombres que empiezan por “P”. El listado deberá estar ordenado alfabéticamente.
select nombre from clientes where nombre like 'A%n' or nombre like 'P%' order by nombre asc;

-- 9. Devuelve un listado de los nombres de los clientes que no empiezan por “A”. El listado deberá estar ordenado alfabéticamente.
select nombre from clientes where nombre not like 'A%n' order by nombre asc;

-- 10.Devuelve un listado con los nombres de los vendedores que terminan por “el” o “o”.
-- Tenga en cuenta que se deberán eliminar los nombres repetidos.
select nombre from clientes where nombre not like '%el' and nombre not like '%o' group by nombre;

-- 11.Devuelve un listado con el identificador, nombre y apellido de todos los clientes que han realizado algún pedido.
-- El listado debe estar ordenado alfabéticamente y se deben eliminar los elementos repetidos.
select p.id_cliente, c.nombre, c.apellido from pedidos as p 
inner join clientes as c on p.id_cliente = c.id group by id_cliente order by nombre asc;

-- 12.Devuelve un listado que muestre todos los pedidos que ha realizado cada cliente.
-- El resultado debe mostrar todos los datos de los pedidos y del cliente. 
-- El listado debe mostrar los datos de los clientes ordenados alfabéticamente.
select c.*, p.id, p.cantidad, p.fecha as id_pedido, p.cantidad, p.fecha from pedidos as p 
inner join clientes as c on p.id_cliente = c.id order by p.id_cliente asc;

-- 13.Devuelve un listado que muestre todos los pedidos en los que ha participado un vendedor.
-- El resultado debe mostrar todos los datos de los pedidos y de los vendedores.
-- El listado debe mostrar los datos de los vendedores ordenados alfabéticamente
select v.*, p.id, p.cantidad, p.fecha as id_pedido, p.fecha from pedidos as p 
inner join vendedores as v on p.id_vendedor = v.id order by p.id_vendedor asc;

-- 14.Devuelve un listado que muestre todos los clientes, con todos los pedidos que han realizado y
-- con los datos de los vendedores asociados a cada pedido.
select c.*, p.*, v.* from pedidos as p 
inner join clientes as c on p.id_cliente = c.id 
inner join vendedores as v on p.id_vendedor = v.id order by c.id asc;

-- 15.Devuelve un listado de todos los clientes que realizaron un pedido durante el año 2022,
-- cuyo monto esté entre $300 y $1000.
select p.id, p.cantidad, p.fecha, c.nombre, c.apellido from pedidos p 
inner join clientes c on p.id_cliente = c.id 
where p.fecha like '2022%' and cantidad between 300 and 1000 order by id_cliente asc;

-- 16.Devuelve el nombre y apellido de todos los vendedores que han participado en algún pedido realizado por María Santana.
select v.nombre, v.apellido from clientes c 
inner join pedidos p on p.id_cliente = c.id 
inner join vendedores v on p.id_vendedor = v.id 
where c.nombre = 'María' and c.apellido = 'Santana';

-- 17.Devuelve el nombre de todos los clientes que han realizado algún pedido con el vendedor Daniel Sáez.
select c.nombre, c.apellido from clientes c 
inner join pedidos p on p.id_cliente = c.id 
inner join vendedores v on p.id_vendedor = v.id 
where v.nombre = 'Daniel' and v.apellido = 'Sáez';

-- 18.Devuelve un listado con todos los clientes junto con los datos de los pedidos que han realizado.
-- Este listado también debe incluir los clientes que no han realizado ningún pedido.
-- El listado debe estar ordenado alfabéticamente por el apellido y nombre de los clientes.
select c.*, p.id as id_pedido, p.cantidad, p.fecha, p.id_cliente, p.id_vendedor from pedidos as p 
right join clientes as c on p.id_cliente = c.id order by p.id_cliente asc;

-- 19.Devuelve un listado con todos los vendedores junto con los datos de los pedidos que han realizado.
-- Este listado también debe incluir los vendedores que no han realizado ningún pedido.
-- El listado debe estar ordenado alfabéticamente por el apellido y nombre de los vendedores.
select v.*, p.id as id_pedido, p.cantidad, p.fecha, p.id_cliente, p.id_vendedor from pedidos as p 
right join vendedores as v on p.id_vendedor = v.id order by v.apellido asc;

-- 20.Devuelve un listado que solamente muestre los clientes que no han realizado ningún pedido.
select c.* from clientes c left JOIN pedidos p on p.id_cliente = c.id 
where p.id_vendedor is null or p.id_cliente is null order by p.id_cliente asc;

-- 21.Devuelve un listado que solamente muestre los vendedores que no han realizado ningún pedido.
select v.* from vendedores v left JOIN pedidos p on p.id_vendedor = v.id 
where p.id_vendedor is null or p.id_cliente is null order by p.id_vendedor asc;

-- 22.Devuelve un listado con los clientes que no han realizado ningún pedido y de los vendedores que no han participado en ningún pedido.
-- Ordene el listado alfabéticamente por el apellido y el nombre. En el listado deberá diferenciar de algún modo los clientes y los vendedores.
select distinct concat_ws(' ', c.nombre, c.apellido) as cliente, concat_ws(' ', v.nombre, v.apellido) as vendedor
from clientes c 
join vendedores v on c.cuitcuil is null
join pedidos p where v.id like '8';

-- 23.Calcula la cantidad total que suman todos los pedidos que aparecen en la tabla pedido.
select sum(cantidad) as suma_total_cantidad from pedidos;

-- 24.Calcula la cantidad media de todos los pedidos que aparecen en la tabla pedido.
select avg(cantidad) as promedio_cantidad from pedidos;

-- 25.Calcula el número total de vendedores distintos que aparecen en la tabla pedido.
select count(distinct id_vendedor) as cantidad_vendedores from pedidos;

-- 26.Calcula el número total de clientes que aparecen en la tabla cliente.
select count(id) as cantidad_clientes from clientes;

-- 27.Calcula cuál es la mayor cantidad que aparece en la tabla pedido.
select max(cantidad) as maxima_cantidad from pedidos;

-- 28.Calcula cuál es la menor cantidad que aparece en la tabla pedido.
select min(cantidad) as minima_cantidad from pedidos;

-- 29.Calcula cuál es el valor máximo de categoría para cada una de las ciudades que aparece en la tabla cliente.
select max(distinct categoría) as maxima_categoría from clientes;

-- 30.Calcula cuál es el máximo valor de los pedidos realizados durante el mismo día para cada uno de los clientes.
-- Es decir, el mismo cliente puede haber realizado varios pedidos de diferentes cantidades el mismo día.
-- Se pide que se calcule cuál es el pedido de máximo valor para cada uno de los días en los que un cliente ha realizado un pedido.
-- Muestra el identificador del cliente, nombre, apellido, la fecha y el valor de la cantidad.
SELECT max(p.cantidad) as Max_Pedido, p.fecha, id_cliente, c.nombre, c.apellido  from pedidos p 
inner join clientes c ON c.id=p.id_cliente
group by p.id_cliente, p.fecha;

-- 31.Calcula cuál es el máximo valor de los pedidos realizados durante el mismo día para cada uno de los clientes,
-- teniendo en cuenta que sólo queremos mostrar aquellos pedidos que superen la cantidad de $2000 .
select c.id, c.nombre, c.apellido, p.fecha, p.cantidad from clientes c
join pedidos p on c.id = p.id_cliente
where cantidad > 2000 group by p.fecha order by fecha;

-- 32.Calcula el máximo valor de los pedidos realizados para cada uno de los vendedores durante la fecha 2021-08-17.
-- Muestra el identificador del vendedor, nombre, apellido y total.
select v.id, v.nombre, v.apellido, p.fecha, p.cantidad from vendedores v
join pedidos p on v.id = p.id_cliente
where fecha like '2021-08-17';

-- 33.Devuelve un listado con el identificador de cliente, nombre y apellido y el número total de pedidos que ha realizado cada uno de los clientes.
-- Tenga en cuenta que pueden existir clientes que no han realizado ningún pedido.
-- Estos clientes también deben aparecer en el listado indicando que el número de pedidos realizados es 0.
select distinct c.id, c.nombre, c.apellido, p.fecha, p.cantidad from clientes c
left join pedidos p on c.id = p.id_cliente
group by nombre;

-- 34.Devuelve un listado con el identificador de cliente, nombre, apellido y el número total de pedidos que ha
-- realizado cada uno de clientes durante el año 2020.
select c.id, c.nombre, c.apellido, p.fecha from clientes c
join pedidos p on c.id = p.id_cliente
where fecha between '2020-01-01' and '2020-12-31';

-- 35.Devuelve cuál ha sido el pedido de máximo valor que se ha realizado cada año.
SELECT id, MAX(cantidad) as maxima_cantidad, YEAR(fecha) as año FROM pedidos
GROUP BY YEAR(fecha)
ORDER BY YEAR(fecha) asc;

-- 36.Devuelve el número total de pedidos que se han realizado cada año.
SELECT count(cantidad) As cantidad , YEAR(fecha) as fecha FROM pedidos
GROUP BY YEAR(fecha)
ORDER BY YEAR(fecha) asc;

-- 37.Devuelve un listado con todos los pedidos que ha realizado Adela Salas. (Sin utilizar INNER JOIN).
SELECT p.cantidad as cantidad_pedidos, concat_ws(' ',c.nombre, c.apellido) as nombre_cliente 
from pedidos p left join clientes c on p.id_cliente = c.id where c.id = '2';

-- 38.Devuelve el número de pedidos en los que ha participado el vendedor Daniel Sáe. (Sin utilizar INNER JOIN)
SELECT p.cantidad as cantidad_pedidos, concat_ws(' ',v.nombre, v.apellido) as nombre_vendedor 
from pedidos p left join vendedores v on p.id_vendedor = v.id where v.id = '1';

-- 39.Devuelve los datos del cliente que realizó el pedido más caro en el año 2020. (Sin utilizar INNER JOIN)
select c.id, concat_ws(' ', c.apellido, c.nombre) as Nombre_Apellido, max(p.cantidad) as pedido_maximo
from clientes as c
cross join pedidos as p on c.id = p.id_cliente
where year(p.fecha) like '2020' order by fecha asc;

-- 40.Devuelve la fecha y la cantidad del pedido de menor valor realizado por el cliente Pepe Ruiz Santana.
SELECT distinct concat_ws(' ',c.nombre,c.apellido) as Cliente,min(cantidad) as cantidad from clientes c
left join pedidos p on c.id = p.id_cliente where c.id = '8';

-- 41.Devuelve un listado de los clientes que no han realizado ningún pedido. (Utilizando IN o NOT IN).
select concat_ws(' ',c.nombre,c.apellido) as Cliente from clientes c
where c.id not in (select p.id_cliente from pedidos p);

-- 42.Devuelve un listado de los vendedores que no han realizado ningún pedido. (Utilizando IN o NOT IN).
select concat_ws(' ',v.nombre,v.apellido) as Vendedor, v.id from vendedores v
where v.id not in (select p.id_vendedor from pedidos p);

-- 43.Devuelve un listado de los clientes que no han realizado ningún pedido. (Utilizando EXISTS o NOT EXISTS).
select concat_ws(' ',c.nombre,c.apellido) as Cliente, c.id from clientes c
where not exists (select * from pedidos p where c.id = p.id_cliente);

-- 44.Devuelve un listado de los vendedores que no han realizado ningún pedido. (Utilizando EXISTS o NOT EXISTS).
select concat_ws(' ',v.nombre,v.apellido) as Vendedores, v.id from vendedores v
where not exists (select * from pedidos p where v.id = p.id_vendedor)

