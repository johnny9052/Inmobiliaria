/* Funciones jQuery */
$(window).on("load", function (e) {
    list();
//    loadEmployee();
//    loadClient();
//    loadTypeEvent();
    loadCheckboxEmployees();
});

function loadCheckboxEmployees() {
    Execute(scanInfo('loadCheckboxEmployees', false),
            'General/CtlGeneral',
            '',
            'BuildCheckbox(info,"FormContainerCheckboxEmployees", "EmployeesChk");');
    /*BuildCheckbox("Info que llega","Id del contenedor", "Nombre de los checks");')*/
}

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
        Execute(scanInfo('save', true, '', [{datos: scanCheckboxDinamic("employeesSelecteds", "EmployeesChk")}]),
                'Employee/CtlEventEmployee',
                '',
                'closeWindow();list();');
    }

}

function list() {
    Execute(scanInfo('list'), 'Employee/CtlEventEmployee', '', 'buildPaginator(info);');
}


function search(id) {
    $("#txtId").val(id);
    Execute(scanInfo('search', true),
            'Employee/CtlEventEmployee',
            '',
            'showData(info);searchEmployeeNames();');
}


function searchEmployeeNames(){
   
    Execute(scanInfo('loadEmployeeSelected', true),
            'General/CtlGeneral',
            '',
            'showEmployeeNames(info);'); 
}


function showEmployeeNames(info){
    var constructor ='';
    for($i=0;$i<info.length;$i++){
        
        constructor = constructor + "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<label>" 
                + info[$i].nombre + "</label><BR>";
    }
     
    $("#ListEmpleados").html(constructor);
}


function showData(info) {
    $("#txtId").val(info[0].id); //.id es lo que se coloque en el procedimiento almacenado searcheevent
    $("#txtClient").val(info[0].nombreCliente);
    $("#txtEventType").val(info[0].tipo_evento);
    $("#txtPlace").val(info[0].lugar_evento);
    $("#txtDateEvent").val(info[0].fecha_evento);
    $("#txtTimeEvent").val(info[0].hora_evento);
    refreshSelect("selEmployee", info[0].id_empleado);
    $("#txtObservations").val(info[0].observaciones);
    $("#txtComments").val(info[0].comentarios);

    openWindow();
    showButton(false);
}


function update() {
    if (validateForm() === true) {
        Execute(scanInfo('update', true), 'Employee/CtlEventEmployee', '', 'closeWindow();list();');
    }
}


function deleteInfo() {
    Execute(scanInfo('delete', true), 'Employee/CtlEventEmployee', '', 'closeWindow("ModalConfirm");list();cleanForm("ModalNew");');
}

