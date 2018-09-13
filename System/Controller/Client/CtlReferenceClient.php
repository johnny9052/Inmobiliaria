<?php

/* IMPORTS */
require '../../DTO/Client/ReferenceClientDTO.php';
require '../../DAO/Client/ReferenceClientDAO.php';
include '../../Helper/Action/Action.php';

/* RECEPCION DE DATOS */
$action = getInfo('action');
$id = getInfo('id');
$client = getInfo('client');
$typeReference = getInfo('typeReference');
$firstName = getInfo('firstName');
$firstLastName = getInfo('firstLastName');
$mobilePhone = getInfo('mobilePhone');

/* DEFINICION DE OBJETOS */
$obj = new ReferenceClientDTO($id, $client, $typeReference, $firstName, $firstLastName, $mobilePhone);
$dao = new ReferenceClientDAO();

/* CONTROL DE ACCIONES */
ExecuteAction($action, $obj, $dao);


