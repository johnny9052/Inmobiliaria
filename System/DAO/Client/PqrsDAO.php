<?php

/**
 * Definicion de acciones para la gestion de los usuarios
 *
 * @author Johnny Alexander Salazar
 * @version 0.1
 */
class PqrsDAO {

    private $repository;

    function PqrsDAO() {
        require_once '../../Infraestructure/Repository.php';
        $this->repository = new Repository();
    }

    /**
     * Ejecuta un listar en la base de datos
     * @param PqrsDTO $obj 
     * @return void      
     * @author Johnny Alexander Salazar
     * @version 0.1
     */
    public function ListAll(PqrsDTO $obj) {
        $query = $this->repository->buildQuery("listpqrs", array((int) $obj->getId()));
        $this->repository->BuildPaginatorDataTable($query,'');
    }

    /**
     * Ejecuta un buscar en la base de datos
     * @param PqrsDTO $obj 
     * @return void      
     * @author Johnny Alexander Salazar
     * @version 0.1
     */
    public function Search(PqrsDTO $obj) {
        $query = $this->repository->buildQuery("searchpqrs", array((int) $obj->getId()));
        $this->repository->Execute($query);
    }

    /**
     * Ejecuta un actualizar en la base de datos
     * @param PqrsDTO $obj 
     * @return void      
     * @author Johnny Alexander Salazar
     * @version 0.1
     */
    public function Update(PqrsDTO $obj) {
        $query = $this->repository->buildQuerySimply("updatepqrs", array((int) $obj->getId(),
            (string) $obj->getGivenResponse()));
        $this->repository->ExecuteTransaction($query);
    }
}
