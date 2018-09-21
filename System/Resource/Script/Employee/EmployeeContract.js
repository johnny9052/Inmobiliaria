var objFileContract = {
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
        /*Se define el array de datos adicionales como un objeto, debido a que es necesario pasarlo por referencia para el llenado de los archivos*/
        var infoPlus = {
            temp: new Array()
        };
        /*Se manda por referencia el objeto de la info adicional donde se añadiran los archivos, junto el el objeto que tiene la informacion real de todos los archivos*/
        addFileNameAndEncodingAndDeletedFiles(infoPlus, objFileContract, 'Contract');

        Execute(scanInfo('save', true, '', infoPlus.temp), 'Employee/CtlEmployeeContract', '', 'closeWindow();list();limpiarMultimedia();', '', 'Ha superado el tamaño maximo de las imagenes');
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
    $("#txtEndDate").val(info[0].fecha_terminacion);
    refreshSelect("selContractType", info[0].tipo_contrato);
    refreshSelect("selPosition", info[0].cargo);
    $("#txtSalary").val(info[0].salario);

    /*Se organiza el archivo cargado desde la base de datos, estableciendo su codificacion
     * y todas sus caracteristicas*/
    var nombreContrato = organizarArchivoCargadoDesdeBD(info[0].contrato, objFileContract);

    $("#lstArchivoAgregado").html(imageDownloadFile("pdf", objFileContract.listFileURL[objFileContract.listFileName.indexOf(nombreContrato)], nombreContrato));

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
        addFileNameAndEncodingAndDeletedFiles(infoPlus, objFileContract, 'Contract');

        Execute(scanInfo('update', true, '', infoPlus.temp), 'Employee/CtlEmployeeContract', '', 'closeWindow();list();');
    }
}


function deleteInfo() {

    /*Se define el array de datos adicionales como un objeto, debido a que 
     * es necesario pasarlo por referencia para el llenado de los archivos*/
    var infoPlus = {
        temp: new Array()
    };

    /*Se manda por referencia el objeto de la info adicional donde se añadiran los archivos, junto el el objeto que tiene la informacion real de todos los archivos*/
    addAllFileNameDeleted(infoPlus, objFileContract, 'Contract');

    Execute(scanInfo('delete', true, '', infoPlus.temp), 'Employee/CtlEmployeeContract', '', 'closeWindow("ModalConfirm");list();cleanForm("ModalNew");limpiarMultimedia();');
}


/**
 * Se limpia o reinicia todos los elementos involucrados en los videos e imagenes
 * @returns {void}
 * @author Johnny Alexander Salazar
 * @version 0.1
 */
function limpiarMultimedia() {
    objFileContract.listFileBase64 = new Array();
    objFileContract.listFileName = new Array();
    objFileContract.listFileURL = new Array();
    $("#lstArchivoAgregado").html("");
}







