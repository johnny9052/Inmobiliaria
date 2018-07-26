var plusImagen = new Array();
var plusImagenName = new Array();


var plusVideo = new Array();


/* Funciones jQuery */
/* global markersListGlobal */

$(window).on("load", function (e) {
    list();
    loadDepartment();
    loadCity(-1);
    loadNeighborhood(-1);
    loadStratum();
    loadPropertieType();
    loadOfferType();
    loadCurtainType();
    loadVigilanceType();
    loadZone();
    loadViewType();
    loadStatus();
    loadKitchenType();
    loadKitchenStructure();
    loadFloorType();
    loadClient();
    loadOutstandingType();
});



function loadDepartment() {
    Execute(scanInfo('loadDepartment', false), 'General/CtlGeneral', '', 'buildSelect(info,"selState");');
}


function loadCity(id) {
    Execute(scanInfo('loadCity', false, '', [{datos: ["id", id]}]), 'General/CtlGeneral', '', 'buildSelect(info,"selCity");');
}


function loadNeighborhood(id) {
    Execute(scanInfo('loadNeighborhood', false, '', [{datos: ["id", id]}]), 'General/CtlGeneral', '', 'buildSelect(info,"selBarrio");');
}

function loadStratum() {
    Execute(scanInfo('loadStratum', false), 'General/CtlGeneral', '', 'buildSelect(info,"selStratum");');
}


function loadPropertieType() {
    Execute(scanInfo('loadPropertieType', false), 'General/CtlGeneral', '', 'buildSelect(info,"selPropertieType");');
}


function loadOfferType() {
    Execute(scanInfo('loadOfferType', false), 'General/CtlGeneral', '', 'buildSelect(info,"selOfferType");');
}


function loadCurtainType() {
    Execute(scanInfo('loadCurtainType', false), 'General/CtlGeneral', '', 'buildSelect(info,"selCurtainType");');
}


function loadVigilanceType() {
    Execute(scanInfo('loadVigilanceType', false), 'General/CtlGeneral', '', 'buildSelect(info,"selVigilanceType");');
}

function loadZone() {
    Execute(scanInfo('loadZone', false), 'General/CtlGeneral', '', 'buildSelect(info,"selZone");');
}


function loadViewType() {
    Execute(scanInfo('loadViewType', false), 'General/CtlGeneral', '', 'buildSelect(info,"selViewType");');
}

function loadStatus() {
    Execute(scanInfo('loadStatus', false), 'General/CtlGeneral', '', 'buildSelect(info,"selStatus");');
}

function loadKitchenType() {
    Execute(scanInfo('loadKitchenType', false), 'General/CtlGeneral', '', 'buildSelect(info,"selKitchenType");');
}


function loadKitchenStructure() {
    Execute(scanInfo('loadKitchenStructure', false), 'General/CtlGeneral', '', 'buildSelect(info,"selKitchenStructure");');
}


function loadFloorType() {
    Execute(scanInfo('loadFloorType', false), 'General/CtlGeneral', '', 'buildSelect(info,"selFloorType");');
}

function loadClient() {
    Execute(scanInfo('loadclient', false), 'General/CtlGeneral', '', 'buildSelect(info,"selClient");');
}


function loadOutstandingType() {
    Execute(scanInfo('loadOutstandingType', false), 'General/CtlGeneral', '', 'buildSelect(info,"selOutstandingType");');
}





function save() {
    if (markersListGlobal.length > 0) {
        if (validateForm() === true) {

            var lat = markersListGlobal[0].getPosition().lat();
            var lng = markersListGlobal[0].getPosition().lat();

            var temp = new Array();

            for (var x = 0; x < plusImagen.length; x++) {

                temp.push({datos: ["nameFile" + x, plusImagenName[x]]});
                temp.push({datos: ["base64File" + x, plusImagen[x]]});
            }


            Execute(scanInfo('save', true, '', temp), 'Propertie/CtlPropertie', '', ' closeWindow();list();deleteMarkers();');
        }
    } else {
        showToast("Seleccione un punto en el mapa", "error");
    }
}


function list() {
    Execute(scanInfo('listfilter'), 'Propertie/CtlPropertie', '', 'buildPaginator(info);');
}


function search(id) {
    $("#txtId").val(id);
    Execute(scanInfo('search', true), 'Propertie/CtlPropertie', '', 'showData(info);');
}


