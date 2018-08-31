<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of GeneralDTO
 *
 * @author Johnny
 */
abstract class BaseDTO {

    protected $IdUser;
    protected $IdRol;
    protected $idfilter;

    function getIdUser() {
        return $this->IdUser;
    }

    function setIdUser($IdUser) {
        $this->IdUser = $IdUser;
    }

    function getIdRol() {
        return $this->IdRol;
    }

    function setIdRol($IdRol) {
        $this->IdRol = $IdRol;
    }

    function getIdfilter() {
        return $this->idfilter;
    }

    function setIdfilter($idfilter) {
        $this->idfilter = $idfilter;
    }

}
