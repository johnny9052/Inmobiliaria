<?php

/* IMPORTS */
require '../../DTO/Client/ClientDTO.php';
require '../../DAO/Client/ClientDAO.php';
include '../../Helper/Action/Action.php';

/* RECEPCION DE DATOS */
$action = getInfoClient('action');
$id = getInfoClient('id');
$firstName = getInfoClient('firstName');
$secondName = getInfoClient('secondName');
$firstLastName = getInfoClient('firstLastName');
$secondLastName = getInfoClient('secondLastName');
$documentType = getInfoClient('documentType');
$documentNumber = getInfoClient('documentNumber');
$cityExpedition = getInfoClient('cityExpedition');
$birthdate = getInfoClient('birthdate');
$clientType = getInfoClient('clientType');
$address = getInfoClient('address');
$homePhone = getInfoClient('homePhone');
$mobilePhone = getInfoClient('mobilePhone');
$email = getInfoClient('email');
$gender = getInfoClient('gender');
$cityResidence = getInfoClient('cityResidence');
$profession = getInfoClient('profession');


$birthdate = date("Y-m-d", strtotime($birthdate));

/* DEFINICION DE OBJETOS */
$obj = new ClientDTO($id, $firstName, $secondName, $firstLastName, $secondLastName, $documentType, $documentNumber, $cityExpedition, $birthdate, $clientType, $address, $homePhone, $mobilePhone, $email, $gender, $cityResidence, $profession);
$dao = new ClientDAO();

/* CONTROL DE ACCIONES */
ExecuteAction($action, $obj, $dao);


