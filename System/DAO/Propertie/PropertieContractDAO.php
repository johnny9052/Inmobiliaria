<?php

/**
 * Definicion de acciones para la gestion de los usuarios
 *
 * @author Johnny Alexander Salazar
 * @version 0.1
 */
class PropertieContractDAO {

    private $repository;

    function PropertieContractDAO() {
        require_once '../../Infraestructure/Repository.php';
        $this->repository = new Repository();
    }

    /**
     * Ejecuta un guardar en la base de datos
     * @param PropertieContractDTO $obj 
     * @return void      
     * @author Johnny Alexander Salazar
     * @version 0.1
     */
    public function Save(PropertieContractDTO $obj) {
        $query = $this->repository->buildQuerySimply("savecontractpropertie", array((int) $obj->getId(),
            (int) $obj->getPropertie(), (string) $obj->getFirmDate(),
            (string) $obj->getStartDate(),(string) $obj->getEndDate(),
            (float) $obj->getContractValue(), (int) $obj->getTermContract(),
            (string) $obj->getWayPay(), (string) $obj->getUrlContract()
        ));
        //echo $query;
        $this->repository->ExecuteTransaction($query);
    }

    /**
     * Ejecuta un listar en la base de datos
     * @param PropertieContractDTO $obj 
     * @return void      
     * @author Johnny Alexander Salazar
     * @version 0.1
     */
    public function ListAll(PropertieContractDTO $obj) {
        $query = $this->repository->buildQuery("listcontractpropertie", array((int) $obj->getId()));
        $this->repository->BuildPaginatorDataTable($query, '');
    }

    /**
     * Ejecuta un buscar en la base de datos
     * @param PropertieContractDTO $obj 
     * @return void      
     * @author Johnny Alexander Salazar
     * @version 0.1
     */
    public function Search(PropertieContractDTO $obj) {
        $query = $this->repository->buildQuery("searchcontractpropertie", array((int) $obj->getId()));
        $this->repository->Execute($query);
    }

    /**
     * Ejecuta un actualizar en la base de datos
     * @param PropertieContractDTO $obj 
     * @return void      
     * @author Johnny Alexander Salazar
     * @version 0.1
     */
    public function Update(PropertieContractDTO $obj) {
        $query = $this->repository->buildQuerySimply("updatecontractpropertie", array((int) $obj->getId(),
            (int) $obj->getPropertie(), (string) $obj->getFirmDate(),
            (string) $obj->getStartDate(),(string) $obj->getEndDate(),
            (float) $obj->getContractValue(), (int) $obj->getTermContract(),
            (string) $obj->getWayPay(), (string) $obj->getUrlContract()
        ));
        $this->repository->ExecuteTransaction($query);
    }

    /**
     * Ejecuta un borrar en la base de datos
     * @param PropertieContractDTO $obj 
     * @return void      
     * @author Johnny Alexander Salazar
     * @version 0.1
     */
    public function Delete(PropertieContractDTO $obj) {
        $query = $this->repository->buildQuerySimply("deletecontractpropertie", array((int) $obj->getId()));
        $this->repository->ExecuteTransaction($query);
    }

}
