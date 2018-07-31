var listImagen = new Array();
var listImagenName = new Array();


var listVideo = new Array();


/* Funciones jQuery */
/* global markersListGlobal, google */

$(window).on("load", function (e) {
    list();
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
    //loadStatus();
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
    Execute(scanInfo('loadclient', false), 'General/CtlGeneral', '', 'buildSelect(info,"selClient");');
}


function loadOutstandingType() {
    Execute(scanInfo('loadOutstandingType', false), 'General/CtlGeneral', '', 'buildSelect(info,"selOutstandingType");');
}





function save() {
    if (markersListGlobal.length > 0) {
        if (validateForm() === true) {

            var temp = new Array();

            var lat = markersListGlobal[0].getPosition().lat();
            var lng = markersListGlobal[0].getPosition().lng();

            temp.push({datos: ["lat", lat]});
            temp.push({datos: ["lng", lng]});



            for (var x = 0; x < listImagen.length; x++) {

                temp.push({datos: ["nameFile" + x, listImagenName[x]]});
                temp.push({datos: ["base64File" + x, listImagen[x]]});
            }

            var tempVideo = new Array();

            tempVideo.push("urlVideos");

            for (var y = 0; y < listVideo.length; y++) {
                tempVideo.push(listVideo[y]);
            }

            temp.push({datos: tempVideo});


            Execute(scanInfo('save', true, '', temp), 'Propertie/CtlPropertie', '', ' closeWindow();list();deleteMarkers();limpiarMultimedia();');
        }
    } else {
        showToast("Seleccione un punto en el mapa", "error");
    }
}


function list() {
    Execute(scanInfo('listfilter'), 'Propertie/CtlPropertie', '', 'buildPaginator(info);');
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
    addMarker(new google.maps.LatLng(info[0].latitud, info[0].longitud));


    loadVideosPropertie(info[0].id);
    loadImagesPropertie(info[0].id);

    openWindow();
    showButton(false);
}





function update() {
    if (validateForm() === true) {
        Execute(scanInfo('update', true), 'Propertie/CtlPropertie', '', 'closeWindow();list();');
    }
}


function deleteInfo() {
    Execute(scanInfo('delete', true), 'Propertie/CtlPropertie', '', 'closeWindow("ModalConfirm");list();cleanForm("ModalNew");');
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
    Execute(scanInfo('loadImage', false, '', [{datos: ["id", id]}]), 'Propertie/CtlPropertie', '', 'listImages(info);');
}



function listImages(info) {

    var lblImagenes = "";

    for (var x = 0; x < info.length; x++) {
        /*Se agrega a la lista de nombres el nombre del archivo*/
        listImagenName.push(info[x].ruta_imagen);
        listImagen.push('Not base64');

        /*Se arma la cadena,tomando como referencias el nombre del archivo sin 
         * espacios ni caracteres especiales*/
        lblImagenes = lblImagenes + "<label class='seleccionable' id='" + info[x].ruta_imagen + "' onclick='eliminarImagen(" + '"' + info[x].ruta_imagen + '"' + ");'>(X)    " + setSpacesInText(((info[x].ruta_imagen).split("/"))[4]) + "</label><br>";
    }

    /*Se añade la nueva imagen a la lista de imagenes disponibles*/
    $("#lstImagenesAgregadas").html($("#lstImagenesAgregadas").html() + lblImagenes);

}


/**
 * Se mapean todas las imagenes seleccionadas, convirtiendolas a base64, y 
 * almacenandolas en una lista
 * @returns {void}
 * @author Johnny Alexander Salazar
 * @version 0.2
 */
function procesarImagenes() {

    /*Cadena donde se almacenara las imagenes que se listen*/
    var lblImagenes = "";

    /*Se capturan todas las imagenes seleccionadas*/
    var files = $("#fileImagen")[0].files;

    /*Por cada imagen, se añade a la cadena, se codifica a bas64 y se obtiene su 
     * nombre para ser almacenados*/
    for (var i = 0; i < files.length; i++) {

        /*Se obtiene el archivo*/
        var file = files[i];

        /*Si se pudo obtener algun archivo*/
        if (file !== undefined) {
            var nombreArchivo = ((file.name).split("."))[0].substring(0, 5);
            /*Se arma la cadena,tomando como referencias el nombre del archivo sin 
             * espacios ni caracteres especiales*/
            lblImagenes = lblImagenes + "<label class='seleccionable' id='" + cleanNameFile(nombreArchivo) + "' onclick='eliminarImagen(" + '"' + cleanNameFile(nombreArchivo) + '"' + ");'>(X)    " + setSpacesInText(nombreArchivo) + "</label><br>";

            /*Se agrega a la lista de nombres el nombre del archivo*/
            listImagenName.push(cleanNameFile(nombreArchivo));
            /*Se convierte la imagen seleccionada a BASE64 y se añade la codificacion 
             * a la lista correspondiente*/
            base64(file, function (data) {
                listImagen.push((data.base64 !== undefined) ? data.base64 : ""); // prints the base64 string                                
            });
        }
    }

    /*Se añade la nueva imagen a la lista de imagenes disponibles*/
    $("#lstImagenesAgregadas").html($("#lstImagenesAgregadas").html() + lblImagenes);

    console.log(listImagen);
}




function loadVideosPropertie(id) {
    Execute(scanInfo('loadVideo', false, '', [{datos: ["id", id]}]), 'Propertie/CtlPropertie', '', 'listVideos(info);');
}


function listVideos(info) {

    for (var x = 0; x < info.length; x++) {
        listVideo.push(info[x].ruta_video);
    }

    pintarVideos();
}



/**
 * Se almacenan todas las URL de videos agregados, almacenandolos en una lista 
 * @returns {void}
 * @author Johnny Alexander Salazar
 * @version 0.1
 */
function agregarVideo() {
    /*Se captura la URL*/
    var videoFileURL = $("#txtUrlVideo").val();

    /*Si se ha agregado algun video*/
    if (videoFileURL !== "" && videoFileURL !== null) {
        /*Se almacena el video*/
        listVideo.push(videoFileURL);
        /*Se enlista el video*/
        pintarVideos();
        /*Se limpia el campo del video ingresado*/
        $("#txtUrlVideo").val("");
        console.log(listVideo);
    } else {

    }
}


/**
 * Recorre los videos almacenados, enlistandolos y tomando sus posiciones como 
 * referentes
 * @returns {void}
 * @author Johnny Alexander Salazar
 * @version 0.1
 */
function pintarVideos() {
    var lblVideos = "";
    $("#lstVideosAgregados").html("");
    for (var y = 0; y < listVideo.length; y++) {
        lblVideos = lblVideos + "<label class='seleccionable' id='Video" + y + "' onclick='eliminarVideo(" + '"Video' + y + '"' + ");'>(X)    " + listVideo[y] + "</label><br>";
    }
    $("#lstVideosAgregados").html(lblVideos);
}






/**
 * Se elimina un video a partir de su posicion
 * @param {String} pos posicion del video que se desea eliminar
 * @returns {void}
 * @author Johnny Alexander Salazar
 * @version 0.1
 */
function eliminarVideo(pos) {
    /*Se obtiene la posicion del video a eliminar*/
    pos = (pos.split("Video"))[1];

    if (pos !== -1) {
        listVideo.splice(pos, 1);
    }

    /*Repinda los videos para actualizar sus posiciones*/
    pintarVideos();

}




/**
 * Se elimina un video a partir de su id
 * @param {String} id id de la imagen a eliminar, el cual es su nombre sin 
 * caracteres especiales
 * @returns {void}
 * @author Johnny Alexander Salazar
 * @version 0.1
 */
function eliminarImagen(id) {
    /*Se obtiene la posicion de la imagen en la lista a partir de su nombre*/
    var pos = listImagenName.indexOf(id);

    alert(pos);

    /*Si la encuentra*/
    if (pos !== -1) {
        /*La elimina de las listas de los nombre sy las codificaciones*/
        listImagen.splice(pos, 1);
        listImagenName.splice(pos, 1);
        /*Se limpia el nombre para poder eliminarlo del listado visual*/
        id = cleanNameFile(id);
        $("#" + id).html("");
    }
}


/**
 * Se limpia o reinicia todos los elementos involucrados en los videos e imagenes
 * @returns {void}
 * @author Johnny Alexander Salazar
 * @version 0.1
 */
function limpiarMultimedia() {
    listImagen = new Array();
    listImagenName = new Array();
    listVideo = new Array();
    $("#lstVideosAgregados").html("");
    $("#lstImagenesAgregadas").html("");
    $("#fileImagen").val('');
}

