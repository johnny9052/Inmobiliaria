<?php

/* IMPORTS */
require '../../DTO/Contract/SpouseDTO.php';
require '../../DAO/Contract/SpouseDAO.php';
include '../../Helper/Action/Action.php';

/* RECEPCION DE DATOS */
$action = getInfo('action');
$id = getInfo('id');
$client = getInfo('client');
$documentNumber = getInfo('documentNumber');
$expeditionDate = getInfo('expeditionDate');
$email = getInfo('email');
$firstName = getInfo('firstName');
$firstLastName = getInfo('firstLastName');
$mobilePhone = getInfo('mobilePhone');
$company = getInfo('company');
$address = getInfo('address');
$officePhone = getInfo('officePhone');
$salary = getInfo('salary');


$expeditionDate = date("Y-m-d", strtotime($expeditionDate));

/* DEFINICION DE OBJETOS */
$obj = new SpouseDTO($id, $client, $documentNumber, $expeditionDate, $email, $firstName, $firstLastName, $mobilePhone, $company, $address, $officePhone, $salary);
$dao = new SpouseDAO();

/* CONTROL DE ACCIONES */
ExecuteAction($action, $obj, $dao);


