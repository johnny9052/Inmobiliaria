/* Funciones jQuery */
/* global markersListGlobal, google, URL */
$(window).on("load", function (e) {
    /*Se obtiene un posible filtro de busqueda, si es que existe*/
    var id = getUrlParameter('idFilter');
    list(id);
    loadEmployee();
    loadDepartment();
    loadCity(-1);
    loadClient();
    loadTypeEvent();
    loadCheckboxEmployees();
});

function loadCheckboxEmployees() {
    Execute(scanInfo('loadCheckboxEmployees', false),
            'General/CtlGeneral',
            '',
            'BuildCheckbox(info,"FormContainerCheckboxEmployees", "EmployeesChk");');
    /*BuildCheckbox("Info que llega","Id del contenedor", "Nombre de los checks");')*/
}

function loadTypeEvent() {
    Execute(scanInfo('loadTypeEvent', false), 'General/CtlGeneral', '', 'buildSelect(info,"selTypeEvent");');
}

function loadDepartment() {
    Execute(scanInfo('loadDepartment', false), 'General/CtlGeneral', '', 'buildSelect(info,"selState");');
}

function loadCity(id) {
    Execute(scanInfo('loadCity', false, '', [{datos: ["id", id]}]), 'General/CtlGeneral', '', 'buildSelect(info,"selCity");');
}

function loadClient() {
    Execute(scanInfo('loadClient', false), 'General/CtlGeneral', '', 'buildSelect(info,"selClient");');
}

function loadEmployee() {
    Execute(scanInfo('loadEmployee', false), 'General/CtlGeneral', '', 'buildSelect(info,"selEmployee");');
}

/**
 * Cada vez que se selecciona un nuevo departamento - municipio, se actualiza 
 * la caja de busqueda del mapa
 * @returns {void}
 * @author Johnny Alexander Salazar
 * @version 0.1
 */
function actualizarMucipioMapa() {
    var nombreDepto = ($("#selState").val() === "-1") ? "" : $("#selState option:selected").text();
    var nombreMunicipio = ($("#selCity").val() === "-1") ? "" : $("#selCity option:selected").text();
    var nombreCompleto = nombreMunicipio + " " + nombreDepto;
    $("#pac-input").val(nombreCompleto);
}

function save() {
    /*Se valida el marcador seleccionado del gps*/
    if (markersListGlobal.length > 0) {
        if (validateForm() === true) {

            /*Se define el array de datos adicionales como un objeto, debido a que es necesario pasarlo por referencia para el llenado de los archivos*/
            var infoPlus = {
                temp: new Array()
            };

            /*Se obteien los datos de latitud - longitud*/
            var lat = markersListGlobal[0].getPosition().lat();
            var lng = markersListGlobal[0].getPosition().lng();

            /*Se añaden como datos adicionales*/
            infoPlus.temp.push({datos: ["lat", lat]});
            infoPlus.temp.push({datos: ["lng", lng]});
            
            infoPlus.temp.push({datos: scanCheckboxDinamic("employeesSelecteds", "EmployeesChk")});

            Execute(scanInfo('save', true, '', infoPlus.temp), 'Client/CtlEvent', '', ' closeWindow();list();deleteMarkers();limpiarMultimedia();', '', 'Ha superado el tamaño maximo de las imagenes');
        }
    } else {
        showToast("Seleccione un punto en el mapa", "error");
    }
}

function list(id) {
    /*Se agrega un posible filtro del listado*/
    var infoPlus = {
        temp: new Array()
    };
    infoPlus.temp.push({datos: ["idFilter", id]});
    Execute(scanInfo('list', false, '', infoPlus.temp), 'Client/CtlEvent', '', 'buildPaginator(info);');
}


function search(id) {
    $("#txtId").val(id);
    Execute(scanInfo('search', true),
            'Client/CtlEvent',
            '',
            'showData(info);CheckCheckboxChecked("loadEmployeeSelected","EmployeesChk");');
}


function showData(info) {
    $("#txtId").val(info[0].id); //.id es lo que se coloque en el procedimiento almacenado searcheevent
    refreshSelect("selClient", info[0].cedula_cliente);
    refreshSelect("selTypeEvent", info[0].id_tipo_evento);
    $("#txtPlace").val(info[0].lugar_evento);
    $("#txtDateEvent").val(info[0].fecha_evento);
    $("#txtTimeEvent").val(info[0].hora_evento);
    refreshSelect("selEmployee", info[0].id_empleado);
    $("#txtObservations").val(info[0].observaciones);
    refreshSelect("selState", info[0].id_departamento);
    refreshSelect("selCity", info[0].id_ciudad);
    
    alert(info[0].latitud);
    alert(info[0].longitud);
    
    
    /*Se añade el punto del gps*/
    addMarker(new google.maps.LatLng(info[0].latitud, info[0].longitud));
    moveToPosition(info[0].latitud, info[0].longitud);

    openWindow();
    showButton(false);
}


function update() {
    /*Se valida el marcador seleccionado del gps*/
    if (markersListGlobal.length > 0) {
        if (validateForm() === true) {

            /*Se define el array de datos adicionales como un objeto, debido a que es necesario pasarlo por referencia para el llenado de los archivos*/
            var infoPlus = {
                temp: new Array()
            };

            /*Se obteien los datos de latitud - longitud*/
            var lat = markersListGlobal[0].getPosition().lat();
            var lng = markersListGlobal[0].getPosition().lng();

            /*Se añaden como datos adicionales*/
            infoPlus.temp.push({datos: ["lat", lat]});
            infoPlus.temp.push({datos: ["lng", lng]});
            
            infoPlus.temp.push({datos: scanCheckboxDinamic("employeesSelecteds", "EmployeesChk")});

            Execute(scanInfo('update', true, '', infoPlus.temp), 'Client/CtlEvent', '', ' closeWindow();list();deleteMarkers();limpiarMultimedia();', '', 'Ha superado el tamaño maximo de las imagenes');
        }
    } else {
        showToast("Seleccione un punto en el mapa", "error");
    }
}


function deleteInfo() {
    Execute(scanInfo('delete', true), 'Client/CtlEvent', '', 'closeWindow("ModalConfirm");list();cleanForm("ModalNew");');
}
