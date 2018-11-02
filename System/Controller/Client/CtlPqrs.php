<?php

/* IMPORTS */
require '../../DTO/Client/PqrsDTO.php';
require '../../DAO/Client/PqrsDAO.php';
include '../../Helper/Action/Action.php';
include '../../Infraestructure/Repository.php';

/* RECEPCION DE DATOS */
$action = getInfo('action');
$id = getInfo('id');
$datePQRS = getInfo('datePQRS');
$timePQRS = getInfo('timePQRS');
$descriptionPQRS = getInfo('descriptionPQRS');
$givenResponse = getInfo('givenResponse');
$typePQRS = getInfo('typePQRS');
$client = getInfo('client');

$name = getInfo('name');
$email = getInfo('email');

/* ENVIO DE CORREO ELECTRONICO */
$rep = new Repository();

//$rep->sendEmailPQRS($email, "Respuesta PQRS Hexagono", "Cordial saludo " . $name . " : " . $mensaje);


/* DEFINICION DE OBJETOS */
$obj = new PqrsDTO($id, $datePQRS, $timePQRS, $descriptionPQRS, $givenResponse, $typePQRS, $client);
$dao = new PqrsDAO();

/* CONTROL DE ACCIONES */
ExecuteAction($action, $obj, $dao);


