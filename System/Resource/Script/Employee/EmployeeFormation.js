var objFileFormation = {
    listFileBase64: new Array(),
    listFileName: new Array(),
    listFileURL: new Array(),
    listFileNameDeleted: new Array()
};

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
        
        /*Se define el array de datos adicionales como un objeto, debido a que 
         * es necesario pasarlo por referencia para el llenado de los archivos*/
        var infoPlus = {
            temp: new Array()
        };

        /*Se manda por referencia el objeto de la info adicional donde se añadiran 
         * los archivos, junto el el objeto que tiene la informacion real de
         * todos los archivos*/
        addFileNameAndEncodingAndDeletedFiles(infoPlus, objFileFormation, 'Formation');

        Execute(scanInfo('save', true, '', infoPlus.temp), 'Employee/CtlEmployeeFormation', '', 'closeWindow();list();limpiarMultimedia();', '', 'Ha superado el tamaño maximo de las imagenes');
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
    
    /*Se organiza el archivo cargado desde la base de datos, estableciendo su codificacion
     * y todas sus caracteristicas*/
    var nombreArchivoFormacion = organizarArchivoCargadoDesdeBD(info[0].certificado, objFileFormation);

    $("#lstArchivoAgregado").html(imageDownloadFile("pdf", objFileFormation.listFileURL[objFileFormation.listFileName.indexOf(nombreArchivoFormacion)], nombreArchivoFormacion));
    
    
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
        addFileNameAndEncodingAndDeletedFiles(infoPlus, objFileFormation, 'Formation');

        Execute(scanInfo('update', true, '', infoPlus.temp), 'Employee/CtlEmployeeFormation', '', 'closeWindow();list();');
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
    addAllFileNameDeleted(infoPlus, objFileFormation, 'Formation');

    Execute(scanInfo('delete', true, '', infoPlus.temp), 'Employee/CtlEmployeeFormation', '', 'closeWindow("ModalConfirm");list();cleanForm("ModalNew");limpiarMultimedia();');
}

/**
 * Se limpia o reinicia todos los elementos involucrados en los videos e imagenes
 * @returns {void}
 * @author Johnny Alexander Salazar
 * @version 0.1
 */
function limpiarMultimedia() {
    objFileFormation.listFileBase64 = new Array();
    objFileFormation.listFileName = new Array();
    objFileFormation.listFileURL = new Array();
    $("#lstArchivoAgregado").html("");
}