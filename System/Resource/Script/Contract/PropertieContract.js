var objFileContract = {
    listFileBase64: new Array(),
    listFileName: new Array(),
    listFileURL: new Array(),
    listFileNameDeleted: new Array()
};


/* Funciones jQuery */
$(window).on("load", function (e) {
    list();
    loadPropertie();
    loadClient();
});


function loadPropertie() {
    Execute(scanInfo('loadPropertie', false), 'General/CtlGeneral', '', 'buildSelect(info,"selPropertie");');
}

function loadClient() {
    Execute(scanInfo('loadClient', false), 'General/CtlGeneral', '', 'buildSelect(info,"selClient");');
}


function save() {
    if (validateForm() === true) {
        /*Se define el array de datos adicionales como un objeto, debido a que es necesario pasarlo por referencia para el llenado de los archivos*/
        var infoPlus = {
            temp: new Array()
        };
        /*Se manda por referencia el objeto de la info adicional donde se añadiran los archivos, junto el el objeto que tiene la informacion real de todos los archivos*/
        addFileNameAndEncodingAndDeletedFiles(infoPlus, objFileContract, 'Contract');

        Execute(scanInfo('save', true, '', infoPlus.temp), 'Contract/CtlPropertieContract', '', 'closeWindow();list();limpiarMultimedia();', '', 'Ha superado el tamaño maximo de las imagenes');
    }
}

function list() {
    Execute(scanInfo('list'), 'Contract/CtlPropertieContract', '', 'buildPaginator(info);');
}


function search(id) {
    $("#txtId").val(id);
    Execute(scanInfo('search', true), 'Contract/CtlPropertieContract', '', 'showData(info);');
}


function showData(info) {
    refreshSelect("selClient", info[0].cliente);
    refreshSelect("selPropertie", info[0].inmueble);
    $("#txtFirmDate").val(info[0].fecha_contrato);
    $("#txtStartDate").val(info[0].fecha_inicio);
    $("#txtEndDate").val(info[0].fecha_fin);
    $("#txtContractValue").val(info[0].valor_contrato);
    $("#txtTermContract").val(info[0].plazo_contrato);
    $("#txtWayPay").val(info[0].forma_pago);

    /*Se organiza el archivo cargado desde la base de datos, estableciendo su codificacion
     * y todas sus caracteristicas*/
    var nombreContrato = organizarArchivoCargadoDesdeBD(info[0].ruta_contrato, objFileContract);

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

        Execute(scanInfo('update', true, '', infoPlus.temp), 'Contract/CtlPropertieContract', '', 'closeWindow();list();');
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

    Execute(scanInfo('delete', true, '', infoPlus.temp), 'Contract/CtlPropertieContract', '', 'closeWindow("ModalConfirm");list();cleanForm("ModalNew");limpiarMultimedia();');
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







