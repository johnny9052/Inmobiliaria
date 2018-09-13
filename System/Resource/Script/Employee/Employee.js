var objFileIdentification = {
    listFileBase64: new Array(),
    listFileName: new Array(),
    listFileURL: new Array(),
    listFileNameDeleted: new Array()
};

var objFileMilitaryCard = {
    listFileBase64: new Array(),
    listFileName: new Array(),
    listFileURL: new Array(),
    listFileNameDeleted: new Array()
};

var objImageEmployee = {
    listFileBase64: new Array(),
    listFileName: new Array(),
    listFileURL: new Array(),
    listFileNameDeleted: new Array()
};


/* Funciones jQuery */
$(window).on("load", function (e) {
    list();
    loadDepartmentExpedition();
    loadDepartmentBirth();
    loadDepartmentResidence();
    loadGender();
    loadProfessionNivel();
    loadCityExpedition(-1);
    loadCityResidence(-1);
    loadCityBirth(-1);
    loadProfession(-1);
    loadMaritalStatus();
    loadTypeEmployee();
    loadBloodType();
    loadPensionFund();
    loadSeveranceFund();
    loadArl();
    loadEps();
    loadCompensationBox();
});

function loadTypeEmployee() {
    Execute(scanInfo('loadTypeEmployee', false), 'General/CtlGeneral', '', 'buildSelect(info,"selTypeEmployee");');
}

function loadTipoIdentificacion() {
    Execute(scanInfo('loadTipoIdentificacion', false), 'General/CtlGeneral', '', 'buildSelect(info,"selDocumentType");');
}

function loadBloodType() {
    Execute(scanInfo('loadBloodType', false), 'General/CtlGeneral', '', 'buildSelect(info,"selBloodType");');
}

function loadPensionFund() {
    Execute(scanInfo('loadPensionFund', false), 'General/CtlGeneral', '', 'buildSelect(info,"selPensionFund");');
}

function loadSeveranceFund() {
    Execute(scanInfo('loadSeveranceFund', false), 'General/CtlGeneral', '', 'buildSelect(info,"selSeveranceFund");');
}

function loadArl() {
    Execute(scanInfo('loadArl', false), 'General/CtlGeneral', '', 'buildSelect(info,"selArl");');
}

function loadEps() {
    Execute(scanInfo('loadEps', false), 'General/CtlGeneral', '', 'buildSelect(info,"selEps");');
}

function loadCompensationBox() {
    Execute(scanInfo('loadCompensationBox', false), 'General/CtlGeneral', '', 'buildSelect(info,"selCompensationBox");');
}

function loadDepartmentResidence() {
    Execute(scanInfo('loadDepartment', false), 'General/CtlGeneral', '', 'buildSelect(info,"selStateResidence");');
}

function loadDepartmentExpedition() {
    Execute(scanInfo('loadDepartment', false), 'General/CtlGeneral', '', 'buildSelect(info,"selStateExpedition");');
}

function loadDepartmentBirth() {
    Execute(scanInfo('loadDepartment', false), 'General/CtlGeneral', '', 'buildSelect(info,"selStateBirth");');
}


function loadCityExpedition(id) {
    Execute(scanInfo('loadCity', false, '', [{datos: ["id", id]}]), 'General/CtlGeneral', '', 'buildSelect(info,"selCityExpedition");');
}

function loadCityResidence(id) {
    Execute(scanInfo('loadCity', false, '', [{datos: ["id", id]}]), 'General/CtlGeneral', '', 'buildSelect(info,"selCity");');
}

