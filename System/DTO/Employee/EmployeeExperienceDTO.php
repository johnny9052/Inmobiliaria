<?php

require_once ('../../DTO/BaseDTO.php');

class EmployeeExperienceDTO extends BaseDTO {

    private $id;
    private $employee;
    private $companyName;
    private $admissionDate;
    private $departureDate;
    private $urlWorkCertificate;
    private $position;
    
    
    function __construct($id, $employee, $companyName, $admissionDate, $departureDate, $urlWorkCertificate, $position) {
        $this->id = $id;
        $this->employee = $employee;
        $this->companyName = $companyName;
        $this->admissionDate = $admissionDate;
        $this->departureDate = $departureDate;
        $this->urlWorkCertificate = $urlWorkCertificate;
        $this->position = $position;
    }
    
    function getId() {
        return $this->id;
    }

    function getEmployee() {
        return $this->employee;
    }

    function getCompanyName() {
        return $this->companyName;
    }

    function getAdmissionDate() {
        return $this->admissionDate;
    }

    function getDepartureDate() {
        return $this->departureDate;
    }

    function getUrlWorkCertificate() {
        return $this->urlWorkCertificate;
    }

    function getPosition() {
        return $this->position;
    }

    function setId($id) {
        $this->id = $id;
    }

    function setEmployee($employee) {
        $this->employee = $employee;
    }

    function setCompanyName($companyName) {
        $this->companyName = $companyName;
    }

    function setAdmissionDate($admissionDate) {
        $this->admissionDate = $admissionDate;
    }

    function setDepartureDate($departureDate) {
        $this->departureDate = $departureDate;
    }

    function setUrlWorkCertificate($urlWorkCertificate) {
        $this->urlWorkCertificate = $urlWorkCertificate;
    }

    function setPosition($position) {
        $this->position = $position;
    }
}
