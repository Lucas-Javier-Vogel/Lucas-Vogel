//a)Modificar el programa lector 1, reemplazar las 2 últimas líneas por:
//console.log(JSON.stringify(rawdata));

const fs = require("fs");
let rawdata = fs.readFileSync('./personas.json');

//¿Qué sucede cuando utilizamos JSON.stringify? Por que?
//Si usamos stringify, este convertira un objeto javascript en una cadena de JSON (aunque en este caso, ya que trajimos un JSON imprime cualquier cosa debido a que ya este es el formato del archivo traido(perdon por no tener una mejor explicacion de la razon de que deen como resultado una gran cantidad de numeros)).

console.log(JSON.stringify(rawdata));

//¿Qué sucede cuando utilizamos JSON.parse? Por que?
//Al utilizar parse nuestra cadena de JSON pasa a convertirse en un objeto de javascript.

console.log(JSON.parse(rawdata)); 





