DROP FUNCTION IF EXISTS updatepropertie;


DELIMITER //
CREATE FUNCTION updatepropertie (`vid` INT, `vPrecio` FLOAT, `vAdministrationCost` FLOAT, `vRoom` INT, `vBath` INT, `vParking` INT, `vTotalArea` FLOAT, `vAreasWithoutBalconies` FLOAT, `vBuildYear` VARCHAR(4), `vNumeroPiso` VARCHAR(3), `vChimenea` TINYINT, `vEstudio` TINYINT, `vDeposito` TINYINT, `vZonaRopas` TINYINT, `vParqueaderoVisitante` TINYINT, `vAscensor` TINYINT, `vTerraza` TINYINT, `vTransportePublicoCercano` TINYINT, `vSalonComunal` TINYINT, `vSauna` TINYINT, `vTurco` TINYINT, `vJacuzzi` TINYINT, `vZonaInfantil` TINYINT, `vJardines` TINYINT, `vDuplex` TINYINT, `vPuertaSeguridad` TINYINT, `vGimnasio` TINYINT, `vPrecioNegociable` TINYINT, `vPiscina` TINYINT, `vZonaMascotas` TINYINT, `vParqueaderoCubierto` TINYINT, `vAmoblado` TINYINT, `vCity` INT, `vBarrio` INT, `vEstrato` INT, `vPropertieType` INT, `vOfferType` INT, `vCurtainType` INT, `vVigilanceType` INT, `vZone` INT, `vViewType` INT, `vStatus` INT, `vKitchenType` INT, `vKitchenStructure` INT, `vFloorType` INT, `vClient` INT, `vPublicationDate` VARCHAR(50), `vReceptionDate` VARCHAR(50), `vOutstandingType` INT, `vLinderos` VARCHAR(200), `vMatriculaInmobiliaria` VARCHAR(45), `vAvaluoCatastral` FLOAT, `vLatitude` VARCHAR(45), `vLongitude` VARCHAR(45), `vImages` VARCHAR(2000), `vVideos` VARCHAR(2000)) RETURNS int(1)
    READS SQL DATA
    DETERMINISTIC
    COMMENT 'Funcion que almacena un inmueble'
BEGIN 
    DECLARE res INT DEFAULT 0;     
     
   
IF NOT EXISTS(select 1 from inmuebles where matriculaInmobiliaria=vMatriculaInmobiliaria and idinmueble<>vid)
		THEN
			update inmuebles set                                                                      
                                    precio = vPrecio,
                                    costoAdministracion = vAdministrationCost,
                                    habitaciones = vRoom,
                                    banos = vBath,
                                    parqueaderos = vParking,
                                    areaTotal = vTotalArea,
                                    areaSinBalcones = vAreasWithoutBalconies,
                                    anoDeConstruccion = vBuildYear,
                                    numeroPiso = vNumeroPiso,
                                    chimenea = vChimenea,
                                    estudio = vEstudio ,
                                    deposito = vDeposito,
                                    zonaRopas = vZonaRopas,
                                    parqueaderoVisitante = vParqueaderoVisitante,
                                    ascensor = vAscensor ,
                                    terraza = vTerraza,
                                    transportePublicoCercano = vTransportePublicoCercano ,
                                    precioNegociable = vPrecioNegociable,                                  
                                    piscina = vPiscina,
                                    zonaMascotas = vZonaMascotas ,
                                    parqueaderoCubierto = vParqueaderoCubierto,
                                    amoblado = vAmoblado,
                                    salonComunal = vSalonComunal,
                                    sauna = vSauna,
                                    turco = vTurco,
                                    jacuzzi = vJacuzzi,
                                    zonaInfantil = vZonaInfantil,
                                    jardines = vJardines,
                                    duplex = vDuplex,
                                    puertaDeSeguridad = vPuertaSeguridad,
                                    gimnasio = vGimnasio,
                                    ciudades_idciudad = vCity,
                                    estratos_idestrato = vEstrato,
                                    barrios_idbarrio = vBarrio,
                                    tiposInmuebles_idtipoInmueble = vPropertieType ,
                                    tiposOfertas_idtipoOferta = vOfferType,
                                    tiposCortinas_idtipoCortina = vCurtainType,
                                    tiposVigilancias_idtipoVigilancia = vVigilanceType ,
                                    zonas_idzona = vZone,
                                    tiposVistas_idtipoVista = vViewType ,                                    
                                    estado_idestado = vStatus ,
                                    tiposCocinas_idtipoCocina = vKitchenType,
                                    estructurasCocinas_idestructuraCocina = vKitchenStructure,
                                    tiposPisos_idtipoPiso = vFloorType,
                                    clientes_cedulaCliente = vClient,
                                    fechaPublicacion = vPublicationDate,
                                    fechaRecepcion = vReceptionDate,
                                    tiposDestacados_idtipoDestacado = vOutstandingType,
                                    linderosInmueble =vLinderos,
                                    matriculaInmobiliaria = vMatriculaInmobiliaria,
                                    avaluoCatastral = vAvaluoCatastral,
                                    latitud = vLatitude,
                                    longitud = vLongitude
                                   
                                where idinmueble=vid;


    SET @vidPropertie = vid;	
    
    delete from imagenInmueble where `idInmueble` = vid;
    
  
    WHILE (LOCATE(',', vImages) > 0) DO
            SET @V_DESIGNATION = SUBSTRING(vImages,1, LOCATE(',',vImages)-1); 
                  SET vImages = SUBSTRING(vImages, LOCATE(',',vImages) + 1); 
                  
              IF @V_DESIGNATION <> ',' THEN	
    		INSERT INTO imagenInmueble(rutaImagen, idInmueble) 
                VALUES (CONVERT(@V_DESIGNATION,CHAR(200)),@vidPropertie);
	END IF;
    END WHILE;


    delete from videoInmueble where idInmueble= vid;

    WHILE (LOCATE(',', vVideos) > 0) DO
            SET @V_DESIGNATION = SUBSTRING(vVideos,1, LOCATE(',',vVideos)-1); 
                  SET vVideos = SUBSTRING(vVideos, LOCATE(',',vVideos) + 1); 
                  
              IF @V_DESIGNATION <> ',' THEN	
    		INSERT INTO videoInmueble(rutaVideo, idInmueble) 
                VALUES (CONVERT(@V_DESIGNATION,CHAR(200)),@vidPropertie);
	END IF;
    END WHILE;
		          
				
    set res = 1;
			
												 				 
		END IF;

	RETURN res;
	
	

END//
DELIMITER ;