<?php

/**
 * Definicion de acciones para la gestion de los usuarios
 *
 * @author Johnny Alexander Salazar
 * @version 0.1
 */
class IndependentPersonDAO {

    private $repository;

    function __construct() {
        require_once '../../Infraestructure/Repository.php';
        $this->repository = new Repository();
    }

    /**
     * Ejecuta un guardar en la base de datos
     * @param IndependentPersonDTO $obj 
     * @return void      
     * @author Johnny Alexander Salazar
     * @version 0.1
     */
    public function Save(IndependentPersonDTO $obj) {
        $query = $this->repository->buildQuerySimply("saveindependent", array((int) $obj->getId(),
            (int) $obj->getActivityEconomic(),
            (string) $obj->getBusinessDescription(), (string) $obj->getMerchantRecord(),
            (int) $obj->getNumberEmployees(), (float) $obj->getIncome(),
            (float) $obj->getExpenses()
        ));
        //echo $query;
        $this->repository->ExecuteTransaction($query);
    }

    /**
     * Ejecuta un listar en la base de datos
     * @param IndependentPersonDTO $obj 
     * @return void      
     * @author Johnny Alexander Salazar
     * @version 0.1
     */
    public function ListAll(IndependentPersonDTO $obj) {
        $query = $this->repository->buildQuery("listindependent", array((int) $obj->getId()));
        $this->repository->BuildPaginatorDataTable($query, '');
    }

    /**
     * Ejecuta un buscar en la base de datos
     * @param IndependentPersonDTO $obj 
     * @return void      
     * @author Johnny Alexander Salazar
     * @version 0.1
     */
    public function Search(IndependentPersonDTO $obj) {
        $query = $this->repository->buildQuery("searchindependent", array((int) $obj->getId()));
        $this->repository->Execute($query);
    }

    /**
     * Ejecuta un actualizar en la base de datos
     * @param IndependentPersonDTO $obj 
     * @return void      
     * @author Johnny Alexander Salazar
     * @version 0.1
     */
    public function Update(IndependentPersonDTO $obj) {
        $query = $this->repository->buildQuerySimply("saveupdateindependent", array((int) $obj->getId(),
            (int) $obj->getActivityEconomic(),
            (string) $obj->getBusinessDescription(), (string) $obj->getMerchantRecord(),
            (int) $obj->getNumberEmployees(), (float) $obj->getIncome(),
            (float) $obj->getExpenses()
        ));
        $this->repository->ExecuteTransaction($query);
    }

    /**
     * Ejecuta un borrar en la base de datos
     * @param IndependentPersonDTO $obj 
     * @return void      
     * @author Johnny Alexander Salazar
     * @version 0.1
     */
    public function Delete(IndependentPersonDTO $obj) {
        $query = $this->repository->buildQuerySimply("deleteindependent", array((int) $obj->getId()));
        $this->repository->ExecuteTransaction($query);
    }

}
