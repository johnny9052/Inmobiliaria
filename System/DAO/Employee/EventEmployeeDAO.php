<?php

/**
 * Definicion de acciones para la gestion de los usuarios
 *
 * @author Johnny Alexander Salazar
 * @version 0.1
 */
class EventEmployeeDAO {

    private $repository;

    function __construct() {
        require_once '../../Infraestructure/Repository.php';
        $this->repository = new Repository();
    }

    /**
     * Ejecuta un guardar en la base de datos
     * @param EventEmployeeDTO $obj 
     * @return void      
     * @author Johnny Alexander Salazar
     * @version 0.1
     */
    public function Save(EventEmployeeDTO $obj) {
        $query = $this->repository->buildQuerySimply("saveevent", array((int) $obj->getId(),
            (string) $obj->getDateEvent(), (string) $obj->getTimeEvent(),
            (string) $obj->getPlaceEvent(), (float) $obj->getLatitude(),
            (float) $obj->getLength(),
            (int) $obj->getClient(), (int) $obj->getEventType(),
            (string) $obj->getObservations(), (string) $obj->getEmployeesSelecteds() . ","
        ));
        $this->repository->ExecuteTransaction($query);
        //echo $query;
    }

    /**
     * Ejecuta un listar en la base de datos
     * @param EventEmployeeDTO $obj 
     * @return void      
     * @author Johnny Alexander Salazar
     * @version 0.1
     */
    public function ListAll(EventEmployeeDTO $obj) {
        $query = $this->repository->buildQuery("listevent", array((int) $obj->getId()));
        $this->repository->BuildPaginatorDataTable($query, '');
    }

    /**
     * Ejecuta un buscar en la base de datos
     * @param EventEmployeeDTO $obj 
     * @return void      
     * @author Johnny Alexander Salazar
     * @version 0.1
     */
    public function Search(EventEmployeeDTO $obj) {
        $query = $this->repository->buildQuery("searcheventcomments", array((int) $obj->getId()));
        $this->repository->Execute($query);
    }

    /**
     * Ejecuta un actualizar en la base de datos
     * @param EventEmployeeDTO $obj 
     * @return void      
     * @author Johnny Alexander Salazar
     * @version 0.1
     */
    public function Update(EventEmployeeDTO $obj) {
        $query = $this->repository->buildQuerySimply("updatecommentevents", array((int) $obj->getId(),
            (string) $obj->getComments()
        ));
        $this->repository->ExecuteTransaction($query);
    }

    /**
     * Ejecuta un borrar en la base de datos
     * @param EventEmployeeDTO $obj 
     * @return void      
     * @author Johnny Alexander Salazar
     * @version 0.1
     */
    public function Delete(EventEmployeeDTO $obj) {
        $query = $this->repository->buildQuerySimply("deleteevent", array((int) $obj->getId()));
        $this->repository->ExecuteTransaction($query);
    }

}
