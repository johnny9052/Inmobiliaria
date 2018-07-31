/* global google */
/*https://developers.google.com/maps/documentation/javascript/maptypes*/
/*Variable global que almacenara el mapa*/
var map;
/*Array con los marcadores puestos*/
var markersListGlobal = [];
var infoWindow;
var geocoder;

/*Funcion de configuracion del mapa*/
function myMap() {

    /*Definimos las coordenadas de una posicion inicial por defecto*/
    var posInicial = {lat: 4.546523, lng: -75.661864};

    /*Instanciamos las configuraciones iniciales del mapa*/
    map = new google.maps.Map(
            document.getElementById('googleMap'), {
        zoom: 15,
        center: posInicial,
        zoomControl: true,
        scaleControl: true,
        mapTypeControl: true,
        mapTypeControlOptions: {//Define el tipo de botones de la parte superior derecha
            style: google.maps.MapTypeControlStyle.DROPDOWN_MENU,
            mapTypeIds: ['roadmap', 'terrain', 'satellite', 'hybrid']
        }});

    // Create the search box and link it to the UI element.
    var input = document.getElementById('pac-input');
    var searchBox = new google.maps.places.SearchBox(input);
    map.controls[google.maps.ControlPosition.TOP_LEFT].push(input);

    // Bias the SearchBox results towards current map's viewport.
    map.addListener('bounds_changed', function () {
        searchBox.setBounds(map.getBounds());
    });

    var markers = [];
    // Listen for the event fired when the user selects a prediction and retrieve
    // more details for that place.




    searchBox.addListener('places_changed', function () {
        var places = searchBox.getPlaces();

        if (places.length === 0) {
            return;
        }

        // Clear out the old markers.
        markers.forEach(function (marker) {
            marker.setMap(null);
        });
        markers = [];

        // For each place, get the icon, name and location.
        var bounds = new google.maps.LatLngBounds();
        places.forEach(function (place) {
            if (!place.geometry) {
                console.log("Returned place contains no geometry");
                return;
            }
            var icon = {
                url: place.icon,
                size: new google.maps.Size(71, 71),
                origin: new google.maps.Point(0, 0),
                anchor: new google.maps.Point(17, 34),
                scaledSize: new google.maps.Size(25, 25)
            };

            // Create a marker for each place.
            markers.push(new google.maps.Marker({
                map: map,
                icon: icon,
                title: place.name,
                position: place.geometry.location
            }));

            if (place.geometry.viewport) {
                // Only geocodes have viewport.
                bounds.union(place.geometry.viewport);
            } else {
                bounds.extend(place.geometry.location);
            }
        });


        map.fitBounds(bounds);
    });



//Se agrega el marcador al mapa
//var marker = new google.maps.Marker({position: posInicial, map: map});





    /*GEOLOCALIZACION - Ubicarse donde se encuentre el equipo*/

    /*Variable para el control de mensajes*/
    infoWindow = new google.maps.InfoWindow;

    geocoder = new google.maps.Geocoder;

    if (navigator.geolocation) {
        navigator.geolocation.getCurrentPosition(function (position) {
            /*Se captura la posicion inicial*/
            var pos = {
                lat: position.coords.latitude,
                lng: position.coords.longitude
            };
            /*Se ubica en el mapa*/
            infoWindow.setPosition(pos);
            /*Si se desea colocar informacion en el marcador*/
            infoWindow.setContent('Estas aqui');
            infoWindow.open(map);
            map.setCenter(pos);
            map.setZoom(16);
        }, function () {
            handleLocationError(true, infoWindow, map.getCenter());
        });
    } else {
        // Browser doesn't support Geolocation
        handleLocationError(false, infoWindow, map.getCenter());
    }

    /*END GEOLOCALIZACION - Ubicarse donde se encuentre el equipo*/




    /*EVENTO QUE PONE MARCADOR CON CLICK*/
    map.addListener('click', function (event) {
        /*Se asocia la funcion que se llamara*/
        addMarker(event.latLng);
    });




}



function addMarker(location) {

    /*Imagen del marcador*/
    //var image = 'System/Resource/Images/map/marker.png';
    var image = 'Resource/Images/map/marker.png';
    /*Titulo del marcador*/
    var mensaje = 'informacion marker';
    /*Se instancia el marcador*/
    var marker = new google.maps.Marker({
        position: location,
        map: map,
        title: mensaje,
        icon: image,
        animation: google.maps.Animation.DROP
    });


    geocoder.geocode({'location': location}, function (results, status) {
        if (status === 'OK') {
            if (results[0]) {
                infoWindow.setContent(results[0].formatted_address);
                infoWindow.open(map, marker);
            } else {
                //window.alert('No results found');
            }
        } else {
            //window.alert('Geocoder failed due to: ' + status);
        }
    });

    deleteMarkers();

    /*Se añade el marcador a la lista de marcadores*/
    markersListGlobal.push(marker);
    /*Se añade un evento cuando se preciona el marcador*/
    marker.addListener('click', toggleBounce);
}


function toggleBounce() {
    //alert('me seleccionaste');
}


/*Funcion que se ejecuta cuando no detecta la georeferenciacion */
function handleLocationError(browserHasGeolocation, infoWindow, pos) {
    infoWindow.setPosition(pos);
    infoWindow.setContent(browserHasGeolocation ?
            'Error: The Geolocation service failed.' :
            'Error: Your browser doesn\'t support geolocation.');
    infoWindow.open(map);
}


// Sets the map on all markers in the array.
function setMapOnAll(map) {
    for (var i = 0; i < markersListGlobal.length; i++) {
        markersListGlobal[i].setMap(map);
    }
}

// Removes the markers from the map, but keeps them in the array.
function clearMarkers() {
    setMapOnAll(null);
}

// Shows any markers currently in the array.
function showMarkers() {
    setMapOnAll(map);
}

// Deletes all markers in the array by removing references to them.
function deleteMarkers() {
    clearMarkers();
    markersListGlobal = [];
}





