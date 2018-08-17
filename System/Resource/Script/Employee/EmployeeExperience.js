var objfileWorkCertificate = {
    listFileBase64: new Array(),
    listFileName: new Array(),
    listFileURL: new Array(),
    listFileNameDeleted: new Array()
};

/* Funciones jQuery */
$(window).on("load", function (e) {
    list();
    loadEmployee();
    loadPosition();
});


function loadEmployee() {
    Execute(scanInfo('loadEmployee', false), 'General/CtlGeneral', '', 'buildSelect(info,"selEmployee");');
}

function loadPosition() {
    Execute(scanInfo('loadPosition', false), 'General/CtlGeneral', '', 'buildSelect(info,"selPosition");');
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
        addFileNameAndEncodingAndDeletedFiles(infoPlus, objfileWorkCertificate, 'Experience');

        Execute(scanInfo('save', true, '', infoPlus.temp), 'Employee/CtlEmployeeExperience', '', 'closeWindow();list();limpiarMultimedia();', '', 'Ha superado el tamaño maximo de las imagenes');
    }
}

function list() {
    Execute(scanInfo('list'), 'Employee/CtlEmployeeExperience', '', 'buildPaginator(info);');
}


function search(id) {
    $("#txtId").val(id);
    Execute(scanInfo('search', true), 'Employee/CtlEmployeeExperience', '', 'showData(info);');
}


function showData(info) {
    refreshSelect("selEmployee", info[0].empleado);
    $("#txtCompanyName").val(info[0].empresa);
    $("#txtAdmissionDate").val(info[0].fecha_ingreso);
    $("#txtDepartureDate").val(info[0].fecha_salida);
    refreshSelect("selPosition", info[0].cargo);
    
    /*Se organiza el archivo cargado desde la base de datos, estableciendo su codificacion
     * y todas sus caracteristicas*/
    var nombreArchivoExperiencia = organizarArchivoCargadoDesdeBD(info[0].certificado_laboral, objfileWorkCertificate);

    $("#lstArchivoAgregado").html(imageDownloadFile("pdf", objfileWorkCertificate.listFileURL[objfileWorkCertificate.listFileName.indexOf(nombreArchivoExperiencia)], nombreArchivoExperiencia));


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
        addFileNameAndEncodingAndDeletedFiles(infoPlus, objfileWorkCertificate, 'Experience');

        Execute(scanInfo('update', true, '', infoPlus.temp), 'Employee/CtlEmployeeExperience', '', 'closeWindow();list();');
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
    addAllFileNameDeleted(infoPlus, objfileWorkCertificate, 'Experience');

    Execute(scanInfo('delete', true, '', infoPlus.temp), 'Employee/CtlEmployeeExperience', '', 'closeWindow("ModalConfirm");list();cleanForm("ModalNew");limpiarMultimedia();');
}

/**
 * Se limpia o reinicia todos los elementos involucrados en los videos e imagenes
 * @returns {void}
 * @author Johnny Alexander Salazar
 * @version 0.1
 */
function limpiarMultimedia() {
    objfileWorkCertificate.listFileBase64 = new Array();
    objfileWorkCertificate.listFileName = new Array();
    objfileWorkCertificate.listFileURL = new Array();
    $("#lstArchivoAgregado").html("");
}
