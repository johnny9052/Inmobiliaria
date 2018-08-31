var objFilePropertie = {
    name: 'objFilePropertie',
    listFileBase64: new Array(),
    listFileName: new Array(),
    listFileURL: new Array(),
    listFileNameDeleted: new Array()
};


var objURLVideosPropertie = {
    /*Atributo con el mismo nombre del objeto, para poder pasarlo como referencia
     * con innerHTML*/
    name: 'objURLVideosPropertie',
    listElements: new Array()
};



/* Funciones jQuery */
/* global markersListGlobal, google, URL */

$(window).on("load", function (e) {
    /*Se obtiene un posible filtro de busqueda, si es que existe*/
    var id = getUrlParameter('idFilter');
    list(id);
    loadDepartment();
    loadCity(-1);
    loadNeighborhood(-1);
    loadStratum();
    loadPropertieType();
    loadOfferType();
    loadCurtainType();
    loadVigilanceType();
    loadZone();
    loadViewType();
    loadKitchenType();
    loadKitchenStructure();
    loadFloorType();
    loadClient();
    loadOutstandingType();
});



function loadDepartment() {
    Execute(scanInfo('loadDepartment', false), 'General/CtlGeneral', '', 'buildSelect(info,"selState");');
}


function loadCity(id) {
    Execute(scanInfo('loadCity', false, '', [{datos: ["id", id]}]), 'General/CtlGeneral', '', 'buildSelect(info,"selCity");');
}


function loadNeighborhood(id) {
    Execute(scanInfo('loadNeighborhood', false, '', [{datos: ["id", id]}]), 'General/CtlGeneral', '', 'buildSelect(info,"selBarrio");');
}

function loadStratum() {
    Execute(scanInfo('loadStratum', false), 'General/CtlGeneral', '', 'buildSelect(info,"selStratum");');
}


function loadPropertieType() {
    Execute(scanInfo('loadPropertieType', false), 'General/CtlGeneral', '', 'buildSelect(info,"selPropertieType");');
}


function loadOfferType() {
    Execute(scanInfo('loadOfferType', false), 'General/CtlGeneral', '', 'buildSelect(info,"selOfferType");');
}


function loadCurtainType() {
    Execute(scanInfo('loadCurtainType', false), 'General/CtlGeneral', '', 'buildSelect(info,"selCurtainType");');
}


function loadVigilanceType() {
    Execute(scanInfo('loadVigilanceType', false), 'General/CtlGeneral', '', 'buildSelect(info,"selVigilanceType");');
}

function loadZone() {
    Execute(scanInfo('loadZone', false), 'General/CtlGeneral', '', 'buildSelect(info,"selZone");');
}


function loadViewType() {
    Execute(scanInfo('loadViewType', false), 'General/CtlGeneral', '', 'buildSelect(info,"selViewType");');
}

function loadStatus() {
    Execute(scanInfo('loadStatus', false), 'General/CtlGeneral', '', 'buildSelect(info,"selStatus");');
}

function loadKitchenType() {
    Execute(scanInfo('loadKitchenType', false), 'General/CtlGeneral', '', 'buildSelect(info,"selKitchenType");');
}


function loadKitchenStructure() {
    Execute(scanInfo('loadKitchenStructure', false), 'General/CtlGeneral', '', 'buildSelect(info,"selKitchenStructure");');
}


function loadFloorType() {
    Execute(scanInfo('loadFloorType', false), 'General/CtlGeneral', '', 'buildSelect(info,"selFloorType");');
}

function loadClient() {
    Execute(scanInfo('loadClient', false), 'General/CtlGeneral', '', 'buildSelect(info,"selClient");');
}


function loadOutstandingType() {
    Execute(scanInfo('loadOutstandingType', false), 'General/CtlGeneral', '', 'buildSelect(info,"selOutstandingType");');
}


function save() {
    /*Se valida el marcador seleccionado del gps*/
    if (markersListGlobal.length > 0) {
        if (validateForm() === true) {

            /*Se define el array de datos adicionales como un objeto, debido a que es necesario pasarlo por referencia para el llenado de los archivos*/
            var infoPlus = {
                temp: new Array()
            };

            /*Se obteien los datos de latitud - longitud*/
            var lat = markersListGlobal[0].getPosition().lat();
            var lng = markersListGlobal[0].getPosition().lng();

            /*Se añaden como datos adicionales*/
            infoPlus.temp.push({datos: ["lat", lat]});
            infoPlus.temp.push({datos: ["lng", lng]});


            /*Se manda por referencia el objeto de la info adicional donde se añadiran los archivos, junto el el objeto que tiene la informacion real de todos los archivos*/
            addFileNameAndEncodingAndDeletedFiles(infoPlus, objFilePropertie, '');


            /*Se agregan los videos que se agregaron dimanicamente*/
            infoPlus.temp.push({datos: prepareDinamicData("urlVideos", objURLVideosPropertie)});

            Execute(scanInfo('save', true, '', infoPlus.temp), 'Propertie/CtlPropertie', '', ' closeWindow();list();deleteMarkers();limpiarMultimedia();', '', 'Ha superado el tamaño maximo de las imagenes');
        }
    } else {
        showToast("Seleccione un punto en el mapa", "error");
    }
}


