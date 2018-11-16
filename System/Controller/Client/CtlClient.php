<?php

/* IMPORTS */
require '../../DTO/Client/ClientDTO.php';
require '../../DAO/Client/ClientDAO.php';
include '../../Helper/Action/Action.php';
include '../../Infraestructure/Cleaner.php';

/* RECEPCION DE DATOS */
$action = getInfo('action');
$id = getInfo('id');
$firstName = getInfo('firstName');
$secondName = getInfo('secondName');
$firstLastName = getInfo('firstLastName');
$secondLastName = getInfo('secondLastName');
$documentType = getInfo('documentType');
$documentNumber = getInfo('documentNumber');
$cityExpedition = getInfo('cityExpedition');
$birthdate = getInfo('birthdate');
$clientType = getInfo('clientType');
$address = getInfo('address');
$homePhone = getInfo('homePhone');
$mobilePhone = getInfo('mobilePhone');
$email = getInfo('email');
$gender = getInfo('gender');
$cityResidence = getInfo('cityResidence');
$profession = getInfo('profession');
$maritalStatus = getInfo('maritalStatus');
$personType = getInfo('personType');
$typesClientSelecteds = getInfo('typesClientSelecteds');
$password = (getInfo('password') === "") ? md5("1234") : md5(getInfo('password'));
$birthdate = date("Y-m-d", strtotime($birthdate));


deleteFiles('ClientImage', '../../', 'System/', 'Resource/Files/Clients/Images/', 1, $documentNumber, false, '.jpg');
/* Se crean las imagenes que se tengan que crear */
$imageEmployee = generateFiles('ClientImage', '../../', 'System/', 'Resource/Files/Clients/Images/', 1, $documentNumber, '.jpg', false);

/* DEFINICION DE OBJETOS */
$obj = new ClientDTO($id, $firstName, $secondName, $firstLastName, $secondLastName, $documentType, $documentNumber, $cityExpedition, $birthdate, $clientType, $address, $homePhone, $mobilePhone, $email, $gender, $cityResidence, $profession, $maritalStatus, $personType, $typesClientSelecteds, $password, $imageEmployee);
$dao = new ClientDAO();

/* CONTROL DE ACCIONES */
ExecuteAction($action, $obj, $dao);


