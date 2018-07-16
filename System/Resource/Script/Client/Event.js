/* Funciones jQuery */
$(window).on("load", function (e) {
//    list();
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
    Execute(scanInfo('loadtypeevent', false), 'General/CtlGeneral', '', 'buildSelect(info,"selTypeEvent");');
}

function loadClient() {
    Execute(scanInfo('loadclient', false), 'General/CtlGeneral', '', 'buildSelect(info,"selClient");');
}

function loadEmployee() {
    Execute(scanInfo('loademployee', false), 'General/CtlGeneral', '', 'buildSelect(info,"selEmployee");');
}

function save() {
    if (validateForm() === true) {
        Execute(scanInfo('save', true), 'Client/CtlEvent', '', 'closeWindow();list();');
    }

}

function list() {
    Execute(scanInfo('list'), 'Client/CtlEvent', '', 'buildPaginator(info);');
}


function search(id) {
    $("#txtId").val(id);
    Execute(scanInfo('search', true), 'Client/CtlEvent', '', 'showData(info);');
}


function showData(info) {
    $("#txtId").val(info[0].id); //.id es lo que se coloque en el procedimiento almacenado searcheevent
    refreshSelect("selClient", info[0].id_cliente);
    refreshSelect("selTypeEvent", info[0].id_evento);
    $("#txtPlace").val(info[0].lugar);
    $("#txtDateEvent").val(info[0].fecha_evento);
    $("#txtTimeEvent").val(info[0].hora_evento);
    refreshSelect("selEmployee", info[0].id_empleado);
    $("#txtObservations").val(info[0].observaciones);

    openWindow();
    showButton(false);
}


function update() {
    if (validateForm() === true) {
        Execute(scanInfo('update', true, '', [{datos: scanCheckboxDinamic("typesClientSelecteds", "ClientType")}]),
                'Client/CtlClient',
                '',
                'closeWindow();list();');
    }
}


function deleteInfo() {
    Execute(scanInfo('delete', true), 'Client/CtlEvent', '', 'closeWindow("ModalConfirm");list();cleanForm("ModalNew");');
}