function loadCityBirth(id) {
    Execute(scanInfo('loadCity', false, '', [{datos: ["id", id]}]), 'General/CtlGeneral', '', 'buildSelect(info,"selCityBirth");');
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

        /*Se define el array de datos adicionales como un objeto, debido a que 
         * es necesario pasarlo por referencia para el llenado de los archivos*/
        var infoPlus = {
            temp: new Array()
        };

        /*Se manda por referencia el objeto de la info adicional donde se añadiran 
         * los archivos, junto el el objeto que tiene la informacion real de
         * todos los archivos*/
        addFileNameAndEncodingAndDeletedFiles(infoPlus, objFileIdentification, 'EmployeeIdentification');
        addFileNameAndEncodingAndDeletedFiles(infoPlus, objFileMilitaryCard, 'EmployeeMilitaryCard');
        addFileNameAndEncodingAndDeletedFiles(infoPlus, objImageEmployee, 'EmployeeImage');

        Execute(scanInfo('save', true, '', infoPlus.temp), 'Employee/CtlEmployee', '', 'list();mostrarMensaje();', '', 'Ha superado el tamaño maximo de las imagenes', '', true);

    }

}

function mostrarMensaje() {
    showToast("Almacenado correctamente", "success", "ModalNew");
    showButtonEmployee(false);
}


function showButtonEmployee(status) {
    if (status) {
        $("#newActionButtonEmployee").show();
        $("#updateActionButtonEmployee").hide();
    } else {
        $("#newActionButtonEmployee").hide();
        $("#updateActionButtonEmployee").show();
    }
}

