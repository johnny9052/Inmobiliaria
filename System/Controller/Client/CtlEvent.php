<?php

/* IMPORTS */
require '../../DTO/Client/EventDTO.php';
require '../../DAO/Client/EventDAO.php';
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
$EmployeesSelecteds = getInfo('employee');


$dateEvent = date("Y-m-d", strtotime($dateEvent));


/* DEFINICION DE OBJETOS */
$obj = new EventDTO($id, $dateEvent, $timeEvent, $placeEvent, $latitude, $length, $employee, $eventType, $observations, $EmployeesSelecteds);
$dao = new EventDAO();

/* CONTROL DE ACCIONES */
ExecuteAction($action, $obj, $dao);


