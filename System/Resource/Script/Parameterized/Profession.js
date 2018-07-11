/* Funciones jQuery */
$(window).on("load", function (e) {
    list();
    loadProfessionNivel();
});



function loadProfessionNivel() {
    Execute(scanInfo('loadProfessionNivel', false), 'General/CtlGeneral', '', 'buildSelect(info,"selProfessionNivel");');
}


function save() {
    if (validateForm() === true) {
        Execute(scanInfo('save', true), 'Parameterized/CtlProfession', '', 'closeWindow();list();');
    }
}

function list() {
    Execute(scanInfo('listfilter'), 'Parameterized/CtlProfession', '', 'buildPaginator(info);');
}


function search(id) {
    $("#txtId").val(id);
    Execute(scanInfo('search', true), 'Parameterized/CtlProfession', '', 'showData(info);');
}


function showData(info) {
    $("#txtId").val(info[0].id);
    $("#txtName").val(info[0].nombre);
    $("#selProfessionNivel").val(info[0].nivelProfesion);
    openWindow();
    showButton(false);
}


function update() {
    if (validateForm() === true) {
        Execute(scanInfo('update', true), 'Parameterized/CtlProfession', '', 'closeWindow();list();');
    }
}


function deleteInfo() {
    if (validateForm() === true) {
        Execute(scanInfo('delete', true), 'Parameterized/CtlProfession', '', 'closeWindow("ModalConfirm");list();cleanForm("ModalNew");');
    }
}
