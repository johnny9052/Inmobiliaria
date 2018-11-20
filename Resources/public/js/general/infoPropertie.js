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
    Execute(scanInfo('search', true), 'Propertie/CtlPropertie', '', 'showData(info);', '', '', 'System/');
}



function sendContact() {
    if (validateForm() === true) {
        Execute(scanInfo('search', true), 'Contact/CtlContact', '', 'showDataSendContact();');
    }
}


function showDataSendContact() {
    showToast("Mensaje enviado, pronto te contactaremos", "sucess");
    cleanForm();
}


function showData(info) {
    $("#txtId").val(info[0].id);
    $("#txtMatricula").val(info[0].matricula_inmobiliaria);
    /*ICONOS PLUS ESTATICOS*/
    $("#lblRoom").html(info[0].habitaciones);
    $("#lblBath").html(info[0].banios);
    $("#lblParking").html(info[0].parqueaderos);
    $("#lblTotalArea").html(info[0].area_total + " m<sup>2</sup>");

    $("#lblTituloBarrio").html(info[0].nombre_barrio);
    $("#lblDescripcion").html(info[0].linderos_inmbueble);
    /*END ICONOS PLUS ESTATICOS*/

    /*INFO ESTATICA*/


    var characteristics = addCharacteristics("Precio", "$ " + parseInt(info[0].precio).toLocaleString());
    characteristics += addCharacteristics("Costo administracion", "$ " + info[0].costo_administracion);
    characteristics += addCharacteristics("Area sin balcones", info[0].area_sin_balcones);
    characteristics += addCharacteristics("Año de construccion", info[0].anio_de_construccion);
    characteristics += addCharacteristics("Numero de piso", info[0].numero_piso);

    characteristics += addCharacteristics("Departamento", info[0].nombre_departamento);
    characteristics += addCharacteristics("Ciudad", info[0].nombre_ciudad);
    characteristics += addCharacteristics("Barrio", info[0].nombre_barrio);
    characteristics += addCharacteristics("Estrato", info[0].nombre_estrato);
    characteristics += addCharacteristics("Tipo inmueble", info[0].nombre_tipo_inmueble);
    characteristics += addCharacteristics("Tipo oferta", info[0].nombre_tipo_oferta);
    characteristics += addCharacteristics("Tipo cortina", info[0].nombre_tipo_cortina);
    characteristics += addCharacteristics("Tipo vigilancia", info[0].nombre_tipo_vigilancia);
    characteristics += addCharacteristics("Zona", info[0].nombre_zona);
    characteristics += addCharacteristics("Tipo vista", info[0].nombre_tipo_vista);
    characteristics += addCharacteristics("Tipo cocina", info[0].nombre_tipo_cocina);
    characteristics += addCharacteristics("Estructura cocina", info[0].nombre_estructura_cocina);
    characteristics += addCharacteristics("Tipo piso", info[0].nombre_tipo_piso);
    characteristics += addCharacteristics("Fecha publicacion", info[0].fecha_publicacion);

    $("#accordionCharacteristics").html(characteristics);


    $("#txtLinderos").val(info[0].linderos_inmbueble);

    /*END INFO ESTATICA*/

    /*INFO PLUS*/

    $("#iconsAditionals").html(
            addIconsPlus(
                    "Chimenea", info[0].chimenea, 'fire',
                    "Estudio", info[0].estudio, 'cube',
                    "Deposito", info[0].deposito, 'cube',
                    "Zona de ropas", info[0].zona_ropas, 'tint') +
            addIconsPlus(
                    "Parq. visitantes", info[0].parqueadero_visitantes, 'car',
                    "Ascensor", info[0].ascensor, 'caret-square-o-up',
                    "Terraza", info[0].terraza, 'cloud',
                    "Transp. pub. cercano", info[0].transporte_publico_cercano, 'bus') +
            addIconsPlus(
                    "Salon comunal", info[0].salon_comunal, 'comments',
                    "Sauna", info[0].sauna, 'tint',
                    "Turco", info[0].turco, 'tint',
                    "Jacuzzi", info[0].jacuzzi, 'tint') +
            addIconsPlus(
                    "Zona infantil", info[0].zona_infantil, 'envira',
                    "Jardines", info[0].jardines, 'child',
                    "Puerta de seguridad", info[0].puerta_de_seguridad, 'expeditedssl',
                    "Duplex", info[0].duplex, 'home') +
            addIconsPlus(
                    "Gimnasio", info[0].gimnasio, 'users',
                    "Precio negociable", info[0].precio_negociable, 'dollar',
                    "Zona mascotas", info[0].zona_mascotas, 'github-alt',
                    "Parqueadero cubierto", info[0].parqueadero_cubierto, 'university') +
            addIconsPlus(
                    "Amoblado", info[0].amoblado, 'codepen',
                    "", "", '',
                    "", "", '',
                    "", "", '')
            );

    /*END INFO PLUS*/


    /*Se añade el punto del gps*/
    addMarker(new google.maps.LatLng(info[0].latitud, info[0].longitud), true);
    /*Se cargan las imagenes y videos*/

    loadVideosPropertie(info[0].id);

    $('html, body').animate({scrollTop: 0}, 'fast');


}

