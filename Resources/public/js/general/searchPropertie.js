/* Funciones jQuery */
$(window).on("load", function (e) {
    loadDepartment();
    loadCity(-1);
    loadNeighborhood(-1);
    loadZone();
    loadPropertieType();
    loadOfferType();
    loadStratum();
    listProperties();
    loadValorMaximo();
    loadAreaMaxima();
});
var registrosPagina = 8;
var totalRegistros = 0;
var totalPaginacion = 0;
var objectToPagination;
function loadValorMaximo() {
    Execute(scanInfo('loadPrecioMaximoInmueble', false), 'General/CtlGeneral', '', 'cargarValorMaximo(info)', '', '', 'System/');
}

function cargarValorMaximo(info) {
    $("#rngValorMaximoInmueble").prop('max', info[0].precio);
    $("#lblValorMaxPosible").html("$ " + parseFloat(info[0].precio).toLocaleString('en'));
}


function loadAreaMaxima() {
    Execute(scanInfo('loadAreaMaximaInmueble', false), 'General/CtlGeneral', '', 'cargarAreaMaxima(info)', '', '', 'System/');
}

function cargarAreaMaxima(info) {
    $("#rngAreaInmueble").prop('max', info[0].area);
    $("#lblAreaMaxPosible").html(info[0].area + " mts2");
}

function loadDepartment() {
    Execute(scanInfo('loadDepartment', false), 'General/CtlGeneral', '', 'buildSelect(info,"selState");', '', '', 'System/');
}

function loadCity(id) {
    Execute(scanInfo('loadCity', false, '', [{datos: ["id", id]}]), 'General/CtlGeneral', '', 'buildSelect(info,"selCity");', '', '', 'System/');
}


function loadNeighborhood(id) {
    Execute(scanInfo('loadNeighborhood', false, '', [{datos: ["id", id]}]), 'General/CtlGeneral', '', 'buildSelect(info,"selBarrio");', '', '', 'System/');
}

function loadZone() {
    Execute(scanInfo('loadZone', false), 'General/CtlGeneral', '', 'buildSelect(info,"selZone");', '', '', 'System/');
}


function loadPropertieType() {
    Execute(scanInfo('loadPropertieType', false), 'General/CtlGeneral', '', 'buildSelect(info,"selPropertieType");', '', '', 'System/');
}


function loadOfferType() {
    Execute(scanInfo('loadOfferType', false), 'General/CtlGeneral', '', 'buildSelect(info,"selOfferType");', '', '', 'System/');
}

function loadStratum() {
    Execute(scanInfo('loadStratum', false), 'General/CtlGeneral', '', 'buildSelect(info,"selStratum");', '', '', 'System/');
}


function listProperties() {

    /*Se define el array de datos adicionales como un objeto, debido a que es necesario pasarlo por referencia para el llenado de los archivos*/
    var infoPlus = {
        temp: new Array()
    };
    var valorMax = $("#lblvalorMaxInmueble").html();
    var areaMax = $("#lblAreaInmueble").html();
    /*Se añaden como datos adicionales*/
    infoPlus.temp.push({datos: ["valorMax", replaceText(valorMax, ",", "")]});
    infoPlus.temp.push({datos: ["areaMax", areaMax]});
    Execute(scanInfo('listNoTable', true, '', infoPlus.temp), 'Propertie/CtlPropertie', '', 'buildListPropertie(info);', '', '', 'System/');
}


function buildListPropertie(info) {

    console.log(info);
    var listado = "";
    showLoadBar(true);
    if (info.length > 0) {


        totalRegistros = info.length;
        totalPaginacion = Math.ceil(totalRegistros / registrosPagina);
        objectToPagination = info;
        var totalIteracion = (info.length > registrosPagina) ? registrosPagina : info.length;
        var contLinea = 0;
        for (f = 0; f < totalIteracion; f++) {
            listado = listado + construirRegistroPaginacion(f);
            contLinea++;
            /*Cada tres registros coloca una linea divisoria*/
            if (contLinea === 4) {
                listado += "<div class='col-md-12'><hr></div>";
                contLinea = 0;
            }
        }

        $("#lstProperties").html(listado);
        configurarPaginador(1);
    } else {
        listado = listado + "<div class='row'>\n\
                                    <div class='col-md-4'></div>\n\
                                    </div>\n\
                                    <div class='col-md-4'></div>\n\
                                                <div class='icon-block'><div> <hr style='color: #DFDFDF;' /></div>\n\
                                                    <label>No se encuentran inmubles con esas caracteristicas</label>\n\
                                                </div>\n\
                                    </div>\n\
                                    <div class='col-md-4'></div>\n\
                             </div>";
        $("#lstProperties").html(listado);
        $('#segmentoPaginador').html("");
    }

    showLoadBar(false);
}




