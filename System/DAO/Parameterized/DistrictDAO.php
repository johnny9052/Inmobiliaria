<?php

/**
 * Definicion de acciones para la gestion de los districtes
 * @author Johnny Alexander Salazar
 * @version 0.1
 */
class DistrictDAO {

    private $repository;

    function __construct() {
        require_once '../../Infraestructure/Repository.php';
        $this->repository = new Repository();
    }

    /**
     * Ejecuta un guardar en la base de datos
     * @param DistrictDTO $obj 
     * @return void      
     * @author Johnny Alexander Salazar
     * @version 0.1
     */
    public function Save(DistrictDTO $obj) {
        $query = $this->repository->buildQuerySimply("savedistrict", array((int) $obj->getId(),
            (string) $obj->getName(), (int) $obj->getCity()));
        
        //echo $query;
        $this->repository->ExecuteTransaction($query);
    }

    /**
     * Ejecuta un listar en la base de datos
     * @param DistrictDTO $obj
     * @param boolean $type indica si se quiere filtro o no 
     * @return void      
     * @author Johnny Alexander Salazar
     * @version 0.1
     */
    public function ListAll(DistrictDTO $obj, $type) {
        $query = $this->repository->buildQuery("listdistrict", array((int) $obj->getIdUser()));
        $this->repository->BuildPaginatorDataTable($query, '', 50);
    }

    /**
     * Ejecuta un buscar en la base de datos
     * @param DistrictDTO $obj 
     * @return void      
     * @author Johnny Alexander Salazar
     * @version 0.1
     */
    public function Search(DistrictDTO $obj) {
        $query = $this->repository->buildQuery("searchdistrict", array((int) $obj->getId()));
        $this->repository->Execute($query);
    }

    /**
     * Ejecuta un actualizar en la base de datos
     * @param DistrictDTO $obj 
     * @return void      
     * @author Johnny Alexander Salazar
     * @version 0.1
     */
    public function Update(DistrictDTO $obj) {
        $query = $this->repository->buildQuerySimply("updatedistrict", array((int) $obj->getId(),
            (string) $obj->getName(), (int) $obj->getCity()));
        $this->repository->ExecuteTransaction($query);
    }

    /**
     * Ejecuta un borrar en la base de datos
     * @param DistrictDTO $obj 
     * @return void      
     * @author Johnny Alexander Salazar
     * @version 0.1
     */
    public function Delete(DistrictDTO $obj) {
        $query = $this->repository->buildQuerySimply("deletedistrict", array((int) $obj->getId()));
        $this->repository->ExecuteTransaction($query);
    }

}
