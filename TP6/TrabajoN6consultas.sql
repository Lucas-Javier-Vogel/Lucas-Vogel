DROP DATABASE IF EXISTS elsistema;
CREATE DATABASE elsistema CHARACTER SET utf8mb4;
USE elsistema;

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
id_cliente INT UNSIGNED,
id_vendedor INT UNSIGNED NOT NULL,
FOREIGN KEY (id_cliente) REFERENCES clientes(id),
FOREIGN KEY (id_vendedor) REFERENCES vendedores(id)
);

-- EJERCICIOS TRABAJO NUMERO 6

-- 1. Agregar las entidades paises (id, nombre), provincias (id, nombre, idpais) y localidades (id,nombre, cp,id_provincia). Tener en cuenta que :
-- ● En un país hay muchas provincias.
-- ● En una provincia hay muchas localidades.

drop table if exists paises;
create table paises (
id int unsigned AUTO_INCREMENT primary key,
nombre varchar(30) not null,
estado boolean
);
drop table if exists provincias;
create table provincias (
id int unsigned AUTO_INCREMENT primary key,
nombre varchar(30) not null,
idpais int unsigned,
estado boolean,
foreign key (idpais) references paises(id)
);
drop table if exists localidades;
create table localidades (
id int unsigned AUTO_INCREMENT primary key,
nombre varchar(30) not null,
cp varchar(30),
idprovincia int unsigned,
estado boolean,
foreign key(idprovincia) references provincias(id)
);

-- select * from paises, provincias, localidades

-- 2. Modificar la tabla empleados usando ALTER TABLE y agregar los campos :
-- ● direccion (varchar)
-- ● id_localidad (pk localidad) –Esta es un relación con la tabla localidades
-- ● email
-- ● telefono
-- ● fecha_ingreso
-- ● tms (timestamp)

alter table empleados add column (
direccion varchar(30),
id_localidad int unsigned,
email varchar(30),
telefono varchar(30),
fecha_ingreso date,
tms timestamp,
foreign key(id_localidad) references localidades(id)
);

-- select * from empleados;

-- 3. Modificar la tabla de departamentos usando ALTER TABLE y agregar los campos :
-- ● gasto (double)
-- ● tms (timestamp)

alter table departamentos add column (
gasto double,
tms timestamp
);

-- select * from departamentos, empleados;

-- 4. Insertar 5 registros en cada tabla de: paises, provincias, localidades, departamentos, empleados.

insert into paises values
(1, "Argentina", true), (2, "Estados unidos", true), (3, "Brasil", true), (4, "Alemania", true), (5, "Chile", true);

insert into provincias values
(1, "Misiones", 1, true), (2, "Texas", 2, false), (3, "Rio de Janeiro", 3, true), (4, "Sao Paulo", 3, false), (5, "Francia", 4, true);

insert into localidades values
(1, "Posadas", "3300", 1, false), (2, "Libertador General San Martin", "3332", 1, false), (3, "Houston", "77006", 2, true), (4, "Barcelos", "20211", 3, true), (5, "Agudos", "01000", 4, false);

insert into departamentos values
(1, "Escalada", 30500, false, 30000, "2007-02-07 07:20:50"), (2, "Ferreira", 75670, true, 70000, "2008-02-07 07:21:20"),
(3, "Hernandez", 102230, true, 67020, "2009-02-08 08:21:10"), (4, "Mendez", 58900, true, 20300, "2007-02-06 06:30:10"), (5, "Marracota", 90230, false, 80289, "2007-03-02 15:20:40");

insert into empleados values
(1, "30-23403670-2", "Domingo", "Sarmiento", 1, true, "open ropen 600", 1, "dominguito2004@gmail.com", "3743 569231", "2004-01-26", "2007-02-07 07:20:50"),
(2, "12-24503470-2", "Agustin", "lopez", 2, false, "Darkoz 121", 2, "lopetardo777@gmail.com", "2371 918323", "2006-07-20", "2007-02-07 07:21:20"),
(3, "02-22024827-2", "Gerardo", "Butierrez", 2, false, "Feliperto", 3, "Gerard2008@gmail.com", "5423 752363", "2004-02-05", "2008-03-22 08:39:53"),
(4, "15-24298323-2", "Hernesto", "Seraphine", 2, true, "Juan May", 4, "Seraphinegood50@gmail.com", "1532 542134", "2005-05-14", "2007-02-08 06:20:12"),
(5, "05-23028429-2", "Luis", "Miguel", 2, false, "Corrientes", 5, "tequieromessi90773@gmail.com", "6423 253456", "2005-07-02", "2007-02-07 07:21:20");

