<?php

/* IMPORTS */
include '../../System/Infraestructure/Repository.php';
include '../../System/Helper/Action/Action.php';

/* RECEPCION DE DATOS */

$action = getInfo("action");
$nombre = getInfo("name");
$email = getInfo("email");
$phone = getInfo("phone");
$mensaje = getInfo("message");

/* DEFINICION DE OBJETOS */
$rep = new Repository();
$rep->sendEmail($email, "Enviado desde contáctenos!", "Mi nombre es " . $nombre . " y " . $mensaje, $phone);

echo "{res:'Success',msg:'Mensaje enviado satisfactoriamente'}";



