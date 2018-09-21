<?php

/* IMPORTS */
require '../../DTO/Contract/DebtorDTO.php';
require '../../DAO/Contract/DebtorDAO.php';
include '../../Helper/Action/Action.php';

/* RECEPCION DE DATOS */
$action = getInfo('action');
$id = getInfo('id');
$documentNumber = getInfo('documentNumber');
$firstName = getInfo('firstName');
$secondName = getInfo('secondName');
$firstLastName = getInfo('firstLastName');
$secondLastName = getInfo('secondLastName');
$address = getInfo('address');
$homePhone = getInfo('homePhone');
$addressOffice = getInfo('addressOffice');
$officePhone = getInfo('officePhone');
$mobilePhone = getInfo('mobilePhone');
$email = getInfo('email');
$monthlyIncome = getInfo('monthlyIncome');
$maritalStatus = getInfo('maritalStatus');
$documentType = getInfo('documentType');
$cityResidence = getInfo('cityResidence');
$cityExpedition = getInfo('cityExpedition');
$expeditionDate = getInfo('expeditionDate');

/* DEFINICION DE OBJETOS */
$obj = new DebtorDTO($id, $documentNumber, $firstName, $secondName, $firstLastName, $secondLastName, $address, $homePhone, $addressOffice, $officePhone, $mobilePhone, $email, $monthlyIncome, $maritalStatus, $documentType, $cityResidence, $cityExpedition, $expeditionDate);
$dao = new DebtorDAO();

/* CONTROL DE ACCIONES */
ExecuteAction($action, $obj, $dao);


