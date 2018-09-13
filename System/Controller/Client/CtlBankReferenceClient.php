<?php

/* IMPORTS */
require '../../DTO/Client/BankReferenceClientDTO.php';
require '../../DAO/Client/BankReferenceClientDAO.php';
include '../../Helper/Action/Action.php';

/* RECEPCION DE DATOS */
$action = getInfo('action');
$id = getInfo('id');
$client = getInfo('client');
$numberAccount = getInfo('numberAccount');
$bank = getInfo('bank');
$branchOffice = getInfo('branchOffice');

/* DEFINICION DE OBJETOS */
$obj = new BankReferenceClientDTO($id, $client, $numberAccount, $bank, $branchOffice);
$dao = new BankReferenceClientDAO();

/* CONTROL DE ACCIONES */
ExecuteAction($action, $obj, $dao);


