# CURSO PROGRAMACIÓN WEB FULL STACK NIVEL 2 TP 9a

## Ejercicio 1:

#### Investigar y dar una definición con sus palabras los siguientes términos:
##### REST
##### API
##### Endpoint
##### Encabezados (headers)

## Ejercicio 1:

#### A- Realizar un fork, descargar y luego configurar el proyecto para que funcione localmente:
#### https://github.com/FacundoRauber/alpha-silicon

#### B- Crear las siguientes tablas en la base de datos:

### CURSOS

#### idcurso int pk unico ai
#### nombre varchar(100)
#### descripcion text
#### estado char(1) default ‘1’

### USUARIOS

#### idusuario int pk unique ai
#### nickname varchar(100) unique
#### email varchar(100) unique
#### password varchar(100)
#### estado char(1) default ‘1’

### MATERIAS

#### idmateria int pk unico ai
#### nombre varchar(100)
#### objetivo text
#### plan_estudio text
#### estado char(1) default ‘1’

### SEDES

#### idsede int pk unico ai
#### nombre varchar(100)
#### dirección text
#### localidad varchar(50)
#### cod_postal varchar(10)
#### telcontacto1 varchar(15)
#### telcontacto2 varchar(15)
#### estado char(1) default ‘1’

#### C- Dar de alta como mínimo 5 cursos, materias y usuarios.Algunos ejemplos pueden ser:
#### Cursos: Introducción a la programación, Programación full stack, …
#### Materias: Ingles 1, Ingles 2, Programación Web, Base de datos, Programación de Apps, …

#### D- Agregar al proyecto los controllers y datasource para poder realizar un alta, baja (solo lógica) y modificación de cursos, materias, sedes y usuarios.
#### Nota: verificar que los endpoint funcionen correctamente

## Ejercicio 3:
#### A- Hacer un backup (dump) de la base de datos.
#### B- Subir los cambios al repositorio personal y compartir el enlace en canvas.