function list(id) {

    /*Se agrega un posible filtro del listado*/
    var infoPlus = {
        temp: new Array()
    };
    infoPlus.temp.push({datos: ["idFilter", id]});

    Execute(scanInfo('list', false, '', infoPlus.temp), 'Propertie/CtlPropertie', '', 'buildPaginator(info);');
}


function search(id) {
    $("#txtId").val(id);
    Execute(scanInfo('search', true), 'Propertie/CtlPropertie', '', 'showData(info);');
}


function showData(info) {
    $("#txtId").val(info[0].id);
    $("#txtPrice").val(info[0].precio);
    $("#txtAdministrationCost").val(info[0].costo_administracion);
    $("#txtRoom").val(info[0].habitaciones);
    $("#txtBath").val(info[0].banios);
    $("#txtParking").val(info[0].parqueaderos);
    $("#txtTotalArea").val(info[0].area_total);
    $("#txtAreasWithoutBalconies").val(info[0].area_sin_balcones);
    $("#txtBuildYear").val(info[0].anio_de_construccion);
    $("#txtNumeroPiso").val(info[0].numero_piso);
    refreshCheckbox("chkChimenea", info[0].chimenea);
    refreshCheckbox("chkEstudio", info[0].estudio);
    refreshCheckbox("chkDeposito", info[0].deposito);
    refreshCheckbox("chkZonaRopas", info[0].zona_ropas);
    refreshCheckbox("chkParqueaderoVisitante", info[0].parqueadero_visitantes);
    refreshCheckbox("chkAscensor", info[0].ascensor);
    refreshCheckbox("chkTerraza", info[0].terraza);
    refreshCheckbox("chkTransportePublicoCercano", info[0].transporte_publico_cercano);
    refreshCheckbox("chkSalonComunal", info[0].salon_comunal);
    refreshCheckbox("chkSauna", info[0].sauna);
    refreshCheckbox("chkTurco", info[0].turco);
    refreshCheckbox("chkJacuzzi", info[0].jacuzzi);
    refreshCheckbox("chkZonaInfantil", info[0].zona_infantil);
    refreshCheckbox("chkJardines", info[0].jardines);
    refreshCheckbox("chkDuplex", info[0].duplex);
    refreshCheckbox("chkPuertaSeguridad", info[0].puerta_de_seguridad);
    refreshCheckbox("chkGimnasio", info[0].gimnasio);
    refreshCheckbox("chkPrecioNegociable", info[0].precio_negociable);
    refreshCheckbox("chkPiscina", info[0].piscina);
    refreshCheckbox("chkZonaMascotas", info[0].zona_mascotas);
    refreshCheckbox("chkParqueaderoCubierto", info[0].parqueadero_cubierto);
    refreshCheckbox("chkAmoblado", info[0].amoblado);
    refreshSelect("selState", info[0].id_departamento);
    refreshSelect("selCity", info[0].id_ciudad);
    refreshSelect("selBarrio", info[0].id_barrio);
    refreshSelect("selStratum", info[0].id_estrato);
    refreshSelect("selPropertieType", info[0].id_tipo_inmueble);
    refreshSelect("selOfferType", info[0].id_tipo_oferta);
    refreshSelect("selCurtainType", info[0].id_tipo_cortina);
    refreshSelect("selVigilanceType", info[0].id_tipo_vigilancia);
    refreshSelect("selZone", info[0].id_zona);
    refreshSelect("selViewType", info[0].id_tipo_vista);
    refreshSelect("selKitchenType", info[0].id_tipo_cocina);
    refreshSelect("selKitchenStructure", info[0].id_estructura_cocina);
    refreshSelect("selFloorType", info[0].id_tipo_piso);
    refreshSelect("selClient", info[0].cedula_cliente);
    refreshSelect("selOutstandingType", info[0].id_tipo_destacado);
    $("#txtPublicationDate").val(info[0].fecha_publicacion);
    $("#txtReceptionDate").val(info[0].fecha_recepcion);
    $("#txtLinderos").val(info[0].linderos_inmbueble);
    $("#txtMatriculaInmobiliaria").val(info[0].matricula_inmobiliaria);
    $("#txtAvaluoCatastral").val(info[0].avaluo_catastral);
    /*Se añade el punto del gps*/
    addMarker(new google.maps.LatLng(info[0].latitud, info[0].longitud));
    /*Se cargan las imagenes y videos*/
    loadVideosPropertie(info[0].id);
    loadImagesPropertie(info[0].id);
    openWindow();
    showButton(false);
}





