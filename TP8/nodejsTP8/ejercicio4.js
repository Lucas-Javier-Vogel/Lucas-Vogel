//Partiendo del programa “Obtener nombres”, crear una función llamada getNombre que reciba el
//arreglo de las personas y busque todas las personas de la localidad Posadas. Si encuentra debe
//imprimir el nombre y el apellido de la persona.
//Llamar a la función getNombre(persona);



const fs = require("fs");
const DatosSinParsear = fs.readFileSync("./personas.json", 'utf-8');
let persona = JSON.parse(DatosSinParsear);
function GetNombre (persona){
for (var i = 0; i < persona['Personas'].length ; i++){
    if (persona['Personas'][i]['Localidad'] == "Posadas") {
        console.log(persona['Personas'][i]['Nombre'], persona['Personas'][i]['Apellido']);
    }
}}
console.log(GetNombre(persona))

//no entiendo (y me gustaria una respuesta) por que sale (junto con los nombres que son correctos) undefined al final cuando se ejecuta el node