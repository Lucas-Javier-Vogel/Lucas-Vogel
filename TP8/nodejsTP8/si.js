const fs = require("fs");
const rawdata = fs.readFileSync('./departamentos.json', 'utf-8');
let departamento = JSON.parse(rawdata);

function getnombre_puesto (departamento) {
    for (let i = 0 ; i < departamento["Departamentos"][0]["Tecnologia"].length ; i++) {

        let i_puesto = departamento["Departamentos"][0]["Tecnologia"][i]['Puesto'];
        let nombre = departamento["Departamentos"][0]["Tecnologia"][i]['Nombre'];

        console.log(nombre, i_puesto);

    }
}
getnombre_puesto(departamento);
/* 
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
 */