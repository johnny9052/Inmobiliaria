/* Funciones jQuery */
$(window).on("load", function (e) {
    var idClient = getUrlParameter('idFilter');
    var idPropertie = getUrlParameter('idFilter');
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
    loadOfferType();
    search(idClient);
    searchPropertieByClient(idClient);
});

var listPropertiesId = new Array();

function loadTipoIdentificacion() {
    Execute(scanInfo('loadTipoIdentificacion', false), 'General/CtlGeneral', '', 'buildSelect(info,"selDocumentType");');
}

function loadOfferType() {
    Execute(scanInfo('loadOfferType', false), 'General/CtlGeneral', '', 'buildSelect(info,"selOfferType");');
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

    /*Se define el array de datos adicionales como un objeto, debido a que es necesario pasarlo por referencia para el llenado de los archivos*/
    var infoPlus = {
        temp: new Array()
    };
    infoPlus.temp.push({datos: ["id", id]});
    Execute(scanInfo('search', false, '', infoPlus.temp), 'Client/CtlProfileClient', '', 'showData(info);');
}

function searchPropertieByClient(id) {

    /*Se define el array de datos adicionales como un objeto, debido a que es necesario pasarlo por referencia para el llenado de los archivos*/
    var infoPlus = {
        temp: new Array()
    };
    infoPlus.temp.push({datos: ["client", id]});
    Execute(scanInfo('listbydata', false, '', infoPlus.temp), 'Propertie/CtlPropertie', '', 'showDataPropertie(info);');
}

function searchTimeLineByClient(id) {

    /*Se define el array de datos adicionales como un objeto, debido a que es necesario pasarlo por referencia para el llenado de los archivos*/
    var infoPlus = {
        temp: new Array()
    };
    infoPlus.temp.push({datos: ["id", id]});
    Execute(scanInfo('SearchEventsClient', false, '', infoPlus.temp), 'Client/CtlProfileClient', '', 'buildTimeLine(info);');
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
    showImageClient(info);
    loadEventsClient(info[0].id);
    searchTimeLineByClient(info[0].id);

}


function showImageClient(info) {
    var listado = "<img class='profile-user-img img-responsive img-circle' src='" + ((info[0].foto_cliente).split("System/")[1]) + "' class='img-circle' alt='Foto cliente'>";
    $("#divImageClient").html(listado);
}

function showDataPropertie(info) {
    var listado = "";
    if (info !== undefined && info !== "" && info !== null) {
        for (var x = 0; x < info.length; x++) {

            listPropertiesId.push(info[x].id);
            listado += "<div class='post'>\n\
                            <div class='user-block'>\n\
                                <img class='img-circle img-bordered-sm' src='../Resources/public/image/iconoinmueblecliente.png' alt='User Image'>\n\
                                <span class='username'>\n\
                                    <a href='#' data-dismiss='modal' onclick='loadInfoPropertieForm(" + listPropertiesId[x] + ");'>" + info[x].nombre_tipo_oferta + " - " + info[x].nombre_ciudad + "</a><a href='#' class='pull-right btn-box-tool'>\n\
                                        <i class='fa fa-times'></i>\n\
                                    </a>\n\
                                </span>\n\
                                <span class='description titulosPrincipales'><b>Valor: $</b>" + parseInt(info[x].precio).toLocaleString() + " -  <b>Administración: $</b>" + parseInt(info[x].costo_administracion).toLocaleString() + "\n\
                                </span>\n\
                            </div>\n\
                            <!-- /.user-block -->\n\
                            <div class='row margin-bottom' id='divGalleryPropertie" + info[x].id + "'>\n\
                            </div>\n\
                            <!-- /.row -->\n\
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
            $("#divInmueblesClientes").html(listado);
        }
    }


    for (var j = 0; j < listPropertiesId.length; j++) {
        loadImagesPropertie(listPropertiesId[j]);
    }
}


function loadImagesPropertie(id) {
    Execute(scanInfo('loadImage', false, '', [{datos: ["id", id]}]), 'Propertie/CtlPropertie', '', 'setImagesPropertie(info);');
}


function setImagesPropertie(info) {


    var id = "";
    var listado = "";
    var limite = info.length;

    if (limite > 3) {
        limite = 3;
    }
    if (info !== undefined && info !== "" && info !== null) {
        for (var x = 0; x < limite; x++) {

            id = "divGalleryPropertie" + info[x].id_inmueble;


            if (x === 0) {
                listado += "<div class='col-sm-6'>\n\
                                <img class='img-responsive' src='" + ((info[x].url_file).split("System/")[1]) + "' alt='Photo'>\n\
                            </div><!-- /.col -->\n\
                            <div class='col-sm-6'>\n\
                                <div class='row'>";
            } else {
                if (x === 2) {
                    x++;
                }

                listado += "<div class='col-sm-6'>\n\
                                    <img class='img-responsive' src='" + ((info[x].url_file).split("System/")[1]) + "' alt='Photo'><br>\n\
                                    <img class='img-responsive' src='" + ((info[x + 1].url_file).split("System/")[1]) + "' alt='Photo'>\n\
                                </div>";

            }
            if (x === limite - 1) {
                listado += "    </div><!-- /.row -->\n\
                                </div>";
            }

        }
        $("#" + id).html(listado);
    }
}

