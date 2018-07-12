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
   

    function __construct($id, $firstName, $secondName, $firstLastName, $secondLastName, $documentNumber, $birthdate, $address, $homePhone, $mobilePhone, $email, $gender, $typeEmployee, $cityResidence, $profession, $maritalStatus) {
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

    function getDocumentNumber() {
        return $this->documentNumber;
    }

    function getBirthdate() {
        return $this->birthdate;
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

    function getTypeEmployee() {
        return $this->typeEmployee;
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

    function setDocumentNumber($documentNumber) {
        $this->documentNumber = $documentNumber;
    }

    function setBirthdate($birthdate) {
        $this->birthdate = $birthdate;
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

    function setTypeEmployee($typeEmployee) {
        $this->typeEmployee = $typeEmployee;
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



}
