<?php

require_once ('../../DTO/BaseDTO.php');

class PqrsDTO extends BaseDTO {
    
    private $id;
    private $datePQRS;
    private $timePQRS;
    private $descriptionPQRS;
    private $givenResponse;
    private $typePQRS;

    function __construct($id, $datePQRS, $timePQRS, $descriptionPQRS, $givenResponse, $typePQRS) {
        $this->id = $id;
        $this->datePQRS = $datePQRS;
        $this->timePQRS = $timePQRS;
        $this->descriptionPQRS = $descriptionPQRS;
        $this->givenResponse = $givenResponse;
        $this->typePQRS = $typePQRS;
    }
    
    function getId() {
        return $this->id;
    }

    function getDatePQRS() {
        return $this->datePQRS;
    }

    function getTimePQRS() {
        return $this->timePQRS;
    }

    function getDescriptionPQRS() {
        return $this->descriptionPQRS;
    }

    function getGivenResponse() {
        return $this->givenResponse;
    }

    function getTypePQRS() {
        return $this->typePQRS;
    }

    function setId($id) {
        $this->id = $id;
    }

    function setDatePQRS($datePQRS) {
        $this->datePQRS = $datePQRS;
    }

    function setTimePQRS($timePQRS) {
        $this->timePQRS = $timePQRS;
    }

    function setDescriptionPQRS($descriptionPQRS) {
        $this->descriptionPQRS = $descriptionPQRS;
    }

    function setGivenResponse($givenResponse) {
        $this->givenResponse = $givenResponse;
    }

    function setTypePQRS($typePQRS) {
        $this->typePQRS = $typePQRS;
    }



}
