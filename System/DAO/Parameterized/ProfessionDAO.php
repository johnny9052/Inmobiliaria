<?php

/**
 * Definicion de acciones para la gestion de los professiones
 * @author Johnny Alexander Salazar
 * @version 0.1
 */
class ProfessionDAO {

    private $repository;

    function __construct() {
        require_once '../../Infraestructure/Repository.php';
        $this->repository = new Repository();
    }

    /**
     * Ejecuta un guardar en la base de datos
     * @param ProfessionDTO $obj 
     * @return void      
     * @author Johnny Alexander Salazar
     * @version 0.1
     */
    public function Save(ProfessionDTO $obj) {
        $query = $this->repository->buildQuerySimply("saveprofession", array(
            (int) $obj->getId(),
            (string) $obj->getName(),
            (int) $obj->getProfessionNivel())
        );
        $this->repository->ExecuteTransaction($query);
    }

    /**
     * Ejecuta un listar en la base de datos
     * @param ProfessionDTO $obj
     * @param boolean $type indica si se quiere filtro o no 
     * @return void      
     * @author Johnny Alexander Salazar
     * @version 0.1
     */
    public function ListAll(ProfessionDTO $obj, $type) {
        $query = $this->repository->buildQuery("listprofession", array((int) $obj->getIdUser()));
        $this->repository->BuildPaginatorDataTable($query, '', 50);
    }

    /**
     * Ejecuta un buscar en la base de datos
     * @param ProfessionDTO $obj 
     * @return void      
     * @author Johnny Alexander Salazar
     * @version 0.1
     */
    public function Search(ProfessionDTO $obj) {
        $query = $this->repository->buildQuery("searchprofession", array((int) $obj->getId()));
        $this->repository->Execute($query);
    }

    /**
     * Ejecuta un actualizar en la base de datos
     * @param ProfessionDTO $obj 
     * @return void      
     * @author Johnny Alexander Salazar
     * @version 0.1
     */
    public function Update(ProfessionDTO $obj) {
        $query = $this->repository->buildQuerySimply("updateprofession", array((int) $obj->getId(),
            (string) $obj->getName(), (int) $obj->getProfessionNivel()));
        $this->repository->ExecuteTransaction($query);
    }

    /**
     * Ejecuta un borrar en la base de datos
     * @param ProfessionDTO $obj 
     * @return void      
     * @author Johnny Alexander Salazar
     * @version 0.1
     */
    public function Delete(ProfessionDTO $obj) {
        $query = $this->repository->buildQuerySimply("deleteprofession", array((int) $obj->getId()));
        $this->repository->ExecuteTransaction($query);
    }

}
