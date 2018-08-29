/* Funciones jQuery */
$(window).on("load", function (e) {
    listProperties();
});

var registrosPagina = 3;
var totalRegistros = 0;
var totalPaginacion = 0;
var objectToPagination;

function listProperties() {
    Execute(scanInfo('listNoTable'), 'Propertie/CtlPropertie', '', 'buildListPropertie(info);', '', '', 'System/');
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

        for (f = 0; f < totalIteracion; f++) {

            listado = listado + construirRegistroPaginacion(f);

        }

        $("#lstProperties").html(listado);
        configurarPaginador(1);
    } else {
        //listado = listado + "<div class='row'><div class='col s12 m1'></div><div class='col s12 m8'><div class='icon-block'><div> <hr style='color: #DFDFDF;' /></div><label>Informacion no encontrada</label><br><p class='light'>No se encuentran noticias para mostrar</p></div></div><div class='col s12 m1'></div></div>";
        //$("#lstNoticias").html(listado);
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


    return "<div class='col-md-4'>\n\
                                    <div class='card mb-4 box-shadow'>\n\
                                        <img src='" + imagen + "'  \n\
                                             width='100' height='225'  \n\
                                             data-src='holder.js/100px225?theme=social&bg=55595c&fg=eceeef&text=Thumbnail' \n\
                                             alt='Card image cap' \n\
                                             class='card-img-top' >\n\
                                        <div class='card-body'>      \n\
                                            <h4 class='card-text'>" + barrio + " - " + zona + " - " + ciudad + "</h4>\n\
                                            <h5 class='card-text'>" + oferta + " - $" + precio + "</h5>   \n\
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
                                            <div> \n\
                                                <button type='button' class='btn btn-block btn-primary btn-lg' onclick='viewInfoPropertie(" + id + ");'>Ver inmueble</button> \n\
                                            </div>\n\
                                        </div> \n\
                                    </div>\n\
                                 </div>";
}



function configurarPaginador(posSeleccionada) {

    var paginador = "";

    for (var x = 1; x <= totalPaginacion; x++) {
        paginador = paginador + "<button id='pag" + (x - 1) + "' type='button' class='btn " + ((posSeleccionada === x) ? "btn-primary" : "btn-default") + " pag' onclick='repaginar(" + (x - 1) + ");'>" + x + "</button>";
    }

    $('#segmentoPaginador').html(paginador);
}


function repaginar(posSeleccionada) {

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