function loadEventsClient(id) {

    /*Se define el array de datos adicionales como un objeto, debido a que es necesario pasarlo por referencia para el llenado de los archivos*/
    var infoPlus = {
        temp: new Array()
    };
    infoPlus.temp.push({datos: ["id", id]});
    Execute(scanInfo('SearchEventsClient', false, '', infoPlus.temp), 'Client/CtlProfileClient', '', 'buildEventsClient(info);');
}

function buildTimeLine(info) {
    
    if (info.length > 0) {
        var listado = "";
        for (f = 0; f < info.length; f++) {

            listado += "<ul class='timeline timeline-inverse'>\n\
                <!-- timeline time label -->\n\
                <li class='time-label'>\n\
                    <span class='bg-red'>" + info[f].fecha + "</span>\n\
                </li>\n\
                <!-- /.timeline-label -->\n\
                <!-- timeline item -->\n\
                <li>\n\
                    <i class='fa fa-envelope bg-blue'></i>\n\
                    <div class='timeline-item'>\n\
                        <span class='time'>\n\
                            <i class='fa fa-clock-o'></i> "+info[f].hora+"\n\
                        </span>\n\
                        <h3 class='timeline-header'>\n\
                            <a href='#'>"+info[f].tipoEvento+"</a> \n\
                        </h3>\n\
                        <div class='timeline-body'>"+info[f].observaciones+"\n\
                        </div>\n\
                        <div class='timeline-footer'>\n\
                            <a class='btn btn-primary btn-xs'>Read more</a>\n\
                            <a class='btn btn-danger btn-xs'>Delete</a>\n\
                        </div>\n\
                    </div>\n\
                </li>\n\
                <!-- END timeline item -->\n\
                <!-- timeline item -->\n\
                <li>\n\
                    <i class='fa fa-user bg-aqua'></i>\n\
                    <div class='timeline-item'>\n\
                        <span class='time'>\n\
                            <i class='fa fa-clock-o'></i> 5 mins ago\n\
                        </span>\n\
                            <h3 class='timeline-header no-border'>\n\
                                <a href='#'>Sarah Young</a> accepted your friend request\n\
                            </h3>\n\
                    </div>\n\
                </li><!-- END timeline item -->\n\
                <!-- timeline item -->\n\
                <li>\n\
                    <i class='fa fa-comments bg-yellow'></i>\n\
                    <div class='timeline-item'>\n\
                        <span class='time'>\n\
                            <i class='fa fa-clock-o'></i> 27 mins ago\n\
                        </span>\n\
                            <h3 class='timeline-header'>\n\
                                <a href='#'>Jay White</a> commented on your post\n\
                            </h3>\n\
                            <div class='timeline-body'>Take me to your leader! Switzerland is small and neutral! We are more like Germany, ambitious and misunderstood!</div>\n\
                            <div class='timeline-footer'>\n\
                                <a class='btn btn-warning btn-flat btn-xs'>View comment</a>\n\
                            </div>\n\
                    </div>\n\
                </li><!-- END timeline item -->\n\
                <!-- timeline time label -->\n\
                <li class='time-label'>\n\
                    <span class='bg-green'>3 Jan. 2014</span>\n\
                </li><!-- /.timeline-label -->\n\
                <!-- timeline item -->\n\
                <li>\n\
                    <i class='fa fa-camera bg-purple'></i>\n\
                    <div class='timeline-item'>\n\
                        <span class='time'>\n\
                            <i class='fa fa-clock-o'></i> 2 days ago\n\
                        </span>\n\
                        <h3 class='timeline-header'>\n\
                            <a href='#'>Mina Lee</a> uploaded new photos\n\
                        </h3>\n\
                        <div class='timeline-body'>\n\
                            <img src='http://placehold.it/150x100' alt='...' class='margin'>\n\
                            <img src='http://placehold.it/150x100' alt='...' class='margin'>\n\
                            <img src='http://placehold.it/150x100' alt='...' class='margin'>\n\
                            <img src='http://placehold.it/150x100' alt='...' class='margin'>\n\
                        </div>\n\
                    </div>\n\
                </li><!-- END timeline item -->\n\
                <li>\n\
                    <i class='fa fa-clock-o bg-gray'></i>\n\
                </li>\n\
            </ul>";
            $("#divTimeLine").html(listado);
        }
    }
}


function buildEventsClient(info) {
    if (info.length > 0) {
        var listado = "";
        for (f = 0; f < info.length; f++) {

            listado += "<div class='post'>\n\
                    <div class='user-block'>\n\
                        <img class='img-circle img-bordered-sm' src='" + ((info[f].fotoempleado).split("System/")[1]) + "' alt='user image'>\n\
                        <span class='username'><a href='#'>" + info[f].nombreempleado + "</a>\n\
                            <a href='#' class='pull-right btn-box-tool'>\n\
                                <i class='fa fa-times'></i>\n\
                            </a>\n\
                        </span>\n\
                        <span class='description'> <b>Fecha:</b> " + info[f].fecha + " - <b>Hora:</b> " + info[f].hora + " - <b>Lugar:</b> " + info[f].lugar + "\n\
                        </span>\n\
                    </div>\n\
                        <!-- /.user-block -->\n\
                        <p>" + info[f].observaciones + "</p> \n\
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



function loadInfoClientForm() {
    redirectInfoFilter('Client/Client', getUrlParameter('idFilter'));
}


function loadInfoPropertieForm(idPropertie) {
    redirectInfoFilter('Propertie/Propertie', idPropertie);
}

