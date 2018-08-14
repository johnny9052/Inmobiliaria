var listFileIdentification = new Array();
var listFileNameIdentification = new Array();
var listFileURLIdentification = new Array();



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

        var temp = new Array();

        for (var x = 0; x < listFileIdentification.length; x++) {

            temp.push({datos: ["nameFile" + x, listFileNameIdentification[x]]});
            temp.push({datos: ["base64File" + x, listFileIdentification[x]]});
        }

        Execute(scanInfo('save', true, '', temp), 'Employee/CtlEmployee', '', 'closeWindow();list();');
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
    $("#fileMilitaryCard").val(info[0].archivo_Libreta_Militar);
    refreshSelect("selPensionFund", info[0].id_Fondo_Pensiones);
    refreshSelect("selSeveranceFund", info[0].id_Fondo_Cesantias);
    refreshSelect("selArl", info[0].id_Arl);
    refreshSelect("selEps", info[0].id_Eps);
    refreshSelect("selCompensationBox", info[0].id_Caja_Compensacion);
    $("#txtContacName").val(info[0].nombre_Contacto);
    $("#txtContactPhone").val(info[0].telefono_Contacto);
    $("#txtContactEmail").val(info[0].correo_Contacto);


    openWindow();
    showButton(false);
}


function update() {
    if (validateForm() === true) {
        Execute(scanInfo('update', true), 'Employee/CtlEmployee', '', 'closeWindow();list();');
    }
}


function deleteInfo() {
    Execute(scanInfo('delete', true), 'Employee/CtlEmployee', '', 'closeWindow("ModalConfirm");list();cleanForm("ModalNew");');
}




function procesarArchivo2() {


    /*Se capturan todas las imagenes seleccionadas*/
    var files = $("#fileIdentification")[0].files;

    /*Por cada imagen, se añade a la cadena, se codifica a bas64 y se obtiene su 
     * nombre para ser almacenados*/
    for (var i = 0; i < files.length; i++) {

        /*Se obtiene el archivo*/
        var file = files[i];

        /*Si se pudo obtener algun archivo*/
        if (file !== undefined) {
            var nombreArchivo = ((file.name).split("."))[0].substring(0, 5);

            /*Se agrega a la lista de nombres el nombre del archivo*/
            listFileNameIdentification.push(cleanNameFile(nombreArchivo));
            /*Se convierte la imagen seleccionada a BASE64 y se añade la codificacion 
             * a la lista correspondiente*/
            base64(file, function (data) {
                listFileIdentification.push((data.base64 !== undefined) ? data.base64 : ""); // prints the base64 string                                
            });
        }
    }


}

function listImages(info) {

    var lblImagenes = "";

    for (var x = 0; x < info.length; x++) {
        /*Se agrega a la lista de nombres el nombre del archivo*/
        listImagenName.push(info[x].ruta_imagen);
        listImagen.push('Not base64');

        /*Se arma la cadena,tomando como referencias el nombre del archivo sin 
         * espacios ni caracteres especiales*/
        lblImagenes = lblImagenes + "<label class='seleccionable' id='" + info[x].ruta_imagen + "' onclick='eliminarImagen(" + '"' + info[x].ruta_imagen + '"' + ");'>(X)    " + setSpacesInText(((info[x].ruta_imagen).split("/"))[4]) + "</label><br>";
    }

    /*Se añade la nueva imagen a la lista de imagenes disponibles*/
    $("#lstImagenesAgregadas").html($("#lstImagenesAgregadas").html() + lblImagenes);

}

function procesarArchivo() {

    /*Se capturan todas las imagenes seleccionadas*/
    var files = $("#fileIdentification")[0].files;

    /*Por cada imagen, se añade a la cadena, se codifica a bas64 y se obtiene su 
     * nombre para ser almacenados*/
    for (var i = 0; i < files.length; i++) {

        /*Se obtiene el archivo*/
        var file = files[i];

        /*Si se pudo obtener algun archivo*/
        if (file !== undefined) {

            var nombreArchivo = ((file.name).split("."))[0];

            /*Se convierte la imagen seleccionada a BASE64 y se añade la codificacion 
             * a la lista correspondiente*/
            base64(file, function (data, fileName, urlImage) {
                listFileIdentification.push((data.base64 !== undefined) ? data.base64 : ""); // prints the base64 string                                                
                listFileNameIdentification.push(fileName);
                listFileURLIdentification.push(urlImage);
            }, cleanNameFile(nombreArchivo), window.URL.createObjectURL(file));
        }
    }
}