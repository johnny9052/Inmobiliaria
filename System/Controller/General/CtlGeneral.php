<?php

/*IMPORTS*/
require '../../DTO/General/GeneralDTO.php';
require '../../DAO/General/GeneralDAO.php';
include '../../Helper/Action/Load.php';

/*RECEPCION DE DATOS*/
$action = (isset($_REQUEST['action']) ? $_REQUEST['action'] : "");
$id = (isset($_REQUEST['id']) ? $_REQUEST['id'] : "");

/*DEFINICION DE OBJETOS*/
$obj = new GeneralDTO($id);
$dao = new GeneralDAO();

/* CONTROL DE ACCIONES */
ExecuteActionLoad($action, $obj, $dao);


