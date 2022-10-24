-- Trabajo N°4 de Programacion Full Stack Lucas Vogel


-- ejercicio 1 :

drop schema if exists trabajon4Ejercicio1;
create schema trabajon4Ejercicio1;

-- creada tabla alumnos y le insertamos valores
create table trabajon4Ejercicio1.ALUMNOS (
	Cod_Matricula int not null auto_increment,
    Nombre varchar(80),
    DNI varchar(45),
    F_Nacimiento date,
    Email varchar(256) unique,
    primary key(Cod_Matricula));
    
insert into trabajon4Ejercicio1.ALUMNOS (Nombre, DNI, F_Nacimiento, Email) values 
('Romero', '23823823', '1973-02-23', 'lala908@gmail.com'),
('Ignacio', '68835813', '1983-07-04', 'ignacius1212@Gmail.com.com'),
('Alberta', '74928375', '2000-05-12', 'kirchnerismolove209@gmail.com');
    
-- creada tabla cursos y le insertamos valores
create table trabajon4Ejercicio1.CURSOS (
	Cod_Cursos int not null,
    Nombre varchar(45) not null,
    primary key(Cod_Cursos));
    
insert into trabajon4Ejercicio1.CURSOS (Cod_Cursos, Nombre) values 
(1, 'Programacion'),
(2, 'Marketing'),
(3, 'Diseño Grafico');
    
-- creada tabla profesores y le insertamos valores
create table trabajon4Ejercicio1.PROFESORES (
	id_profesores int not null auto_increment,
    Nombre varchar(80),
    Especialidad varchar(45),
    Email varchar(256) unique,
    primary key(id_profesores));
    
insert into trabajon4Ejercicio1.PROFESORES (Nombre, Especialidad, Email) values 
('Renzo', 'Programador', 'rezitomorroncito87@gmail.com'),
('Jose', 'Marketing', 'jocementerio910@Gmail.com.com'),
('Velasco', 'Diseño Grafico', 'velasquita45@gmail.com');

-- creada tabla inscripcion para relacionar cursos y alumnos y le insertamos valores
create table trabajon4Ejercicio1.inscripcion (
	Cod_Matricula int not null auto_increment,
    Cod_Cursos int not null,
	foreign key(Cod_Matricula) references ALUMNOS(Cod_Matricula),
    foreign key(Cod_Cursos) references CURSOS(Cod_Cursos),
    primary key(Cod_Cursos, Cod_Matricula));
insert into trabajon4Ejercicio1.inscripcion (Cod_Matricula, Cod_Cursos) values 
(1, 3),
(2, 1),
(3, 1);

-- creada tabla instructor para relacionar cursos y profesores y le insertamos valores
create table trabajon4Ejercicio1.instructor (
	id_profesores int not null auto_increment,
    Cod_Cursos int not null,
	foreign key(id_profesores) references PROFESORES(id_profesores),
    foreign key(Cod_Cursos) references CURSOS(Cod_Cursos),
    primary key(Cod_Cursos, id_profesores));
    
insert into trabajon4Ejercicio1.instructor (id_profesores, Cod_Cursos) values 
(1, 2),
(2, 1),
(3, 3);

-- select p.id_profesores, p.Nombre, c.Cod_Cursos, c.Nombre from trabajon4ejercicio1.profesores p inner join trabajon4ejercicio1.cursos c on p.id_profesores = c.Cod_Cursos;



-- ejercicio 2:

drop schema if exists trabajon4Ejercicio2;
create schema trabajon4Ejercicio2;

-- creada tabla pais y le insertamos valores
create table trabajon4Ejercicio2.PAIS (
	id_pais int not null,
    Nombre_Pais varchar(45) not null,
    primary key(id_pais));
    
insert into trabajon4Ejercicio2.PAIS (id_pais, Nombre_Pais) values 
(1 , 'Argentina'),
(2 , 'Alemania'),
(3 , 'Estados Unidos');

-- creada tabla Provincia y le insertamos valores
create table trabajon4Ejercicio2.PROVINCIA (
	id_provincia int not null,
    Nombre_provincia varchar(45) not null,
	fk_pais int not null,
    foreign key(fk_pais) references PAIS(id_pais),
    primary key(id_provincia));
    
insert into trabajon4Ejercicio2.PROVINCIA (id_provincia, Nombre_provincia, fk_pais) values 
(1, 'Catamarca', '1'),
(2, 'Francia', '2'),
(3, 'Washington', '3');

-- creada tabla Localidad y le insertamos valores
create table trabajon4Ejercicio2.LOCALIDAD (
	Codigo_Localidad int not null,
    Nombre varchar(45) not null,
    Codigo_Postal varchar(45) not null,
	fk_provincia int not null,
    foreign key(fk_provincia) references PROVINCIA(id_provincia),
    primary key(Codigo_Localidad));
    