-- 5. Modificar el nombre de la tabla “pedidos” por “movimientos”. RENAME TABLE

rename table pedidos to movimientos;

-- 6. Agregar las entidades :
-- ● Productos (id, nombre, descripcion, id_marca fk, stock, precio, estado, tms)
-- ● Marcas (id, nombre, descripción, imagen, id_proveedor, estado, tms)
-- ● Proveedores (id, razon_social, nombre, apellido, naturaleza (fisica o juridica), cuit,id_localidad fk, estado,tms)
-- ● Cajas (id,horainicio(datatime),horacierre(datatime), estado, tms)
-- Notas: Muchos productos tienen una sola marca, o una marca tiene uno o muchos productos.
-- Un proveedor está en una localidad.

drop table if exists cajas;
create table cajas (
	id int AUTO_INCREMENT primary key,
    horainicio datetime,
    horacierre datetime,
    estado bool,
    tms timestamp
    );
    
drop table if exists productos;
drop table if exists marcas;    
drop table if exists proveedores;
create table proveedores (
	id int AUTO_INCREMENT primary key,
    razon_social varchar(30),
    nombre varchar(30),
    apellido varchar(30),
    naturaleza set('fisica','juridica'),
	cuit int,
    id_localidad_fk int unsigned,
    estado bool, 
    tms timestamp,
    foreign key(id_localidad_fk) references localidades(id)
    );
   
drop table if exists marcas;
create table marcas (
	id int AUTO_INCREMENT primary key,
    nombre varchar(30),
    descripcion varchar(200),
    imagen int,
    id_proveedor_fk int,
    estado bool,
    tms timestamp,
    foreign key(id_proveedor_fk) references proveedores(id)
    ); 
    
drop table if exists productos;
create table productos (
	id int AUTO_INCREMENT primary key,
    nombre varchar(30),
    descripcion varchar(200),
    id_marca_fk int,
    stock int,
    precio double,
    estado bool,
    tms timestamp,
    foreign key(id_marca_fk) references marcas(id)
    );

-- select * from cajas, proveedores, marcas, productos;

-- 7. Insertar 5 registros en cada tabla del punto 6. Tener en cuenta que el script debe ejecutarse
-- secuencialmente y no fallar.

insert into cajas values
(1, "2005-02-20 09:22:30", "2005-08-11 11:30:21", true, "2005-02-20 09:22:30.238782"), (2, "2006-04-12 15:30:56", "2007-03-22 20:40:11", true, "2006-04-12 15:30:56.248724"), 
(3, "2004-01-13 07:49:21", "2005-02-15 12:02:06", false, "2004-01-13 07:49:21.459259"), (4, "2007-06-03 16:29:25", "2008-05-23 05:36:54", true, "2007-06-03 16:29:25.983982"), 
(5, "2004-05-03 11:42:37", "2006-07-28 15:23:45", true, "2004-05-03 11:42:37.045323");
insert into proveedores values
(1, "Las Cañuelas S.V.", "Domingo", "Faustino", "fisica", "03-23482578-6", 2, true, "2005-03-21 09:32:13.384019"),
(2, "San Cristobal S.V.", "Batazar", "Felpino", "fisica", "20-22348729-1", 1, true, "2003-02-18 23:27:57.346342"),
(3, "Pepsico, inc S.V.", "Renzo", "Paparapa", "juridica", "06-24459812-3", 5, false, "2005-08-02 18:19:27.262123"),
(4, "Las Marias S.V.", "Gustavo", "Fleitas", "fisica", "13-23928319-2", 3, true, "2004-05-11 12:24:39.532126"),
(5, "Saladix S.V.", "Maradona", "Ponce", "juridica", "09-25945822-18", 4, false, "2002-06-07 10:19:49.351236");
insert into marcas values
(1, "Pepsi", "descripcion", 1, 3, false, "2002-06-23 10:20:49.352231"),
(2, "Las Cañuelas", "descripcion", 2, 1, true, "2003-11-12 07:19:23.753452"),
(3, "San Cristobal", "descripcion", 3, 2, false, "2002-03-07 16:53:34.755253"),
(4, "Las Marias", "descripcion", 4, 4, true, "2004-08-27 18:40:52.463578"),
(5, "Saladix", "descripcion", 5, 5, false, "2003-02-02 21:03:19.234173");
insert into productos values
(1, "pepsi en lata", "descripcion", 1, 320, 340, false, "2003-02-02 21:03:19.234173"),
(2, "Merenguitas", "descripcion", 2, 50, 120, true, "2003-02-02 21:03:19.234173"),
(3, "yogurt", "descripcion", 3, 80, 180, false, "2003-02-02 21:03:19.234173"),
(4, "yerba mate exclusiva", "descripcion", 4, 200, 500, true, "2003-02-02 21:03:19.234173"),
(5, "saladix sabor pizza", "descripcion", 5, 100, 240, false, "2003-02-02 21:03:19.234173");

