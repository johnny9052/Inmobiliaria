$(document).ready(function () {
    loadTopInmueblesVisitados();
    loadTopZonasVisitadas();
});

var chart;

function loadTopInmueblesVisitados() {
    Execute(scanInfo('loadInmueblesTopVisitas', false), 'General/CtlGeneral', '', 'cargarDatosTotalVisitasInmueble(info);');
}

function cargarDatosTotalVisitasInmueble(info) {

    var data = new Array();
    var columns = new Array();
    data.push('totalVisitas');

    info.forEach(function (entry) {
        data.push(entry.totalvisitas);
        columns.push(entry.matriculaInmobiliaria);
    });

    buildDashboardBarByCategory(columns, data, 'chart', 'Matricula inmueble', 'Total de visitas');
}


function loadTopZonasVisitadas() {
    Execute(scanInfo('loadZonasTopVisitas', false), 'General/CtlGeneral', '', 'cargarDatosTotalVisitasZonas(info);');
}



function cargarDatosTotalVisitasZonas(info) {

    var data = new Array();
    var columns = new Array();
    data.push('totalVisitas');

    info.forEach(function (entry) {
        data.push(entry.totalvisitas);
        columns.push(entry.nombreZona);
    });

    buildDashboardBarByCategory(columns, data, 'chart2', 'Zonas', 'Total de visitas');
}


















/*Se define una variable chart, la cual contiene el id del div contenedor y los 
 * datos que tendra la grafica que se generara (datos + nombre columnas), el 
 * cual por defecto hace un grafico de lineas*/

var chart3 = c3.generate({
    bindto: '#chart3',
    data: {
        columns: [
            ['data1', 300, 350, 300, 0, 0, 0],
            ['data2', 130, 100, 140, 200, 150, 50]
        ],
        /*Se definen tipos especificos para cada conjunto de datos*/
        types: {
            data1: 'area',
            data2: 'area-spline'
        }
    }
});








/*Se define el valor del KPI, con tu respectivo tipo. Se pueden definir 
 * eventos sobre el */
var chart4 = c3.generate({
    bindto: '#chart4',
    data: {
        columns: [
            ['data', 91.4]
        ],
        type: 'gauge',
        onclick: function (d, i) {
            console.log("onclick", d, i);
        },
        onmouseover: function (d, i) {
            console.log("onmouseover", d, i);
        },
        onmouseout: function (d, i) {
            console.log("onmouseout", d, i);
        }
    },
    color: {
        /*Gama de colores para los valores definidos (Rojo, naranja, amarillo, 
         * verde)*/
        pattern: ['#FF0000', '#F97600', '#F6C600', '#60B044'],
        threshold: {
            values: [30, 60, 90, 100]
        }
    },
    /*Tamaño del KPI*/
    size: {
        height: 180
    }
});


/*Funciones que cambiar los valores para ver el comportamiento del KPI*/
setTimeout(function () {
    chart4.load({
        columns: [['data', 10]]
    });
}, 1000);

setTimeout(function () {
    chart4.load({
        columns: [['data', 50]]
    });
}, 2000);

setTimeout(function () {
    chart4.load({
        columns: [['data', 70]]
    });
}, 3000);

setTimeout(function () {
    chart4.load({
        columns: [['data', 0]]
    });
}, 4000);

setTimeout(function () {
    chart4.load({
        columns: [['data', 100]]
    });
}, 5000);