function addIconsPlus(
        text1, value1, typeIcon1,
        text2, value2, typeIcon2,
        text3, value3, typeIcon3,
        text4, value4, typeIcon4) {




    var iconsPlus = "<div class='row'>\n\
                        <div class='col-1'></div>\n\
                        <div class='col-6'>\n\
                            <div class='row'>\n\
                                <div class='col-md-12 col-sm-12 col-xs-12 divSinEspacio'> \n\
                                            <label class='containerCheckbox'>\n\
                                                <i class='fa fa-" + typeIcon1 + " EspaciadoCaracteristicasInmueblePequenio'></i>\n\
                                                <label class='textoCaracteristicasInmueble espaciadoCaracteristicasInmueble'>&emsp;" + text1 + "</label>\n\
                                                 \n\
                                                <input class='espaciadoCaracteristicasInmueble' disabled='disabled' type='checkbox'" + ((value1 === "0") ? "" : "checked") + ">\n\
                                                <span class='checkmarkcheckbox'></span>\n\
                                            </label>\n\
                                </div>\n\
                            </div>";

    if (text2 !== "") {
        iconsPlus = iconsPlus + "\<div class='row'>\n\
                                    <div class='col-md-12 col-sm-12 col-xs-12 divSinEspacio'> \n\
                                            <label class='containerCheckbox'>\n\
                                                <i class='fa fa-" + typeIcon2 + " EspaciadoCaracteristicasInmueblePequenio'></i>\n\
                                                <label class='textoCaracteristicasInmueble espaciadoCaracteristicasInmueble'>&emsp;" + text2 + "</label>\n\
                                                 \n\
                                                <input class='espaciadoCaracteristicasInmueble' disabled='disabled' type='checkbox'" + ((value2 === "0") ? "" : "checked") + ">\n\
                                                <span class='checkmarkcheckbox'></span>\n\
                                            </label>\n\
                                    </div>\n\
                                </div>";

    }


    if (text3 !== "") {
        iconsPlus = iconsPlus + "<div class='row'>\n\
                                    <div class='col-md-12 col-sm-12 col-xs-12 divSinEspacio'> \n\
                                            <label class='containerCheckbox'>\n\
                                                <i class='fa fa-" + typeIcon3 + " EspaciadoCaracteristicasInmueblePequenio'></i>\n\
                                                <label class='textoCaracteristicasInmueble espaciadoCaracteristicasInmueble'>&emsp;" + text3 + "</label>\n\
                                                 \n\
                                                <input class='espaciadoCaracteristicasInmueble' disabled='disabled' type='checkbox'" + ((value3 === "0") ? "" : "checked") + ">\n\
                                                <span class='checkmarkcheckbox'></span>\n\
                                            </label>\n\
                                    </div>\n\
                                </div>";

    }

    if (text4 !== "") {
        iconsPlus = iconsPlus + "<div class='row'>\n\
                                    <div class='col-md-12 col-sm-12 col-xs-12 divSinEspacio'> \n\
                                            <label class='containerCheckbox'>\n\
                                                <i class='fa fa-" + typeIcon4 + " EspaciadoCaracteristicasInmueblePequenio'></i>\n\
                                                <label class='textoCaracteristicasInmueble espaciadoCaracteristicasInmueble'>&emsp;" + text4 + "</label>\n\
                                                 \n\
                                                <input class='espaciadoCaracteristicasInmueble' disabled='disabled' type='checkbox'" + ((value4 === "0") ? "" : "checked") + ">\n\
                                                <span class='checkmarkcheckbox'></span>\n\
                                            </label>\n\
                                    </div>\n\
                                </div>";
    }

    if (text3 !== "" || text4 !== "") {
        iconsPlus = iconsPlus + "</div>\n\
                        </div>\n\
                        <div class='col-1'></div>\n\
                    </div>";
    }




//    var iconsPlus = "<div class='row'>\n\
//                        <div class='col-1'></div>\n\
//                        <div class='col-10'>\n\
//                            <div class='row text-center'>\n\
//                                <div class='col-md-3 col-sm-6 col-xs-12'> \n\
//                                    <div class='info-box " + ((value1 === "0") ? "bg-gray" : "bg-aqua") + "'>\n\
//                                        <span class='info-box-icon'><i class='fa fa-" + typeIcon1 + "'></i></span>\n\
//                                        <div class='info-box-content text-center'>\n\
//                                            <span class='info-box-text'>" + text1 + "</span>\n\
//                                            <span class='info-box-number'>" + ((value1 === "0") ? "No" : "Si") + "</span>\n\
//                                        </div>   \n\
//                                    </div>\n\
//                                </div>";
//
//
//    if (text2 !== "") {
//        iconsPlus = iconsPlus + "<div class='col-md-3 col-sm-6 col-xs-12'>\n\
//                                    <div class='info-box " + ((value2 === "0") ? "bg-gray" : "bg-aqua") + "'>\n\
//                                        <span class='info-box-icon'>\n\
//                                            <i class='fa fa-" + typeIcon2 + "'></i>\n\
//                                        </span>\n\
//                                        <div class='info-box-content text-center'>\n\
//                                            <span class='info-box-text'>" + text2 + "</span>\n\
//                                            <span class='info-box-number'>" + ((value2 === "0") ? "No" : "Si") + "</span>\n\
//                                        </div>\n\
//                                    </div>\n\
//                                 </div>";
//    }
//
//    if (text3 !== "") {
//        iconsPlus = iconsPlus + "<div class='col-md-3 col-sm-6 col-xs-12'>\n\
//                                    <div class='info-box " + ((value3 === "0") ? "bg-gray" : "bg-aqua") + "'>\n\
//                                        <span class='info-box-icon'>\n\
//                                            <i class='fa fa-" + typeIcon3 + "'></i>\n\
//                                        </span>\n\
//                                        <div class='info-box-content text-center'>\n\
//                                            <span class='info-box-text'>" + text3 + "</span>\n\
//                                            <span class='info-box-number'>" + ((value3 === "0") ? "No" : "Si") + "</span>\n\
//                                        </div>\n\
//                                    </div>\n\
//                                 </div>";
//    }
//
//    if (text4 !== "") {
//        iconsPlus = iconsPlus + "<div class='col-md-3 col-sm-6 col-xs-12'>\n\
//                                    <div class='info-box " + ((value4 === "0") ? "bg-gray" : "bg-aqua") + "'>\n\
//                                        <span class='info-box-icon'>\n\
//                                            <i class='fa fa-" + typeIcon4 + "'></i>\n\
//                                        </span>\n\
//                                        <div class='info-box-content text-center'>\n\
//                                            <span class='info-box-text'>" + text4 + "</span>\n\
//                                            <span class='info-box-number'>" + ((value4 === "0") ? "No" : "Si") + "</span>\n\
//                                        </div>\n\
//                                    </div>\n\
//                                 </div>";
//    }
//    iconsPlus = iconsPlus + "</div></div><div class='col-1'></div></div>";

    return iconsPlus;

}






