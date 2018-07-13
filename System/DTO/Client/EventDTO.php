<?php

require_once ('../../DTO/BaseDTO.php');

class EventDTO extends BaseDTO {

    private $id;
    private $dateEvent;
    private $timeEvent;
    private $placeEvent;
    private $latitude;
    private $length;
    private $employee;
    private $client;
    private $eventType;
    
    function __construct($id, $dateEvent, $timeEvent, $placeEvent, $latitude, $length, $employee, $client, $eventType) {
        $this->id = $id;
        $this->dateEvent = $dateEvent;
        $this->timeEvent = $timeEvent;
        $this->placeEvent = $placeEvent;
        $this->latitude = $latitude;
        $this->length = $length;
        $this->employee = $employee;
        $this->client = $client;
        $this->eventType = $eventType;
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

    function getEmployee() {
        return $this->employee;
    }

    function getClient() {
        return $this->client;
    }

    function getEventType() {
        return $this->eventType;
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

    function setEmployee($employee) {
        $this->employee = $employee;
    }

    function setClient($client) {
        $this->client = $client;
    }

    function setEventType($eventType) {
        $this->eventType = $eventType;
    }
}