-- select * from cajas, proveedores, marcas, productos;

-- 8. Listar el nombre, presupuesto, gastos y diferencia(presupuesto-gasto) de todos los
-- departamentos con estado activo o 1.

select nombre, presupuesto, gasto, (presupuesto - gasto) as diferencia from departamentos where estado = true;

-- 9. Listar todas las localidades agrupadas por pais. En la vista se deberia ver el nombre del pais y el nombre de la localidad

select pa.nombre, l.nombre from paises as pa inner join provincias as pr on pa.id = pr.idpais inner join localidades as l on pr.id = l.idprovincia;

-- 10. Modificar (UPADTE) :
-- ● el telefono de un empleado cuando el id es igual a uno que hayan declarado.
-- ● el fecha_ingreso y la localidad de otro empleado.
 
UPDATE empleados SET telefono = "3764 841621" WHERE (idempleado = "1");
UPDATE empleados SET fecha_ingreso = "2020-07-06", id_localidad = "1" WHERE (idempleado = "2");

-- 11. Insertar 5 vendedores.

insert into vendedores values 
(1, "Martin", "Fierro", "20-25390102-6", 10.58), (2, "Fernando", "Ungaro", "09-26298398-2", 8),
(3, "Melisa", "Ramirez", "30-25390102-1", 15.80), (4, "Darius", "Vogel", "15-25394823-7", 5),
(5, "Pedro", "Kioto", "23-23823410-5", 20.34);

insert into clientes values
(1,"Bruno","Diaz","20-42358753-6","si", 1),
(2,"Bruce","Wayne","20-41159852-6","no", 2),
(3,"Scarlett","Medina","22-39852741-5","nose", 1),
(4,"Thalia","Ojeda","21-42789654-6","anda a saber", 3),
(5,"Luigi","Mourinho","22-39246587-6","puede ser", 2);

-- 12. Modificar la tabla movimientos y agregar los campos: id_producto fk, estado, tms(timestamp), tipo_movimiento (ingreso, egreso, pedido)

alter table movimientos add column (
	id_producto_fk int,
    estado bool,
    tms timestamp,
    tipo_movimiento set('ingreso', 'egreso', 'pedido'),
    foreign key(id_producto_fk) references productos(id)
    );
    
-- select * from movimientos;

-- 13. Insertar 5 movimientos distintos.

insert into movimientos values 
(1, 40, "2005-02-13", 1, 2, 3, true, "2003-08-21 18:23:16.234173", 'ingreso'), (2, 25, "2005-02-13", 2, 1, 2, false, "2002-05-02 15:12:35.234173", 'egreso'),
(3, 30, "2005-02-13", 3, 3, 1, false, "2002-11-15 13:52:26.25199", 'egreso'), (4, 10, "2005-02-13", 4, 5, 4, true, "2003-03-17 07:53:12.234173", 'ingreso'),
(5, 20, "2005-02-13", 5, 4, 5, true, "2004-01-07 21:34:34.305823", 'pedido');

-- 14. Borrar lógicamente (UPDATE de la columna estado) :
-- ● 2 movimientos que fueron cargados mal
-- ● un pais que tenga al menos 3 localidades

UPDATE paises SET estado = false
WHERE (SELECT COUNT(l.nombre) AS CantidadLPorPais FROM provincias AS pr
INNER JOIN localidades AS l ON l.idprovincia = pr.id GROUP BY pr.idpais HAVING COUNT(*) = 3);

