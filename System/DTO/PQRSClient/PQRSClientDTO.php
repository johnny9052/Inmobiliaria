<?php

require_once ('../../DTO/BaseDTO.php');

class PQRSClientDTO extends BaseDTO {

    private $pqrstype;
    private $description;
    private $fecha;
    private $name;
    private $email;

    function __construct($pqrstype, $description, $fecha, $hora, $name, $email, $idUser) {
        $this->pqrstype = $pqrstype;
        $this->description = $description;
        $this->fecha = $fecha;
        parent::setHora($hora);
        $this->name = $name;
        $this->email = $email;
        parent::setIdUser($idUser);
    }

    function getPqrstype() {
        return $this->pqrstype;
    }

    function getDescription() {
        return $this->description;
    }

    function getFecha() {
        return $this->fecha;
    }

    function getName() {
        return $this->name;
    }

    function getEmail() {
        return $this->email;
    }

    function setPqrstype($pqrstype) {
        $this->pqrstype = $pqrstype;
    }

    function setDescription($description) {
        $this->description = $description;
    }

    function setFecha($fecha) {
        $this->fecha = $fecha;
    }

    function setName($name) {
        $this->name = $name;
    }

    function setEmail($email) {
        $this->email = $email;
    }

}
