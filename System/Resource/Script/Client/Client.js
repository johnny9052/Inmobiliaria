/* Funciones jQuery */

var objImageClient = {
    listFileBase64: new Array(),
    listFileName: new Array(),
    listFileURL: new Array(),
    listFileNameDeleted: new Array()
};
$(window).on("load", function (e) {
    list();
    loadTipoIdentificacion();
    loadDepartment();
    loadGender();
    loadProfessionNivel();
    loadCity(-1);
    loadCityResidence(-1);
    loadProfession(-1);
    loadMaritalStatus();
    loadPersonType();
    loadClientTypeCheckbox();
    if (getUrlParameter('idFilter') !== undefined) {
        showToast('Cargando... por favor espere');
        executeWithTime("profileClientAction();", '2000');
    }
});
function profileClientAction() {
    var idClient = getUrlParameter('idFilter');
    if (idClient !== undefined) {
        $("#txtId").val(idClient);
        closeWindow('modal-default');
        executeWithTime("searchIntoModal();", 500);
    }

}


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


function loadClientTypeCheckbox() {
    Execute(scanInfo('loadCheckboxClientType', false),
            'General/CtlGeneral',
            '',
            'BuildCheckbox(info,"FormContainerCheckboxClientType", "ClientType");');
    /*BuildCheckbox("Info que llega","Id del contenedor", "Nombre de los checks");')*/
}

function mostrarMensaje() {
    showToast("Almacenado correctamente", "success", "ModalNew");
    showButtonEmployee(false);
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

        addFileNameAndEncodingAndDeletedFiles(infoPlus, objImageClient, 'ClientImage');
        infoPlus.temp.push({datos: scanCheckboxDinamic("typesClientSelecteds", "ClientType")});
        Execute(scanInfo('save', true, '', infoPlus.temp),
                'Client/CtlClient',
                '',
                'closeWindow();list();mostrarMensaje();', '', 'Ha superado el tamaño maximo de las imagenes', '', true);
    }
}

function list() {
    Execute(scanInfo('list'), 'Client/CtlClient', '', 'buildPaginator(info);');
}


function search(id) {
    $("#txtId").val(id);
    redirectInfoFilter('Client/ProfileClient');
}


function searchIntoModal() {
    Execute(scanInfo('search', true),
            'Client/CtlClient',
            '',
            'showData(info);CheckCheckboxChecked("loadClientTypeSelected","ClientType");');
}



function showData(info) {
    $("#txtId").val(info[0].id);
    $("#txtDocumentNumber").val(info[0].cedula);
    $("#txtFirstName").val(info[0].primer_nombre);
    $("#txtSecondName").val(info[0].segundo_nombre);
    $("#txtFirstLastName").val(info[0].primer_apellido);
    $("#txtSecondLastName").val(info[0].segundo_apellido);
    $("#txtAddress").val(info[0].direccion);
    $("#txtHomePhone").val(info[0].telefono);
    $("#txtMobilePhone").val(info[0].celular);
    $("#txtEmail").val(info[0].email);
    refreshSelect("selGender", info[0].genero);
    $("#txtBirthdate").val(info[0].fecha);
    refreshSelect("selCityResidence", info[0].id_ciudad_residencia);
    refreshSelect("selDocumentType", info[0].id_tipo_identificacion);
    refreshSelect("selCityExpedition", info[0].id_ciudad_expedicion);
    refreshSelect("selMaritalStatus", info[0].estado_civil);
    refreshSelect("selProfession", info[0].id_profesion);
    refreshSelect("selPersonType", info[0].id_tipo_persona);
    refreshSelect("selProfessionNivel", info[0].nivel_profesional);
    refreshSelect("selStateExpedition", info[0].departamento_expedicion);
    refreshSelect("selStateResidence", info[0].departamento_residencia);
    var nombreArchivoFoto = "";
    if (info[0].foto_cliente !== null && info[0].foto_cliente !== undefined) {
        nombreArchivoFoto = organizarArchivoCargadoDesdeBD(info[0].foto_cliente, objImageClient);
    }
    $("#lstArchivoFoto").html(imageDownloadFile("jpg", objImageClient.listFileURL[objImageClient.listFileName.indexOf(nombreArchivoFoto)], nombreArchivoFoto));
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

        addFileNameAndEncodingAndDeletedFiles(infoPlus, objImageClient, 'ClientImage');
        infoPlus.temp.push({datos: scanCheckboxDinamic("typesClientSelecteds", "ClientType")});
        Execute(scanInfo('update', true, '', infoPlus.temp),
                'Client/CtlClient',
                '',
                'closeWindow();list();limpiarMultimedia();', '', 'Ha superado el tamaño maximo de las imagenes');
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

    addAllFileNameDeleted(infoPlus, objImageClient, 'ClientImage');
    Execute(scanInfo('delete', true, '', infoPlus.temp), 'Client/CtlClient', '', 'closeWindow("ModalConfirm");list();cleanForm("ModalNew");limpiarMultimedia();');
}


/**
 * Se limpia o reinicia todos los elementos involucrados en los videos e imagenes
 * @returns {void}
 * @author Johnny Alexander Salazar
 * @version 0.1
 */
function limpiarMultimedia() {
    objImageClient = new Array();
    objImageClient.listFileName = new Array();
    objImageClient.listFileURL = new Array();
    objImageClient.listFileBase64 = new Array();
    objImageClient.listFileNameDeleted = new Array();
    $("#lstArchivoFoto").html("");
}




function closeWindowToFilterClient() {
    
    var idClient = getUrlParameter('idFilter');

    if (idClient !== undefined) {
        redirectInfoFilter('Client/ProfileClient', idClient);
    } else {
        closeWindow();
    }
}