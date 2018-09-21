<?php

require_once ('../../DTO/BaseDTO.php');

class PropertieContractDTO extends BaseDTO {

    private $id;
    private $client;
    private $propertie;
    private $firmDate;
    private $startDate;
    private $endDate;
    private $contractValue;
    private $termContract;
    private $wayPay;
    private $urlContract;
    
    function __construct($id, $client, $propertie, $firmDate, $startDate, $endDate, $contractValue, $termContract, $wayPay, $urlContract) {
        $this->id = $id;
        $this->client = $client;
        $this->propertie = $propertie;
        $this->firmDate = $firmDate;
        $this->startDate = $startDate;
        $this->endDate = $endDate;
        $this->contractValue = $contractValue;
        $this->termContract = $termContract;
        $this->wayPay = $wayPay;
        $this->urlContract = $urlContract;
    }
    
    function getId() {
        return $this->id;
    }

    function getClient() {
        return $this->client;
    }

    function getPropertie() {
        return $this->propertie;
    }

    function getFirmDate() {
        return $this->firmDate;
    }

    function getStartDate() {
        return $this->startDate;
    }

    function getEndDate() {
        return $this->endDate;
    }

    function getContractValue() {
        return $this->contractValue;
    }

    function getTermContract() {
        return $this->termContract;
    }

    function getWayPay() {
        return $this->wayPay;
    }

    function getUrlContract() {
        return $this->urlContract;
    }

    function setId($id) {
        $this->id = $id;
    }

    function setClient($client) {
        $this->client = $client;
    }

    function setPropertie($propertie) {
        $this->propertie = $propertie;
    }

    function setFirmDate($firmDate) {
        $this->firmDate = $firmDate;
    }

    function setStartDate($startDate) {
        $this->startDate = $startDate;
    }

    function setEndDate($endDate) {
        $this->endDate = $endDate;
    }

    function setContractValue($contractValue) {
        $this->contractValue = $contractValue;
    }

    function setTermContract($termContract) {
        $this->termContract = $termContract;
    }

    function setWayPay($wayPay) {
        $this->wayPay = $wayPay;
    }

    function setUrlContract($urlContract) {
        $this->urlContract = $urlContract;
    }



}
