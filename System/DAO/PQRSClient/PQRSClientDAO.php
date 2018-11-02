<?php

/**
 * Definicion de acciones para la gestion de los propertiees
 * @author Johnny Alexander Salazar
 * @version 0.1
 */
class PQRSClientDAO {

    private $repository;

    function PQRSClientDAO() {
        require_once '../../Infraestructure/Repository.php';
        $this->repository = new Repository();
    }

    /**
     * Ejecuta un guardar en la base de datos
     * @param PQRSClientDTO $obj 
     * @return void      
     * @author Johnny Alexander Salazar
     * @version 0.1
     */
    public function Save(PQRSClientDTO $obj) {
        $query = $this->repository->buildQuerySimply("savepqrsclient", array(
            (int) $obj->getPqrstype(),
            (string) $obj->getDescription(), (string) $obj->getFecha(),
            (string) $obj->getHora(), (int) $obj->getIdUser()
        ));

        //echo $query;

        $this->repository->ExecuteTransaction($query);
    }

}
