<?php

/* IMPORTS */
include '../../System/Infraestructure/Repository.php';
include '../../System/Helper/Action/Action.php';

/* RECEPCION DE DATOS */

$action = getInfo("action");
$primerNombre = getInfo("firstName");
$segundoNombre = getInfo("secondName");
$primerApellido = getInfo("firstLastName");
$segundoApellido = getInfo("secondLastName");
$direccion = getInfo("address");
$telefono = getInfo("phone");
$celular = getInfo("celPhone");
$email = getInfo("email");
$departamento = getInfo("state");
$ciudad = getInfo("city");


/* DEFINICION DE OBJETOS */
$rep = new Repository();
$rep->sendEmail($email, "Enviado desde publicar!", "Quiero publicar u inmueble, mi nombre es " . $primerNombre . " " . $segundoNombre . " " . $primerApellido . " " . $segundoApellido . " " . 
                "mi dirección es " . $direccion . " mis telefonos son " . $telefono . " " . $celular . "el inmuueble esta úbicado en " . $departamento . "-" . $ciudad, $celular);

echo "{res:'Success',msg:'Mensaje enviado satisfactoriamente'}";



