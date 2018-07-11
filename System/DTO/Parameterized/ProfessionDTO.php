<?php

require_once ('../../DTO/BaseDTO.php');

class ProfessionDTO extends BaseDTO {
    
    private $id;
    private $name;
    private $professionNivel;

    function __construct($id, $name, $professionNivel) {
        $this->id = $id;
        $this->name = $name;
        $this->professionNivel = $professionNivel;
    }
    function getId() {
        return $this->id;
    }

    function getName() {
        return $this->name;
    }

    function getProfessionNivel() {
        return $this->professionNivel;
    }

    function setId($id) {
        $this->id = $id;
    }

    function setName($name) {
        $this->name = $name;
    }

    function setProfessionNivel($professionNivel) {
        $this->professionNivel = $professionNivel;
    }


}
