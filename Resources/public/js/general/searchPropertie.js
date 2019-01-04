/* Funciones jQuery */
$(window).on('load', function (e) {
    //alert("Estoy en el load");
    loadOfferTypeGeneral();
    listProperties();
});

function searchOfferType() {
    if ($("#selOfferTypeGeneral").val() == -1) {
        var url = "searchPropertie&&offerType=" + $("#selOfferTypeGeneral").val();
        refreshPagePublic(url);
    } else {
        listProperties();
    }

}

function loadOfferTypeGeneral() {
    Execute(scanInfo('loadOfferType', false), 'General/CtlGeneral', '', 'buildSelect(info,"selOfferTypeGeneral");', '', '', 'System/');
}

function listProperties() {
    //alert("Estoy en listproperties");
    var controlOfferType = 0;

    if ($("#selOfferTypeGeneral").val() != -1) {
        controlOfferType = 1;
    }

    if (controlOfferType === 1) {
        tipoOferta = $("#selOfferTypeGeneral").val();
    } else if (getUrlParameter('offerType') !== undefined) {
        tipoOferta = getUrlParameter('offerType');
    } else {
        tipoOferta = -1;
    }


    user = 0;
    departamento = ((getUrlParameter('departament') !== undefined) ? getUrlParameter('departament') : '-1');
    ciudad = ((getUrlParameter('city') !== undefined) ? getUrlParameter('city') : '-1');
    barrio = ((getUrlParameter('neighborhood') !== undefined) ? getUrlParameter('neighborhood') : '-1');
    zona = ((getUrlParameter('zone') !== undefined) ? getUrlParameter('zone') : '-1');
    tipoInmueble = ((getUrlParameter('typePropertie') !== undefined) ? getUrlParameter('typePropertie') : '-1');
    valorMaximo = ((getUrlParameter('maxVal') !== undefined) ? getUrlParameter('maxVal') : '0');
    areaMaxima = ((getUrlParameter('maxArea') !== undefined) ? getUrlParameter('maxArea') : '0');
    estrato = ((getUrlParameter('stratum') !== undefined) ? getUrlParameter('stratum') : '-1');
    parqueaderos = ((getUrlParameter('parking') !== undefined) ? getUrlParameter('parking') : '-1');
    habitaciones = ((getUrlParameter('bedrooms') !== undefined) ? getUrlParameter('bedrooms') : '-1');
    banios = ((getUrlParameter('bathrooms') !== undefined) ? getUrlParameter('bathrooms') : '-1');
    ascensor = ((getUrlParameter('lift') !== undefined) ? getUrlParameter('lift') : '0');
    piscina = ((getUrlParameter('pool') !== undefined) ? getUrlParameter('pool') : '0');

    nombrebarriociudad = ((getUrlParameter('nameNeighborhoodCity') !== undefined) ? getUrlParameter('nameNeighborhoodCity') : "");

    /*Se define el array de datos adicionales como un objeto, debido a que es necesario pasarlo por referencia para el llenado de los archivos*/
    var infoPlus = {
        temp: new Array()
    };

    infoPlus.temp.push({datos: ['IdUser', user]});
    infoPlus.temp.push({datos: ['state', departamento]});
    infoPlus.temp.push({datos: ['areaMax', areaMaxima]});
    infoPlus.temp.push({datos: ['valorMax', valorMaximo]});
    infoPlus.temp.push({datos: ['city', ciudad]});
    infoPlus.temp.push({datos: ['barrio', barrio]});
    infoPlus.temp.push({datos: ['zone', zona]});
    infoPlus.temp.push({datos: ['propertieType', tipoInmueble]});
    infoPlus.temp.push({datos: ['offerType', tipoOferta]});
    infoPlus.temp.push({datos: ['estrato', estrato]});
    infoPlus.temp.push({datos: ['ascensor', ascensor]});
    infoPlus.temp.push({datos: ['iscina', piscina]});
    infoPlus.temp.push({datos: ['room', habitaciones]});
    infoPlus.temp.push({datos: ['bath', banios]});
    infoPlus.temp.push({datos: ['parking', parqueaderos]});
    infoPlus.temp.push({datos: ['nombreCiudadBarrio', nombrebarriociudad]});

//    var valorMax = $('#lblvalorMaxInmueble').html();
//    var areaMax = $('#lblAreaInmueble').html();
//    var nombreCiudadBarrio = $('#txtSearchNeighborhoodCity').val();
//    /*Se añaden como datos adicionales*/
//    infoPlus.temp.push({datos: ['valorMax', replaceText(valorMax, ',', '')]});
//    infoPlus.temp.push({datos: ['areaMax', areaMax]});
//    infoPlus.temp.push({datos: ['nombreCiudadBarrio', nombreCiudadBarrio]});
    Execute(scanInfo('listNoTable', true, '', infoPlus.temp), 'Propertie/CtlPropertie', '', 'construirGridPropertie(info);executeWithTime("closeWindow(\'modal-default\');",1000);', '', '', 'System/');
}

function construirGridPropertie(info) {

    //alert("Estoy en construir");
    //alert(info.length);

    var listado = '';

    if (info.length !== 0) {

        for (i = 0; i < info.length; i++) {

            listado += "<div class='col-md-4'>\n\
                <div class='card-box-a card-shadow seleccionable' onclick='viewInfoPropertie(" + info[i].id + ");' >\n\
                    <div class='img-box-a'>\n\
                        <img src='" + info[i].imagen + "' style='width: 380px; height: 400px;' class='img-a img-fluid'>\n\
                    </div>\n\
                    <div class='card-overlay'>\n\
                        <div class='card-overlay-a-content'>\n\
                            <div class='card-header-a'>\n\
                                <h2 class='card-title-a'>\n\
                                    <a href='#'>" + info[i].ciudad + "<br />" + info[i].tipo + " - " + info[i].zona + "</a>\n\
                                </h2>\n\
                            </div>\n\
                            <div class='card-body-a'>\n\
                                <div class='price-box d-flex'>\n\
                                    <span class='price-a'>" + info[i].oferta + " | $ " + parseInt(info[i].precio).toLocaleString() + "</span>\n\
                                </div>\n\
                                <a href='property-single.html' class='link-a'>Ver más\n\
                                    <span class='ion-ios-arrow-forward'></span>\n\
                                </a>\n\
                            </div>\n\
                            <div class='card-footer-a'>\n\
                                <ul class='card-info d-flex justify-content-around'>\n\
                                    <li>\n\
                                        <label class='fa fa-area-chart'></label><br>\n\
                                        <span>" + info[i].area + " m<sup>2</sup></span>\n\
                                    </li>\n\
                                    <li>\n\
                                        <label class='fa fa-bed'></label><br>\n\
                                        <span>" + info[i].habitaciones + "</span>\n\
                                    </li>\n\
                                    <li>\n\
                                        <label class='fa fa-bath'></label><br>\n\
                                        <span>" + info[i].banios + "</span>\n\
                                    </li>\n\
                                    <li>\n\
                                        <label class='fa fa-automobile'></label><br>\n\
                                        <span>" + info[i].parqueaderos + "</span>\n\
                                    </li>\n\
                                </ul>\n\
                            </div>\n\
                        </div>\n\
                    </div>\n\
                </div>\n\
            </div>"
        }
        $('#lstProperties').html(listado);

    }else{
        listado += "<div class='col-md-10'>\n\
                        <label>No se encuentran inmubles con esas características</label>\n\
                    </div>";
        $('#lstProperties').html(listado);
    }


}

function viewInfoPropertie(id) {
    var url = 'property-single&&id=' + id;
    refreshPagePublic(url);
}
