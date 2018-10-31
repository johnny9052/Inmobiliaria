/* Funciones jQuery */
$(window).on("load", function (e) {
    list();
    loadTipoPqrs();
});


function loadTipoPqrs() {
    Execute(scanInfo('loadTipoPqrs', false), 'General/CtlGeneral', '', 'buildSelect(info,"selTypePQRS");');
}


function list() {
    Execute(scanInfo('list'), 'Client/CtlPqrs', '', 'buildPaginator(info);');
}


function search(id) {
    $("#txtId").val(id);
    Execute(scanInfo('search', true), 'Client/CtlPqrs', '', 'showData(info);');
}


function showData(info) {
    $("#txtId").val(info[0].id);
    $("#txtDatePQRS").val(info[0].fechaPQRS);
    $("#txtTimePQRS").val(info[0].horaPQRS);
    $("#txtDescription").val(info[0].descripcionPQRS);
    $("#txtResponse").val(info[0].respuestaDada);
    
    $("#txtNombre").val(info[0].nombre);
    $("#txtCorreo").val(info[0].correo);
    
    refreshSelect("selTypePQRS", info[0].idtipopqrs);

    openWindow();
    showButton(false);
}


function update() {
    if (validateForm() === true) {
        Execute(scanInfo('update', true), 'Client/CtlPqrs', '', 'closeWindow();list();');
    }
}


function deleteInfo() {
    Execute(scanInfo('delete', true), 'Client/CtlClient', '', 'closeWindow("ModalConfirm");list();cleanForm("ModalNew");');
}
