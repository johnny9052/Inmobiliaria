<?php

/* IMPORTS */
require '../../DTO/Employee/EventEmployeeDTO.php';
require '../../DAO/Employee/EventEmployeeDAO.php';
include '../../Helper/Action/Action.php';

/* RECEPCION DE DATOS */
$action = getInfo('action');
$id = getInfo('id');
$dateEvent = getInfo('dateEvent');
$timeEvent = getInfo('timeEvent');
$placeEvent = getInfo('place');
$latitude = getInfo('latitude');
$length = getInfo('length');
$client = getInfo('client');
$eventType = getInfo('typeEvent');
$observations = getInfo('observations');
$employeesSelecteds = getInfo('employeesSelecteds');
$comments = getInfo('comments');


$dateEvent = date("Y-m-d", strtotime($dateEvent));


/* DEFINICION DE OBJETOS */
$obj = new EventEmployeeDTO($id, $dateEvent, $timeEvent, $placeEvent, $latitude, $length, $client, $eventType, $observations, $employeesSelecteds, $comments);
$dao = new EventEmployeeDAO();

/* CONTROL DE ACCIONES */
ExecuteAction($action, $obj, $dao);


