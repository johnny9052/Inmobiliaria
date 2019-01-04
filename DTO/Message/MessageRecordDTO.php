<?php



class MessageDTO{

    private $firstName;
    private $secondName;
    private $firstLastName;
    private $secondLastName;
    private $address;
    private $phone;
    private $celPhone;
    private $email;
    private $state;
    private $city;  

    function __construct($firstName, $secondName, $firstLastName, $secondLastName, $address, $phone, $celPhone, $email, $state, $city) {
        $this->firstName = $firstName;
        $this->secondName = $secondName;
        $this->firstLastName = $firstLastName;
        $this->secondLastName = $secondLastName;
        $this->address = $address;
        $this->phone = $phone;
        $this->celPhone = $celPhone;
        $this->email = $email;
        $this->state = $state;
        $this->city = $city;
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

    function getAddress() {
        return $this->address;
    }

    function getPhone() {
        return $this->phone;
    }

    function getCelPhone() {
        return $this->celPhone;
    }

    function getEmail() {
        return $this->email;
    }

    function getState() {
        return $this->state;
    }

    function getCity() {
        return $this->city;
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

    function setAddress($address) {
        $this->address = $address;
    }

    function setPhone($phone) {
        $this->phone = $phone;
    }

    function setCelPhone($celPhone) {
        $this->celPhone = $celPhone;
    }

    function setEmail($email) {
        $this->email = $email;
    }

    function setState($state) {
        $this->state = $state;
    }

    function setCity($city) {
        $this->city = $city;
    }



}
