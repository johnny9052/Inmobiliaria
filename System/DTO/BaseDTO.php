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

    /* Atributos para un proceso de auditoria basico */
    protected $idRegister;
    protected $dia;
    protected $mes;
    protected $anio;
    protected $hora;
    protected $ip;
    protected $device;
    protected $sistemaOperativo;
    protected $navegador;
    protected $tokenUser;
    
    
    function getTokenUser() {
        return $this->tokenUser;
    }

    function setTokenUser($tokenUser) {
        $this->tokenUser = $tokenUser;
    }

        /* Auditoria especifica */
    protected $url;
    protected $action_result;

    function getUrl() {
        return $this->url;
    }

    function getAction_result() {
        return $this->action_result;
    }

    function setUrl($url) {
        $this->url = $url;
    }

    function setAction_result($action_result) {
        $this->action_result = $action_result;
    }

    function getIdRegister() {
        return $this->idRegister;
    }

    function getDia() {
        return $this->dia;
    }

    function getMes() {
        return $this->mes;
    }

    function getAnio() {
        return $this->anio;
    }

    function getHora() {
        return $this->hora;
    }

    function getIp() {
        return $this->ip;
    }

    function getDevice() {
        return $this->device;
    }

    function getSistemaOperativo() {
        return $this->sistemaOperativo;
    }

    function getNavegador() {
        return $this->navegador;
    }

    function setIdRegister($idRegister) {
        $this->idRegister = $idRegister;
    }

    function setDia($dia) {
        $this->dia = $dia;
    }

    function setMes($mes) {
        $this->mes = $mes;
    }

    function setAnio($anio) {
        $this->anio = $anio;
    }

    function setHora($hora) {
        $this->hora = $hora;
    }

    function setIp($ip) {
        $this->ip = $ip;
    }

    function setDevice($device) {
        $this->device = $device;
    }

    function setSistemaOperativo($sistemaOperativo) {
        $this->sistemaOperativo = $sistemaOperativo;
    }

    function setNavegador($navegador) {
        $this->navegador = $navegador;
    }

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

    public function setDataAudit($idRegister, $dia, $mes, $anio, $hora, $ip, $device, $sistemaOperativo, $navegador, $tokenUser ,$url = '', $action_result = '') {
        $this->setIdRegister($idRegister);
        $this->setDia($dia);
        $this->setMes($mes);
        $this->setAnio($anio);
        $this->setHora($hora);
        $this->setIp($ip);
        $this->setDevice($device);
        $this->setSistemaOperativo($sistemaOperativo);
        $this->setNavegador($navegador);
        $this->setUrl($url);
        $this->setAction_result($action_result);
        $this->setTokenUser($tokenUser);
    }

}
