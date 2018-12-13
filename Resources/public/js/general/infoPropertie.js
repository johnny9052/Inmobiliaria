/* Funciones jQuery */
/* global markersListGlobal, google, URL */

$(window).on("load", function (e) {
    var id = getUrlParameter('id');
    $("#txtIdPDFPropertie").val(id);
    search(id);


    setTimeout(function () {
        saveAudit();
    }, 5000);

});

var registrosFotosInmueble = 100;
var totalRegistrosFotos = 0;
var posicionActualPaginacionFotos = 0;
var objectToPaginationPhoto;


var repaginarAutomaticamente = true;

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



function saveAudit() {
    var browser = getBrowserName();
    var so = getNameOperativeSystem();
    var device = getDeviceType();
    var user = (getDataCache("userhexagono")).data;
    var ip = (getDataCache("userhexagonoip")).data;
    var idPropertie = getUrlParameter('id');

    /*Se define el array de datos adicionales como un objeto, debido a que es necesario pasarlo por referencia para el llenado de los archivos*/
    var infoPlus = {
        temp: new Array()
    };

    /*Se añaden como datos adicionales*/
    infoPlus.temp.push({datos: ["browser", browser]});
    infoPlus.temp.push({datos: ["so", so]});
    infoPlus.temp.push({datos: ["device", device]});
    infoPlus.temp.push({datos: ["user", user]});
    infoPlus.temp.push({datos: ["ip", ip]});
    infoPlus.temp.push({datos: ["id", idPropertie]});

    Execute(scanInfo('auditPublic', false, '', infoPlus.temp), 'Propertie/CtlPropertie', '', '', '', '', 'System/', true);
}


function search(id) {
    $("#txtId").val(id);
    Execute(scanInfo('search', true, 'FormContainerContact'), 'Propertie/CtlPropertie', '', 'showData(info);', '', '', 'System/');
}



function sendContact() {
    if (validateForm('FormContainerContact') === true) {
        Execute(scanInfo('search', true, 'FormContainerContact'), 'Contact/CtlContact', '', 'showDataSendContact();');
    }
}


function showDataSendContact() {
    showToast("Mensaje enviado, pronto te contactaremos", "sucess");
    executeWithTime("cleanForm('FormContainerContact');", 3000);

}


