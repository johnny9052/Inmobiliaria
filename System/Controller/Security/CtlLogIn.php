<?php

/* IMPORTS */
require '../../DTO/Security/LogInDTO.php';
require '../../DAO/Security/LogInDAO.php';
include '../../Helper/Action/Action.php';

/* RECEPCION DE DATOS */
$action = getInfo('action');
$usuario = getInfo('user');
$password = getInfo('password');


/* DEFINICION DE OBJETOS */
$obj = new LogInDTO($usuario, $password);
$conex = new LogInDAO();


///* CONTROL DE ACCIONES */
switch ($action) {
    case "logInPublic":
        $conex->SignInPublic($obj);
        break;

    default :
        $conex->SignIn($obj);
        break;
}




