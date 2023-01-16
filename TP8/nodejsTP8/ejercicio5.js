//Crear un programa (ejercicio5.js) capaz de leer el archivo departamentos.json.
//Luego recorrer e imprimir nombre + puesto de los empleados de tecnologia.

const fs = require("fs");
const rawdata = fs.readFileSync('./departamentos.json', 'utf-8');
let departamento = JSON.parse(rawdata);

function EmpleadosDeTecnologia (departamento) {
    for (let i = 0 ; i < departamento["Departamentos"][0]["Tecnologia"].length ; i++) {
        let puesto = departamento["Departamentos"][0]["Tecnologia"][i]["Nombre"];
        let nombre = departamento["Departamentos"][0]["Tecnologia"][i]["Puesto"];
        let NumeroEmpleado = i + 1; //solo para decoracion
        console.log("El nombre del empleado numero "+NumeroEmpleado+" de tecnologia es "+puesto+" y su puesto es "+nombre);
    }
}
//me gustaria saber por que al hacer un console.log al salir todos los datos dice undefined
console.log(EmpleadosDeTecnologia(departamento)) 


