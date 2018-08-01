<?php

/* IMPORTS */
require '../../DTO/Propertie/PropertieDTO.php';
require '../../DAO/Propertie/PropertieDAO.php';
include '../../Helper/Action/Action.php';
include '../../Infraestructure/Cleaner.php';

/* RECEPCION DE DATOS */
$action = getInfo('action');
$id = getInfo('id');
$precio = getInfo('precio');
$administrationCost = getInfo('administrationCost');
$room = getInfo('room');
$bath = getInfo('bath');
$parking = getInfo('parking');
$totalArea = getInfo('totalArea');
$areasWithoutBalconies = getInfo('areasWithoutBalconies');
$buildYear = getInfo('buildYear');
$numeroPiso = getInfo('numeroPiso');
$chimenea = getInfo('chimenea');
$estudio = getInfo('estudio');
$deposito = getInfo('deposito');
$zonaRopas = getInfo('zonaRopas');
$parqueaderoVisitante = getInfo('parqueaderoVisitante');
$ascensor = getInfo('ascensor');
$terraza = getInfo('terraza');
$transportePublicoCercano = getInfo('transportePublicoCercano');
$salonComunal = getInfo('salonComunal');
$sauna = getInfo('sauna');
$turco = getInfo('turco');
$jacuzzi = getInfo('jacuzzi');
$zonaInfantil = getInfo('zonaInfantil');
$jardines = getInfo('jardines');
$duplex = getInfo('duplex');
$puertaSeguridad = getInfo('puertaSeguridad');
$gimnasio = getInfo('gimnasio');
$precioNegociable = getInfo('precioNegociable');
$piscina = getInfo('piscina');
$zonaMascotas = getInfo('zonaMascotas');
$parqueaderoCubierto = getInfo('parqueaderoCubierto');
$amoblado = getInfo('amoblado');
$city = getInfo('city');
$barrio = getInfo('barrio');
$estrato = getInfo('estrato');
$propertieType = getInfo('propertieType');
$offerType = getInfo('offerType');
$curtainType = getInfo('curtainType');
$vigilanceType = getInfo('vigilanceType');
$zone = getInfo('zone');
$viewType = getInfo('viewType');
/* VALIDAR ESTO EN LA BASE DE DATOS, EL ID DE REGISTRADO */
$status = 13;
$kitchenType = getInfo('kitchenType');
$kitchenStructure = getInfo('kitchenStructure');
$floorType = getInfo('floorType');
$client = getInfo('client');
$publicationDate = getInfo('publicationDate');
$receptionDate = getInfo('receptionDate');
$outstandingType = getInfo('outstandingType');
$linderos = getInfo('linderos');
$matriculaInmobiliaria = getInfo('matriculaInmobiliaria');
$avaluoCatastral = getInfo('avaluoCatastral');
$latitude = getInfo('lat');
$longitude = getInfo('lng');

$publicationDate = date("Y-m-d", strtotime($publicationDate));
$receptionDate = date("Y-m-d", strtotime($receptionDate));

$urlVideos = getInfo('urlVideos');

/* Se borran todas las imagenes que se tengan que eliminar */
deleteFiles('nameFileDelete', '../../', 'System/', 'Resource/Images/Properties/', 100, $matriculaInmobiliaria, false, '.jpg');
/* Se crean las imagenes que se tengan que crear */
$images = generateFiles('../../', 'System/', 'Resource/Images/Properties/', 100, 'nameFileDelete', 'nameFile', 'base64File', $matriculaInmobiliaria, '.jpg', false);

/* DEFINICION DE OBJETOS */
$obj = new PropertieDTO($id, $precio, $administrationCost, $room, $bath, $parking, $totalArea, $areasWithoutBalconies, $buildYear, $numeroPiso, $chimenea, $estudio, $deposito, $zonaRopas, $parqueaderoVisitante, $ascensor, $terraza, $transportePublicoCercano, $salonComunal, $sauna, $turco, $jacuzzi, $zonaInfantil, $jardines, $duplex, $puertaSeguridad, $gimnasio, $precioNegociable, $piscina, $zonaMascotas, $parqueaderoCubierto, $amoblado, $city, $barrio, $estrato, $propertieType, $offerType, $curtainType, $vigilanceType, $zone, $viewType, $status, $kitchenType, $kitchenStructure, $floorType, $client, $publicationDate, $receptionDate, $outstandingType, $linderos, $matriculaInmobiliaria, $avaluoCatastral, $latitude, $longitude, $images, $urlVideos);
$dao = new PropertieDAO();

/* CONTROL DE ACCIONES */
ExecuteAction($action, $obj, $dao);