insert into trabajon4Ejercicio2.LOCALIDAD (Codigo_Localidad, Nombre, Codigo_Postal, fk_provincia) values 
(1, 'Garbarino', '3332', '1'),
(2, 'Derenge', '7899', '2'),
(3, 'Masachusetts', '9854', '3');

-- creada tabla empleado y le insertamos valores
create table trabajon4Ejercicio2.EMPLEADO (
	id_empleado int not null,
    DNI varchar(45) not null,
    Nombre varchar(80) not null,
    Telefono varchar(45) not null,
    Email varchar(45) not null unique,
    Fecha_Alta date not null,
    fk_Localidad int not null,
    foreign key(fk_Localidad) references LOCALIDAD(Codigo_Localidad),
    primary key(id_empleado));
    
insert into trabajon4Ejercicio2.EMPLEADO (id_empleado, DNI, Nombre, Telefono, Email, Fecha_Alta, fk_Localidad) values 
(1, '58583920', 'Lucas', '3739 829383', 'lucasyeliana2018@gmail.com', '2021-09-22', '1'),
(2, '62533920', 'Eliana', '3847 920390', 'aguatescristlinos23@gmail.com', '2021-02-25', '2'),
(3, '71583920', 'Susana', '8273 209383', 'raismoldoBalt908@gmail.com', '2020-12-06', '3');


-- ejercicio 3 

drop schema if exists trabajon4Ejercicio3;
create schema trabajon4Ejercicio3;

-- creada tabla coches y le insertamos valores
create table trabajon4Ejercicio3.COCHES (
	Matricula_coche varchar(45) not null unique,
    Modelo varchar(45) not null,
    Color varchar(45) not null,
    Marca varchar(45) not null,
    Precio_alquiler int not null,
    Litros_gasolina float not null,
    primary key(Matricula_coche));
    
insert into trabajon4Ejercicio3.COCHES 
(Matricula_coche, Modelo, Color, Marca, Precio_alquiler, Litros_gasolina) values 
('PKD 873' , 'Viper 08', 'Magenta', 'Renault', 50000, 2.5),
('6H9 012' , 'Ricumba 970', 'Azul', 'Toyota', 30000, 1.5),
('BN3 1V7' , 'Lighter 3000', 'Verde', 'Ford', 70000, 3);

create table trabajon4Ejercicio3.RESERVAS (
	id_RESERVAS int not null,
    f_inicial_reserva date not null,
    f_final_reserva date not null,
    Precio_Total int not null,
    Cantidad_Coches int not null,
    primary key(id_RESERVAS));
    
insert into trabajon4Ejercicio3.RESERVAS
(id_RESERVAS, f_inicial_reserva, f_final_reserva, Precio_Total, Cantidad_Coches) values 
('1' , '2005-04-22', '2005-05-24', 50000, 2),
('2' , '2005-05-09', '2005-08-12', 30000, 1),
('3' , '2006-11-14', '2006-12-04', 70000, 3);

create table trabajon4Ejercicio3.CLIENTES (
	Codigo_cliente int not null unique,
    DNI varchar(45) not null,
    Nombre varchar(80) not null,
    Direccion varchar(45) not null,
    Telefono varchar(45) not null,
    fk_RESERVAS int not null,
    foreign key(fk_RESERVAS) references RESERVAS(id_RESERVAS),
    primary key(Codigo_cliente));

insert into trabajon4Ejercicio3.CLIENTES
(Codigo_cliente, DNI, Nombre, Direccion, Telefono, fk_RESERVAS) values 
('1' , '46983498', 'Diego', 'mt. 2345', '2387 872398', 1),
('2' , '46837492', 'Jazmin', '4232B', '9058 834734', 2),
('3' , '46839382', 'Antonio', 'A23521', '8234 904392', 3);

create table trabajon4Ejercicio3.RESERVAMIENTO (
	fk_RESERVAS int not null,
    fk_Matricula_coche varchar(45) not null unique,
    foreign key(fk_RESERVAS) references RESERVAS(id_RESERVAS),
    foreign key(fk_Matricula_coche) references COCHES(Matricula_coche),
    primary key(fk_RESERVAS, fk_Matricula_coche));

-- select r.id_RESERVAS, r.f_inicial_reserva, r.f_final_reserva, r.Precio_Total, r.Cantidad_Coches, c.Codigo_cliente, c.DNI, c.Nombre from trabajon4ejercicio3.reservas r right join trabajon4ejercicio3.clientes c on r.id_RESERVAS = c.fk_RESERVAS;



    
    
