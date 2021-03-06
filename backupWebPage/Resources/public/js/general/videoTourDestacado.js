/* Funciones jQuery */
$(window).on("load", function (e) {
    listFeaturedProperties();
    executeWithTime('repaginacionAutomatica();', 3000);
});
var registrosPaginaDestacado = 2;
var totalRegistrosDestacado = 0;
var posicionActualPaginacionDestacado = 0;
var objectToPaginationDestacado;


var repaginarAutomaticamente = true;

function listFeaturedProperties() {
    Execute(scanInfo('listNoTableByFixedContidion', false, '', ''), 'Propertie/CtlPropertie', '', 'buildListFeaturedProperties(info);', '', '', 'System/');
}







function buildListFeaturedProperties(info) {

    console.log(info);
    var listado = "<tr>";
    showLoadBar(true);
    if (info.length > 0) {

        totalRegistrosDestacado = info.length;
        objectToPaginationDestacado = info;
        var totalIteracion = (info.length > registrosPaginaDestacado) ? registrosPaginaDestacado : info.length;

        for (f = 0; f < totalIteracion; f++) {
            listado = listado + construirRegistroPaginacionDestacado(f);
        }

        listado += "</tr>";
        $("#tblInmueblesDestacados").html(listado);
    } else {
        listado = listado + "<div class='row'>\n\
                                    <div class='col-md-4 col-sm-12 col-xs-12'></div>\n\
                                    </div>\n\
                                    <div class='col-md-4 col-sm-12 col-xs-12'></div>\n\
                                                <div class='icon-block'><div> <hr style='color: #DFDFDF;' /></div>\n\
                                                    <label>No se encuentran inmubles con esas caracteristicas</label>\n\
                                                </div>\n\
                                    </div>\n\
                                    <div class='col-md-4 col-sm-12 col-xs-12'></div>\n\
                             </div>";
        $("#tblInmueblesDestacados").html(listado);
        $('#segmentoPaginadorDestacado').html("");
    }

    showLoadBar(false);
}




function viewInfoFeaturedPropertie(id) {
    var url = "infoPropertie&&id=" + id;
    refreshPagePublic(url);
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
    var tipoinmueble = objectToPaginationDestacado[pos].tipoinmueble;
    var linderos = objectToPaginationDestacado[pos].linderos;


    return "<td class='seleccionable' onclick='viewInfoFeaturedPropertie(" + id + ");' width='50%'>\n\
                    <table>\n\
                        <tr>\n\
                            <td>\n\
                                <img class='rounded-circle' src='" + imagen + "' alt='Generic placeholder image' width='70' height='70'>\n\
                            </td>\n\
                            <td>\n\
                                &nbsp; &nbsp;\n\
                            </td>\n\
                            <td>\n\
                                <table class='tableEspacios'>\n\
                                    <tr class='informacionInmuebleDestacado'>\n\
                                        <td>\n\
                                            <h6 class='informacionInmuebleDestacado'>" + ciudad + "</h6>\n\
                                        </td>\n\
                                    </tr>\n\
                                    <tr class='informacionInmuebleDestacado'>\n\
                                        <td>\n\
                                            <h6 class='informacionInmuebleDestacado'>" + barrio + "</h6>\n\
                                            <img src='Resources/public/image/LineaDivisora2.PNG' width='55'/>\n\
                                        </td>\n\
                                    </tr>\n\
                                    <tr class='informacionInmuebleDestacado'>\n\
                                        <td>\n\
                                        </td>\n\
                                    </tr>\n\
                                    <tr class='informacionInmuebleDestacado'>\n\
                                        <td>\n\
                                        </td>\n\
                                    </tr>\n\
                                </table>\n\
                            </td>\n\
                        </tr>\n\
                    </table>\n\
                    <br>\n\
                    <small class='textoContenido'>" + ((linderos.length > 500) ? linderos.substring(0, 500) : rellenarEspaciosTexto(linderos, 500)) + "</small>\n\
                </td>\n\
                <td>\n\
                    &nbsp; &nbsp; &nbsp;\n\
                </td>";
}










function repaginarDestacado(cambioPosicion) {

    posicionActualPaginacionDestacado += cambioPosicion;

    if (posicionActualPaginacionDestacado < 0) {
        posicionActualPaginacionDestacado = 0;
    }

    if (posicionActualPaginacionDestacado + 2 > objectToPaginationDestacado.length - 1) {
        posicionActualPaginacionDestacado = objectToPaginationDestacado.length - 2;
    }

    var posInicial = posicionActualPaginacionDestacado;
    var posFinal = (objectToPaginationDestacado.length < posicionActualPaginacionDestacado + 2) ? objectToPaginationDestacado.length : posicionActualPaginacionDestacado + 2;    
    var listado = "<tr>";

    for (f = posInicial; f < posFinal; f++) {
        listado = listado + construirRegistroPaginacionDestacado(f);
    }

    listado += "</tr>";

    $("#tblInmueblesDestacados").html(listado);

    showLoadBar(false);

}




function rellenarEspaciosTexto(cadena, tamanio) {

    numeroEspacios = (cadena.length > tamanio) ? 0 : (tamanio - cadena.length);

    while (numeroEspacios > 0) {
        cadena += " &nbsp; ";
        numeroEspacios--;
    }

    return cadena;
}




function repaginacionAutomatica() {

    if (repaginarAutomaticamente) {

        if ((posicionActualPaginacionDestacado + 2) === objectToPaginationDestacado.length) {
            posicionActualPaginacionDestacado = 0;
        }
        repaginarDestacado(2);
        executeWithTime('repaginacionAutomatica();', 3000);
    }
}