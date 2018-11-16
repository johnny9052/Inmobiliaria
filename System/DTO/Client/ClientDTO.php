<?php

require_once ('../../DTO/BaseDTO.php');

class ClientDTO extends BaseDTO {

    private $id;
    private $firstName;
    private $secondName;
    private $firstLastName;
    private $secondLastName;
    private $documentType;
    private $documentNumber;
    private $cityExpedition;
    private $birthdate;
    private $clientType;
    private $address;
    private $homePhone;
    private $mobilePhone;
    private $email;
    private $gender;
    private $cityResidence;
    private $profession;
    private $maritalStatus;
    private $personType;
    private $typesClientSelecteds;
    private $password;
    private $imageEmployee;

    function __construct($id, $firstName, $secondName, $firstLastName, $secondLastName, $documentType, $documentNumber, $cityExpedition, $birthdate, $clientType, $address, $homePhone, $mobilePhone, $email, $gender, $cityResidence, $profession, $maritalStatus, $personType, $typesClientSelecteds, $password, $imageEmployee) {
        $this->id = $id;
        $this->firstName = $firstName;
        $this->secondName = $secondName;
        $this->firstLastName = $firstLastName;
        $this->secondLastName = $secondLastName;
        $this->documentType = $documentType;
        $this->documentNumber = $documentNumber;
        $this->cityExpedition = $cityExpedition;
        $this->birthdate = $birthdate;
        $this->clientType = $clientType;
        $this->address = $address;
        $this->homePhone = $homePhone;
        $this->mobilePhone = $mobilePhone;
        $this->email = $email;
        $this->gender = $gender;
        $this->cityResidence = $cityResidence;
        $this->profession = $profession;
        $this->maritalStatus = $maritalStatus;
        $this->personType = $personType;
        $this->typesClientSelecteds = $typesClientSelecteds;
        $this->password = $password;
        $this->imageEmployee = $imageEmployee;
    }
    
    function getId() {
        return $this->id;
    }

    function getFirstName() {
        return $this->firstName;
    }

    function getSecondName() {
        return $this->secondName;
    }

    function getFirstLastName() {
        return $this->firstLastName;
    }

    function getSecondLastName() {
        return $this->secondLastName;
    }

    function getDocumentType() {
        return $this->documentType;
    }

    function getDocumentNumber() {
        return $this->documentNumber;
    }

    function getCityExpedition() {
        return $this->cityExpedition;
    }

    function getBirthdate() {
        return $this->birthdate;
    }

    function getClientType() {
        return $this->clientType;
    }

    function getAddress() {
        return $this->address;
    }

    function getHomePhone() {
        return $this->homePhone;
    }

    function getMobilePhone() {
        return $this->mobilePhone;
    }

    function getEmail() {
        return $this->email;
    }

    function getGender() {
        return $this->gender;
    }

    function getCityResidence() {
        return $this->cityResidence;
    }

    function getProfession() {
        return $this->profession;
    }

    function getMaritalStatus() {
        return $this->maritalStatus;
    }

    function getPersonType() {
        return $this->personType;
    }

    function getTypesClientSelecteds() {
        return $this->typesClientSelecteds;
    }

    function getPassword() {
        return $this->password;
    }

    function getImageEmployee() {
        return $this->imageEmployee;
    }

    function setId($id) {
        $this->id = $id;
    }

    function setFirstName($firstName) {
        $this->firstName = $firstName;
    }

    function setSecondName($secondName) {
        $this->secondName = $secondName;
    }

    function setFirstLastName($firstLastName) {
        $this->firstLastName = $firstLastName;
    }

    function setSecondLastName($secondLastName) {
        $this->secondLastName = $secondLastName;
    }

    function setDocumentType($documentType) {
        $this->documentType = $documentType;
    }

    function setDocumentNumber($documentNumber) {
        $this->documentNumber = $documentNumber;
    }

    function setCityExpedition($cityExpedition) {
        $this->cityExpedition = $cityExpedition;
    }

    function setBirthdate($birthdate) {
        $this->birthdate = $birthdate;
    }

    function setClientType($clientType) {
        $this->clientType = $clientType;
    }

    function setAddress($address) {
        $this->address = $address;
    }

    function setHomePhone($homePhone) {
        $this->homePhone = $homePhone;
    }

    function setMobilePhone($mobilePhone) {
        $this->mobilePhone = $mobilePhone;
    }

    function setEmail($email) {
        $this->email = $email;
    }

    function setGender($gender) {
        $this->gender = $gender;
    }

    function setCityResidence($cityResidence) {
        $this->cityResidence = $cityResidence;
    }

    function setProfession($profession) {
        $this->profession = $profession;
    }

    function setMaritalStatus($maritalStatus) {
        $this->maritalStatus = $maritalStatus;
    }

    function setPersonType($personType) {
        $this->personType = $personType;
    }

    function setTypesClientSelecteds($typesClientSelecteds) {
        $this->typesClientSelecteds = $typesClientSelecteds;
    }

    function setPassword($password) {
        $this->password = $password;
    }

    function setImageEmployee($imageEmployee) {
        $this->imageEmployee = $imageEmployee;
    }



}
