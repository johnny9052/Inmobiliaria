<?php

require_once ('../../DTO/BaseDTO.php');

class EmployeeDTO extends BaseDTO {

    private $id;
    private $firstName;
    private $secondName;
    private $firstLastName;
    private $secondLastName;
    private $documentNumber;
    private $birthdate;
    private $address;
    private $homePhone;
    private $mobilePhone;
    private $email;
    private $gender;
    private $typeEmployee;
    private $cityResidence;
    private $profession;
    private $maritalStatus;
    private $cityExpedition;
    private $fileIdentification;
    private $cityBirth;
    private $militaryCard;
    private $bloodType;
    private $fileMilitaryCard;
    private $pensionFund;
    private $severanceFund;
    private $arl;
    private $eps;
    private $compensationBox;
    private $disability;
    
    function __construct($id, $firstName, $secondName, $firstLastName, $secondLastName, $documentNumber, $birthdate, $address, $homePhone, $mobilePhone, $email, $gender, $typeEmployee, $cityResidence, $profession, $maritalStatus, $cityExpedition, $fileIdentification, $cityBirth, $militaryCard, $bloodType, $fileMilitaryCard, $pensionFund, $severanceFund, $arl, $eps, $compensationBox, $disability) {
        $this->id = $id;
        $this->firstName = $firstName;
        $this->secondName = $secondName;
        $this->firstLastName = $firstLastName;
        $this->secondLastName = $secondLastName;
        $this->documentNumber = $documentNumber;
        $this->birthdate = $birthdate;
        $this->address = $address;
        $this->homePhone = $homePhone;
        $this->mobilePhone = $mobilePhone;
        $this->email = $email;
        $this->gender = $gender;
        $this->typeEmployee = $typeEmployee;
        $this->cityResidence = $cityResidence;
        $this->profession = $profession;
        $this->maritalStatus = $maritalStatus;
        $this->cityExpedition = $cityExpedition;
        $this->fileIdentification = $fileIdentification;
        $this->cityBirth = $cityBirth;
        $this->militaryCard = $militaryCard;
        $this->bloodType = $bloodType;
        $this->fileMilitaryCard = $fileMilitaryCard;
        $this->pensionFund = $pensionFund;
        $this->severanceFund = $severanceFund;
        $this->arl = $arl;
        $this->eps = $eps;
        $this->compensationBox = $compensationBox;
        $this->disability = $disability;
    }
    


}
