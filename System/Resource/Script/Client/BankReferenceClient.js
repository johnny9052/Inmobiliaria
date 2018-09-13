/* Funciones jQuery */
$(window).on("load", function (e) {
    list();
    loadClient();
    loadBank();
});

function loadClient() {
    Execute(scanInfo('loadClient', false), 'General/CtlGeneral', '', 'buildSelect(info,"selClient");');
}

function loadBank() {
    Execute(scanInfo('loadBank', false), 'General/CtlGeneral', '', 'buildSelect(info,"selBank");');
}

function save() {
    if (validateForm() === true) {
        Execute(scanInfo('save', true), 'Client/CtlBankReferenceClient', '', 'closeWindow();list();');
    }
}

function list() {
    Execute(scanInfo('list'), 'Client/CtlBankReferenceClient', '', 'buildPaginator(info);');
}


function search(id) {
    $("#txtId").val(id);
    Execute(scanInfo('search', true), 'Client/CtlBankReferenceClient', '', 'showData(info);');
}


function showData(info) {
    $("#txtId").val(info[0].id);
    refreshSelect("selClient", info[0].cliente);
    $("#txtNumberAccount").val(info[0].numero_cuenta);
    refreshSelect("selBank", info[0].banco);
    $("#txtBranchOffice").val(info[0].sucursal);
        
    openWindow();
    showButton(false);
}


function update() {
    if (validateForm() === true) {
        Execute(scanInfo('update', true), 'Client/CtlBankReferenceClient', '', 'closeWindow();list();');
    }
}


function deleteInfo() {
    Execute(scanInfo('delete', true), 'Client/CtlBankReferenceClient', '', 'closeWindow("ModalConfirm");list();cleanForm("ModalNew");');
}
