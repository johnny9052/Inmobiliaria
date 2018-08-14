/* Funciones jQuery */
$(window).on("load", function (e) {
    list();
    loadEmployee();
    loadPosition();
    loadArea();
    loadContractType();
});


function loadEmployee() {
    Execute(scanInfo('loadEmployee', false), 'General/CtlGeneral', '', 'buildSelect(info,"selEmployee");');
}

function loadPosition() {
    Execute(scanInfo('loadPosition', false), 'General/CtlGeneral', '', 'buildSelect(info,"selPosition");');
}

function loadArea() {
    Execute(scanInfo('loadArea', false), 'General/CtlGeneral', '', 'buildSelect(info,"selArea");');
}

function loadContractType() {
    Execute(scanInfo('loadContractType', false), 'General/CtlGeneral', '', 'buildSelect(info,"selContractType");');
}


function save() {
    if (validateForm() === true) {
        Execute(scanInfo('save', true), 'Employee/CtlEmployeeContract', '', 'closeWindow();list();');
    }
}

function list() {
    Execute(scanInfo('list'), 'Employee/CtlEmployeeContract', '', 'buildPaginator(info);');
}


function search(id) {
    $("#txtId").val(id);
    Execute(scanInfo('search', true), 'Employee/CtlEmployeeContract', '', 'showData(info);');
}


function showData(info) {
    refreshSelect("selEmployee", info[0].empleado);
    refreshSelect("selArea", info[0].area);
    $("#txtStartDate").val(info[0].fecha_inicio);
    $("#txtEndDate").val(info[0].fecha_finalizacion);
    refreshSelect("selContractType", info[0].tipo_contrato);
    refreshSelect("selPosition", info[0].cargo);
    $("#txtSalary").val(info[0].salario);
    $("#fileContract").val(info[0].archivo_contrato);
    

    openWindow();
    showButton(false);
}


function update() {
    if (validateForm() === true) {
        Execute(scanInfo('update', true), 'Employee/CtlEmployeeContract', '', 'closeWindow();list();');
    }
}


function deleteInfo() {
    Execute(scanInfo('delete', true), 'Employee/CtlEmployeeContract', '', 'closeWindow("ModalConfirm");list();cleanForm("ModalNew");');
}
