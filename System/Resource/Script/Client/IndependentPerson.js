/* Funciones jQuery */
$(window).on("load", function (e) {
    list();
    loadClient();
    loadActivityEconomic();
});


function loadClient() {
    Execute(scanInfo('loadClient', false), 'General/CtlGeneral', '', 'buildSelect(info,"lblNameClient");');
}

function loadActivityEconomic() {
    Execute(scanInfo('loadActivityEconomic', false), 'General/CtlGeneral', '', 'buildSelect(info,"selLaborType");');
}

function save() {
    if (validateForm() === true) {
        Execute(scanInfo('save', true), 'Client/CtlIndependentPerson', '', 'closeWindow();list();');
    }
}

function list() {
    Execute(scanInfo('list'), 'Client/CtlIndependentPerson', '', 'buildPaginator(info);');
}


function search(id) {
    $("#txtId").val(id);
    Execute(scanInfo('search', true), 'Client/CtlIndependentPerson', '', 'showData(info);');
}


function showData(info) {
    $("#lblNameClient").html(info[0].nombre);
    refreshSelect("selLaborType", info[0].actividadEconomica);
    $("#txtBusinessDescription").val(info[0].descripcionNegocio);
    $("#txtMerchantRecord").val(info[0].registroMercantil);
    $("#txtNumberEmployees").val(info[0].numeroEmpleados);
    $("#txtIncome").val(info[0].ingresos);
    $("#txtExpenses").val(info[0].egresos);
    
    openWindow();
    showButton(false);
}


function update() {
    if (validateForm() === true) {
        Execute(scanInfo('update', true), 'Client/CtlIndependentPerson', '', 'closeWindow();list();');
    }
}


function deleteInfo() {
    Execute(scanInfo('delete', true), 'Client/CtlIndependentPerson', '', 'closeWindow("ModalConfirm");list();cleanForm("ModalNew");');
}
