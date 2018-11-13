/* Funciones jQuery */
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
    loadOfferType();
    search(1);
    searchPropertieByClient(1);
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


function showDataPropertie(info) {
    var listado = "";
    if (info !== undefined && info !== "" && info !== null) {
        for (var x = 0; x < info.length; x++) {

            listPropertiesId.push(info[x].id);
            listado += "<div class='post'>\n\
                            <div class='user-block'>\n\
                                <img class='img-circle img-bordered-sm' src='../Resources/public/image/user6-128x128.jpg' alt='User Image'>\n\
                                <span class='username'>\n\
                                    <a href='#'>" + info[x].nombre_tipo_oferta + " - "+ info[x].nombre_ciudad +"</a><a href='#' class='pull-right btn-box-tool'>\n\
                                        <i class='fa fa-times'></i>\n\
                                    </a>\n\
                                </span>\n\
                                <span class='description titulosPrincipales'>Valor: $"+parseInt(info[x].precio).toLocaleString()+" -  Administración: $"+parseInt(info[x].costo_administracion).toLocaleString()+"\n\
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




//    $("#txtIdPDFPropertie").val(info[0].id);
//    $("#txtPrice").val(info[0].precio);
//    $("#txtAdministrationCost").val(info[0].costo_administracion);
//    $("#txtRoom").val(info[0].habitaciones);
//    $("#txtBath").val(info[0].banios);
//    $("#txtParking").val(info[0].parqueaderos);
//    $("#txtTotalArea").val(info[0].area_total);
//    $("#txtAreasWithoutBalconies").val(info[0].area_sin_balcones);
//    $("#txtBuildYear").val(info[0].anio_de_construccion);
//    $("#txtNumeroPiso").val(info[0].numero_piso);
//    refreshCheckbox("chkChimenea", info[0].chimenea);
//    refreshCheckbox("chkEstudio", info[0].estudio);
//    refreshCheckbox("chkDeposito", info[0].deposito);
//    refreshCheckbox("chkZonaRopas", info[0].zona_ropas);
//    refreshCheckbox("chkParqueaderoVisitante", info[0].parqueadero_visitantes);
//    refreshCheckbox("chkAscensor", info[0].ascensor);
//    refreshCheckbox("chkTerraza", info[0].terraza);
//    refreshCheckbox("chkTransportePublicoCercano", info[0].transporte_publico_cercano);
//    refreshCheckbox("chkSalonComunal", info[0].salon_comunal);
//    refreshCheckbox("chkSauna", info[0].sauna);
//    refreshCheckbox("chkTurco", info[0].turco);
//    refreshCheckbox("chkJacuzzi", info[0].jacuzzi);
//    refreshCheckbox("chkZonaInfantil", info[0].zona_infantil);
//    refreshCheckbox("chkJardines", info[0].jardines);
//    refreshCheckbox("chkDuplex", info[0].duplex);
//    refreshCheckbox("chkPuertaSeguridad", info[0].puerta_de_seguridad);
//    refreshCheckbox("chkGimnasio", info[0].gimnasio);
//    refreshCheckbox("chkPrecioNegociable", info[0].precio_negociable);
//    refreshCheckbox("chkPiscina", info[0].piscina);
//    refreshCheckbox("chkZonaMascotas", info[0].zona_mascotas);
//    refreshCheckbox("chkParqueaderoCubierto", info[0].parqueadero_cubierto);
//    refreshCheckbox("chkAmoblado", info[0].amoblado);
//    refreshSelect("selState", info[0].id_departamento);
//    refreshSelect("selCity", info[0].id_ciudad);
//    refreshSelect("selBarrio", info[0].id_barrio);
//    refreshSelect("selStratum", info[0].id_estrato);
//    refreshSelect("selPropertieType", info[0].id_tipo_inmueble);
//    refreshSelect("selOfferType", info[0].id_tipo_oferta);
//    refreshSelect("selCurtainType", info[0].id_tipo_cortina);
//    refreshSelect("selVigilanceType", info[0].id_tipo_vigilancia);
//    refreshSelect("selZone", info[0].id_zona);
//    refreshSelect("selStatus", info[0].estado);
//    refreshSelect("selViewType", info[0].id_tipo_vista);
//    refreshSelect("selKitchenType", info[0].id_tipo_cocina);
//    refreshSelect("selKitchenStructure", info[0].id_estructura_cocina);
//    refreshSelect("selFloorType", info[0].id_tipo_piso);
//    refreshSelect("selClient", info[0].cedula_cliente);
//    refreshSelect("selOutstandingType", info[0].id_tipo_destacado);
//    $("#txtPublicationDate").val(info[0].fecha_publicacion);
//    $("#txtReceptionDate").val(info[0].fecha_recepcion);
//    $("#txtLinderos").val(info[0].linderos_inmbueble);
//    $("#txtMatriculaInmobiliaria").val(info[0].matricula_inmobiliaria);
//    $("#txtAvaluoCatastral").val(info[0].avaluo_catastral);
//    /*Se añade el punto del gps*/
//    addMarker(new google.maps.LatLng(info[0].latitud, info[0].longitud));
//    /*Se cargan las imagenes y videos*/
//    loadVideosPropertie(info[0].id);
//    loadImagesPropertie(info[0].id);
//    openWindow();
//    showButton(false);
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



function buildEventsClient(info) {
    if (info.length > 0) {
        var listado = "";
        for (f = 0; f < info.length; f++) {

            listado += "<div class='post'>\n\
                    <div class='user-block'>\n\
                        <img class='img-circle img-bordered-sm' src='../Resources/public/image/user1-128x128.jpg' alt='user image'>\n\
                        <span class='username'><a href='#'>" + info[f].nombreempleado + "</a>\n\
                            <a href='#' class='pull-right btn-box-tool'>\n\
                                <i class='fa fa-times'></i>\n\
                            </a>\n\
                        </span>\n\
                        <span class='description'> Fecha: " + info[f].fecha + " - Hora: " + info[f].hora + "\n\
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



