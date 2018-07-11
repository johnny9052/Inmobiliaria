<?php

/*IMPORTS*/
require '../../DTO/Parameterized/ProfessionDTO.php';
require '../../DAO/Parameterized/ProfessionDAO.php';
include '../../Helper/Action/Action.php';

/*RECEPCION DE DATOS*/
$action = getInfoClient('action');
$id = getInfoClient('id');
$name = getInfoClient('name');
$professionNivel = getInfoClient('professionNivel');

/*DEFINICION DE OBJETOS*/
$obj = new ProfessionDTO($id, $name, $professionNivel);
$dao = new ProfessionDAO();

/* CONTROL DE ACCIONES */
ExecuteAction($action, $obj, $dao);


