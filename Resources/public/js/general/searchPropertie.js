/* Funciones jQuery */
$(window).on('load', function (e) {
    //alert("Estoy en el load");
    loadOfferTypeGeneral();
    listProperties();


//
//    if (getUrlParameter('typeOffer') !== undefined || getUrlParameter('nameNeighborhoodCity') !== undefined) {
//
//        if (getUrlParameter('nameNeighborhoodCity') !== '') {
//            $('#txtSearchNeighborhoodCity').val(getUrlParameter('nameNeighborhoodCity'));
//        }
//
//        if (getUrlParameter('typeOffer') !== undefined) {
//            rapidSearch(getUrlParameter('typeOffer'));
//        } else {
//            rapidSearch('');
//        }
//
//        showToast('Cargando... por favor espere');
//
//    } else {
//        listProperties();
//    }
//
//    if (getUrlParameter('idciudad') !== undefined) {
//
//        if (getUrlParameter('nameNeighborhoodCity') !== '') {
//            $('#txtSearchNeighborhoodCity').val(getUrlParameter('nameNeighborhoodCity'));
//        }
//
//        if (getUrlParameter('typeOffer') !== undefined) {
//            rapidSearch(getUrlParameter('typeOffer'));
//        } else {
//            rapidSearch('');
//        }
//
//        showToast('Cargando... por favor espere');
//
//    } else {
//        listProperties();
//    }

});

function searchOfferType() {
    if ($("#selOfferTypeGeneral").val() == -1) {
        var url = "searchPropertie&&offerType=" + $("#selOfferTypeGeneral").val();
        refreshPagePublic(url);
    }else{
        listProperties();
    }

}

function loadOfferTypeGeneral() {
    Execute(scanInfo('loadOfferType', false), 'General/CtlGeneral', '', 'buildSelect(info,"selOfferTypeGeneral");', '', '', 'System/');
}

//var registrosPagina = 8;
//var totalRegistros = 0;
//var totalPaginacion = 0;
//var objectToPagination;

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
//
//
//function buildListPropertie(info) {
//
//    console.log(info);
//    var listado = '';
//    showLoadBar(true);
//    if (info.length > 0) {
//
//
//        totalRegistros = info.length;
//        totalPaginacion = Math.ceil(totalRegistros / registrosPagina);
//        objectToPagination = info;
//        var totalIteracion = (info.length > registrosPagina) ? registrosPagina : info.length;
//        var contLinea = 0;
//        for (f = 0; f < totalIteracion; f++) {
//            listado = listado + construirRegistroPaginacion(f);
//            contLinea++;
//            /*Cada tres registros coloca una linea divisoria*/
//            if (contLinea === 4) {
//                listado += '<div class='col-md-12'><hr></div>';
//                contLinea = 0;
//            }
//        }
//
//        $('#lstProperties').html(listado);
//        configurarPaginador(1);
//    } else {
//        listado = listado + '<div class='row'>\n\
//                                    <div class='col-md-4'></div>\n\
//                                    </div>\n\
//                                    <div class='col-md-4'></div>\n\
//                                                <div class='icon-block'><div> <hr style='color: #DFDFDF;' /></div>\n\
//                                                    <label>No se encuentran inmubles con esas caracteristicas</label>\n\
//                                                </div>\n\
//                                    </div>\n\
//                                    <div class='col-md-4'></div>\n\
//                             </div>';
//        $('#lstProperties').html(listado);
//        $('#segmentoPaginador').html('');
//    }
//
//    showLoadBar(false);
//}

function construirGridPropertie(info) {

    //alert("Estoy en construir");
    //alert(info.length);

    var listado = '';

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
}




