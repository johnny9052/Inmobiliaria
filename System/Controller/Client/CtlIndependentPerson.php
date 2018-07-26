<?php

/* IMPORTS */
require '../../DTO/Client/IndependentPersonDTO.php';
require '../../DAO/Client/IndependentPersonDAO.php';
include '../../Helper/Action/Action.php';

/* RECEPCION DE DATOS */
$action = getInfo('action');
$id = getInfo('id');
$client = getInfo('client');
$activityEconomic = getInfo('laborType');
$businessDescription = getInfo('businessDescription');
$merchantRecord= getInfo('merchantRecord');
$numberEmployees = getInfo('numberEmployees');
$income = getInfo('income');
$expenses = getInfo('expenses');



/* DEFINICION DE OBJETOS */
$obj = new IndependentPersonDTO($id, $client, $activityEconomic, $businessDescription, $merchantRecord, $numberEmployees, $income, $expenses);
$dao = new IndependentPersonDAO();

/* CONTROL DE ACCIONES */
ExecuteAction($action, $obj, $dao);


