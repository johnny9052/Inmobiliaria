<?php

require_once ('../../DTO/BaseDTO.php');

class PropertieDTO extends BaseDTO {

    private $id;
    private $precio;
    private $administrationCost;
    private $room;
    private $bath;
    private $parking;
    private $totalArea;
    private $areasWithoutBalconies;
    private $buildYear;
    private $numeroPiso;
    private $chimenea;
    private $estudio;
    private $deposito;
    private $zonaRopas;
    private $parqueaderoVisitante;
    private $ascensor;
    private $terraza;
    private $transportePublicoCercano;
    private $salonComunal;
    private $sauna;
    private $turco;
    private $jacuzzi;
    private $zonaInfantil;
    private $jardines;
    private $duplex;
    private $puertaSeguridad;
    private $gimnasio;
    private $precioNegociable;
    private $piscina;
    private $zonaMascotas;
    private $parqueaderoCubierto;
    private $amoblado;
    private $city;
    private $barrio;
    private $estrato;
    private $propertieType;
    private $offerType;
    private $curtainType;
    private $vigilanceType;
    private $zone;
    private $viewType;
    private $status;
    private $kitchenType;
    private $kitchenStructure;
    private $floorType;
    private $client;
    private $publicationDate;
    private $receptionDate;
    private $outstandingType;
    private $linderos;
    private $matriculaInmobiliaria;
    private $avaluoCatastral;
    private $latitude;
    private $longitude;
    private $images;
    private $urlVideos;
    private $direccionCarrera;
    private $direccionCalle;
    private $direccionNumero;
    private $direccionInformacionAdicional;
    /* Filter */
    private $areaMax;
    private $valorMax;
    private $state;
    private $nombreCiudadBarrio;

    function __construct($id, $precio, $administrationCost, $room, $bath, $parking, $totalArea, $areasWithoutBalconies, $buildYear, $numeroPiso, $chimenea, $estudio, $deposito, $zonaRopas, $parqueaderoVisitante, $ascensor, $terraza, $transportePublicoCercano, $salonComunal, $sauna, $turco, $jacuzzi, $zonaInfantil, $jardines, $duplex, $puertaSeguridad, $gimnasio, $precioNegociable, $piscina, $zonaMascotas, $parqueaderoCubierto, $amoblado, $city, $barrio, $estrato, $propertieType, $offerType, $curtainType, $vigilanceType, $zone, $viewType, $status, $kitchenType, $kitchenStructure, $floorType, $client, $publicationDate, $receptionDate, $outstandingType, $linderos, $matriculaInmobiliaria, $avaluoCatastral, $latitude, $longitude, $images, $urlVideos, $idfilter, $direccionCarrera, $direccionCalle, $direccionNumero, $direccionInformacionAdicional) {
        $this->id = $id;
        $this->precio = $precio;
        $this->administrationCost = $administrationCost;
        $this->room = $room;
        $this->bath = $bath;
        $this->parking = $parking;
        $this->totalArea = $totalArea;
        $this->areasWithoutBalconies = $areasWithoutBalconies;
        $this->buildYear = $buildYear;
        $this->numeroPiso = $numeroPiso;
        $this->chimenea = $chimenea;
        $this->estudio = $estudio;
        $this->deposito = $deposito;
        $this->zonaRopas = $zonaRopas;
        $this->parqueaderoVisitante = $parqueaderoVisitante;
        $this->ascensor = $ascensor;
        $this->terraza = $terraza;
        $this->transportePublicoCercano = $transportePublicoCercano;
        $this->salonComunal = $salonComunal;
        $this->sauna = $sauna;
        $this->turco = $turco;
        $this->jacuzzi = $jacuzzi;
        $this->zonaInfantil = $zonaInfantil;
        $this->jardines = $jardines;
        $this->duplex = $duplex;
        $this->puertaSeguridad = $puertaSeguridad;
        $this->gimnasio = $gimnasio;
        $this->precioNegociable = $precioNegociable;
        $this->piscina = $piscina;
        $this->zonaMascotas = $zonaMascotas;
        $this->parqueaderoCubierto = $parqueaderoCubierto;
        $this->amoblado = $amoblado;
        $this->city = $city;
        $this->barrio = $barrio;
        $this->estrato = $estrato;
        $this->propertieType = $propertieType;
        $this->offerType = $offerType;
        $this->curtainType = $curtainType;
        $this->vigilanceType = $vigilanceType;
        $this->zone = $zone;
        $this->viewType = $viewType;
        $this->status = $status;
        $this->kitchenType = $kitchenType;
        $this->kitchenStructure = $kitchenStructure;
        $this->floorType = $floorType;
        $this->client = $client;
        $this->publicationDate = $publicationDate;
        $this->receptionDate = $receptionDate;
        $this->outstandingType = $outstandingType;
        $this->linderos = $linderos;
        $this->matriculaInmobiliaria = $matriculaInmobiliaria;
        $this->avaluoCatastral = $avaluoCatastral;
        $this->latitude = $latitude;
        $this->longitude = $longitude;
        $this->images = $images;
        $this->urlVideos = $urlVideos;
        $this->idfilter = $idfilter;
        $this->direccionCarrera = $direccionCarrera;
        $this->direccionCalle = $direccionCalle;
        $this->direccionNumero = $direccionNumero;
        $this->direccionInformacionAdicional = $direccionInformacionAdicional;
    }

