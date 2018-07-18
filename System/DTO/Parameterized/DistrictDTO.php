<?php

require_once ('../../DTO/BaseDTO.php');

class DistrictDTO extends BaseDTO {

    private $id;
    private $name;
    private $city;

    function __construct($id, $name, $city) {
        $this->id = $id;
        $this->name = $name;
        $this->city = $city;
    }

    function getId() {
        return $this->id;
    }

    function getName() {
        return $this->name;
    }

    function getCity() {
        return $this->city;
    }

    function setId($id) {
        $this->id = $id;
    }

    function setName($name) {
        $this->name = $name;
    }

    function setCity($city) {
        $this->city = $city;
    }

}