function update() {
    /*Se valida si se ha seleccionado un punto en el gps*/
    if (markersListGlobal.length > 0) {
        if (validateForm() === true) {
            /*Se define el array de datos adicionales como un objeto, debido a que es necesario pasarlo por referencia para el llenado de los archivos*/
            var infoPlus = {
                temp: new Array()
            };
            /*Se obtiene la latitud y longitud*/
            var lat = markersListGlobal[0].getPosition().lat();
            var lng = markersListGlobal[0].getPosition().lng();
            /*Se añaden*/
            infoPlus.temp.push({datos: ["lat", lat]});
            infoPlus.temp.push({datos: ["lng", lng]});
            /*Se manda por referencia el objeto de la info adicional donde se añadiran los archivos, junto el el objeto que tiene la informacion real de todos los archivos*/
            addFileNameAndEncodingAndDeletedFiles(infoPlus, objFilePropertie, '');
            /*Se agregan los videos que se agregaron dimanicamente*/
            infoPlus.temp.push({datos: prepareDinamicData("urlVideos", objURLVideosPropertie)});
            Execute(scanInfo('update', true, '', infoPlus.temp), 'Propertie/CtlPropertie', '', ' closeWindow();list();deleteMarkers();limpiarMultimedia();');
        }
    } else {
        showToast("Seleccione un punto en el mapa", "error");
    }
}


function deleteInfo() {
    /*Se define el array de datos adicionales como un objeto, debido a que 
     * es necesario pasarlo por referencia para el llenado de los archivos*/
    var infoPlus = {
        temp: new Array()
    };
    /*Se manda por referencia el objeto de la info adicional donde se añadiran los archivos, junto el el objeto que tiene la informacion real de todos los archivos*/
    addAllFileNameDeleted(infoPlus, objFilePropertie, '');
    Execute(scanInfo('delete', true, '', infoPlus.temp), 'Propertie/CtlPropertie', '', 'closeWindow("ModalConfirm");list();cleanForm("ModalNew");deleteMarkers();limpiarMultimedia();');
}



/**
 * Determina si se ha escogido un municipio para saber si se puede agregar un 
 * nuevo barrio
 * @returns {void}
 * @author Johnny Alexander Salazar
 * @version 0.1
 */
function validarMunicipioSeleccionado() {
    /*Si no se ha escogido un barrio*/
    if ($('#selCity').val() === "-1") {
        showToast("No ha seleccionado ningun municipio", 'error', 'ModalNew');
    } else {
        /*Se cierra el modal actual, se indica que no se limpia el formualrio, 
         * y es abre el modal para el registro del barrio*/
        closeWindow('ModalNew', false, 'ModalNewDistrict');
    }
}



/**
 * Se almacena un nuevo barrio 
 * @returns {void}
 * @author Johnny Alexander Salazar
 * @version 0.1
 */
function saveNewDistrict() {
    /*Para la validacion, se manda el id del form a mapear y el id del modal de 
     * dicho form, por si sucede un error, vuelva a dicho modal*/
    if (validateForm('FormContainerDistrict', 'ModalNewDistrict') === true) {

        Execute(scanInfo('save', true, 'FormContainerDistrict',
                [{datos: ["city", $('#selCity').val()]}]),
                'Parameterized/CtlDistrict',
                '',
                'loadNeighborhood(' + $('#selCity').val() + ');cleanForm("ModalNewDistrict");',
                'ModalNewDistrict');
    }
}


/**
 * Cada vez que se selecciona un nuevo departamento - municipio, se actualiza 
 * la caja de busqueda del mapa
 * @returns {void}
 * @author Johnny Alexander Salazar
 * @version 0.1
 */
function actualizarMucipioMapa() {
    var nombreDepto = ($("#selState").val() === "-1") ? "" : $("#selState option:selected").text();
    var nombreMunicipio = ($("#selCity").val() === "-1") ? "" : $("#selCity option:selected").text();
    var nombreCompleto = nombreMunicipio + " " + nombreDepto;
    $("#pac-input").val(nombreCompleto);
}



function loadImagesPropertie(id) {
    Execute(scanInfo('loadImage', false, '', [{datos: ["id", id]}]), 'Propertie/CtlPropertie', '', 'listFilesTwoColumns(info,objFilePropertie,"lstImagenesAgregadas","lstImagenesAgregadas2");');
}

function loadVideosPropertie(id) {
    Execute(scanInfo('loadVideo', false, '', [{datos: ["id", id]}]), 'Propertie/CtlPropertie', '', 'listDinamicData(info, objURLVideosPropertie,"lstVideosAgregados","Video");');
}


/**
 * Se limpia o reinicia todos los elementos involucrados en los videos e imagenes
 * @returns {void}
 * @author Johnny Alexander Salazar
 * @version 0.1
 */
function limpiarMultimedia() {
    objFilePropertie.listFileBase64 = new Array();
    objFilePropertie.listFileName = new Array();
    objFilePropertie.listFileURL = new Array();
    objURLVideosPropertie.listElements = new Array();
    $("#lstVideosAgregados").html("");
    $("#lstImagenesAgregadas").html("");
    $("#lstImagenesAgregadas2").html("");
    $("#fileImagen").val('');
}




