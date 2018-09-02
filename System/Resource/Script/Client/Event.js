/* Funciones jQuery */
$(window).on("load", function (e) {
    /*Se obtiene un posible filtro de busqueda, si es que existe*/
    var id = getUrlParameter('idFilter');
    list();
    loadEmployee();
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

function loadClient() {
    Execute(scanInfo('loadClient', false), 'General/CtlGeneral', '', 'buildSelect(info,"selClient");');
}

function loadEmployee() {
    Execute(scanInfo('loadEmployee', false), 'General/CtlGeneral', '', 'buildSelect(info,"selEmployee");');
}

function save() {
    if (validateForm() === true) {
        Execute(scanInfo('save', true, '', [{datos: scanCheckboxDinamic("employeesSelecteds", "EmployeesChk")}]),
                'Client/CtlEvent',
                '',
                'closeWindow();list();');
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

    openWindow();
    showButton(false);
}


function update() {
    if (validateForm() === true) {
        Execute(scanInfo('update', true, '', [{datos: scanCheckboxDinamic("employeesSelecteds", "EmployeesChk")}]),
                'Client/CtlEvent',
                '',
                'closeWindow();list();');
    }
}


function deleteInfo() {
    Execute(scanInfo('delete', true), 'Client/CtlEvent', '', 'closeWindow("ModalConfirm");list();cleanForm("ModalNew");');
}