-- 15. Modificar el campo stock de la tabla productos teniendo en cuenta la cantidad de la tabla
-- de movimientos. Sumar el stock si es un ingreso, restar si es un egreso. Esto hacerlo de
-- manera manual en base los 5 movimientos insertados en el punto 13. Es decir deben haber 5 updates de la tabla producto

update productos as prod inner join movimientos as mov on mov.id_producto_fk = prod.id set prod.stock = prod.stock - mov.cantidad where tipo_movimiento = "egreso" and mov.id = 1;
update productos as prod inner join movimientos as mov on mov.id_producto_fk = prod.id set prod.stock = prod.stock - mov.cantidad where tipo_movimiento = "egreso" and mov.id = 2;
update productos as prod inner join movimientos as mov on mov.id_producto_fk = prod.id set prod.stock = prod.stock - mov.cantidad where tipo_movimiento = "egreso" and mov.id = 3;
update productos as prod inner join movimientos as mov on mov.id_producto_fk = prod.id set prod.stock = prod.stock - mov.cantidad where tipo_movimiento = "egreso" and mov.id = 4;
update productos as prod inner join movimientos as mov on mov.id_producto_fk = prod.id set prod.stock = prod.stock - mov.cantidad where tipo_movimiento = "egreso" and mov.id = 5;

update productos as prod inner join movimientos as mov on mov.id_producto_fk = prod.id set prod.stock = prod.stock + mov.cantidad where tipo_movimiento = "ingreso" and mov.id = 1;
update productos as prod inner join movimientos as mov on mov.id_producto_fk = prod.id set prod.stock = prod.stock + mov.cantidad where tipo_movimiento = "ingreso" and mov.id = 2;
update productos as prod inner join movimientos as mov on mov.id_producto_fk = prod.id set prod.stock = prod.stock + mov.cantidad where tipo_movimiento = "ingreso" and mov.id = 3;
update productos as prod inner join movimientos as mov on mov.id_producto_fk = prod.id set prod.stock = prod.stock + mov.cantidad where tipo_movimiento = "ingreso" and mov.id = 4;
update productos as prod inner join movimientos as mov on mov.id_producto_fk = prod.id set prod.stock = prod.stock + mov.cantidad where tipo_movimiento = "ingreso" and mov.id = 5;

-- select * from productos;

-- 16. Cear la tabla parametros (id, tms, cosas(json), id_usuario)

drop table if exists parametros;
create table parametros (
	id int primary key,
    tms timestamp,
    cosas json not null,
    id_usuario int
    );

-- 17. Insertar en la tabla parametros teniendo en cuenta la columna cosas:
-- ● {"idDeLaCosa": 101, "permisos": "PUT, GET"}
-- ● {"vistasPermitidas":"menuPrincipal,menuSecundario,ventas,estadisticaVentas,listaCliente", “grupo": "ventas"}
-- ● {"zonaHoraria": "America/Argentina/BuenosAires"}
-- ● {"fechaInicioActividades": 01/01/2019, "mesAperturaCaja": "Enero", "mesCierreCaja":"Diciembre"}
-- ● {"balancesAniosAnteriores": {"2019": {"ingreso": "7374901.93","egreso": "3732538,75"},"2020":{"ingreso": "27442665,12","egreso": "8522331,82"},"2021": {"ingreso":"31634912,57","egreso": "9757142,66"}}}
-- Nota: Rellenar a criterio los campos id, tms,id_usuario

insert into parametros values
( 1, "2007-02-07 07:20:50", '{"idDeLaCosa": 101, "permisos": "PUT, GET"}', 1);
insert into parametros values
( 2, "2006-11-25 07:21:20", '{"vistasPermitidas":"menuPrincipal,menuSecundario,ventas,estadisticaVentas,listaCliente","grupo":"ventas"}', 2);
insert into parametros values
( 3, "2007-03-12 08:39:53", '{"zonaHoraria": "America/Argentina/BuenosAires"}', 3);
insert into parametros values
( 4, "2007-06-03 11:42:37", '{"fechaInicioActividades": "01/01/2019", "mesAperturaCaja": "Enero", "mesCierreCaja":"Diciembre"}', 4);
insert into parametros values
( 5, "2008-08-20 06:20:12", '{"balancesAniosAnteriores": {"2019": {"ingreso": "7374901.93","egreso": "3732538,75"},"2020":{"ingreso": "27442665,12","egreso": "8522331,82"},"2021": {"ingreso":"31634912,57","egreso": "9757142,66"}}}', 5);
select * from parametros;
