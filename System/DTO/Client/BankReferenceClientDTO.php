<?php

require_once ('../../DTO/BaseDTO.php');

class BankReferenceClientDTO extends BaseDTO {

    private $id;
    private $client;
    private $numberAccount;
    private $bank;
    private $branchOffice;

    function __construct($id, $client, $numberAccount, $bank, $branchOffice) {
        $this->id = $id;
        $this->client = $client;
        $this->numberAccount = $numberAccount;
        $this->bank = $bank;
        $this->branchOffice = $branchOffice;
    }
    
    function getId() {
        return $this->id;
    }

    function getClient() {
        return $this->client;
    }

    function getNumberAccount() {
        return $this->numberAccount;
    }

    function getBank() {
        return $this->bank;
    }

    function getBranchOffice() {
        return $this->branchOffice;
    }

    function setId($id) {
        $this->id = $id;
    }

    function setClient($client) {
        $this->client = $client;
    }

    function setNumberAccount($numberAccount) {
        $this->numberAccount = $numberAccount;
    }

    function setBank($bank) {
        $this->bank = $bank;
    }

    function setBranchOffice($branchOffice) {
        $this->branchOffice = $branchOffice;
    }



}