    function getAreaMax() {
        return $this->areaMax;
    }

    function getValorMax() {
        return $this->valorMax;
    }

    function setAreaMax($areaMax) {
        $this->areaMax = $areaMax;
    }

    function setValorMax($valorMax) {
        $this->valorMax = $valorMax;
    }

    function getId() {
        return $this->id;
    }

    function getPrecio() {
        return $this->precio;
    }

    function getAdministrationCost() {
        return $this->administrationCost;
    }

    function getRoom() {
        return $this->room;
    }

    function getBath() {
        return $this->bath;
    }

    function getParking() {
        return $this->parking;
    }

    function getTotalArea() {
        return $this->totalArea;
    }

    function getAreasWithoutBalconies() {
        return $this->areasWithoutBalconies;
    }

    function getBuildYear() {
        return $this->buildYear;
    }

    function getNumeroPiso() {
        return $this->numeroPiso;
    }

    function getChimenea() {
        return $this->chimenea;
    }

    function getEstudio() {
        return $this->estudio;
    }

    function getDeposito() {
        return $this->deposito;
    }

    function getZonaRopas() {
        return $this->zonaRopas;
    }

    function getParqueaderoVisitante() {
        return $this->parqueaderoVisitante;
    }

    function getAscensor() {
        return $this->ascensor;
    }

    function getTerraza() {
        return $this->terraza;
    }

    function getTransportePublicoCercano() {
        return $this->transportePublicoCercano;
    }

    function getSalonComunal() {
        return $this->salonComunal;
    }

    function getSauna() {
        return $this->sauna;
    }

    function getTurco() {
        return $this->turco;
    }

    function getJacuzzi() {
        return $this->jacuzzi;
    }

    function getZonaInfantil() {
        return $this->zonaInfantil;
    }

    function getJardines() {
        return $this->jardines;
    }

    function getDuplex() {
        return $this->duplex;
    }

    function getPuertaSeguridad() {
        return $this->puertaSeguridad;
    }

    function getGimnasio() {
        return $this->gimnasio;
    }

    function getPrecioNegociable() {
        return $this->precioNegociable;
    }

    function getPiscina() {
        return $this->piscina;
    }

    function getZonaMascotas() {
        return $this->zonaMascotas;
    }

    function getParqueaderoCubierto() {
        return $this->parqueaderoCubierto;
    }

    function getAmoblado() {
        return $this->amoblado;
    }

    function getCity() {
        return $this->city;
    }

    function getBarrio() {
        return $this->barrio;
    }

    function getEstrato() {
        return $this->estrato;
    }

    function getPropertieType() {
        return $this->propertieType;
    }

    function getOfferType() {
        return $this->offerType;
    }

    function getCurtainType() {
        return $this->curtainType;
    }

