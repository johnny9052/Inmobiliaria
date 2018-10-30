/* Funciones jQuery */
$(window).on("load", function (e) {
    listFeaturedProperties();
});



var registrosPaginaDestacado = 2;
var totalRegistrosDestacado = 0;
var totalPaginacionDestacado = 0;
var objectToPaginationDestacado;


function listFeaturedProperties() {
    Execute(scanInfo('listNoTableByFixedContidion', false, '', ''), 'Propertie/CtlPropertie', '', 'buildListFeaturedProperties(info);', '', '', 'System/');
}


function buildListFeaturedProperties(info) {

    console.log(info);

    var listado = "";

    showLoadBar(true);

    if (info.length > 0) {

        totalRegistros = info.length;
        totalPaginacion = Math.ceil(totalRegistros / registrosPaginaDestacado);
        objectToPaginationDestacado = info;

        var totalIteracion = (info.length > registrosPaginaDestacado) ? registrosPaginaDestacado : info.length;


        for (f = 0; f < totalIteracion; f++) {
            listado = listado + construirRegistroPaginacionDestacado(f);
        }

        $("#tblInmueblesDestacados").html(listado);
        configurarPaginadorDestacado(1);
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
        $("#tblInmueblesDestacados").html(listado);
        $('#segmentoPaginadorDestacado').html("");
    }

    showLoadBar(false);
}








function construirRegistroPaginacionDestacado(pos) {

    var id = objectToPaginationDestacado[pos].id;
    var tipo = objectToPaginationDestacado[pos].tipo;
    var oferta = objectToPaginationDestacado[pos].oferta;
    var precio = objectToPaginationDestacado[pos].precio;
    var ciudad = objectToPaginationDestacado[pos].ciudad;
    var zona = objectToPaginationDestacado[pos].zona;
    var barrio = objectToPaginationDestacado[pos].barrio;
    var imagen = objectToPaginationDestacado[pos].imagen;
    var habitaciones = objectToPaginationDestacado[pos].habitaciones;
    var parqueaderos = objectToPaginationDestacado[pos].parqueaderos;
    var area = objectToPaginationDestacado[pos].area;
    var tipoinmueble = objectToPaginationDestacado[pos].tipoinmueble;

    /*Medidas originales, a col-md-4 y 100 x 225*/
    /*Medidas de prueba, a col-md-3 y 100 x 175*/
    return "<div class='col-md-4 seleccionable' onclick='viewInfoPropertie(" + id + ");'>\n\
                                    <div class='mb-4 imagenesListadoInmueblesContenedor'>\n\
                                        <img src='" + imagen + "'  \n\
                                             width='100' height='225'  \n\
                                             alt='Card image cap' \n\
                                             class='card-img-top' >\n\
                                        <div class='valorInmuebleListaPublica titulosSecundarios'>" + "$" + precio + "</div>\n\
                                        <div class='card-body'>      \n\
                                            <h4 class='card-text'>" + barrio + " - " + zona + " - " + ciudad + "</h4>\n\
                                                <small class='text-muted'>   \n\
                                                <label for='chkChimenea' class='fa fa-home'></label> \n\
                                                <label for='chkChimenea'>" + tipoinmueble + "</label>&nbsp;&nbsp;\n\
                                                <label for='chkChimenea' class='fa fa-bed'></label> \n\
                                                <label for='chkChimenea'>" + habitaciones + " Hab.</label>&nbsp;&nbsp;&nbsp;\n\
                                                <label for='chkChimenea' class='fa fa-automobile'></label>\n\
                                                <label for='chkChimenea'>" + parqueaderos + " Parq.</label>&nbsp;&nbsp;&nbsp;\n\
                                                <label for='chkChimenea' class='fa fa-area-chart'></label>\n\
                                                <label for='chkChimenea'>" + area + " m<sup>2</sup></label>&nbsp;&nbsp;&nbsp;\n\
                                            </small>                            \n\
                                        </div> \n\
                                    </div>\n\
                                 </div>";


}



function configurarPaginadorDestacado(posSeleccionada) {

    var paginador = "";

    for (var x = 1; x <= totalPaginacionDestacado; x++) {
        paginador = paginador + "<button id='pag" + (x - 1) + "' type='button' class='btn " + ((posSeleccionada === x) ? "btn-primary" : "btn-default") + " pag' onclick='repaginar(" + (x - 1) + ");'>" + x + "</button>";
    }

    $('#segmentoPaginadorDestacado').html(paginador);
}






function repaginar(posSeleccionada) {

    showLoadBar(true);

    var listado = "";

    $(".pag").removeClass("btn-primary");
    $(".pag").addClass("btn-default");
    $("#pag" + posSeleccionada).addClass("btn-primary");

    var posInicial = posSeleccionada * registrosPaginaDestacado;
    var posFinal = ((posInicial + registrosPaginaDestacado) > totalRegistrosDestacado) ? totalRegistrosDestacado : (posInicial + registrosPaginaDestacado);

    for (f = posInicial; f <= posFinal - 1; f++) {

        listado = listado + construirRegistroPaginacionDestacado(f);
    }

    $("#tblInmueblesDestacados").html(listado);

    showLoadBar(false);

}