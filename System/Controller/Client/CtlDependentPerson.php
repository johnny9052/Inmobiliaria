<?php

/* IMPORTS */
require '../../DTO/Client/DependentPersonDTO.php';
require '../../DAO/Client/DependentPersonDAO.php';
include '../../Helper/Action/Action.php';

/* RECEPCION DE DATOS */
$action = getInfo('action');
$id = getInfo('id');
$client = getInfo('client');
$activityEconomic = getInfo('laborType');
$company = getInfo('companyName');
$position = getInfo('position');
$address = getInfo('address');
$salary = getInfo('salary');
$otherIncome = getInfo('income');
$antiquity = getInfo('antiquity');
$officePhone = getInfo('phoneOffice');


/* DEFINICION DE OBJETOS */
$obj = new DependentPersonDTO($id, $client, $activityEconomic, $company, $position, $address, $salary, $otherIncome, $antiquity, $officePhone);
$dao = new DependentPersonDAO();

/* CONTROL DE ACCIONES */
ExecuteAction($action, $obj, $dao);


