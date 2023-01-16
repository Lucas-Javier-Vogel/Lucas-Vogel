# CURSO PROGRAMACIÓN WEB FULL STACK NIVEL 2 TP 7
# Lucas Vogel

## Ejercicio 1:

#### Crear un archivo JSON llamado personas.json que contenga los siguientes datos:

#### Nombre         |Apellido  |DNI      |Telefono   |Localidad
#### Pedro          |Guzman    |22773450 |3755121314 |L. N. Alem
#### Maria          |Nieves    |35928532 |3764131517 |Posadas
#### Roberto Carlos |Guerra    |40726384 |3758171819 |Apóstoles
#### Julieta        |Lopez     |29384710 |3751222324 |Eldorado
#### Ramon          |Rodriguez |31749223 |3765334455 |Posadas

## Ejercicio 2:

#### Crear un archivo JSON llamado departamentos.json que contenga la siguiente información:
#### Contabilidad:
#####              id_empleado: 10; nombre: Juan Segovia
#####              id_empleado: 15; nombre: Ramiro Romero
#### Tecnología:
#####             id_empleado: 12; nombre: Pablo Richmon ; puesto: PM
#####             id_empleado: 23; nombre: Marta Fernandez; puesto: TechLead
#####              id_empleado: 24; nombre: Pedro Mendez ; puesto: FullStack JS
#### Producción:
#####              id_empleado: 7; nombre: Gabriela Lescano
#### Comercial:
#####              id_empleado: 2; nombre: Fabiana Martines

## Ejercicio 3:

#### Crear un archivo JSON llamado productos.json que contenga la siguiente información:

#### id_producto: 283; nombre: Gafas de sol; Marca: Acme; disponible: 20; precio: 9800; temporada:
#### Verano 2023; caracteristicas: color: negro; marco: metal;

#### id_producto: 191; nombre: Reloj deportivo; Marca: Timer; disponible: 2; precio: 21400;
#### caracteristicas: color: plateado; material: goma y plástico;

#### id_producto: 148; nombre: Juego de medias; Marca: Piecito; disponible: 38; precio: 500;
#### caracteristicas: color: varios; material: algodon;

#### id_producto: 82; nombre: Camiseta selección Argentina; Marca: Argento; disponible: 11; precio:
#### 6800; talle: L

#### id_producto: 81; nombre: Camiseta selección Argentina; Marca: Argento; disponible: 15; precio:
#### 6800; talle: M

## Ejercicio 4:

#### a- Crear una carpeta llamada “nodejs”.
#### b- Dentro de la carpeta “nodejs”, ejecutar el comando “npm init”. Seguir los pasos por defecto.
#### Esto creará un archivo package.json
#### c- Luego, editar el objeto “scripts” y agregar la linea: "start": "node index.js" quedando:
```
{
// ...
"scripts": {
"start": "node index.js",
"test": "echo \"Error: no test specified\" && exit 1"
},
// ...
}
```
#### d- Crear el archivo index.js con el siguiente contenido:
```
console.log('Hola soy un programa')
```
#### e- Ejecutar: node index.js
#### f- Luego ejecutar npm start

## Ejercicio 5:

#### a- Dentro de la carpeta nodejs
#### b- Crear un archivo llamado programa.js y declarar la siguiente función:
```
// Declaro la función sumar y paso como parametro 2 numeros
function sumar(num1, num2) {
resultado = num1 + num2;
console.log("La suma es: "+resultado)
}
// Declaró la explotación de la función
module.exports = {
"sumar": sumar
}
```
#### c- Luego, agregar debajo del archivo index.js el siguiente contenido:
```
//
const operacion = require("./programa")
// LLamado al objeto operacion
operacion.sumar(4, 3)
```
#### d- Ejecutar npm start













