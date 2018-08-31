<?php

require_once ('../../DTO/BaseDTO.php');

class ContentDTO extends BaseDTO {

    private $page;

    public function __Construct($page, $rol, $idfilter) {
        $this->page = $page;
        parent::setIdRol($rol);
        parent::setIdfilter($idfilter);
    }

    function getPage() {
        return $this->page;
    }

    function setPage($page) {
        $this->page = $page;
    }

}
