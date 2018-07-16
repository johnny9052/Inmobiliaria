<?php

require_once ('../../DTO/BaseDTO.php');

class EventDTO extends BaseDTO {

    private $id;
    private $dateEvent;
    private $timeEvent;
    private $placeEvent;
    private $latitude;
    private $length;
    private $client;
    private $eventType;
    private $observations;
    private $employeesSelecteds;
    
    function __construct($id, $dateEvent, $timeEvent, $placeEvent, $latitude, $length, $client, $eventType, $observations, $employeesSelecteds) {
        $this->id = $id;
        $this->dateEvent = $dateEvent;
        $this->timeEvent = $timeEvent;
        $this->placeEvent = $placeEvent;
        $this->latitude = $latitude;
        $this->length = $length;
        $this->client = $client;
        $this->eventType = $eventType;
        $this->observations = $observations;
        $this->employeesSelecteds = $employeesSelecteds;
    }
    
    function getId() {
        return $this->id;
    }

    function getDateEvent() {
        return $this->dateEvent;
    }

    function getTimeEvent() {
        return $this->timeEvent;
    }

    function getPlaceEvent() {
        return $this->placeEvent;
    }

    function getLatitude() {
        return $this->latitude;
    }

    function getLength() {
        return $this->length;
    }

    function getClient() {
        return $this->client;
    }

    function getEventType() {
        return $this->eventType;
    }

    function getObservations() {
        return $this->observations;
    }

    function getEmployeesSelecteds() {
        return $this->employeesSelecteds;
    }

    function setId($id) {
        $this->id = $id;
    }

    function setDateEvent($dateEvent) {
        $this->dateEvent = $dateEvent;
    }

    function setTimeEvent($timeEvent) {
        $this->timeEvent = $timeEvent;
    }

    function setPlaceEvent($placeEvent) {
        $this->placeEvent = $placeEvent;
    }

    function setLatitude($latitude) {
        $this->latitude = $latitude;
    }

    function setLength($length) {
        $this->length = $length;
    }

    function setClient($client) {
        $this->client = $client;
    }

    function setEventType($eventType) {
        $this->eventType = $eventType;
    }

    function setObservations($observations) {
        $this->observations = $observations;
    }

    function setEmployeesSelecteds($employeesSelecteds) {
        $this->employeesSelecteds = $employeesSelecteds;
    }




}
