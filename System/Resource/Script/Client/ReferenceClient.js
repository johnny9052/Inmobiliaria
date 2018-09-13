/* Funciones jQuery */
$(window).on("load", function (e) {
    list();
    loadClient();
    loadTypeReference();
});

function loadClient() {
    Execute(scanInfo('loadClient', false), 'General/CtlGeneral', '', 'buildSelect(info,"selClient");');
}

function loadTypeReference() {
    Execute(scanInfo('loadTypeReference', false), 'General/CtlGeneral', '', 'buildSelect(info,"selTypeReference");');
}

function save() {
    if (validateForm() === true) {
        Execute(scanInfo('save', true), 'Client/CtlReferenceClient', '', 'closeWindow();list();');
    }
}

function list() {
    Execute(scanInfo('list'), 'Client/CtlReferenceClient', '', 'buildPaginator(info);');
}


function search(id) {
    $("#txtId").val(id);
    Execute(scanInfo('search', true), 'Client/CtlReferenceClient', '', 'showData(info);');
}


function showData(info) {
    $("#txtId").val(info[0].id);
    refreshSelect("selClient", info[0].cliente);
    refreshSelect("selTypeReference", info[0].tipo_referencia);
    $("#txtFirstName").val(info[0].nombres);
    $("#txtFirstLastName").val(info[0].apellidos);
    $("#txtMobilePhone").val(info[0].telefono);
    
    openWindow();
    showButton(false);
}


function update() {
    if (validateForm() === true) {
        Execute(scanInfo('update', true), 'Client/CtlReferenceClient', '', 'closeWindow();list();');
    }
}


function deleteInfo() {
    Execute(scanInfo('delete', true), 'Client/CtlReferenceClient', '', 'closeWindow("ModalConfirm");list();cleanForm("ModalNew");');
}
