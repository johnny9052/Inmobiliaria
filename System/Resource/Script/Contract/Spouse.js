/* Funciones jQuery */
$(window).on("load", function (e) {
    list();
    loadClient();
});

function loadClient() {
    Execute(scanInfo('loadClient', false), 'General/CtlGeneral', '', 'buildSelect(info,"selClient");');
}

function loadTypeReference() {
    Execute(scanInfo('loadTypeReference', false), 'General/CtlGeneral', '', 'buildSelect(info,"selTypeReference");');
}

function save() {
    if (validateForm() === true) {
        Execute(scanInfo('save', true), 'Contract/CtlSpouse', '', 'closeWindow();list();');
    }
}

function list() {
    Execute(scanInfo('list'), 'Contract/CtlSpouse', '', 'buildPaginator(info);');
}


function search(id) {
    $("#txtId").val(id);
    Execute(scanInfo('search', true), 'Contract/CtlSpouse', '', 'showData(info);');
}


function showData(info) {
    $("#txtId").val(info[0].id);
    refreshSelect("selClient", info[0].cliente);
    $("#txtDocumentNumber").val(info[0].cedula);
    $("#txtExpeditiondate").val(info[0].fecha_expedicion);
    $("#txtEmail").val(info[0].correo);
    $("#txtFirstName").val(info[0].nombres);
    $("#txtFirstLastName").val(info[0].apellidos);
    $("#txtMobilePhone").val(info[0].telefono_movil);
    $("#txtCompany").val(info[0].empresa);
    $("#txtAddress").val(info[0].direccion);
    $("#txtOfficePhone").val(info[0].telefono_laboral);
    $("#txtSalary").val(info[0].salario);
    
    
    
    openWindow();
    showButton(false);
}


function update() {
    if (validateForm() === true) {
        Execute(scanInfo('update', true), 'Contract/CtlSpouse', '', 'closeWindow();list();');
    }
}


function deleteInfo() {
    Execute(scanInfo('delete', true), 'Contract/CtlSpouse', '', 'closeWindow("ModalConfirm");list();cleanForm("ModalNew");');
}