function showData(info) {
    $("#txtId").val(info[0].id);
    $("#txtName").val(info[0].nombre);
    $("#txtDescription").val(info[0].descripcion);
    openWindow();
    showButton(false);
}


function update() {
    if (validateForm() === true) {
        Execute(scanInfo('update', true), 'Propertie/CtlPropertie', '', 'closeWindow();list();');
    }
}


function deleteInfo() {
    Execute(scanInfo('delete', true), 'Propertie/CtlPropertie', '', 'closeWindow("ModalConfirm");list();cleanForm("ModalNew");');
}



function validarMunicipioSeleccionado() {
    if ($('#selCity').val() === "-1") {
        showToast("No ha seleccionado ningun municipio", 'error', 'ModalNew');
    } else {
        //$('#txtIdCityForDistrict').val($('#selCity').val());
        goNavigation('ModalNew', 'ModalNewDistrict', true);
    }
}


function saveNewDistrict() {
    if (validateForm('FormContainerDistrict', 'ModalNewDistrict') === true) {
        Execute(scanInfo('save', false, '', [{datos: ["city", $('#selCity').val()]},
            {datos: ["nameDistrict", $('#txtNameDistrict').val()]}
        ]),
                'Parameterized/CtlDistrict',
                '',
                'loadNeighborhood(' + $('#selCity').val() + ');cleanForm("ModalNewDistrict");');
    }
}



function actualizarMucipioMapa() {

    var nombreDepto = ($("#selState").val() === "-1") ? "" : $("#selState option:selected").text();
    var nombreMunicipio = ($("#selCity").val() === "-1") ? "" : $("#selCity option:selected").text();

    var nombreCompleto = nombreMunicipio + " " + nombreDepto;

    $("#pac-input").val(nombreCompleto);


}




function procesarImagenes() {

    plusImagen = new Array();

    var lblImagenes = "";

    // assuming there is a file input with the ID `my-input`...
    var files = $("#fileImagen")[0].files;

    for (var i = 0; i < files.length; i++)
    {
        var file = files[i];

        //console.log(file.name);
        lblImagenes = lblImagenes + "<label class='seleccionable' id='" + limpiarNombre(file.name) + "' onclick='eliminarImagen(" + '"' + limpiarNombre(file.name) + '"' + ");'>(X)    " + file.name + "</label><br>";

        /*Si existen campos de fecha con archivos cargados*/
        if (file !== undefined) {
            plusImagenName.push(limpiarNombre(file.name));
            /*Convierte la imagen seleccionada a BASE64*/
            base64(file, function (data) {
                /*Se añade la imagen como campo adicional*/
                plusImagen.push((data.base64 !== undefined) ? data.base64 : ""); // prints the base64 string                                
            });
        }
    }

    $("#lstImagenesAgregadas").html("");
    $("#lstImagenesAgregadas").html(lblImagenes);

    console.log(plusImagen);
}






function agregarVideo() {

    var lblVideos = "";

    var videoFileURL = $("#txtUrlVideo").val();

    if (videoFileURL !== "" && videoFileURL !== null) {
        plusVideo.push(videoFileURL);
        $("#lstVideosAgregados").html("");

        for (var y = 0; y < plusVideo.length; y++) {
            lblVideos = lblVideos + "<label class='seleccionable' id='Video" + y + "' onclick='eliminarVideo(" + '"Video' + y + '"' + ");'>(X)    " + plusVideo[y] + "</label><br>";
        }

        $("#lstVideosAgregados").html(lblVideos);
        $("#txtUrlVideo").val("");
        console.log(plusVideo);
    } else {

    }
}




function eliminarVideo(pos) {

    if (pos !== -1) {
        plusImagen.splice(pos, 1);
        plusImagenName.splice(pos, 1);
    }

    $("#Video" + pos).html("");
}








function eliminarImagen(id) {

    var pos = plusImagenName.indexOf(id);

    if (pos !== -1) {
        plusImagen.splice(pos, 1);
        plusImagenName.splice(pos, 1);
    }

    id = limpiarNombre(id);
    $("#" + id).html("");
}


function limpiarNombre(nombre) {
    return ((nombre).replace(/\./g, "_")).replace(/\s/g, "");
}