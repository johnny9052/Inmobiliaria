<?php

/**
 * Definicion de acciones para la gestion de los propertiees
 * @author Johnny Alexander Salazar
 * @version 0.1
 */
class PropertieDAO {

    private $repository;

    function PropertieDAO() {
        require_once '../../Infraestructure/Repository.php';
        $this->repository = new Repository();
    }

    /**
     * Ejecuta un guardar en la base de datos
     * @param PropertieDTO $obj 
     * @return void      
     * @author Johnny Alexander Salazar
     * @version 0.1
     */
    public function Save(PropertieDTO $obj) {
        $query = $this->repository->buildQuerySimply("savepropertie", array((int) $obj->getId(),
            (float) $obj->getPrecio(), (float) $obj->getAdministrationCost(),
            (int) $obj->getRoom(), (int) $obj->getBath(),
            (int) $obj->getParking(), (float) $obj->getTotalArea(),
            (float) $obj->getAreasWithoutBalconies(), (string) $obj->getBuildYear(),
            (string) $obj->getNumeroPiso(), (int) $obj->getChimenea(),
            (int) $obj->getEstudio(), (int) $obj->getDeposito(),
            (int) $obj->getZonaRopas(), (int) $obj->getParqueaderoVisitante(),
            (int) $obj->getAscensor(), (int) $obj->getTerraza(),
            (int) $obj->getTransportePublicoCercano(), (int) $obj->getSalonComunal(),
            (int) $obj->getSauna(), (int) $obj->getTurco(),
            (int) $obj->getJacuzzi(), (int) $obj->getZonaInfantil(),
            (int) $obj->getJardines(), (int) $obj->getDuplex(),
            (int) $obj->getPuertaSeguridad(), (int) $obj->getGimnasio(),
            (int) $obj->getPrecioNegociable(), (int) $obj->getPiscina(),
            (int) $obj->getZonaMascotas(), (int) $obj->getParqueaderoCubierto(),
            (int) $obj->getAmoblado(), (int) $obj->getCity(),
            (int) $obj->getBarrio(), (int) $obj->getEstrato(),
            (int) $obj->getPropertieType(), (int) $obj->getOfferType(),
            (int) $obj->getCurtainType(), (int) $obj->getVigilanceType(),
            (int) $obj->getZone(), (int) $obj->getViewType(),
            (int) $obj->getStatus(), (int) $obj->getKitchenType(),
            (int) $obj->getKitchenStructure(), (int) $obj->getFloorType(),
            (int) $obj->getClient(), (string) $obj->getPublicationDate(),
            (string) $obj->getReceptionDate(), (int) $obj->getOutstandingType(),
            (string) $obj->getLinderos(), (string) $obj->getMatriculaInmobiliaria(),
            (float) $obj->getAvaluoCatastral(), (string) $obj->getLatitude(),
            (string) $obj->getLongitude(), (string) implode(",", $obj->getImages()) . ',',
            (string) $obj->getUrlVideos() . ','
        ));

        //echo $query;

        $this->repository->ExecuteTransaction($query);
    }

    /**
     * Ejecuta un listar en la base de datos
     * @param PropertieDTO $obj
     * @param intean $type indica si se quiere filtro o no 
     * @return void      
     * @author Johnny Alexander Salazar
     * @version 0.1
     */
    public function ListAll(PropertieDTO $obj) {
        $query = $this->repository->buildQuery("listpropertie", array((int) $obj->getIdUser()));
        $this->repository->BuildPaginatorDataTable($query, '');
    }

    /**
     * Ejecuta un buscar en la base de datos
     * @param PropertieDTO $obj 
     * @return void      
     * @author Johnny Alexander Salazar
     * @version 0.1
     */
    public function Search(PropertieDTO $obj) {
        $query = $this->repository->buildQuery("searchpropertie", array((int) $obj->getId()));
        $this->repository->Execute($query);
    }