    function getVigilanceType() {
        return $this->vigilanceType;
    }

    function getZone() {
        return $this->zone;
    }

    function getViewType() {
        return $this->viewType;
    }

    function getStatus() {
        return $this->status;
    }

    function getKitchenType() {
        return $this->kitchenType;
    }

    function getKitchenStructure() {
        return $this->kitchenStructure;
    }

    function getFloorType() {
        return $this->floorType;
    }

    function getClient() {
        return $this->client;
    }

    function getPublicationDate() {
        return $this->publicationDate;
    }

    function getReceptionDate() {
        return $this->receptionDate;
    }

    function getOutstandingType() {
        return $this->outstandingType;
    }

    function getLinderos() {
        return $this->linderos;
    }

    function getMatriculaInmobiliaria() {
        return $this->matriculaInmobiliaria;
    }

    function getAvaluoCatastral() {
        return $this->avaluoCatastral;
    }

    function getLatitude() {
        return $this->latitude;
    }

    function getLongitude() {
        return $this->longitude;
    }

    function getImages() {
        return $this->images;
    }

    function getUrlVideos() {
        return $this->urlVideos;
    }

    function setId($id) {
        $this->id = $id;
    }

    function setPrecio($precio) {
        $this->precio = $precio;
    }

    function setAdministrationCost($administrationCost) {
        $this->administrationCost = $administrationCost;
    }

    function setRoom($room) {
        $this->room = $room;
    }

    function setBath($bath) {
        $this->bath = $bath;
    }

    function setParking($parking) {
        $this->parking = $parking;
    }

    function setTotalArea($totalArea) {
        $this->totalArea = $totalArea;
    }

    function setAreasWithoutBalconies($areasWithoutBalconies) {
        $this->areasWithoutBalconies = $areasWithoutBalconies;
    }

    function setBuildYear($buildYear) {
        $this->buildYear = $buildYear;
    }

    function setNumeroPiso($numeroPiso) {
        $this->numeroPiso = $numeroPiso;
    }

    function setChimenea($chimenea) {
        $this->chimenea = $chimenea;
    }

    function setEstudio($estudio) {
        $this->estudio = $estudio;
    }

    function setDeposito($deposito) {
        $this->deposito = $deposito;
    }

    function setZonaRopas($zonaRopas) {
        $this->zonaRopas = $zonaRopas;
    }

    function setParqueaderoVisitante($parqueaderoVisitante) {
        $this->parqueaderoVisitante = $parqueaderoVisitante;
    }

    function setAscensor($ascensor) {
        $this->ascensor = $ascensor;
    }

    function setTerraza($terraza) {
        $this->terraza = $terraza;
    }

    function setTransportePublicoCercano($transportePublicoCercano) {
        $this->transportePublicoCercano = $transportePublicoCercano;
    }

    function setSalonComunal($salonComunal) {
        $this->salonComunal = $salonComunal;
    }

    function setSauna($sauna) {
        $this->sauna = $sauna;
    }

    function setTurco($turco) {
        $this->turco = $turco;
    }

    function setJacuzzi($jacuzzi) {
        $this->jacuzzi = $jacuzzi;
    }

    function setZonaInfantil($zonaInfantil) {
        $this->zonaInfantil = $zonaInfantil;
    }

    function setJardines($jardines) {
        $this->jardines = $jardines;
    }

    function setDuplex($duplex) {
        $this->duplex = $duplex;
    }

    function setPuertaSeguridad($puertaSeguridad) {
        $this->puertaSeguridad = $puertaSeguridad;
    }

    function setGimnasio($gimnasio) {
        $this->gimnasio = $gimnasio;
    }

    function setPrecioNegociable($precioNegociable) {
        $this->precioNegociable = $precioNegociable;
    }

    function setPiscina($piscina) {
        $this->piscina = $piscina;
    }

    function setZonaMascotas($zonaMascotas) {
        $this->zonaMascotas = $zonaMascotas;
    }

    function setParqueaderoCubierto($parqueaderoCubierto) {
        $this->parqueaderoCubierto = $parqueaderoCubierto;
    }

