<?php

require_once ('../../DTO/BaseDTO.php');

class EmployeeFormationDTO extends BaseDTO {

    private $id;
    private $employee;
    private $educationInstitute;
    private $profession;
    private $periodicity;
    private $graduate;
    private $level;
    private $fileCertificate;
    
    function __construct($id, $employee, $educationInstitute, $profession, $periodicity, $graduate, $level, $fileCertificate) {
        $this->id = $id;
        $this->employee = $employee;
        $this->educationInstitute = $educationInstitute;
        $this->profession = $profession;
        $this->periodicity = $periodicity;
        $this->graduate = $graduate;
        $this->level = $level;
        $this->fileCertificate = $fileCertificate;
    }
    
    function getId() {
        return $this->id;
    }

    function getEmployee() {
        return $this->employee;
    }

    function getEducationInstitute() {
        return $this->educationInstitute;
    }

    function getProfession() {
        return $this->profession;
    }

    function getPeriodicity() {
        return $this->periodicity;
    }

    function getGraduate() {
        return $this->graduate;
    }

    function getLevel() {
        return $this->level;
    }

    function getFileCertificate() {
        return $this->fileCertificate;
    }

    function setId($id) {
        $this->id = $id;
    }

    function setEmployee($employee) {
        $this->employee = $employee;
    }

    function setEducationInstitute($educationInstitute) {
        $this->educationInstitute = $educationInstitute;
    }

    function setProfession($profession) {
        $this->profession = $profession;
    }

    function setPeriodicity($periodicity) {
        $this->periodicity = $periodicity;
    }

    function setGraduate($graduate) {
        $this->graduate = $graduate;
    }

    function setLevel($level) {
        $this->level = $level;
    }

    function setFileCertificate($fileCertificate) {
        $this->fileCertificate = $fileCertificate;
    }    
}
