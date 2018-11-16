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
        $query = $this->repository->buildQuerySimply("savepropertie", array(
            (int) $obj->getId(),
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
            (string) $obj->getLongitude(),
            (string) $obj->getDireccionCarrera(), (string) $obj->getDireccionCalle(),
            (string) $obj->getDireccionNumero(), (string) $obj->getDireccionInformacionAdicional(),
            (string) implode(",", $obj->getImages()) . ',',
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
        $query = $this->repository->buildQuery("listpropertie", array((int) $obj->getIdfilter()));
        $this->repository->BuildPaginatorDataTable($query, '');
    }

    public function ListByUser(PropertieDTO $obj) {
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
            (float) $obj->getAvaluoCatastral(),
            (string) $obj->getLatitude(),
            (string) $obj->getLongitude(),
            (string) $obj->getDireccionCarrera(), (string) $obj->getDireccionCalle(),
            (string) $obj->getDireccionNumero(), (string) $obj->getDireccionInformacionAdicional(),
            (string) implode(",", $obj->getImages()) . ',',
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
        $query = $this->repository->buildQuery("listpropertiepublic", array(
            (int) $obj->getIdUser(),
            (int) $obj->getState(),
            (int) $obj->getAreaMax(),
            (int) $obj->getValorMax(),
            (int) $obj->getCity(),
            (int) $obj->getBarrio(),
            (int) $obj->getZone(),
            (int) $obj->getPropertieType(),
            (int) $obj->getOfferType(),
            (int) $obj->getEstrato(),
            (int) $obj->getAscensor(),
            (int) $obj->getPiscina(),
            (int) $obj->getRoom(),
            (int) $obj->getBath(),
            (int) $obj->getParking(),
            (string) $obj->getNombreCiudadBarrio()
        ));

        //echo $query;
        $this->repository->Execute($query);
    }

    /**
     * Ejecuta un listar en la base de datos que tiene una condicion fija y 
     * especifica en su implementacion, pero sin organizarlo en una tabla
     * @param PropertieDTO $obj     
     * @return void      
     * @author Johnny Alexander Salazar
     * @version 0.1
     */
    public function ListAllNoTableByFixedCondition(PropertieDTO $obj) {
        $query = $this->repository->buildQuery("listfeaturedpropertie", array(
            (int) $obj->getIdUser()
        ));

        //echo $query;
        $this->repository->Execute($query);
    }

    public function GeneratePDF(PropertieDTO $obj) {

        $query = $this->repository->buildQuery("searchpropertiepdf", array((int) $obj->getId()));

        //Longitud maxima de los caracteres del listado
        $max = 200;
        $cadenaHTML = "";
        /* Le asigno la consulta SQL a la conexion de la base de datos */
        $resultado = $this->repository->getObjCon()->getConnect()->prepare($query);
        /* Executo la consulta */
        $resultado->execute();

        /* Se meten los datos a un vector, organizados sus campos no por nombre, 
          si no enumarados */
        $vec = $resultado->fetchAll(PDO::FETCH_NUM);
        //echo $resultado->columnCount() . '----' . $resultado->rowCount();

        /* quedo pendiente mirar como saco todos los registros por un lado y 
         * los campos por el otro de ser necesario, para eso si se necesita 
         * sacar una copia de resultado despues del execute pues se hace.
         */

        if ($resultado->rowCount() > 0) {

            $cadenaHTML .= "<table style='width:100%;'>  
                              <tr>
                                  <td class='titulo' style='width:100%;'>
                                     " . $vec[0][56] . "
                                  </td>
                              </tr>
                              <tr>
                                  <td>
                                    <hr>
                                  </td>
                              </tr>
                              <tr>
                                  <td class='imgPropertie'>
                                    <img class='imgPropertie' src='../../../" . $vec[0][68] . "'>
                                  </td>
                              </tr>                              

                              <tr>
                                  <td>
                                    <br>
                                  </td>
                              </tr>
                            
                              <tr>
                                  <td class='subtitulo'>
                                    Descripcion
                                  </td>
                              </tr>
                              <tr>
                                  <td>
                                    <br>
                                  </td>
                              </tr>
                              <tr>
                                  <td>
                                    " . $vec[0][46] . "
                                  </td>
                              </tr>
                            </table>
                            <br>";



            /*
              0  inm.idinmueble as id,
              1  inm.precio as precio,
              2  inm.costoAdministracion as costo_administracion,
              3  inm.habitaciones as habitaciones,
              4  inm.banos as banios,
              5  inm.parqueaderos as parqueaderos,
              6  inm.areaTotal as area_total,
              7  inm.areaSinBalcones as area_sin_balcones,
              8  inm.anoDeConstruccion as anio_de_construccion,
              9  inm.numeroPiso as numero_piso,
              10 inm.chimenea as chimenea,
              11 inm.estudio as estudio,
              12 inm.deposito as deposito,
              13 inm.zonaRopas as zona_ropas,
              14 inm.parqueaderoVisitante as parqueadero_visitantes,
              15 inm.ascensor as ascensor,
              16 inm.terraza as terraza,
              17 inm.transportePublicoCercano as transporte_publico_cercano,
              18 inm.precioNegociable as precio_negociable,
              19 inm.latitud as latitud,
              20 inm.longitud as longitud,

              21 inm.salonComunal as salon_comunal,
              22 inm.sauna as sauna,
              23 inm.turco as turco,
              24 inm.jacuzzi as jacuzzi,
              25 inm.zonaInfantil as zona_infantil,
              26 inm.jardines as jardines,
              27 inm.duplex as duplex,
              28 inm.puertaDeSeguridad as puerta_de_seguridad,
              29 inm.gimnasio as gimnasio,

              30 inm.ciudades_idciudad as id_ciudad,
              31 inm.estratos_idestrato as id_estrato,
              32 inm.tiposInmuebles_idtipoInmueble as id_tipo_inmueble,
              33 inm.tiposOfertas_idtipoOferta as id_tipo_oferta,
              34 inm.tiposCortinas_idtipoCortina as id_tipo_cortina,
              35 inm.tiposVigilancias_idtipoVigilancia as id_tipo_vigilancia,
              36 inm.zonas_idzona as id_zona,
              37 inm.tiposVistas_idtipoVista as id_tipo_vista,
              38 inm.barrios_idbarrio as id_barrio,
              39 inm.tiposCocinas_idtipoCocina as id_tipo_cocina,
              40 inm.estructurasCocinas_idestructuraCocina as id_estructura_cocina,
              41 inm.tiposPisos_idtipoPiso as id_tipo_piso,
              42 inm.clientes_cedulaCliente as cedula_cliente,
              43 inm.fechaPublicación as fecha_publicacion,
              44 inm.fechaRecepcion as fecha_recepcion,
              45 inm.tiposDestacados_idtipoDestacado as id_tipo_destacado,
              46 inm.linderosInmueble as linderos_inmbueble,
              47 inm.matriculaInmobiliaria as matricula_inmobiliaria,
              48 inm.avaluoCatastral as avaluo_catastral,
              49 inm.piscina as piscina,

              50 inm.zonaMascotas as zona_mascotas,
              51 inm.parqueaderoCubierto as parqueadero_cubierto,
              52 inm.amoblado as amoblado,

              53 ciu.`Departamentos_idDepartamento` as id_departamento,
              54 dep.`nombreDepartamento` as nombre_departamento,
              55 ciu.`nombreCiudad` as nombre_ciudad,
              56 bar.`nombreBarrio` as nombre_barrio,
              57 estr.`nombreEstrato` as nombre_estrato,
              58 tipinm.`nombreTipoInmueble` as nombre_tipo_inmueble,
              59 tipofer.`nombreTipoOferta` as nombre_tipo_oferta,
              60 tipcort.`nombreTipoCortina` as nombre_tipo_cortina,
              61 tipvig.`nombreTipoVigilancia` as nombre_tipo_vigilancia,
              62 zon.`nombreZona` as nombre_zona,
              63 tipvist.`nombreTipoVista` as nombre_tipo_vista,
              64 tipcoc.`nombreTipoCocina` as nombre_tipo_cocina,
              65 estcoc.`nombreEstructuraCocina` as nombre_estructura_cocina,
              66 tipis.`nombreTipoPiso` as nombre_tipo_piso,
              67 tipdest.`nombreDestacado` as nombre_tipo_destacado
              68 loadimagepropertie(inm.idinmueble) as imagen
             * */

            $cadenaHTML .= "<table style='width:100%;'>";
            $cadenaHTML .= $this->generateCharacteristicGeneric("Codigo", $vec[0][47]);
            $cadenaHTML .= $this->generateCharacteristicGeneric("Precio", '$ ' . $vec[0][1]);
            $cadenaHTML .= $this->generateCharacteristicGeneric("Costo administracion", '$ ' . $vec[0][2]);
            $cadenaHTML .= $this->generateCharacteristicGeneric("Habitaciones", $vec[0][3]);
            $cadenaHTML .= $this->generateCharacteristicGeneric("Baños", $vec[0][4]);
            $cadenaHTML .= $this->generateCharacteristicGeneric("Parqueaderos", $vec[0][5]);
            $cadenaHTML .= $this->generateCharacteristicGeneric("Area total", $vec[0][6] . " mts 2");
            $cadenaHTML .= $this->generateCharacteristicGeneric("Area sin balcones", $vec[0][7] . " mts 2");
            $cadenaHTML .= $this->generateCharacteristicGeneric("Año de construccion", $vec[0][8]);
            $cadenaHTML .= $this->generateCharacteristicGeneric("Departamento", $vec[0][54]);
            $cadenaHTML .= $this->generateCharacteristicGeneric("Ciudad", $vec[0][55]);
            $cadenaHTML .= $this->generateCharacteristicGeneric("Estrato", $vec[0][57]);
            $cadenaHTML .= $this->generateCharacteristicGeneric("Tipo inmueble", $vec[0][58]);
            $cadenaHTML .= $this->generateCharacteristicGeneric("Tipo oferta", $vec[0][59]);
            $cadenaHTML .= $this->generateCharacteristicGeneric("Tipo cortina", $vec[0][60]);
            $cadenaHTML .= $this->generateCharacteristicGeneric("Tipo vigilancia", $vec[0][61]);
            $cadenaHTML .= $this->generateCharacteristicGeneric("Zona", $vec[0][62]);
            $cadenaHTML .= $this->generateCharacteristicGeneric("Tipo vista", $vec[0][63]);
            $cadenaHTML .= $this->generateCharacteristicGeneric("Tipo cocina", $vec[0][64]);
            $cadenaHTML .= $this->generateCharacteristicGeneric("Estructura cocina", $vec[0][65]);
            $cadenaHTML .= $this->generateCharacteristicGeneric("Tipo piso", $vec[0][66]);
            $cadenaHTML .= $this->generateCharacteristicGeneric("Fecha publicacion", $vec[0][43]);
            $cadenaHTML .= "</table>";


            $cadenaHTML .= "<table style='width:100%;'>";
            $cadenaHTML .= " <tr>
                                  <td class='subtitulo'>
                                    Caracteristicas adicionales
                                  </td>
                              </tr>";
            $cadenaHTML .= "<tr>
                                <td>
                                    <hr>
                                </td>
                            </tr>";
            $cadenaHTML .= "</table>";

            $cadenaHTML .= "<table style='width:100%;'>";
            $cadenaHTML .= $this->generateCharacteristicGeneric("Chimenea", ($vec[0][10] === '1') ? 'Si' : 'No');
            $cadenaHTML .= $this->generateCharacteristicGeneric("Estudio", ($vec[0][11] === '1') ? 'Si' : 'No');
            $cadenaHTML .= $this->generateCharacteristicGeneric("Deposito", ($vec[0][12] === '1') ? 'Si' : 'No');
            $cadenaHTML .= $this->generateCharacteristicGeneric("Zona de ropas", ($vec[0][13] === '1') ? 'Si' : 'No');
            $cadenaHTML .= $this->generateCharacteristicGeneric("Parq. visitantes", ($vec[0][14] === '1') ? 'Si' : 'No');
            $cadenaHTML .= $this->generateCharacteristicGeneric("Ascensor", ($vec[0][15] === '1') ? 'Si' : 'No');
            $cadenaHTML .= $this->generateCharacteristicGeneric("Terraza", ($vec[0][16] === '1') ? 'Si' : 'No');
            $cadenaHTML .= $this->generateCharacteristicGeneric("Transp. publico cercano", ($vec[0][17] === '1') ? 'Si' : 'No');

            $cadenaHTML .= $this->generateCharacteristicGeneric("Salon comunal", ($vec[0][21] === '1') ? 'Si' : 'No');
            $cadenaHTML .= $this->generateCharacteristicGeneric("Sauna", ($vec[0][22] === '1') ? 'Si' : 'No');
            $cadenaHTML .= $this->generateCharacteristicGeneric("Turco", ($vec[0][23] === '1') ? 'Si' : 'No');
            $cadenaHTML .= $this->generateCharacteristicGeneric("Jacuzzi", ($vec[0][24] === '1') ? 'Si' : 'No');
            $cadenaHTML .= $this->generateCharacteristicGeneric("Zona infantil", ($vec[0][25] === '1') ? 'Si' : 'No');
            $cadenaHTML .= $this->generateCharacteristicGeneric("Jardines", ($vec[0][26] === '1') ? 'Si' : 'No');
            $cadenaHTML .= $this->generateCharacteristicGeneric("Duplex", ($vec[0][27] === '1') ? 'Si' : 'No');
            $cadenaHTML .= $this->generateCharacteristicGeneric("Puerta seguridad", ($vec[0][28] === '1') ? 'Si' : 'No');
            $cadenaHTML .= $this->generateCharacteristicGeneric("Gimnacion", ($vec[0][29] === '1') ? 'Si' : 'No');

            $cadenaHTML .= $this->generateCharacteristicGeneric("Precio negociable", ($vec[0][18] === '1') ? 'Si' : 'No');

            $cadenaHTML .= $this->generateCharacteristicGeneric("Zona mascotas", ($vec[0][50] === '1') ? 'Si' : 'No');
            $cadenaHTML .= $this->generateCharacteristicGeneric("Parqueadero cubierto", ($vec[0][51] === '1') ? 'Si' : 'No');
            $cadenaHTML .= $this->generateCharacteristicGeneric("Amoblado", ($vec[0][52] === '1') ? 'Si' : 'No');

            $cadenaHTML .= "</table>";
        } else {
            $cadenaHTML = "<label>No hay registros en la base de datos</label>";
        }



        $this->repository->BuildPDF($cadenaHTML, $vec[0][1]);
    }

    public function generateCharacteristicGeneric($title, $value) {
        return "<tr>
                    <td style='width:10%;'>
                    
                    </td>
                    <td style='width:20%;'>
                        <label class='minisubtitulo'>" . $title . "</label>
                    </td>
                    <td style='width:70%;'>
                        " . $value . "
                    </td>                    
                </tr>
                <tr>
                    <td>
                        <br>
                    </td>
                </tr>";
    }

    public function ReportCSVList(PropertieDTO $obj) {
        $query = $this->repository->buildQuery("listpropertiecsv", array((int) $obj->getId()));
        $this->repository->BuildReportCSV($query, 'lista de inmuebles');
    }

    public function ReportCSVListByUser(PropertieDTO $obj) {
        $query = $this->repository->buildQuery("listpropertiecsv", array((int) $obj->getIdUser()));
        $this->repository->BuildReportCSV($query, 'lista de inmuebles');
    }

    public function GeneratePDFList(PropertieDTO $obj) {

        $query = $this->repository->buildQuery("listpropertie", array((int) $obj->getId()));

        //Longitud maxima de los caracteres del listado
        $max = 200;
        $cadenaHTML = "";
        /* Le asigno la consulta SQL a la conexion de la base de datos */
        $resultado = $this->repository->getObjCon()->getConnect()->prepare($query);
        /* Executo la consulta */
        $resultado->execute();

        /* Se meten los datos a un vector, organizados sus campos no por nombre, 
          si no enumarados */
        $vec = $resultado->fetchAll(PDO::FETCH_NUM);
        //echo $resultado->columnCount() . '----' . $resultado->rowCount();

        /* quedo pendiente mirar como saco todos los registros por un lado y 
         * los campos por el otro de ser necesario, para eso si se necesita 
         * sacar una copia de resultado despues del execute pues se hace.
         */

        if ($resultado->rowCount() > 0) {

            $cadenaHTML .= "<table class='titulo' style='width:100%;'>  
                              <tr>
                                  <td style='width:100%;'>
                                     Listado de inmuebles registrados
                                  </td>
                              </tr>
                              <tr>
                                  <td>
                                    <hr>
                                  </td>
                              </tr>
                            </table>
                            <br>";


            $cadenaHTML .= "<table id='customers' style='width:100%;'>";

            $cadenaHTML .= "<tr>";
            $cadenaHTML .= "<th style='width:14%;'>Matricula</th>";
            $cadenaHTML .= "<th style='width:14%;'>Tipo</th>";
            $cadenaHTML .= "<th style='width:14%;'>Oferta</th>";
            $cadenaHTML .= "<th style='width:14%;'>Precio</th>";
            $cadenaHTML .= "<th style='width:14%;'>Ciudad</th>";
            $cadenaHTML .= "<th style='width:14%;'>Zona</th>";
            $cadenaHTML .= "<th style='width:14%;'>Fecha</th>";
            $cadenaHTML .= "</tr>";

            for ($cont = 0; $cont < $resultado->rowCount(); $cont++) {
                $cadenaHTML .= "<tr>";
                $cadenaHTML .= "<td style='width:14%;'>" . $vec[$cont][1] . "</td>";
                $cadenaHTML .= "<td style='width:14%;'>" . $vec[$cont][2] . "</td>";
                $cadenaHTML .= "<td style='width:14%;'>" . $vec[$cont][3] . "</td>";
                $cadenaHTML .= "<td style='width:14%;'>" . $vec[$cont][4] . "</td>";
                $cadenaHTML .= "<td style='width:14%;'>" . $vec[$cont][5] . "</td>";
                $cadenaHTML .= "<td style='width:14%;'>" . $vec[$cont][6] . "</td>";
                $cadenaHTML .= "<td style='width:14%;'>" . $vec[$cont][7] . "</td>";
                $cadenaHTML .= "</tr>";
            }
            $cadenaHTML .= "</table>";
        } else {
            $cadenaHTML = "<label>No hay registros en la base de datos</label>";
        }

        $this->repository->BuildPDF($cadenaHTML, $vec[0][1]);
    }

    public function GeneratePDFListByUser(PropertieDTO $obj) {

        $query = $this->repository->buildQuery("listpropertie", array((int) $obj->getIdUser()));

        //Longitud maxima de los caracteres del listado
        $max = 200;
        $cadenaHTML = "";
        /* Le asigno la consulta SQL a la conexion de la base de datos */
        $resultado = $this->repository->getObjCon()->getConnect()->prepare($query);
        /* Executo la consulta */
        $resultado->execute();

        /* Se meten los datos a un vector, organizados sus campos no por nombre, 
          si no enumarados */
        $vec = $resultado->fetchAll(PDO::FETCH_NUM);
        //echo $resultado->columnCount() . '----' . $resultado->rowCount();

        /* quedo pendiente mirar como saco todos los registros por un lado y 
         * los campos por el otro de ser necesario, para eso si se necesita 
         * sacar una copia de resultado despues del execute pues se hace.
         */

        if ($resultado->rowCount() > 0) {

            $cadenaHTML .= "<table class='titulo' style='width:100%;'>  
                              <tr>
                                  <td style='width:100%;'>
                                     Listado de inmuebles registrados
                                  </td>
                              </tr>
                              <tr>
                                  <td>
                                    <hr>
                                  </td>
                              </tr>
                            </table>
                            <br>";


            $cadenaHTML .= "<table id='customers' style='width:100%;'>";

            $cadenaHTML .= "<tr>";
            $cadenaHTML .= "<th style='width:14%;'>Matricula</th>";
            $cadenaHTML .= "<th style='width:14%;'>Tipo</th>";
            $cadenaHTML .= "<th style='width:14%;'>Oferta</th>";
            $cadenaHTML .= "<th style='width:14%;'>Precio</th>";
            $cadenaHTML .= "<th style='width:14%;'>Ciudad</th>";
            $cadenaHTML .= "<th style='width:14%;'>Zona</th>";
            $cadenaHTML .= "<th style='width:14%;'>Fecha</th>";
            $cadenaHTML .= "</tr>";

            for ($cont = 0; $cont < $resultado->rowCount(); $cont++) {
                $cadenaHTML .= "<tr>";
                $cadenaHTML .= "<td style='width:14%;'>" . $vec[$cont][1] . "</td>";
                $cadenaHTML .= "<td style='width:14%;'>" . $vec[$cont][2] . "</td>";
                $cadenaHTML .= "<td style='width:14%;'>" . $vec[$cont][3] . "</td>";
                $cadenaHTML .= "<td style='width:14%;'>" . $vec[$cont][4] . "</td>";
                $cadenaHTML .= "<td style='width:14%;'>" . $vec[$cont][5] . "</td>";
                $cadenaHTML .= "<td style='width:14%;'>" . $vec[$cont][6] . "</td>";
                $cadenaHTML .= "<td style='width:14%;'>" . $vec[$cont][7] . "</td>";
                $cadenaHTML .= "</tr>";
            }
            $cadenaHTML .= "</table>";
        } else {
            $cadenaHTML = "<label>No hay registros en la base de datos</label>";
        }

        $this->repository->BuildPDF($cadenaHTML, $vec[0][1]);
    }

    public function AuditPublic(PropertieDTO $obj) {
        $query = $this->repository->buildQuerySimply("savepropertieauditpublic", array(
            (string) $obj->getTokenUser(),
            (int) $obj->getId(),
            (string) $obj->getDia(),
            (string) $obj->getMes(),
            (string) $obj->getAnio(),
            (string) $obj->getHora(),
            (string) $obj->getIp(),
            (string) $obj->getDevice(),
            (string) $obj->getSistemaOperativo(),
            (string) $obj->getNavegador()
        ));

        //echo $query;

        $this->repository->ExecuteTransaction($query);
    }

    public function ListByData(PropertieDTO $obj) {
        $query = $this->repository->buildQuery("searchpropertiebyclient", array((int) $obj->getClient()));
        $this->repository->Execute($query);
    }

}
