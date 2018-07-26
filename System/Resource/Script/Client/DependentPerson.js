/* Funciones jQuery */
$(window).on("load", function (e) {
    list();
    loadClient();
    loadActivityEconomic();
    loadPosition();
});


function loadClient() {
    Execute(scanInfo('loadClient', false), 'General/CtlGeneral', '', 'buildSelect(info,"lblNameClient");');
}

function loadActivityEconomic() {
    Execute(scanInfo('loadActivityEconomic', false), 'General/CtlGeneral', '', 'buildSelect(info,"selLaborType");');
}

function loadPosition() {
    Execute(scanInfo('loadPosition', false), 'General/CtlGeneral', '', 'buildSelect(info,"selPosition");');
}


function save() {
    if (validateForm() === true) {
        Execute(scanInfo('save', true), 'Client/CtlDependentPerson', '', 'closeWindow();list();');
    }
}

function list() {
    Execute(scanInfo('list'), 'Client/CtlDependentPerson', '', 'buildPaginator(info);');
}


function search(id) {
    $("#txtId").val(id);
    Execute(scanInfo('search', true), 'Client/CtlDependentPerson', '', 'showData(info);');
}


function showData(info) {
    $("#lblNameClient").html(info[0].nombre);
    refreshSelect("selLaborType", info[0].actividadEconomica);
    $("#txtCompanyName").val(info[0].nombreEmpresa);
    refreshSelect("selPosition", info[0].cargo);
    $("#txtAddress").val(info[0].direccionOficina);
    $("#txtSalary").val(info[0].salario);
    $("#txtIncome").val(info[0].otrosIngresos);
    $("#txtAntiquity").val(info[0].antiguedad);
    $("#txtPhoneoffice").val(info[0].telefonoOficina);

    openWindow();
    showButton(false);
}


function update() {
    if (validateForm() === true) {
        Execute(scanInfo('update', true), 'Client/CtlDependentPerson', '', 'closeWindow();list();');
    }
}


function deleteInfo() {
    Execute(scanInfo('delete', true), 'Client/CtlDependentPerson', '', 'closeWindow("ModalConfirm");list();cleanForm("ModalNew");');
}
