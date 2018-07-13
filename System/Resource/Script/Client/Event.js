/* Funciones jQuery */
$(window).on("load", function (e) {
//    list();
    loadEmployee();
    loadClient();
    loadTypeEvent();
});

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
            Execute(scanInfo('update', true), 'Client/CtlEvent', '', 'closeWindow();list();');
        }
    } else {
        showToast("El password no coincide");
    }
}


function deleteInfo() {
    Execute(scanInfo('delete', true), 'Client/CtlEvent', '', 'closeWindow("ModalConfirm");list();cleanForm("ModalNew");');
}