    function setAmoblado($amoblado) {
        $this->amoblado = $amoblado;
    }

    function setCity($city) {
        $this->city = $city;
    }

    function setBarrio($barrio) {
        $this->barrio = $barrio;
    }

    function setEstrato($estrato) {
        $this->estrato = $estrato;
    }

    function setPropertieType($propertieType) {
        $this->propertieType = $propertieType;
    }

    function setOfferType($offerType) {
        $this->offerType = $offerType;
    }

    function setCurtainType($curtainType) {
        $this->curtainType = $curtainType;
    }

    function setVigilanceType($vigilanceType) {
        $this->vigilanceType = $vigilanceType;
    }

    function setZone($zone) {
        $this->zone = $zone;
    }

    function setViewType($viewType) {
        $this->viewType = $viewType;
    }

    function setStatus($status) {
        $this->status = $status;
    }

    function setKitchenType($kitchenType) {
        $this->kitchenType = $kitchenType;
    }

    function setKitchenStructure($kitchenStructure) {
        $this->kitchenStructure = $kitchenStructure;
    }

    function setFloorType($floorType) {
        $this->floorType = $floorType;
    }

    function setClient($client) {
        $this->client = $client;
    }

    function setPublicationDate($publicationDate) {
        $this->publicationDate = $publicationDate;
    }

    function setReceptionDate($receptionDate) {
        $this->receptionDate = $receptionDate;
    }

    function setOutstandingType($outstandingType) {
        $this->outstandingType = $outstandingType;
    }

    function setLinderos($linderos) {
        $this->linderos = $linderos;
    }

    function setMatriculaInmobiliaria($matriculaInmobiliaria) {
        $this->matriculaInmobiliaria = $matriculaInmobiliaria;
    }

    function setAvaluoCatastral($avaluoCatastral) {
        $this->avaluoCatastral = $avaluoCatastral;
    }

    function setLatitude($latitude) {
        $this->latitude = $latitude;
    }

    function setLongitude($longitude) {
        $this->longitude = $longitude;
    }

    function setImages($images) {
        $this->images = $images;
    }

    function setUrlVideos($urlVideos) {
        $this->urlVideos = $urlVideos;
    }

    function getState() {
        return $this->state;
    }

    function setState($state) {
        $this->state = $state;
    }

    function getNombreCiudadBarrio() {
        return $this->nombreCiudadBarrio;
    }

    function setNombreCiudadBarrio($nombreCiudadBarrio) {
        $this->nombreCiudadBarrio = $nombreCiudadBarrio;
    }

    function getDireccionCarrera() {
        return $this->direccionCarrera;
    }

    function getDireccionCalle() {
        return $this->direccionCalle;
    }

    function getDireccionNumero() {
        return $this->direccionNumero;
    }

    function getDireccionInformacionAdicional() {
        return $this->direccionInformacionAdicional;
    }

    function setDireccionCarrera($direccionCarrera) {
        $this->direccionCarrera = $direccionCarrera;
    }

    function setDireccionCalle($direccionCalle) {
        $this->direccionCalle = $direccionCalle;
    }

    function setDireccionNumero($direccionNumero) {
        $this->direccionNumero = $direccionNumero;
    }

    function setDireccionInformacionAdicional($direccionInformacionAdicional) {
        $this->direccionInformacionAdicional = $direccionInformacionAdicional;
    }

    function saveFilterSearch($areaMax, $valorMax, $state, $city, $barrio, $zone, $propertieType, $offerType, $estrato, $ascensor, $piscina, $room, $bath, $parking, $nombreCiudadBarrio) {
        $this->valorMax = $valorMax;
        $this->areaMax = $areaMax;
        $this->state = $state;
        $this->city = $city;
        $this->barrio = $barrio;
        $this->zone = $zone;
        $this->propertieType = $propertieType;
        $this->offerType = $offerType;
        $this->estrato = $estrato;
        $this->ascensor = $ascensor;
        $this->piscina = $piscina;
        $this->room = $room;
        $this->bath = $bath;
        $this->parking = $parking;
        $this->nombreCiudadBarrio = $nombreCiudadBarrio;
    }

}
