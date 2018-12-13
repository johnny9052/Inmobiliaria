var tipoOferta = "";
var nombreBarrioCiudad = "";

function cambiarTipoOferta(tipo, id) {

    $(".botonFiltroBusquedaBanner").removeClass("botonSeleccionado");
    if (tipoOferta === tipo) {
        tipoOferta = "";
    } else {
        tipoOferta = tipo;
        $("#" + id).addClass("botonSeleccionado");
    }
}


function rapidSearch() {

    nombreBarrioCiudad = $("#txtSearchNeighborhoodCity").val();

    var url = "searchPropertie" +
            ((tipoOferta !== "") ? ("&&typeOffer=" + tipoOferta) : "") +
            ((nombreBarrioCiudad !== "") ? ("&&nameNeighborhoodCity=" + nombreBarrioCiudad) : "");


    if (tipoOferta !== "" || nombreBarrioCiudad !== "") {
        refreshPagePublic(url);
    } else {
        showToast("Ingrese o seleccione un criterio de busqueda", "error");
    }
}

function rapidSearchByCity(id) {

    var url = "searchPropertie&&idciudad=" + id;
        refreshPagePublic(url);
    
}

