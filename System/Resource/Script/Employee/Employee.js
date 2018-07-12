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
    loadTypeEmployee();
});

function loadTypeEmployee() {
    Execute(scanInfo('loadTypeEmployee', false), 'General/CtlGeneral', '', 'buildSelect(info,"selTypeEmployee");');
}

function loadTipoIdentificacion() {
    Execute(scanInfo('loadTipoIdentificacion', false), 'General/CtlGeneral', '', 'buildSelect(info,"selDocumentType");');
}


function loadDepartment() {
    Execute(scanInfo('loadDepartment', false), 'General/CtlGeneral', '', 'buildSelect(info,"selStateResidence");');
}


function loadCity(id) {
    Execute(scanInfo('loadCity', false, '', [{datos: ["id", id]}]), 'General/CtlGeneral', '', 'buildSelect(info,"selCityExpedition");');
}


function loadCityResidence(id) {
    Execute(scanInfo('loadCity', false, '', [{datos: ["id", id]}]), 'General/CtlGeneral', '', 'buildSelect(info,"selCityResidence");');
}


function loadEmployeeType() {
    Execute(scanInfo('loadEmployeeType', false), 'General/CtlGeneral', '', 'buildSelect(info,"selEmployeeType");');
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

function save() {
    if (validateForm() === true) {
        Execute(scanInfo('save', true), 'Employee/CtlEmployee', '', 'closeWindow();list();');
    }

}

function list() {
    Execute(scanInfo('list'), 'Employee/CtlEmployee', '', 'buildPaginator(info);');
}


function search(id) {
    $("#txtId").val(id);
    Execute(scanInfo('search', true), 'Employee/CtlEmployee', '', 'showData(info);');
}


function showData(info) {
        
    $("#txtId").val(info[0].id);
    refreshSelect("selTypeEmployee", info[0].tipo_cliente);
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
    refreshSelect("selCityExpedition", info[0].id_ciudad_expedicion);    
    refreshSelect("selMaritalStatus", info[0].estado_civil);    
    refreshSelect("selProfession", info[0].id_profesion);
    openWindow();
    showButton(false);
}


function update() {
    var password = $("#txtPassword").val();
    var confirm = $("#txtPasswordConfirm").val();

    if (password === confirm) {
        if (validateForm() === true) {
            Execute(scanInfo('update', true), 'Employee/CtlEmployee', '', 'closeWindow();list();');
        }
    } else {
        showToast("El password no coincide");
    }
}


function deleteInfo() {
    Execute(scanInfo('delete', true), 'Employee/CtlEmployee', '', 'closeWindow("ModalConfirm");list();cleanForm("ModalNew");');
}
