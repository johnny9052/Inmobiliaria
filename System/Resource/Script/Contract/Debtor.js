/* Funciones jQuery */
$(window).on("load", function (e) {
    list();
    loadTipoIdentificacion();
    loadDepartment();
    loadCity(-1);
    loadCityResidence(-1);
    loadMaritalStatus();
});


function loadTipoIdentificacion() {
    Execute(scanInfo('loadTipoIdentificacion', false), 'General/CtlGeneral', '', 'buildSelect(info,"selDocumentType");');
}


function loadDepartment() {
    Execute(scanInfo('loadDepartment', false), 'General/CtlGeneral', '', 'buildSelect(info,"selStateExpedition");buildSelect(info,"selStateResidence");');
}


function loadCity(id) {
    Execute(scanInfo('loadCity', false, '', [{datos: ["id", id]}]), 'General/CtlGeneral', '', 'buildSelect(info,"selCityExpedition");');
}


function loadCityResidence(id) {
    Execute(scanInfo('loadCity', false, '', [{datos: ["id", id]}]), 'General/CtlGeneral', '', 'buildSelect(info,"selCityResidence");');
}

function loadMaritalStatus() {
    Execute(scanInfo('loadMaritalStatus', false), 'General/CtlGeneral', '', 'buildSelect(info,"selMaritalStatus");');
}


function save() {
    if (validateForm() === true) {
        Execute(scanInfo('save', true), 'Contract/CtlDebtor', '', 'closeWindow();list();');
    }
}

function list() {
    Execute(scanInfo('list'), 'Contract/CtlDebtor', '', 'buildPaginator(info);');
}


function search(id) {
    $("#txtId").val(id);
    Execute(scanInfo('search', true),
    
    'Contract/CtlDebtor',
            '',
            'showData(info);CheckCheckboxChecked("loadClientTypeSelected","ClientType");');
}


function showData(info) {
    $("#txtId").val(info[0].id);
    $("#txtDocumentNumber").val(info[0].cedula);
    $("#txtFirstName").val(info[0].primer_nombre);
    $("#txtSecondName").val(info[0].segundo_nombre);
    $("#txtFirstLastName").val(info[0].primer_apellido);
    $("#txtSecondLastName").val(info[0].segundo_apellido);
    $("#txtAddress").val(info[0].direccion_residencia);
    $("#txtHomePhone").val(info[0].telefono_residencia);
    $("#txtAddressOffice").val(info[0].direccion_laboral);
    $("#txtOfficePhone").val(info[0].telefono_laboral);
    $("#txtMobilePhone").val(info[0].celular);
    $("#txtEmail").val(info[0].email);
    $("#txtMonthlyIncome").val(info[0].ingresos);
    refreshSelect("selMaritalStatus", info[0].estado_civil);
    refreshSelect("selDocumentType", info[0].tipo_identificacion);
    refreshSelect("selStateResidence", info[0].id_departamento_residencia);
    refreshSelect("selCityResidence", info[0].id_ciudad_residencia);
    refreshSelect("selStateExpedition", info[0].id_departamento_expedicion);
    refreshSelect("selCityExpedition", info[0].id_ciudad_expedicion);
    
    $("#txtExpeditionDate").val(info[0].fecha_expedicion);

    openWindow();
    showButton(false);
}


function update() {
    if (validateForm() === true) {
        Execute(scanInfo('update', true), 'Contract/CtlDebtor', '', 'closeWindow();list();');
    }
}


function deleteInfo() {
    Execute(scanInfo('delete', true), 'Contract/CtlDebtor', '', 'closeWindow("ModalConfirm");list();cleanForm("ModalNew");');
}
