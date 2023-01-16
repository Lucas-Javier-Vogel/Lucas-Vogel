//a)Modificar el programa lector 3, reemplazar la anteúltima línea por:
//console.log(JSON.stringify(data));
//¿Qué sucede cuando utilizamos JSON.stringify?
//por lo que yo entiendo, al utilizar stringify, ya que estamos pasando al mismo formato de archivo no cumple su papel por lo que muestra datos ilegibles o no los resultantes deseados.

'use strict';
const fs = require('fs');
fs.readFile('./personas.json', (err, data) => {
    if (err) throw err;
    console.log(JSON.stringify(data));
    console.log(data);
});
/* console.log(data); */

//b) Agregar debajo:
//console.log(data);
//¿Que sucede? Por que?
//(hago un parentesis por que no tengo idea si se refieren a debajo del stringify o de la funcion por lo cual explicare las 2)Si esta dentro de la funcion mostrara los datos sin ser pasados a otro formato por lo que no es entendible.Si es completamente abajo no permite ejecutar el node debido a que "data" solo es vigente en la funcion y no fuera de ella.