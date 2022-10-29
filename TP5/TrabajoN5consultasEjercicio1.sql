DROP DATABASE IF EXISTS sistema;
CREATE DATABASE sistema CHARACTER SET utf8mb4;
USE sistema;
CREATE TABLE departamentos (
iddepartamento INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(100) NOT NULL,
presupuesto DOUBLE UNSIGNED NOT NULL,
estado boolean NOT NULL
);
CREATE TABLE empleados (
idempleado INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
cuil_cuit VARCHAR(15) NOT NULL UNIQUE,
nombre VARCHAR(100) NOT NULL,
apellido VARCHAR(100) NOT NULL,
id_departamento INT UNSIGNED,
estado BOOLEAN,
FOREIGN KEY (id_departamento) REFERENCES departamentos(iddepartamento)
);
INSERT INTO departamentos 
VALUES
(1, 'Desarrollo', 120000, true),    (2, 'Sistemas', 150000, true),
(3, 'Recursos Humanos', 280000, true),    (4, 'Contabilidad', 110000, true),
(5, 'I+D', 375000, true),    (6, 'Proyectos', 0,true ),
(7, 'Publicidad', 0, true),    (8, 'Comercial', 0, false);
INSERT INTO empleados 
VALUES
(1, '27-32481596-3', 'Aarón', 'Rivero', 1, true),   (2, '27-29557532-1', 'Adela', 'Salas', 2, true),
(3, '20-36970642-1', 'Adolfo', 'Rubio', 3, true),   (4, '20-41705545-1', 'Adrián', 'Suárez', 4, true),
(5, '20-17087203-3', 'Marcos', 'Loyola', 5, true),   (6, '27-38382980-3', 'María', 'Santana', 1, true),
(7, '23-80576669-1', 'Pilar', 'Ruiz', 2, true),   (8, '24-71651431-3', 'Pepe', 'Ruiz', 3, true),
(9, '25-36399183-3', 'Juan', 'Gómez', 2, true),   (10, '20-34638446-3', 'Diego','Flores', 5, true),
(11, '27-36738983-3', 'Marta','Herrera', 1, true),   (12, '27-44123836-1', 'Irene','Salas', NULL, false),
(13, '20-38265162-1', 'Juan', 'Antonio', NULL, true);

-- 1. Lista el apellido de todos los empleados.
select apellido from empleados;

-- 2. Lista el apellido de los empleados eliminando los apellidos que estén repetidos.
select apellido from empleados group by apellido;

-- 3. Lista todas las columnas de la tabla empleados.
select * from empleados;

-- 4. Lista el nombre y apellido de todos los empleados.
select nombre, apellido from empleados;

-- 5. Lista el cuit/cuil de los departamentos de los empleados que aparecen en la tabla empleados.
select cuil_cuit from empleados;

-- 6. Lista el nombre y apellido de los empleados en una única columna.
select concat_ws(' ', nombre, apellido) as nombre_apellido from empleados;

-- 7. Lista el nombre y apellido de los empleados en una única columna, convirtiendo todos los caracteres en mayúscula.
select concat_ws(' ', upper(nombre), upper(apellido)) as nombre_apellido from empleados;

-- 8. Lista el nombre y apellido de los empleados en una única columna, convirtiendo todos los caracteres en minúscula.
select concat_ws(' ', lower(nombre), lower(apellido)) as nombre_apellido from empleados;

-- 9. Lista el nombre de los departamentos y el valor del presupuesto actual ordenado de forma ascendente.
select nombre, presupuesto from departamentos order by presupuesto ASC;

-- 10. Lista el nombre de todos los departamentos ordenados de forma ascendente.
select nombre from departamentos order by nombre asc;

-- 11. Lista el nombre de todos los departamentos ordenados de forma descendente.
select nombre from departamentos order by nombre desc;

-- 12. Lista el apellido y el nombre de todos los empleados, 
select concat_ws(' ', apellido, nombre) as apellido_nombre from empleados order by apellido asc;

-- 13. Devuelve una lista con el nombre y el presupuesto, de los 3 departamentos que tienen mayor presupuesto.
select nombre, presupuesto from departamentos order by presupuesto desc limit 3;

