/* Funciones jQuery */
$(window).on("load", function (e) {
//    list();
//    loadTipoIdentificacion();
//    loadDepartment();
//    loadGender();
//    loadProfessionNivel();
//    loadCity(-1);
//    loadCityResidence(-1);
//    loadProfession(-1);
//    loadMaritalStatus();
//    loadPersonType();
//    loadClientTypeCheckbox();
    search(1);
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


function save() {
    if (validateForm() === true) {
        Execute(scanInfo('save', true, '', [{datos: scanCheckboxDinamic("typesClientSelecteds", "ClientType")}]),
                'Client/CtlProfileClient',
                '',
                'closeWindow();list();');
    }
}

function list() {
    Execute(scanInfo('list'), 'Client/CtlProfileClient', '', 'buildPaginator(info);');
}


function search(id) {
    $("#txtId").val(id);
    Execute(scanInfo('search', true), 'Client/CtlProfileClient', '', 'showData(info);');
}


function showData(info) {
    $("#lblNameClient").html(info[0].nombre);
    $("#lblProfession").html(info[0].profesion);
    $("#lblNumberProperties").html(info[0].cantidadinmuebles);
    $("#lblNumberContracts").html(info[0].cantidadcontratos);
    $("#lblNumberEvents").html(info[0].cantidadeventos);
    $("#lblCity").html(info[0].ciudad);
    $("#lblPhone").html(info[0].telefonos);
    $("#lblEmail").html(info[0].email);
    $("#lblPersonType").html(info[0].tipocliente);
    loadEventsClient(info[0].id);

}

function loadEventsClient(id) {
    $("#txtId").val(id);
    Execute(scanInfo('SearchEventsClient', true), 'Client/CtlProfileClient', '', 'buildEventsClient(info);');
}

function buildEventsClient(info) {
    if (info.length > 0) {
        var listado = "";
        alert(info.length);
        for (f = 0; f < info.length; f++) {

            listado += "<div class='post'>\n\
                    <div class='user-block'>\n\
                        <img class='img-circle img-bordered-sm' src='../Resources/public/image/user1-128x128.jpg' alt='user image'>\n\
                        <span class='username'><a href='#'>" + info[f].nombreempleado + "</a>\n\
                            <a href='#' class='pull-right btn-box-tool'>\n\
                                <i class='fa fa-times'></i>\n\
                            </a>\n\
                        </span>\n\
                        <span class='description'> Fecha: "+ info[f].fecha +" - Hora: "+info[f].hora+"\n\
                        </span>\n\
                    </div>\n\
                        <!-- /.user-block -->\n\
                        <p>"+info[f].observaciones +"</p> \n\
                        <ul class='list-inline'>\n\
                            <li>\n\
                                <a href='#' class='link-black text-sm'>\n\
                                    <i class='fa fa-share margin-r-5'></i> Share\n\
                                </a>\n\
                            </li>\n\
                            <li>\n\
                                <a href='#' class='link-black text-sm'>\n\
                                    <i class='fa fa-thumbs-o-up margin-r-5'></i> Like\n\
                                </a>\n\
                            </li>\n\
                            <li class='pull-right'>\n\
                                <a href='#' class='link-black text-sm'>\n\
                                    <i class='fa fa-comments-o margin-r-5'></i> Comments(5)\n\
                                </a>\n\
                            </li>\n\
                        </ul>\n\
                        <input class='form-control input-sm' type='text' placeholder='Type a comment'>\n\
                </div>";
        }
    }

    $("#divEventosClientes").html(listado);

}



function update() {
    if (validateForm() === true) {
        Execute(scanInfo('update', true, '', [{datos: scanCheckboxDinamic("typesClientSelecteds", "ClientType")}]),
                'Client/CtlProfileClient',
                '',
                'closeWindow();list();');
    }
}


function deleteInfo() {
    Execute(scanInfo('delete', true), 'Client/CtlProfileClient', '', 'closeWindow("ModalConfirm");list();cleanForm("ModalNew");');
}
