var objFileContract = {
    listFileBase64: new Array(),
    listFileName: new Array(),
    listFileURL: new Array(),
    listFileNameDeleted: new Array()
};

var objDeudores = {
    /*Atributo con el mismo nombre del objeto, para poder pasarlo como referencia
     * con innerHTML*/
    name: 'objDeudores',
    listElements: new Array(),
    listNameElements: new Array()
};


/* Funciones jQuery */
$(window).on("load", function (e) {
    list();
    loadPropertie();
    loadClient();
    loadContractTypeCheckbox();
    loadDebtor();
    loadTipoIdentificacion();
    loadDepartment();
    loadCity(-1);
    loadCityResidence(-1);
    loadMaritalStatus();
});

function loadTipoIdentificacion() {
    Execute(scanInfo('loadTipoIdentificacion', false), 'General/CtlGeneral', '', 'buildSelect(info,"selDocumentType");');
}


function loadDepartment() {
    Execute(scanInfo('loadDepartment', false), 'General/CtlGeneral', '', 'buildSelect(info,"selStateExpedition");buildSelect(info,"selStateResidence");');
}


function loadCity(id) {
    Execute(scanInfo('loadCity', false, '', [{datos: ["id", id]}]), 'General/CtlGeneral', '', 'buildSelect(info,"selCityExpedition");');
}


function loadCityResidence(id) {
    Execute(scanInfo('loadCity', false, '', [{datos: ["id", id]}]), 'General/CtlGeneral', '', 'buildSelect(info,"selCityResidence");');
}

function loadMaritalStatus() {
    Execute(scanInfo('loadMaritalStatus', false), 'General/CtlGeneral', '', 'buildSelect(info,"selMaritalStatus");');
}

function loadPropertie() {
    Execute(scanInfo('loadPropertie', false), 'General/CtlGeneral', '', 'buildSelect(info,"selPropertie");');
}

function loadClient() {
    Execute(scanInfo('loadClient', false), 'General/CtlGeneral', '', 'buildSelect(info,"selClient");');
}

function loadDebtor() {
    Execute(scanInfo('loadDebtor', false), 'General/CtlGeneral', '', 'buildSelect(info,"selDebtor");');
}

function abrirModalDebtor() {
            /*Se cierra el modal actual, se indica que no se limpia el formualrio, 
         * y es abre el modal para el registro del barrio*/
        closeWindow('ModalNew', false, 'ModalNewDebtor'); 
}


/**
 * Se almacena un nuevo deudor 
 * @returns {void}
 * @author David Alberto Angarita García
 * @version 0.1
 */
function saveNewDebtor() {
    /*Para la validacion, se manda el id del form a mapear y el id del modal de 
     * dicho form, por si sucede un error, vuelva a dicho modal*/
    if (validateForm('FormContainerDebtor', 'ModalNewDebtor') === true) {

        Execute(scanInfo('save', true, 'FormContainerDebtor'), 'Contract/CtlDebtor', '', 'loadDebtor();cleanForm("ModalNewDebtor");',
                'ModalNewDebtor');
    }
}


function save() {
    if (objDeudores.listElements.length > 0) {
        if (validateForm() === true) {
            /*Se define el array de datos adicionales como un objeto, debido a que es necesario pasarlo por referencia para el llenado de los archivos*/
            var infoPlus = {
                temp: new Array()
            };

            /*Se manda por referencia el objeto de la info adicional donde se añadiran los archivos, junto el el objeto que tiene la informacion real de todos los archivos*/
            addFileNameAndEncodingAndDeletedFiles(infoPlus, objFileContract, 'Contract');

            infoPlus.temp.push({datos: scanCheckboxDinamic("typesContractSelecteds", "ContractType")});

            infoPlus.temp.push({datos: scanDataLabelDinamic("listDebtor", "deudor", true, "deudor")});



            Execute(scanInfo('save', true, '', infoPlus.temp), 'Contract/CtlPropertieContract', '', 'closeWindow();list();limpiarMultimedia();', '', 'Ha superado el tamaño maximo del archivo');
            //Execute(scanInfo('save', true, '', [{datos: scanCheckboxDinamic("typesContractSelecteds", "ContractType")}]),
        }
    } else {
        showToast("Por favor registre un deudor", "error");
    }

}