function construirRegistroPaginacion(pos) {

    var id = objectToPagination[pos].id;
    var tipo = objectToPagination[pos].tipo;
    var oferta = objectToPagination[pos].oferta;
    var precio = objectToPagination[pos].precio;
    var ciudad = objectToPagination[pos].ciudad;
    var zona = objectToPagination[pos].zona;
    var barrio = objectToPagination[pos].barrio;
    var imagen = objectToPagination[pos].imagen;
    var habitaciones = objectToPagination[pos].habitaciones;
    var parqueaderos = objectToPagination[pos].parqueaderos;
    var area = objectToPagination[pos].area;
    var tipoinmueble = objectToPagination[pos].tipoinmueble;
    /*Medidas originales, a col-md-4 y 100 x 225*/
    /*Medidas de prueba, a col-md-3 y 100 x 175*/
    return "<div class='col-md-3 seleccionable' onclick='viewInfoPropertie(" + id + ");'>\n\
                                    <div class='mb-4 imagenesListadoInmueblesContenedor'>\n\
                                        <img src='" + imagen + "'  \n\
                                             width='100' height='225'  \n\
                                             alt='Card image cap' \n\
                                             class='card-img-top' >\n\
                                        <div class='card-body'>      \n\
                                            <h5 class='card-text titulosPrincipales'>" + ((barrio.length > 20) ? (barrio.substring(0, 22) + "..") : barrio) + "</h5>\n\
                                            <h5 class='card-text titulosPrincipales'>" + oferta + "</h5>\n\
                                            <small class='text-muted'>   \n\
                                                <label for='chkChimenea' class='fa fa-home'></label> \n\
                                                <label for='chkChimenea'>" + tipoinmueble + "</label>&nbsp;&nbsp;\n\
                                                <label for='chkChimenea' class='fa fa-bed'></label> \n\
                                                <label for='chkChimenea'>" + habitaciones + " Hab.</label>&nbsp;&nbsp;&nbsp;\n\
                                                <label for='chkChimenea' class='fa fa-automobile'></label>\n\
                                                <label for='chkChimenea'>" + parqueaderos + " Parq.</label>&nbsp;&nbsp;&nbsp;\n\
                                                <label for='chkChimenea' class='fa fa-area-chart'></label>\n\
                                                <label for='chkChimenea'>" + area + " m<sup>2</sup></label>&nbsp;&nbsp;&nbsp;\n\
                                            </small>\n\
                                            <div> \n\
                                                <button type='button' class='btn btn-block btn-primary btn-lg'>$ " + parseInt(precio).toLocaleString() + "</button> \n\
                                            </div>\n\
                                        </div> \n\
                                    </div>\n\
                                 </div>";
//    return "<div class='col-md-4'>\n\
//                                    <div class='card mb-4 box-shadow'>\n\
//                                        <img src='" + imagen + "'  \n\
//                                             width='100' height='225'  \n\
//                                             data-src='holder.js/100px225?theme=social&bg=55595c&fg=eceeef&text=Thumbnail' \n\
//                                             alt='Card image cap' \n\
//                                             class='card-img-top' >\n\
//                                        <div class='card-body'>      \n\
//                                            <h4 class='card-text'>" + barrio + " - " + zona + " - " + ciudad + "</h4>\n\
//                                            <h5 class='card-text'>" + oferta + " - $" + precio + "</h5>   \n\
//                                            <small class='text-muted'>   \n\
//                                                <label for='chkChimenea' class='fa fa-home'></label> \n\
//                                                <label for='chkChimenea'>" + tipoinmueble + "</label>&nbsp;&nbsp;\n\
//                                                <label for='chkChimenea' class='fa fa-bed'></label> \n\
//                                                <label for='chkChimenea'>" + habitaciones + " Hab.</label>&nbsp;&nbsp;&nbsp;\n\
//                                                <label for='chkChimenea' class='fa fa-automobile'></label>\n\
//                                                <label for='chkChimenea'>" + parqueaderos + " Parq.</label>&nbsp;&nbsp;&nbsp;\n\
//                                                <label for='chkChimenea' class='fa fa-area-chart'></label>\n\
//                                                <label for='chkChimenea'>" + area + " m<sup>2</sup></label>&nbsp;&nbsp;&nbsp;\n\
//                                            </small>                            \n\
//                                            <div> \n\
//                                                <button type='button' class='btn btn-block btn-primary btn-lg' onclick='viewInfoPropertie(" + id + ");'>Ver inmueble</button> \n\
//                                            </div>\n\
//                                        </div> \n\
//                                    </div>\n\
//                                 </div>";
}



function configurarPaginador(posSeleccionada) {

    var paginador = "";
    for (var x = 1; x <= totalPaginacion; x++) {
        paginador = paginador + "<button id='pag" + (x - 1) + "' type='button' class='btn " + ((posSeleccionada === x) ? "btn-primary" : "btn-default") + " pag' onclick='repaginar(" + (x - 1) + ");'>" + x + "</button>";
    }

    $('#segmentoPaginador').html(paginador);
}


function repaginar(posSeleccionada) {
    
    moverScrollView("divMoveToAfterFilterRepaginar");


    showLoadBar(true);
    var listado = "";
    $(".pag").removeClass("btn-primary");
    $(".pag").addClass("btn-default");
    $("#pag" + posSeleccionada).addClass("btn-primary");
    var posInicial = posSeleccionada * registrosPagina;
    var posFinal = ((posInicial + registrosPagina) > totalRegistros) ? totalRegistros : (posInicial + registrosPagina);
    for (f = posInicial; f <= posFinal - 1; f++) {

        listado = listado + construirRegistroPaginacion(f);
    }

    $("#lstProperties").html(listado);
    showLoadBar(false);
}



function viewInfoPropertie(id) {
    var url = "infoPropertie&&id=" + id;
    refreshPagePublic(url);
}





function changeValueRange(idRange, idLbl) {
    $("#" + idLbl).html(parseFloat($("#" + idRange).val()).toLocaleString('en'));
}