    /**
     * Ejecuta un actualizar en la base de datos
     * @param PropertieDTO $obj 
     * @return void      
     * @author Johnny Alexander Salazar
     * @version 0.1
     */
    public function Update(PropertieDTO $obj) {
        $query = $this->repository->buildQuerySimply("updatepropertie", array((int) $obj->getId(),
            (float) $obj->getPrecio(), (float) $obj->getAdministrationCost(),
            (int) $obj->getRoom(), (int) $obj->getBath(),
            (int) $obj->getParking(), (float) $obj->getTotalArea(),
            (float) $obj->getAreasWithoutBalconies(), (string) $obj->getBuildYear(),
            (string) $obj->getNumeroPiso(), (int) $obj->getChimenea(),
            (int) $obj->getEstudio(), (int) $obj->getDeposito(),
            (int) $obj->getZonaRopas(), (int) $obj->getParqueaderoVisitante(),
            (int) $obj->getAscensor(), (int) $obj->getTerraza(),
            (int) $obj->getTransportePublicoCercano(), (int) $obj->getSalonComunal(),
            (int) $obj->getSauna(), (int) $obj->getTurco(),
            (int) $obj->getJacuzzi(), (int) $obj->getZonaInfantil(),
            (int) $obj->getJardines(), (int) $obj->getDuplex(),
            (int) $obj->getPuertaSeguridad(), (int) $obj->getGimnasio(),
            (int) $obj->getPrecioNegociable(), (int) $obj->getPiscina(),
            (int) $obj->getZonaMascotas(), (int) $obj->getParqueaderoCubierto(),
            (int) $obj->getAmoblado(), (int) $obj->getCity(),
            (int) $obj->getBarrio(), (int) $obj->getEstrato(),
            (int) $obj->getPropertieType(), (int) $obj->getOfferType(),
            (int) $obj->getCurtainType(), (int) $obj->getVigilanceType(),
            (int) $obj->getZone(), (int) $obj->getViewType(),
            (int) $obj->getStatus(), (int) $obj->getKitchenType(),
            (int) $obj->getKitchenStructure(), (int) $obj->getFloorType(),
            (int) $obj->getClient(), (string) $obj->getPublicationDate(),
            (string) $obj->getReceptionDate(), (int) $obj->getOutstandingType(),
            (string) $obj->getLinderos(), (string) $obj->getMatriculaInmobiliaria(),
            (float) $obj->getAvaluoCatastral(), (string) $obj->getLatitude(),
            (string) $obj->getLongitude(), (string) implode(",", $obj->getImages()) . ',',
            (string) $obj->getUrlVideos() . ','
        ));

        $this->repository->ExecuteTransaction($query);
    }

    /**
     * Ejecuta un borrar en la base de datos
     * @param PropertieDTO $obj 
     * @return void      
     * @author Johnny Alexander Salazar
     * @version 0.1
     */
    public function Delete(PropertieDTO $obj) {
        $query = $this->repository->buildQuerySimply("deletepropertie", array((int) $obj->getId()));
        $this->repository->ExecuteTransaction($query);
    }

    /**
     * Ejecuta un buscar en la base de datos, enfocado a la busqueda de los videos 
     * asociados
     * @param PropertieDTO $obj 
     * @return void      
     * @author Johnny Alexander Salazar
     * @version 0.1
     */
    public function LoadVideo(PropertieDTO $obj) {
        $query = $this->repository->buildQuery("listvideopropertie", array((int) $obj->getId()));
        $this->repository->Execute($query);
    }

    /**
     * Ejecuta un buscar en la base de datos, enfocado a la busqueda de las imagenes 
     * asociados
     * @param PropertieDTO $obj 
     * @return void      
     * @author Johnny Alexander Salazar
     * @version 0.1
     */
    public function LoadImage(PropertieDTO $obj) {
        $query = $this->repository->buildQuery("listimagepropertie", array((int) $obj->getId()));
        $this->repository->Execute($query);
    }

    /**
     * Ejecuta un listar en la base de datos, pero sin organizarlo en una tabla
     * @param PropertieDTO $obj
     * @param intean $type indica si se quiere filtro o no 
     * @return void      
     * @author Johnny Alexander Salazar
     * @version 0.1
     */
    public function ListAllNoTable(PropertieDTO $obj) {
        $query = $this->repository->buildQuery("listpropertiepublic", array((int) $obj->getIdUser()));
        $this->repository->Execute($query);
    }

}