function showButtonExperience(status) {
    if (status) {
        $("#newActionButtonExperience").show();
        $("#updateActionButtonExperience").hide();
    } else {
        $("#newActionButtonExperience").hide();
        $("#updateActionButtonExperience").show();
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
    refreshSelect("selTypeEmployee", info[0].id_tipo_Empleado);
    refreshSelect("selCityExpedition", info[0].id_Ciudad_Expedicion);
    refreshSelect("selCityBirth", info[0].id_Ciudad_Nacimiento);
    $("#txtDocumentNumber").val(info[0].cedula);
    $("#txtFirstName").val(info[0].primer_nombre);
    $("#txtSecondName").val(info[0].segundo_nombre);
    $("#txtFirstLastName").val(info[0].primer_apellido);
    $("#txtSecondLastName").val(info[0].segundo_apellido);
    $("#txtAddress").val(info[0].direccion);
    $("#txtHomePhone").val(info[0].telefono);
    $("#txtMobilePhone").val(info[0].celular);
    $("#txtEmail").val(info[0].email);
    $("#txtBirthdate").val(info[0].fecha);
    $("#txtExpeditionDate").val(info[0].fecha_Expedicion);
    refreshSelect("selGender", info[0].genero);
    $("#txtBirthdate").val(info[0].fecha);
    refreshSelect("selCity", info[0].id_ciudad_residencia);
    refreshSelect("selMaritalStatus", info[0].estado_civil);
    refreshSelect("selProfession", info[0].id_profesion);
    refreshSelect("selStateResidence", info[0].id_departamento);
    refreshSelect("selStateExpedition", info[0].id_Departamento_Expedicion);
    refreshSelect("selStateBirth", info[0].id_Departamento_Nacimiento);
    refreshSelect("selProfessionNivel", info[0].id_nivel);
    $("#txtMilitaryCard").val(info[0].numero_Libreta_Militar);
    refreshSelect("selBloodType", info[0].id_Tipo_Sangre);
    refreshSelect("selPensionFund", info[0].id_Fondo_Pensiones);
    refreshSelect("selSeveranceFund", info[0].id_Fondo_Cesantias);
    refreshSelect("selArl", info[0].id_Arl);
    refreshSelect("selEps", info[0].id_Eps);
    refreshSelect("selCompensationBox", info[0].id_Caja_Compensacion);
    $("#txtContacName").val(info[0].nombre_Contacto);
    $("#txtContactPhone").val(info[0].telefono_Contacto);
    $("#txtContactEmail").val(info[0].correo_Contacto);

    /*Se organiza el archivo cargado desde la base de datos, estableciendo su codificacion
     * y todas sus caracteristicas*/
    var nombreArchivoCedula = organizarArchivoCargadoDesdeBD(info[0].archivo_Cedula, objFileIdentification);

    $("#lstArchivoCedula").html(imageDownloadFile("pdf", objFileIdentification.listFileURL[objFileIdentification.listFileName.indexOf(nombreArchivoCedula)], nombreArchivoCedula));

    var nombreArchivoLibreta = organizarArchivoCargadoDesdeBD(info[0].archivo_Libreta_Militar, objFileMilitaryCard);

    $("#lstArchivoLibreta").html(imageDownloadFile("pdf", objFileMilitaryCard.listFileURL[objFileMilitaryCard.listFileName.indexOf(nombreArchivoLibreta)], nombreArchivoLibreta));

    var nombreArchivoFoto = organizarArchivoCargadoDesdeBD(info[0].foto_Empleado, objImageEmployee);

    $("#lstArchivoFoto").html(imageDownloadFile("jpg", objImageEmployee.listFileURL[objImageEmployee.listFileName.indexOf(nombreArchivoFoto)], nombreArchivoFoto));

    openWindow();
    showButton(false);
}


function update() {
    if (validateForm() === true) {
        /*Se define el array de datos adicionales como un objeto, debido a que 
         * es necesario pasarlo por referencia para el llenado de los archivos*/
        var infoPlus = {
            temp: new Array()
        };

        /*Se manda por referencia el objeto de la info adicional donde se añadiran 
         * los archivos, junto el el objeto que tiene la informacion real de
         * todos los archivos*/
        addFileNameAndEncodingAndDeletedFiles(infoPlus, objFileIdentification, 'EmployeeIdentification');
        addFileNameAndEncodingAndDeletedFiles(infoPlus, objFileMilitaryCard, 'EmployeeMilitaryCard');
        addFileNameAndEncodingAndDeletedFiles(infoPlus, objImageEmployee, 'EmployeeImage');

        Execute(scanInfo('update', true, '', infoPlus.temp), 'Employee/CtlEmployee', '', 'closeWindow();list();limpiarMultimedia();', '', 'Ha superado el tamaño maximo de las imagenes');
    }
}


function deleteInfo() {
    /*Se define el array de datos adicionales como un objeto, debido a que 
     * es necesario pasarlo por referencia para el llenado de los archivos*/
    var infoPlus = {
        temp: new Array()
    };

    /*Se manda por referencia el objeto de la info adicional donde se añadiran 
     * los archivos, junto el el objeto que tiene la informacion real de
     * todos los archivos*/
    addAllFileNameDeleted(infoPlus, objFileIdentification, 'EmployeeIdentification');
    addAllFileNameDeleted(infoPlus, objFileMilitaryCard, 'EmployeeMilitaryCard');
    addAllFileNameDeleted(infoPlus, objImageEmployee, 'EmployeeImage');

    Execute(scanInfo('delete', true, '', infoPlus.temp), 'Employee/CtlEmployee', '', 'closeWindow("ModalConfirm");list();cleanForm("ModalNew");limpiarMultimedia();');
}

/**
 * Se limpia o reinicia todos los elementos involucrados en los videos e imagenes
 * @returns {void}
 * @author Johnny Alexander Salazar
 * @version 0.1
 */
function limpiarMultimedia() {
    objFileIdentification.listFileBase64 = new Array();
    objFileIdentification.listFileName = new Array();
    objFileIdentification.listFileURL = new Array();
    $("#lstArchivoCedula").html("");

    objFileMilitaryCard.listFileBase64 = new Array();
    objFileMilitaryCard.listFileName = new Array();
    objFileMilitaryCard.listFileURL = new Array();
    $("#lstArchivoLibreta").html("");

    objImageEmployee.listFileBase64 = new Array();
    objImageEmployee.listFileName = new Array();
    objImageEmployee.listFileURL = new Array();
    $("#lstArchivoFoto").html("");
}