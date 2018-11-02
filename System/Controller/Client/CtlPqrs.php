<?php

/* IMPORTS */
require '../../DTO/Client/PqrsDTO.php';
require '../../DAO/Client/PqrsDAO.php';
include '../../Helper/Action/Action.php';

/* RECEPCION DE DATOS */
$action = getInfo('action');
$id = getInfo('id');
$datePQRS = getInfo('datePQRS');
$timePQRS = getInfo('timePQRS');
$descriptionPQRS = getInfo('descriptionPQRS');
$givenResponse = getInfo('givenResponse');
$typePQRS = getInfo('typePQRS');
$client = getInfo('client');

/* DEFINICION DE OBJETOS */
$obj = new PqrsDTO($id, $datePQRS, $timePQRS, $descriptionPQRS, $givenResponse, $typePQRS, $client);
$dao = new PqrsDAO();

/* CONTROL DE ACCIONES */
ExecuteAction($action, $obj, $dao);