function addCharacteristics(text, value) {
    var characteristic = "<div class='panel box box-primary'>\n\
                            <div class='box-header with-border'>\n\
                                <div class='row'>        \n\
                                    <h3 class='box-title text-light-blue col-md-5 col-sm-12 col-xs-12'>\n\
                                        " + text + "                                    \n\
                                    </h3>                                    \n\
                                    <h5 class='box-title col-md-5 col-sm-12 col-xs-12'>\n\
                                    " + value + "</h5>                                \n\
                                </div>                            \n\
                            </div>                                                    \n\
                          </div>";


    return characteristic;
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
    Execute(scanInfo('loadImage', false, '', [{datos: ["id", id]}]), 'Propertie/CtlPropertie', '', 'buildCarusel(info,objFilePropertie);', '', '', 'System/');
}



function buildCarusel(info, obj) {

    var imgcarusel = "";
    var imgMiniaturaCarusel = "";
    var paginatorcarusel = "";

    var positionCarusel = 0;

    if (info !== undefined && info !== "" && info !== null) {
        for (var x = 0; x < info.length; x++) {
            organizarArchivoCargadoDesdeBD(info[x].url_file, obj);
        }
    }

    for (var y = 0; y < obj.listFileName.length; y++) {
        imgcarusel += "<div class='carousel-item " + ((y === 0) ? 'active' : '') + "'>\n\
                                <img src='System/" + obj.listFileURL[y] + "' alt='" + cleanNameFile(obj.listFileName[y]) + "' style='max-width: 900px; max-height: 500px;'>\n\
                        </div>";
        
        imgMiniaturaCarusel += "<span data-target='#divcarusel' data-slide-to='" + y + "'>\n\
                                    <img class='seleccionable' src='System/" + obj.listFileURL[y] + "' alt='" + cleanNameFile(obj.listFileName[y]) + "' height='40' width='40'>\n\
                                </span>&nbsp;";
        paginatorcarusel += "<li data-target='#divcarusel' data-slide-to='" + y + "' class='" + ((y === 0) ? 'active' : '') + "'></li>";
        positionCarusel++;
    }


    for (var z = 0; z < objURLVideosPropertie.listElements.length; z++) {
        imgcarusel += "<div class='carousel-item'>\n\
                        <div class='auto-resizable-iframe'>\n\
                            <div>\n\
                                <iframe frameborder='0' allowfullscreen='' src='" + (objURLVideosPropertie.listElements[z]).replace("watch?v=", "embed/") + "'>\n\
                                </iframe>\n\
                            </div>\n\
                        </div>\n\
                      </div>";
        
        imgMiniaturaCarusel += "<span data-target='#divcarusel' data-slide-to='" + positionCarusel + "'><img class='seleccionable' src='System/Resource/Multimedia/Images/videocarusel.png' alt='Video' height='40' width='40'></span>&nbsp;";
        paginatorcarusel += "<li data-target='#divcarusel' data-slide-to='" + positionCarusel + "'></li>";
        positionCarusel++;
    }



    var car = "<div id='divcarusel' class='carousel slide' data-ride='carousel'>\n\
                 <ul class='carousel-indicators' id='paginatorcarusel'>";

    car += paginatorcarusel;
    car += "</ul>";

    car += "<div class='carousel-inner' id='imagesCarusel'>";
    car += imgcarusel;
    car += "</div>";
    /*Botones de atras y siguiente*/
    car += "<a class='carousel-control-prev' href='#divcarusel' data-slide='prev'>\n\
                <span class='carousel-control-prev-icon'></span>\n\
            </a>\n\
            <a class='carousel-control-next' href='#divcarusel' data-slide='next'>\n\
                <span class='carousel-control-next-icon'></span>\n\
            </a>";
    car += "</div>";

    console.log(car);

    $("#containercarusel").html(car);
    $("#divImgMiniatura").html(imgMiniaturaCarusel);



}