function showData(info) {
    $("#txtId").val(info[0].id);
    $("#txtMatricula").val(info[0].matricula_inmobiliaria);


    /*INFO ESTATICA*/
    $("#lblMatricula").html(info[0].matricula_inmobiliaria);
    $("#lblMatricula2").html(info[0].matricula_inmobiliaria);
    $("#lblCity").html(info[0].nombre_ciudad);
    $("#lblPropertieType").html(info[0].nombre_tipo_inmueble);
    $("#lblOfferType").html(info[0].nombre_tipo_oferta);
    $("#lblTotalArea").html(info[0].area_total + " m<sup>2</sup>");
    $("#lblRoom").html(info[0].habitaciones);
    $("#lblBath").html(info[0].banios);
    $("#lblParking").html(info[0].parqueaderos);
    $("#lblDescription").html(info[0].linderos_inmbueble);
    $("#lblStateList").html(info[0].nombre_departamento);
    $("#lblAdminVal").html("$ " + parseInt(info[0].costo_administracion).toLocaleString());
    $("#lblConstructionYear").html(info[0].anio_de_construccion);
    $("#lblFloorNumber").html(info[0].numero_piso);
    $("#lblStratum").html(info[0].nombre_estrato);
    $("#lblCurtainType").html(info[0].nombre_tipo_cortina);
    $("#lblSurveillanceType").html(info[0].nombre_tipo_vigilancia);
    $("#lblZoneList").html(info[0].nombre_zona);
    $("#lblViewType").html(info[0].nombre_tipo_vista);
    $("#lblKitchenType").html(info[0].nombre_tipo_cocina);
    $("#lblKitchenStructure").html(info[0].nombre_estructura_cocina);
    $("#lblFloorType").html(info[0].nombre_tipo_piso);




    $("#lblTituloBarrio").html(info[0].nombre_ciudad);
    $("#lblState").html(info[0].nombre_departamento);
    $("#lblValue").html("$ " + parseInt(info[0].precio).toLocaleString());
    /*END INFO ESTATICA*/

    /*INFO PLUS*/

    $("#divCheck").html(
            addIconsPlusOk(
                    "Chimenea", info[0].chimenea, 'fire',
                    "Estudio", info[0].estudio, 'cube',
                    "Deposito", info[0].deposito, 'cube',
                    "Zona de ropas", info[0].zona_ropas, 'tint') +
            addIconsPlusOk(
                    "Parq. visita", info[0].parqueadero_visitantes, 'car',
                    "Ascensor", info[0].ascensor, 'caret-square-o-up',
                    "Terraza", info[0].terraza, 'cloud',
                    "Tra. cercano", info[0].transporte_publico_cercano, 'bus') +
            addIconsPlusOk(
                    "Salon comunal", info[0].salon_comunal, 'comments',
                    "Sauna", info[0].sauna, 'tint',
                    "Turco", info[0].turco, 'tint',
                    "Jacuzzi", info[0].jacuzzi, 'tint') +
            addIconsPlusOk(
                    "Zona infantil", info[0].zona_infantil, 'envira',
                    "Jardines", info[0].jardines, 'child',
                    "Puerta segura", info[0].puerta_de_seguridad, 'expeditedssl',
                    "Duplex", info[0].duplex, 'home') +
            addIconsPlusOk(
                    "Gimnasio", info[0].gimnasio, 'users',
                    "Precio negociable", info[0].precio_negociable, 'dollar',
                    "Zona mascotas", info[0].zona_mascotas, 'github-alt',
                    "Parq. cubierto", info[0].parqueadero_cubierto, 'university') +
            addIconsPlusOk(
                    "Amoblado", info[0].amoblado, 'codepen',
                    "", "", '',
                    "", "", '',
                    "", "", '')
            );

    /*END INFO PLUS*/


    /*Se añade el punto del gps*/
    //addMarker(new google.maps.LatLng(info[0].latitud, info[0].longitud), true);
    /*Se cargan las imagenes y videos*/

    loadVideosPropertie(info[0].id);

    $('html, body').animate({scrollTop: 0}, 'fast');


}

function addIconsPlusOk(
        text1, value1, typeIcon1,
        text2, value2, typeIcon2,
        text3, value3, typeIcon3,
        text4, value4, typeIcon4) {

    var iconsPlus = "<li>\n\
                        <label class='containerCheckbox '>\n\
                            <input class='espaciadoCaracteristicasInmueble' disabled='disabled' type='checkbox' " + ((value1 === "0") ? "" : "checked") + ">\n\
                            <span class='checkmarkcheckbox'></span>\n\
                            <i class='fa fa-" + typeIcon1 + " EspaciadoCaracteristicasInmueblePequenio'></i>\n\
                            <label class='textoCaracteristicasInmueble espaciadoCaracteristicasInmueble'>&emsp;" + text1 + "</label>\n\
                        </label>\n\
                    </li>"
    if (text2 !== "") {
        iconsPlus = iconsPlus + "<li>\n\
                        <label class='containerCheckbox '>\n\
                            <input class='espaciadoCaracteristicasInmueble' disabled='disabled' type='checkbox' " + ((value2 === "0") ? "" : "checked") + ">\n\
                            <span class='checkmarkcheckbox'></span>\n\
                            <i class='fa fa-" + typeIcon2 + " EspaciadoCaracteristicasInmueblePequenio'></i>\n\
                            <label class='textoCaracteristicasInmueble espaciadoCaracteristicasInmueble'>&emsp;" + text2 + "</label>\n\
                        </label>\n\
                    </li>";
    }
    if (text3 !== "") {
        iconsPlus = iconsPlus + "<li>\n\
                        <label class='containerCheckbox '>\n\
                            <input class='espaciadoCaracteristicasInmueble' disabled='disabled' type='checkbox' " + ((value3 === "0") ? "" : "checked") + ">\n\
                            <span class='checkmarkcheckbox'></span>\n\
                            <i class='fa fa-" + typeIcon3 + " EspaciadoCaracteristicasInmueblePequenio'></i>\n\
                            <label class='textoCaracteristicasInmueble espaciadoCaracteristicasInmueble'>&emsp;" + text3 + "</label>\n\
                        </label>\n\
                    </li>";
    }
    if (text4 !== "") {
        iconsPlus = iconsPlus + "<li>\n\
                        <label class='containerCheckbox '>\n\
                            <input class='espaciadoCaracteristicasInmueble' disabled='disabled' type='checkbox' " + ((value4 === "0") ? "" : "checked") + ">\n\
                            <span class='checkmarkcheckbox'></span>\n\
                            <i class='fa fa-" + typeIcon4 + " EspaciadoCaracteristicasInmueblePequenio'></i>\n\
                            <label class='textoCaracteristicasInmueble espaciadoCaracteristicasInmueble'>&emsp;" + text4 + "</label>\n\
                        </label>\n\
                    </li>";
    }

    return iconsPlus;
}

