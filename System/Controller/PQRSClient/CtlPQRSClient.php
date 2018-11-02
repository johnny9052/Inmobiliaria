<?php

session_start();

/* IMPORTS */
require '../../DTO/PQRSClient/PQRSClientDTO.php';
require '../../DAO/PQRSClient/PQRSClientDAO.php';
include '../../Helper/Action/Action.php';


/* RECEPCION DE DATOS */
$action = getInfo('action');
$id = getInfo('id');
$pqrstype = getInfo('pqrstype');
$description = getInfo('description');

date_default_timezone_set('America/Bogota');

$dia = date('d');
$mes = date('n');
$anio = date("Y");

$fecha = $anio . '-' . $mes . '-' . $dia;

$hora = date('H:i');

$iduser = getInfoSesion('identificationPublicHexagon');
$name = getInfoSesion('namePublicHexagon');
$email = getInfoSesion('emailPublicHexagon');

/* DEFINICION DE OBJETOS */
$obj = new PQRSClientDTO($pqrstype, $description, $fecha, $hora, $name, $email, $iduser);
$dao = new PQRSClientDAO();

/* CONTROL DE ACCIONES */
ExecuteAction($action, $obj, $dao);