//function construirRegistroPaginacion(pos) {
//
//                var id = objectToPagination[pos].id;
//        var tipo = objectToPagination[pos].tipo;
//        var oferta = objectToPagination[pos].oferta;
//        var precio = objectToPagination[pos].precio;
//        var ciudad = objectToPagination[pos].ciudad;
//        var zona = objectToPagination[pos].zona;
//        var barrio = objectToPagination[pos].barrio;
//        var imagen = objectToPagination[pos].imagen;
//        var habitaciones = objectToPagination[pos].habitaciones;
//        var parqueaderos = objectToPagination[pos].parqueaderos;
//        var area = objectToPagination[pos].area;
//        var tipoinmueble = objectToPagination[pos].tipoinmueble;
//        return '<div class='col-md-3 seleccionable' onclick='viewInfoPropertie(' + id + ');'>\n\
//                                    <div class='mb-4 imagenesListadoInmueblesContenedor'>\n\
//                                        <a href='?page=infoPropertie&&id=' + id + ''><img src='' + imagen + ''  \n\
//                                             width='100' height='225'  \n\
//                                             alt='Card image cap' \n\
//                                             class='card-img-top' ></a>\n\
//                                        <div class='ofertaInmuebleListaPublica'>\n\
//                                            <img class='imangenOfertaInmuebleListaPublica' src='Resources/public/image/' + ((oferta === 'Venta') ? 'venta' : 'arriendo') + '.png' width='100' height='100'>\n\
//                                        </div>\n\
//                                        <div class='card-body' style='padding-bottom: 0px;padding-top: 5px;'>      \n\
//                                            <h5 class='card-text titulosPrincipales'>' + ((barrio.length > 20) ? (barrio.substring(0, 22) + '..') : barrio) + '</h5>\n\
//                                            <small class='text-muted'>   \n\
//                                                <label for='chkChimenea' class='fa fa-home'></label> \n\
//                                                <label for='chkChimenea'>' + tipoinmueble + '</label>&nbsp;&nbsp;\n\
//                                                <label for='chkChimenea' class='fa fa-bed'></label> \n\
//                                                <label for='chkChimenea'>' + habitaciones + ' Hab.</label>&nbsp;&nbsp;&nbsp;<br>\n\
//                                                <label for='chkChimenea' class='fa fa-automobile'></label>\n\
//                                                <label for='chkChimenea'>' + parqueaderos + ' Parq.</label>&nbsp;&nbsp;&nbsp;\n\
//                                                <label for='chkChimenea' class='fa fa-area-chart'></label>\n\
//                                                <label for='chkChimenea'>' + area + ' m<sup>2</sup></label>&nbsp;&nbsp;&nbsp;\n\
//                                            </small>\n\
//                                        </div> \n\
//                                        <div> \n\
//                                            <a href='?page=infoPropertie&&id=' + id + ''>\n\
//                                                <button type='button' class='btn btn-block btn-primary btn-lg'>$ ' + parseInt(precio).toLocaleString() + '</button>\n\
//                                            </a> \n\
//                                        </div>\n\
//                                    </div>\n\
//                                 </div>';
////    return '<div class='col-md-4'>\n\
////                                    <div class='card mb-4 box-shadow'>\n\
////                                        <img src='' + imagen + ''  \n\
////                                             width='100' height='225'  \n\
////                                             data-src='holder.js/100px225?theme=social&bg=55595c&fg=eceeef&text=Thumbnail' \n\
////                                             alt='Card image cap' \n\
////                                             class='card-img-top' >\n\
////                                        <div class='card-body'>      \n\
////                                            <h4 class='card-text'>' + barrio + ' - ' + zona + ' - ' + ciudad + '</h4>\n\
////                                            <h5 class='card-text'>' + oferta + ' - $' + precio + '</h5>   \n\
////                                            <small class='text-muted'>   \n\
////                                                <label for='chkChimenea' class='fa fa-home'></label> \n\
////                                                <label for='chkChimenea'>' + tipoinmueble + '</label>&nbsp;&nbsp;\n\
////                                                <label for='chkChimenea' class='fa fa-bed'></label> \n\
////                                                <label for='chkChimenea'>' + habitaciones + ' Hab.</label>&nbsp;&nbsp;&nbsp;\n\
////                                                <label for='chkChimenea' class='fa fa-automobile'></label>\n\
////                                                <label for='chkChimenea'>' + parqueaderos + ' Parq.</label>&nbsp;&nbsp;&nbsp;\n\
////                                                <label for='chkChimenea' class='fa fa-area-chart'></label>\n\
////                                                <label for='chkChimenea'>' + area + ' m<sup>2</sup></label>&nbsp;&nbsp;&nbsp;\n\
////                                            </small>                            \n\
////                                            <div> \n\
////                                                <button type='button' class='btn btn-block btn-primary btn-lg' onclick='viewInfoPropertie(' + id + ');'>Ver inmueble</button> \n\
////                                            </div>\n\
////                                        </div> \n\
////                                    </div>\n\
////                                 </div>';
//}
//
//
//
//function configurarPaginador(posSeleccionada) {
//
//        var paginador = '';
//        for (var x = 1; x <= totalPaginacion; x++) {
//                paginador = paginador + '<button id='pag' + (x - 1) + '' type='button' class='btn ' + ((posSeleccionada === x) ? 'btn-primary' : 'btn-default') + ' pag' onclick='repaginar(' + (x - 1) + ');'>' + x + '</button>';
//}
//
//$('#segmentoPaginador').html(paginador);
//}
//
//
//function repaginar(posSeleccionada) {
//
//                moverScrollView('divMoveToAfterFilterRepaginar');
//                showLoadBar(true);
//                var listado = '';
//                $('.pag').removeClass('btn-primary');
//                $('.pag').addClass('btn-default');
//                $('#pag' + posSeleccionada).addClass('btn-primary');
//                var posInicial = posSeleccionada * registrosPagina;
//                var posFinal = ((posInicial + registrosPagina) > totalRegistros) ? totalRegistros : (posInicial + registrosPagina);
//                for (f = posInicial; f <= posFinal - 1; f++) {
//
//                                listado = listado + construirRegistroPaginacion(f);
//}
//
//$('#lstProperties').html(listado);
//showLoadBar(false);
//}
//
//
//
function viewInfoPropertie(id) {
    var url = 'property-single&&id=' + id;
    refreshPagePublic(url);
}
//
//
//
//
//
//function changeValueRange(idRange, idLbl) {
//                                $('#' + idLbl).html(parseFloat($('#' + idRange).val()).toLocaleString('en'));
//}
//
//
//function changeValuerapidSearch(valor, id) {
//                                $('.botonFiltroBusquedaBanner').removeClass('botonSeleccionado');
//                                if ($('#selOfferType').val() === valor) {
//                                            $('#selOfferType').val(-1);
//} else {
//                                                    $('#' + id).addClass('botonSeleccionado');
//                                            $('#selOfferType').val(valor);
//}
//}
//
//
//function rapidSearch(type) {
//
//
//
//                                            if ((type !== '' && $('#selOfferType option').length > 1) || type === '') {
//                                                switch (type) {
//
//                                                        case 'venta':
//                                                            $('#btnVentaFiltroSearch').addClass('botonSeleccionado');
//                                                            $('#selOfferType').val(16);
//                                                            break;
//
//                                                        case 'arriendo':
//                                                            $('#btnArriendoFiltroSearch').addClass('botonSeleccionado');
//                                                            $('#selOfferType').val(15);
//                                                            break;
//
//                                                        case 'vacacional':
//                                                            $('#btnVacacionalFiltroSearch').addClass('botonSeleccionado');
//                                                            $('#selOfferType').val(17);
//                                                            break;
//
//                                                        default:
//
//                                                            break;
//}
//
//listProperties();
//moverScrollView('divMoveToAfterFilterRepaginar');
//} else {
//                                                        executeWithTime('rapidSearch('' + type + '')', 1000);
//}
//}