function loadVideosPropertie(id) {
    Execute(scanInfo('loadVideo', false, '', [{datos: ["id", id]}]), 'Propertie/CtlPropertie', '', 'almacenarVideos(info, objURLVideosPropertie,' + id + ');', '', '', 'System/');
}

function almacenarVideos(info, obj, id) {
    /*Se agregan todos los datos a la lista, y se pintan*/
    for (var x = 0; x < info.length; x++) {
        if (info[x].dinamic_data !== "") {
            obj.listElements.push(info[x].dinamic_data);
        }
    }

    loadImagesPropertie(id);
}


function loadImagesPropertie(id) {
    Execute(scanInfo('loadImage', false, '', [{datos: ["id", id]}]), 'Propertie/CtlPropertie', '', 'buildImageProperties(info,objFilePropertie);', '', '', 'System/');
}


function buildImageProperties(info, obj) {

    console.log(info);
    var listado = "<div id='property-single-carousel' class='owl-carousel owl-arrow gallery-property carruselHexagono'>";



    showLoadBar(true);
    if (info.length > 0) {

        totalRegistrosFotos = info.length;
        objectToPaginationPhoto = info;
        var totalIteracion = (info.length > registrosFotosInmueble) ? registrosFotosInmueble : info.length;

        var imgcarusel = "";
        //var imgMiniaturaCarusel = "";
        var paginatorcarusel = "";
        var positionCarusel = 0;

        if (info !== undefined && info !== "" && info !== null) {
            for (var x = 0; x < info.length; x++) {
                organizarArchivoCargadoDesdeBD(info[x].url_file, obj);
            }
        }
        for (var y = 0; y < obj.listFileName.length; y++) {
            listado += " <div class='carousel-item-b'>\n\
                            <img src='System/" + obj.listFileURL[y] + " 'style='max-width: 900px; max-height: 500px;>\n\
                        </div>";
        }
        listado += "</div>";

        $("#carouselImages").html(listado);


        /*--/ Property owl /--*/
        
       $('.carruselHexagono').owlCarousel({
		loop: true,
		margin: 0,  
		nav: true,
		navText: ['<i class="ion-ios-arrow-back" aria-hidden="true"></i>', '<i class="ion-ios-arrow-forward" aria-hidden="true"></i>'],
		responsive: {
			0: {
				items: 1,
			}
		}
	});
        
//        $('.carruselHexagono').owlCarousel({
//            loop: true,
//            margin: 30,
//            responsive: {
//                0: {
//                    items: 1,
//                },
//                769: {
//                    items: 2,
//                },
//                992: {
//                    items: 3,
//                }
//            }
//        });



    } else {
        listado = listado + "<div class='owl-carousel owl-theme carruselHexagono'>\n\
                             </div>";
        $("#property-single-carousel").html(listado);
        $('#segmentoPaginadorDestacado').html("");
    }

    showLoadBar(false);
}