-- 14. Devuelve una lista con el nombre y el presupuesto, de los 3 departamentos que tienen menor presupuesto.
select nombre, presupuesto from departamentos order by presupuesto asc limit 3;

-- 15. Devuelve una lista con el nombre de los departamentos y el presupuesto, de aquellos que tienen un presupuesto mayor o igual a $150000.
select nombre, presupuesto from departamentos where presupuesto >= 150000;

-- 16. Devuelve una lista con el nombre de los departamentos y el presupuesto, de aquellos que tienen un presupuesto entre $100000 y $200000. Sin utilizar el operador BETWEEN.
select nombre, presupuesto from departamentos where presupuesto >= 100000 and presupuesto <= 200000;

-- 17. Devuelve una lista con el nombre de los departamentos que no tienen un presupuesto entre $100000 y $200000. Sin utilizar el operador BETWEEN.
Select nombre, presupuesto from departamentos where presupuesto >=100000 and presupuesto <= 200000;

-- 18. Devuelve una lista con el nombre de los departamentos que tienen un presupuesto entre $100000 y $200000. Utilizando el operador BETWEEN.
select nombre, presupuesto from departamentos where presupuesto between 100000 and 200000;

-- 19. Devuelve una lista con el nombre de los departamentos que no tienen un presupuesto entre $100000 y $200000. Utilizando el operador BETWEEN.
select nombre, presupuesto from departamentos where presupuesto not between 100000 and 200000;

-- 20. Devuelve un listado con los empleados y los datos de los departamentos donde trabaja cada uno.
select e.nombre as nombre_empleado, d.nombre as nombre_departamento, d.presupuesto, d.estado from empleados as e inner join departamentos as d on e.id_departamento = d.iddepartamento;

-- 21. Devuelve un listado con los empleados y los datos de los departamentos donde trabaja cada uno. Ordena el resultado, en primer lugar por el nombre del departamento (en orden alfabético) y en segundo lugar por apellido y el nombre de los empleados.
select d.nombre as nombre_departamento, e.apellido as apellido_empleado, e.nombre as nombre_empleado, d.presupuesto, d.estado from empleados as e inner join departamentos as d on e.id_departamento = d.iddepartamento order by d.nombre asc;

-- 22. Devuelve un listado con el código y el nombre del departamento, solamente de aquellos departamentos que tienen empleados.
select d.nombre, d.iddepartamento from empleados as e left join departamentos as d on e.id_departamento = d.iddepartamento group by d.nombre asc;

-- 23. Devuelve el nombre del departamento donde trabaja el empleado que tiene el cuit 27-38382980-3.
select d.nombre as nombre_departamento from empleados as e inner join departamentos as d on e.id_departamento = d.iddepartamento where e.cuil_cuit like '27-38382980-3';

-- 24. Devuelve el nombre del departamento donde trabaja el empleado Pepe Ruiz.
select d.nombre as nombre_departamento from empleados as e inner join departamentos as d on e.id_departamento = d.iddepartamento where concat_ws(' ', e.nombre, e.apellido) like 'Pepe Ruiz';

-- 25. Devuelve un listado con los datos de los empleados que trabajan en el departamento de I+D. Ordena el resultado alfabéticamente.
select e.* from empleados as e inner join departamentos as d on e.id_departamento = d.iddepartamento  where id_departamento = 5 order by e.nombre asc;

-- 26. Devuelve un listado con los datos de los empleados que trabajan en el departamento de Sistemas, Contabilidad o I+D. Ordena el resultado alfabéticamente.
select d.nombre as nombre_departamento, e.* from empleados as e inner join departamentos as d on e.id_departamento = d.iddepartamento  where (id_departamento = 5 or id_departamento = 4 or id_departamento = 2) order by d.nombre asc;

-- 27. Devuelve una lista con el nombre de los empleados que tienen los departamentos que no tienen un presupuesto entre $100000 y $200000.
select d.nombre, e.nombre, d.presupuesto from empleados as e inner join departamentos as d on e.id_departamento = d.iddepartamento  where presupuesto not between 100000 and 200000 order by d.nombre asc;
