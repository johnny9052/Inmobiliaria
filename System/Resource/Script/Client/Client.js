/* Funciones jQuery */
$(window).on("load", function (e) {
    list();
    loadTipoIdentificacion();
    loadDepartment();
    loadGender();
    loadProfessionNivel();
    loadCity(-1);
    loadCityResidence(-1);
    loadProfession(-1);
    loadMaritalStatus();
    loadPersonType();
    loadClientType();
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

function loadGender() {
    Execute(scanInfo('loadGender', false), 'General/CtlGeneral', '', 'buildSelect(info,"selGender");');
}

function loadProfessionNivel() {
    Execute(scanInfo('loadProfessionNivel', false), 'General/CtlGeneral', '', 'buildSelect(info,"selProfessionNivel");');
}

function loadProfession(id) {
    Execute(scanInfo('loadProfession', false, '', [{datos: ["id", id]}]), 'General/CtlGeneral', '', 'buildSelect(info,"selProfession");');
}



function loadMaritalStatus() {
    Execute(scanInfo('loadMaritalStatus', false), 'General/CtlGeneral', '', 'buildSelect(info,"selMaritalStatus");');
}

function loadPersonType() {
    Execute(scanInfo('loadPersonType', false), 'General/CtlGeneral', '', 'buildSelect(info,"selPersonType");');
}


function loadClientType() {
    Execute(scanInfo('loadCheckboxClientType', false), 'General/CtlGeneral', '', 'BuildCheckbox(info,"FormContainerCheckboxClientType");');
}



function save() {
    if (validateForm() === true) {
        Execute(scanInfo('save', true), 'Client/CtlClient', '', 'closeWindow();list();');
    }

}

function list() {
    Execute(scanInfo('list'), 'Client/CtlClient', '', 'buildPaginator(info);');
}


function search(id) {
    $("#txtId").val(id);
    Execute(scanInfo('search', true), 'Client/CtlClient', '', 'showData(info);');
}


function showData(info) {
    $("#txtId").val(info[0].id);
    $("#txtDocumentNumber").val(info[0].cedula);
    $("#txtFirstName").val(info[0].primer_nombre);
    $("#txtSecondName").val(info[0].segundo_nombre);
    $("#txtFirstLastName").val(info[0].primer_apellido);
    $("#txtSecondLastName").val(info[0].segundo_apellido);
    $("#txtAddress").val(info[0].direccion);
    $("#txtHomePhone").val(info[0].telefono);
    $("#txtMobilePhone").val(info[0].celular);
    $("#txtEmail").val(info[0].email);
    refreshSelect("selGender", info[0].genero);
    $("#txtBirthdate").val(info[0].fecha);
    refreshSelect("selCityResidence", info[0].id_ciudad_residencia);
    refreshSelect("selDocumentType", info[0].id_tipo_identificacion);
    refreshSelect("selCityExpedition", info[0].id_ciudad_expedicion);
    refreshSelect("selMaritalStatus", info[0].estado_civil);
    refreshSelect("selProfession", info[0].id_profesion);
    refreshSelect("selPersonType", info[0].id_tipo_persona);
    openWindow();
    showButton(false);
}


function update() {
    var password = $("#txtPassword").val();
    var confirm = $("#txtPasswordConfirm").val();

    if (password === confirm) {
        if (validateForm() === true) {
            Execute(scanInfo('update', true), 'Client/CtlClient', '', 'closeWindow();list();');
        }
    } else {
        showToast("El password no coincide");
    }
}


function deleteInfo() {
    Execute(scanInfo('delete', true), 'Client/CtlClient', '', 'closeWindow("ModalConfirm");list();cleanForm("ModalNew");');
}
