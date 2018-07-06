<?php

/* IMPORTS */
require '../../DTO/Message/MessageDTO.php';
include '../../System/Infraestructure/Repository.php';

/* RECEPCION DE DATOS */
$action = (isset($_REQUEST['action']) ? $_REQUEST['action'] : "");
$nombre = (isset($_POST['nombre']) ? $_POST['nombre'] : "");
$email = (isset($_POST['email']) ? $_POST['email'] : "");
$organizacion = (isset($_POST['organizacion']) ? $_POST['organizacion'] : "");
$mensaje = (isset($_POST['mensaje']) ? $_POST['mensaje'] : "");

/* DEFINICION DE OBJETOS */
$rep = new Repository();
$rep->sendEmail($email, $nombre,"Soy de la organizacion ".$organizacion.": ".$mensaje." ");

echo "{res:'Success',msg:'Mensaje enviado satisfactoriamente'}";



