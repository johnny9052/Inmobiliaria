/* Funciones jQuery */
$(window).on("load", function (e) {
    list();
    loadEmployee();
    loadPosition();
});


function loadEmployee() {
    Execute(scanInfo('loadEmployee', false), 'General/CtlGeneral', '', 'buildSelect(info,"selEmployee");');
}

function loadPosition() {
    Execute(scanInfo('loadPosition', false), 'General/CtlGeneral', '', 'buildSelect(info,"selPosition");');
}


function save() {
    if (validateForm() === true) {
        Execute(scanInfo('save', true), 'Employee/CtlEmployeeExperience', '', 'closeWindow();list();');
    }
}

function list() {
    Execute(scanInfo('list'), 'Employee/CtlEmployeeExperience', '', 'buildPaginator(info);');
}


function search(id) {
    $("#txtId").val(id);
    Execute(scanInfo('search', true), 'Employee/CtlEmployeeExperience', '', 'showData(info);');
}


function showData(info) {
    refreshSelect("selEmployee", info[0].empleado);
    $("#txtCompanyName").val(info[0].empresa);
    $("#txtAdmissionDate").val(info[0].fecha_ingreso);
    $("#txtDepartureDate").val(info[0].fecha_salida);
    $("#fileWorkCertificate").val(info[0].certificado_laboral);
    refreshSelect("selPosition", info[0].cargo);

    openWindow();
    showButton(false);
}


function update() {
    if (validateForm() === true) {
        Execute(scanInfo('update', true), 'Employee/CtlEmployeeExperience', '', 'closeWindow();list();');
    }
}


function deleteInfo() {
    Execute(scanInfo('delete', true), 'Employee/CtlEmployeeExperience', '', 'closeWindow("ModalConfirm");list();cleanForm("ModalNew");');
}
