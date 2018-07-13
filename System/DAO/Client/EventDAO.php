<?php

/**
 * Definicion de acciones para la gestion de los usuarios
 *
 * @author Johnny Alexander Salazar
 * @version 0.1
 */
class EventDAO {

    private $repository;

    function EventDAO() {
        require_once '../../Infraestructure/Repository.php';
        $this->repository = new Repository();
    }

    /**
     * Ejecuta un guardar en la base de datos
     * @param EventDTO $obj 
     * @return void      
     * @author Johnny Alexander Salazar
     * @version 0.1
     */
    public function Save(EventDTO $obj) {
        $query = $this->repository->buildQuerySimply("saveevent", array((int) $obj->getId(),
            (string) $obj->getDateEvent(), (string) $obj->getTimeEvent(),
            (string) $obj->getPlaceEvent(), (float) $obj->getLatitude(),
            (float) $obj->getLength(), (int) $obj->getEmployee(),
            (int) $obj->getClient(), (int) $obj->getEventType(),
            (string) $obj->getObservations()
        ));
        $this->repository->ExecuteTransaction($query);
    }

    /**
     * Ejecuta un listar en la base de datos
     * @param EventDTO $obj 
     * @return void      
     * @author Johnny Alexander Salazar
     * @version 0.1
     */
    public function ListAll(EventDTO $obj) {
        $query = $this->repository->buildQuery("listevent", array((int) $obj->getId()));
        $this->repository->BuildPaginatorDataTable($query, '');
    }

    /**
     * Ejecuta un buscar en la base de datos
     * @param EventDTO $obj 
     * @return void      
     * @author Johnny Alexander Salazar
     * @version 0.1
     */
    public function Search(EventDTO $obj) {
        $query = $this->repository->buildQuery("searchevent", array((int) $obj->getId()));
        $this->repository->Execute($query);
    }

    /**
     * Ejecuta un actualizar en la base de datos
     * @param EventDTO $obj 
     * @return void      
     * @author Johnny Alexander Salazar
     * @version 0.1
     */
    public function Update(EventDTO $obj) {
        $query = $this->repository->buildQuerySimply("updateevent", array((int) $obj->getId(),
            (string) $obj->getDateEvent, (string) $obj->getTimeEvent(),
            (string) $obj->getPlaceEvent(), (float) $obj->getLatitude(),
            (float) $obj->getLength(), (int) $obj->getEmployee(),
            (int) $obj->getClient(), (int) $obj->getEventType(),
            (string) $obj->getObservations()));
        $this->repository->ExecuteTransaction($query);
    }

    /**
     * Ejecuta un borrar en la base de datos
     * @param EventDTO $obj 
     * @return void      
     * @author Johnny Alexander Salazar
     * @version 0.1
     */
    public function Delete(EventDTO $obj) {
        $query = $this->repository->buildQuerySimply("deleteevent", array((int) $obj->getId()));
        $this->repository->ExecuteTransaction($query);
    }

}