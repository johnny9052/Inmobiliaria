<?php

require_once ('../../DTO/BaseDTO.php');

class ReferenceClientDTO extends BaseDTO {

    private $id;
    private $client;
    private $typeReference;
    private $firstName;
    private $firstLastName;
    private $mobilePhone;

    function __construct($id, $client, $typeReference, $firstName, $firstLastName, $mobilePhone) {
        $this->id = $id;
        $this->client = $client;
        $this->typeReference = $typeReference;
        $this->firstName = $firstName;
        $this->firstLastName = $firstLastName;
        $this->mobilePhone = $mobilePhone;
    }
    
    function getId() {
        return $this->id;
    }

    function getClient() {
        return $this->client;
    }

    function getTypeReference() {
        return $this->typeReference;
    }

    function getFirstName() {
        return $this->firstName;
    }

    function getFirstLastName() {
        return $this->firstLastName;
    }

    function getMobilePhone() {
        return $this->mobilePhone;
    }

    function setId($id) {
        $this->id = $id;
    }

    function setClient($client) {
        $this->client = $client;
    }

    function setTypeReference($typeReference) {
        $this->typeReference = $typeReference;
    }

    function setFirstName($firstName) {
        $this->firstName = $firstName;
    }

    function setFirstLastName($firstLastName) {
        $this->firstLastName = $firstLastName;
    }

    function setMobilePhone($mobilePhone) {
        $this->mobilePhone = $mobilePhone;
    }

}
