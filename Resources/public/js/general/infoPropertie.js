/* Funciones jQuery */
/* global markersListGlobal, google, URL */

$(window).on("load", function (e) {
    var id = getUrlParameter('id');
    search(id);
});


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



function search(id) {
    $("#txtId").val(id);
    Execute(scanInfo('search', true), 'Propertie/CtlPropertie', '', 'showData(info);', '', '', 'System/');
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