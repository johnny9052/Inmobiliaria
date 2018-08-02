<?php

/* IMPORTS */
require '../../DTO/Employee/EmployeeDTO.php';
require '../../DAO/Employee/EmployeeDAO.php';
include '../../Helper/Action/Action.php';
include '../../Infraestructure/Cleaner.php';


/* RECEPCION DE DATOS */
$action = getInfo('action');
$id = getInfo('id');
$firstName = getInfo('firstName');
$secondName = getInfo('secondName');
$firstLastName = getInfo('firstLastName');
$secondLastName = getInfo('secondLastName');
$documentNumber = getInfo('documentNumber');
$birthdate = getInfo('birthdate');
$address = getInfo('address');
$homePhone = getInfo('homePhone');
$mobilePhone = getInfo('mobilePhone');
$email = getInfo('email');
$gender = getInfo('gender');
$typeEmployee = getInfo('typeEmployee');
$cityResidence = getInfo('cityResidence');
$profession = getInfo('profession');
$maritalStatus = getInfo('maritalStatus');
$cityExpedition = getInfo('cityExpedition');
$expeditionDate = getInfo('expeditionDate');
$fileIdentification = getInfo('urlFileIdentification');
$cityBirth = getInfo('cityBirth');
$militaryCard = getInfo('militaryCard');
$bloodType = getInfo('bloodType');
$fileMilitaryCard = getInfo('urlFileMilitaryCard');
$pensionFund = getimagesize('pensionFund');
$severanceFund = getInfo('severanceFund');
$arl = getInfo('arl');
$eps = getInfo('eps');
$compensationBox = getInfo('compensationBox');
$disability = getInfo('disability');
$imageEmployee = getInfo('urlImage');
$contactName = getInfo('contacName');
$contactPhone = getInfo('contactPhone');
$contactEmail = getInfo('contactEmail');


$birthdate = date("Y-m-d", strtotime($birthdate));



$route = '../../Resource/Files/Employees/';
$routeDB = 'System/Resource/Files/Employees/';

for ($x = 0; $x < 20; $x++) {

    $base64Code = getInfo('base64File' . $x);
    $filePath = getInfo('nameFile' . $x);

    if ($filePath != null && $filePath != "") {
        $cleaner = new Cleaner();
        $filePathDB = $routeDB . $cleaner->cleanValueFileName($documentNumber . '_' . $filePath) . '_' . $cleaner->cleanValueDate(date('Y-m-d H:i:s')) . '.pdf';
        $filePath = $route . $cleaner->cleanValueFileName($documentNumber . '_' . $filePath) . '_' . $cleaner->cleanValueDate(date('Y-m-d H:i:s')) . '.pdf';
        base64_to_file($base64Code, $filePath);
        $file = $filePathDB;
    } else {
        break;
    }
}

/* DEFINICION DE OBJETOS */
$obj = new EmployeeDTO($id, $firstName, $secondName, $firstLastName, $secondLastName, $documentNumber, $expeditionDate, $birthdate, $address, $homePhone, $mobilePhone, $email, $gender, $typeEmployee, $cityResidence, $profession, $maritalStatus, $cityExpedition, $fileIdentification, $cityBirth, $militaryCard, $bloodType, $fileMilitaryCard, $pensionFund, $severanceFund, $arl, $eps, $compensationBox, $disability, $imageEmployee, $contacName, $contactPhone, $contactEmail);
$dao = new EmployeeDAO();

/* CONTROL DE ACCIONES */
ExecuteAction($action, $obj, $dao);





