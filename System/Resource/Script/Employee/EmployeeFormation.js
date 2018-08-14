var listFileCertificate = new Array();
var listFileNameCertificate = new Array();
var listFileURLCertificate = new Array();

/* Funciones jQuery */
$(window).on("load", function (e) {
    list();
    loadEmployee();
    loadProfessionNivel();
    loadProfession(-1);
    loadPeriodicity();
});

function loadPeriodicity() {
    Execute(scanInfo('loadPeriodicity', false), 'General/CtlGeneral', '', 'buildSelect(info,"selPeriodicity");');
}

function loadProfessionNivel() {
    Execute(scanInfo('loadProfessionNivel', false), 'General/CtlGeneral', '', 'buildSelect(info,"selProfessionNivel");');
}

function loadProfession(id) {
    Execute(scanInfo('loadProfession', false, '', [{datos: ["id", id]}]), 'General/CtlGeneral', '', 'buildSelect(info,"selProfession");');
}

function loadEmployee() {
    Execute(scanInfo('loadEmployee', false), 'General/CtlGeneral', '', 'buildSelect(info,"selEmployee");');
}

function loadPosition() {
    Execute(scanInfo('loadPosition', false), 'General/CtlGeneral', '', 'buildSelect(info,"selPosition");');
}


function save() {
    if (validateForm() === true) {

        var temp = new Array();

        for (var x = 0; x < listFileCertificate.length; x++) {

            temp.push({datos: ["nameFile" + x, listFileNameCertificate[x]]});
            temp.push({datos: ["base64File" + x, listFileCertificate[x]]});
        }

        Execute(scanInfo('save', true), 'Employee/CtlEmployeeFormation', '', 'closeWindow();list();');
    }
}

function list() {
    Execute(scanInfo('list'), 'Employee/CtlEmployeeFormation', '', 'buildPaginator(info);');
}


function search(id) {
    $("#txtId").val(id);
    Execute(scanInfo('search', true), 'Employee/CtlEmployeeFormation', '', 'showData(info);');
}


function showData(info) {
    
    $("#txtEducationInstitute").val(info[0].institucion_educacion);
    $("#txtLevel").val(info[0].nivel_alcanzado);
    $("#fileCertificate").val(info[0].certificado);
    refreshSelect("selEmployee", info[0].empleado);
    refreshSelect("selProfession", info[0].profesion);
    refreshSelect("selPeriodicity", info[0].periodicidad);
    refreshSelect("selProfessionNivel", info[0].idnivel_Profesion);
    refreshCheckbox("chkGraduate", info[0].graduado);
    openWindow();
    showButton(false);
}


function update() {
    if (validateForm() === true) {
        Execute(scanInfo('update', true), 'Employee/CtlEmployeeFormation', '', 'closeWindow();list();');
    }
}


function deleteInfo() {
    Execute(scanInfo('delete', true), 'Employee/CtlEmployeeFormation', '', 'closeWindow("ModalConfirm");list();cleanForm("ModalNew");');
}

function procesarArchivo2() {


    /*Se capturan todas las imagenes seleccionadas*/
    var files = $("#fileCertificate")[0].files;

    /*Por cada imagen, se añade a la cadena, se codifica a bas64 y se obtiene su 
     * nombre para ser almacenados*/
    for (var i = 0; i < files.length; i++) {

        /*Se obtiene el archivo*/
        var file = files[i];

        /*Si se pudo obtener algun archivo*/
        if (file !== undefined) {
            var nombreArchivo = ((file.name).split("."))[0].substring(0, 5);

            /*Se agrega a la lista de nombres el nombre del archivo*/
            listFileNameCertificate.push(cleanNameFile(nombreArchivo));
            /*Se convierte la imagen seleccionada a BASE64 y se añade la codificacion 
             * a la lista correspondiente*/
            base64(file, function (data) {
                listFileCertificate.push((data.base64 !== undefined) ? data.base64 : ""); // prints the base64 string                                
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
    var files = $("#fileCertificate")[0].files;

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
                listFileCertificate.push((data.base64 !== undefined) ? data.base64 : ""); // prints the base64 string                                                
                listFileNameCertificate.push(fileName);
                listFileURLCertificate.push(urlImage);
            }, cleanNameFile(nombreArchivo), window.URL.createObjectURL(file));
        }
    }
}
