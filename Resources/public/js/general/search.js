/* Funciones jQuery */
$(window).on('load', function (e) {
    loadDepartment();
    loadCity(-1);
    loadNeighborhood(-1);
    loadZone();
    loadPropertieType();
    loadOfferType();
    loadStratum();
    loadValorMaximo();
    loadAreaMaxima();
});

function loadValorMaximo() {
    Execute(scanInfo('loadPrecioMaximoInmueble', false), 'General/CtlGeneral', '', 'cargarValorMaximo(info)', '', '', 'System/');
}

function cargarValorMaximo(info) {
    $('#rngValorMaximoInmueble').prop('max', info[0].precio);
    $('#lblValorMaxPosible').html('$ ' + parseFloat(info[0].precio).toLocaleString('en'));
}


function loadAreaMaxima() {
    Execute(scanInfo('loadAreaMaximaInmueble', false), 'General/CtlGeneral', '', 'cargarAreaMaxima(info)', '', '', 'System/');
}

function cargarAreaMaxima(info) {
    $('#rngAreaInmueble').prop('max', info[0].area);
    $('#lblAreaMaxPosible').html(info[0].area + ' mts2');
}

function loadDepartment() {
    Execute(scanInfo('loadDepartment', false), 'General/CtlGeneral', '', 'buildSelect(info,"selState");', '', '', 'System/');
}

function loadCity(id) {
    Execute(scanInfo('loadCity', false, '', [{datos: ['id', id]}]), 'General/CtlGeneral', '', 'buildSelect(info,"selCity");', '', '', 'System/');
}

function loadNeighborhood(id) {
    Execute(scanInfo('loadNeighborhood', false, '', [{datos: ['id', id]}]), 'General/CtlGeneral', '', 'buildSelect(info,"selBarrio");', '', '', 'System/');
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

function changeValueRange(idRange, idLbl) {
    $('#' + idLbl).html(parseFloat($('#' + idRange).val()).toLocaleString('en'));
}

function changeValuerapidSearch(valor, id) {
    $('.botonFiltroBusquedaBanner').removeClass('botonSeleccionado');
    if ($('#selOfferType').val() === valor) {
        $('#selOfferType').val(-1);
    } else {
        $('#' + id).addClass('botonSeleccionado');
        $('#selOfferType').val(valor);
    }
}

function rapidSearchGeneral() {
    loadPropertie();
    
//    departamento = $("#selState").val();
//    ciudad = $("#selCity").val();
//    barrio = $("#selBarrio").val();
//    zona = $("#selZone").val();
//    tipoInmueble = $("#selPropertieType").val();
//    tipoOferta = $("#selOfferType").val();
//    valorMaximo = $("#lblvalorMaxInmueble").val();
//    areaMaxima = $("#lblAreaInmueble").val();
//    estrato = $("#selStratum").val();
//    parqueaderos = $("#selParqueaderos").val();
//    habitaciones = $("#selHabitaciones").val();
//    banios = $("#selBanios").val();
//    ascensor = $("#selPropertieType").val();
//    piscina = $("#chkAscensor").val();
//
//    var url = "searchPropertie" +
//            ((departamento !== "") ? ("&&departament=" + departamento) : "") +
//            ((ciudad !== "") ? ("&&city=" + ciudad) : "") +
//            ((barrio !== "") ? ("&&neighborhood=" + barrio) : "") +
//            ((zona !== "") ? ("&&zone=" + zona) : "") +
//            ((tipoInmueble !== "") ? ("&&typePropertie=" + tipoInmueble) : "") +
//            ((tipoOferta !== "") ? ("&&offerType=" + tipoOferta) : "") +
//            ((valorMaximo !== "") ? ("&&maxVal=" + valorMaximo) : "") +
//            ((areaMaxima !== "") ? ("&&maxArea=" + areaMaxima) : "") +
//            ((estrato !== "") ? ("&&stratum=" + estrato) : "") +
//            ((parqueaderos !== "") ? ("&&parking=" + parqueaderos) : "") +
//            ((habitaciones !== "") ? ("&&bedrooms=" + habitaciones) : "") +
//            ((banios !== "") ? ("&&bathrooms=" + banios) : "") +
//            ((ascensor !== "") ? ("&&lift=" + ascensor) : "") +
//            ((piscina !== "") ? ("&&pool=" + piscina) : "");
//
//
//    if (departamento !== "" || ciudad !== "" || barrio !== "" || zona !== ""
//            || tipoInmueble !== "" || tipoOferta !== "" || valorMaximo !== "" || areaMaxima !== ""
//            || estrato !== "" || parqueaderos !== "" || habitaciones !== "" || banios !== ""
//            || ascensor !== "" || piscina !== "") {
//        refreshPagePublic(url);
//    } else {
//        showToast("Ingrese o seleccione un criterio de busqueda", "error");
//    }
}