function list() {
    Execute(scanInfo('list'), 'Contract/CtlPropertieContract', '', 'buildPaginator(info);');
}


function search(id) {
    $("#txtId").val(id);
    Execute(scanInfo('search', true),
            'Contract/CtlPropertieContract',
            '',
            'showData(info);CheckCheckboxChecked("loadTypesContractSelecteds","ContractType");');
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

    loadDebtorContract(info[0].id);

    openWindow();
    showButton(false);
}


function update() {
    if (objDeudores.listElements.length > 0) {
        if (validateForm() === true) {

            /*Se define el array de datos adicionales como un objeto, debido a que es necesario pasarlo por referencia para el llenado de los archivos*/
            var infoPlus = {
                temp: new Array()
            };

            /*Se manda por referencia el objeto de la info adicional donde se añadiran los archivos, junto el el objeto que tiene la informacion real de todos los archivos*/
            addFileNameAndEncodingAndDeletedFiles(infoPlus, objFileContract, 'Contract');

            infoPlus.temp.push({datos: scanCheckboxDinamic("typesContractSelecteds", "ContractType")});

            infoPlus.temp.push({datos: scanDataLabelDinamic("listDebtor", "deudor", true, "deudor")});

            Execute(scanInfo('update', true, '', infoPlus.temp), 'Contract/CtlPropertieContract', '', 'closeWindow();list();limpiarMultimedia();', '', 'Ha superado el tamaño maximo de las imagenes');
        }
    } else {
        showToast("Por favor registre un deudor", "error");
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

function loadContractTypeCheckbox() {
    Execute(scanInfo('loadCheckboxContractType', false),
            'General/CtlGeneral',
            '',
            'BuildCheckbox(info,"FormContainerCheckboxContractType", "ContractType");');
    /*BuildCheckbox("Info que llega","Id del contenedor", "Nombre de los checks");')*/
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
    $("#listDebtor").html("");
    objDeudores.listElements = new Array();
    objDeudores.listNameElements = new Array();

}


function agregarDeudorContrato() {

    var nombreDeudor = $("#selDebtor option:selected").text();
    var idDeudor = $("#selDebtor").val();
    var incluido = false;
    for (var x = 0; x < objDeudores.listNameElements.length; x++) {
        if (nombreDeudor === objDeudores.listNameElements[x]) {
            incluido = true;
        }
    }
    if (incluido === false) {
        if (idDeudor !== -1 && idDeudor !== "-1") {
            objDeudores.listElements.push(parseInt(idDeudor));
            objDeudores.listNameElements.push(nombreDeudor);
            listarDeudores(objDeudores.listElements, objDeudores.listNameElements);
        }
    }else{
        showToast("El deudor ya se encuentra en la lista", "error");
    }





}


function listarDeudores(listId, listName) {

    var content = "";

    var label = "";
    var labelX = "";

    for (var x = 0; x < listId.length; x++) {
        label = "<label id='deudor" + listId[x] + "' class='dinamicLabelData'>" + listName[x] + "</label>";
        labelX = "<label id='cerrar' onclick='eliminarDeudorContrato(" + listId[x] + ");' class = 'seleccionable'>  (X) </label>";
        content += "<br>" + label + labelX;
    }

    $("#listDebtor").html(content);
}

function eliminarDeudorContrato(idDeudor) {

    var pos = objDeudores.listElements.indexOf(idDeudor);
    
    if (pos !== -1) {
        objDeudores.listElements.splice(pos, 1);
        objDeudores.listNameElements.splice(pos, 1);
        listarDeudores(objDeudores.listElements, objDeudores.listNameElements);
    }
}


function loadDebtorContract(id) {
    Execute(scanInfo('loadDebtorContract', false, '', [{datos: ["id", id]}]), 'Contract/CtlPropertieContract', '', 'agregarDeudorFromDB(info);');
}


function agregarDeudorFromDB(info) {
    /*Se agregan todos los datos a la lista, y se pintan*/
    for (var x = 0; x < info.length; x++) {
        if (info[x].dinamic_data !== "") {
            objDeudores.listElements.push(parseInt(info[x].id));
            objDeudores.listNameElements.push(info[x].dinamic_data);
        }
    }
    listarDeudores(objDeudores.listElements, objDeudores.listNameElements);
}