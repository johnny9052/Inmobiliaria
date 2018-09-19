$(document).ready(function () {
    loadTopInmueblesVisitados();
    loadTopZonasVisitadas();
    loadTotalInmueblesPorOferta();
    loadTotalInmuebles();
    loadTotalClientes();
    loadTotalArrendatarios();
});

var chart3;





function loadTotalInmuebles() {
    Execute(scanInfo('loadTotalInmuebles', false), 'General/CtlGeneral', '', 'setTotalInmuebles(info)');
}

function setTotalInmuebles(info) {
    $("#lblTotalInmuebles").html(info[0].total);
}

function loadTotalClientes() {
    Execute(scanInfo('loadTotalClientes', false), 'General/CtlGeneral', '', 'setTotalClientes(info)');
}

function setTotalClientes(info) {
    $("#lblTotalClientes").html(info[0].total);
}

function loadTotalArrendatarios() {
    Execute(scanInfo('loadTotalArrendatarios', false), 'General/CtlGeneral', '', 'setTotalArrendatarios(info)');
}

function setTotalArrendatarios(info) {
    $("#lblTotalArrendatarios").html(info[0].total);
}



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




function loadTotalInmueblesPorOferta() {

    Execute(scanInfo('loadTotalInmueblesPorOferta', false), 'General/CtlGeneral', '', 'cargarDatosTotalInmueblesPorOferta(info);');
}

function cargarDatosTotalInmueblesPorOferta(info) {
    console.log(info);
    var data = new Array();
    var columns = new Array();
    data.push('Inmuebles en total');

    info.forEach(function (entry) {
        data.push(entry.total);
        columns.push(entry.tipo);
    });

    chart3 = buildDashboardArea(columns, [data], 'chart3', 'Tipo de oferta', 'Total');

    loadTotalInmueblesPorOfertaContrato();
}



function loadTotalInmueblesPorOfertaContrato() {
    Execute(scanInfo('loadTotalInmueblesPorOfertaContrato', false), 'General/CtlGeneral', '', 'cargarDatosTotalInmueblesPorOfertaContrato(info);');
}


function cargarDatosTotalInmueblesPorOfertaContrato(info) {
    var data = new Array();
    data.push('Inmuebles contratados');

    info.forEach(function (entry) {
        data.push(entry.total);
    });


    chart3.load({
        columns: [
            data
        ]
    });

}

















/*Se define el valor del KPI, con tu respectivo tipo. Se pueden definir 
 * eventos sobre el */
var colorScale = d3.scale.category10();

var chart4 = c3.generate({
    bindto: '#chart4',
    data: {
        columns: [
            ['data1', 30, 200, 100, 400, 150, 250],
            ['data2', 50, 20, 10, 40, 15, 25]
        ],
        type: 'bar',
        order: 'asc',
        labels: true,
        color: function (inColor, data) {
            if (data.index !== undefined) {
                return colorScale(data.index);
            }

            return inColor;
        }
    },
    legend: {
        show: false
    },
    zoom: {
        enabled: false
    },
    axis: {
        y: {
            label: {
                text: 'labelAxisY',
                position: 'outer-middle'
                        // inner-top : default
                        // inner-middle
                        // inner-bottom
                        // outer-top
                        // outer-middle
                        // outer-bottom
            }
        },
        x: {
            type: 'category',
            categories: ['aa', 'bb', 'cc', 'dd'],
            label: {
                text: 'sdasdasasda',
                position: 'outer-center'
                        // inner-right : default
                        // inner-center
                        // inner-left
                        // outer-right
                        // outer-center
                        // outer-left
            }
        }
    },
    tooltip: {
        show: false
    },
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


