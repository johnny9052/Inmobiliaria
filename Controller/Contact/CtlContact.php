<?php

/* IMPORTS */
include '../../System/Infraestructure/Repository.php';
include '../../System/Helper/Action/Action.php';

/* RECEPCION DE DATOS */

$action = getInfo("action");
$idpropertie = getInfo("id");
$matricula = getInfo("matricula");
$nombre = getInfo("name");
$email = getInfo("email");
$phone = getInfo("phone");
$mensaje = getInfo("message");

/* DEFINICION DE OBJETOS */
$rep = new Repository();
$rep->sendEmail($email, "Estoy interesado en un inmueble!", "Mi nombre es " . $nombre . " y estoy interesado en el imumeble codigo " . $matricula .
        ": " . $mensaje, $phone);

echo "{res:'Success',msg:'Mensaje enviado satisfactoriamente'}";



