//a)Modificar el programa lector 2, reemplazar la última línea por:
//console.log(JSON.stringify(jsonData));

'use strict';  
let jsonData = require('./personas.json');

//¿Qué sucede cuando utilizamos JSON.stringify? Por que?
//Si usamos stringify, este convertira un objeto javascript en una cadena de JSON.

console.log(JSON.stringify(jsonData));

//b)Agregar al final:
//console.log(JSON.parse(jsonData));
//¿Qué sucede cuando utilizamos JSON.parse? Por que?
//Al utilizar parse nuestra cadena de JSON pasa a convertirse en un objeto de javascript (en este caso no funcionaria debido a que se esta intentando convertir un archivo con el mismo formato(es la unica explicacion que le encontre)).

console.log(JSON.parse(jsonData));