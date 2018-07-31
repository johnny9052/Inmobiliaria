DROP PROCEDURE IF EXISTS savepropertie;


DELIMITER //
CREATE FUNCTION savepropertie (vid INT, 
                               vPrecio float, 
                               vAdministrationCost float, 
                               vRoom int, 
                               vBath int, 
                               vParking INT, 
                               vTotalArea float, 
                               vAreasWithoutBalconies float, 
                               vBuildYear VARCHAR(4), 
                               vNumeroPiso VARCHAR(3), 
                               vChimenea tinyint, 
                               vEstudio tinyint, 
                               vDeposito tinyint,
                               vZonaRopas tinyint ,
                               vParqueaderoVisitante tinyint ,
                               vAscensor tinyint ,
                               vTerraza tinyint ,
                               vTransportePublicoCercano tinyint,
                               vSalonComunal tinyint ,
                               vSauna tinyint ,
                               vTurco tinyint ,
                               vJacuzzi tinyint ,
                               vZonaInfantil tinyint ,
                               vJardines tinyint ,
                               vDuplex tinyint ,
                               vPuertaSeguridad tinyint ,
                               vGimnasio tinyint ,
                               vPrecioNegociable tinyint ,
                               vPiscina tinyint ,
                               vZonaMascotas tinyint ,
                               vParqueaderoCubierto tinyint ,
                               vAmoblado tinyint ,
                               vCity int ,
                               vBarrio int ,
                               vEstrato int ,
                               vPropertieType int ,
                               vOfferType int ,
                               vCurtainType int ,
                               vVigilanceType int ,
                               vZone int ,
                               vViewType int ,
                               vStatus int ,
                               vKitchenType int ,
                               vKitchenStructure int ,
                               vFloorType int ,
                               vClient int ,
                               vPublicationDate varchar(50) ,
                               vReceptionDate varchar(50) ,
                               vOutstandingType int,
                               vLinderos varchar(200),
                               vMatriculaInmobiliaria varchar(45) ,
                               vAvaluoCatastral float,
                               vLatitude varchar(45) ,
                               vLongitude varchar(45), 
                               vImages varchar(2000),
                               vVideos varchar(2000)
                               ) RETURNS int(1)
    READS SQL DATA
    DETERMINISTIC
    COMMENT 'Funcion que almacena un inmueble'
BEGIN 
    DECLARE res INT DEFAULT 0;     
     
IF NOT EXISTS(select 1 from inmuebles where matriculaInmobiliaria=vMatriculaInmobiliaria)
		THEN
			insert into inmuebles(                                                                        
                                    precio,
                                    costoAdministracion,
                                    habitaciones,
                                    banos,
                                    parqueaderos,
                                    areaTotal ,
                                    areaSinBalcones ,
                                    anoDeConstruccion ,
                                    numeroPiso ,
                                    chimenea ,
                                    estudio ,
                                    deposito ,
                                    zonaRopas ,
                                    parqueaderoVisitante ,
                                    ascensor ,
                                    terraza ,
                                    transportePublicoCercano ,
                                    precioNegociable ,                                  
                                    piscina ,
                                    zonaMascotas ,
                                    parqueaderoCubierto ,
                                    amoblado,
                                    salonComunal ,
                                    sauna ,
                                    turco ,
                                    jacuzzi ,
                                    zonaInfantil ,
                                    jardines ,
                                    duplex ,
                                    puertaDeSeguridad ,
                                    gimnasio ,
                                    ciudades_idciudad ,
                                    estratos_idestrato ,
                                    barrios_idbarrio ,
                                    tiposInmuebles_idtipoInmueble ,
                                    tiposOfertas_idtipoOferta ,
                                    tiposCortinas_idtipoCortina ,
                                    tiposVigilancias_idtipoVigilancia ,
                                    zonas_idzona ,
                                    tiposVistas_idtipoVista ,                                    
                                    estado_idestado ,
                                    tiposCocinas_idtipoCocina ,
                                    estructurasCocinas_idestructuraCocina ,
                                    tiposPisos_idtipoPiso ,
                                    clientes_cedulaCliente ,
                                    fechaPublicación ,
                                    fechaRecepcion ,
                                    tiposDestacados_idtipoDestacado ,
                                    linderosInmueble ,
                                    matriculaInmobiliaria ,
                                    avaluoCatastral,
                                    latitud,
                                    longitud
                                   )
                        VALUES (
                               vPrecio , 
                               vAdministrationCost , 
                               vRoom , 
                               vBath , 
                               vParking , 
                               vTotalArea , 
                               vAreasWithoutBalconies , 
                               vBuildYear , 
                               vNumeroPiso , 
                               vChimenea , 
                               vEstudio , 
                               vDeposito ,
                               vZonaRopas  ,
                               vParqueaderoVisitante  ,
                               vAscensor  ,
                               vTerraza  ,
                               vTransportePublicoCercano ,
                               vPrecioNegociable  ,                                
                               vPiscina  ,
                               vZonaMascotas  ,
                               vParqueaderoCubierto  ,
                               vAmoblado  ,
                               vSalonComunal  ,
                               vSauna  ,
                               vTurco  ,
                               vJacuzzi  ,
                               vZonaInfantil  ,
                               vJardines  ,
                               vDuplex  ,
                               vPuertaSeguridad  ,
                               vGimnasio  ,                                                              
                               vCity  ,
                               vEstrato  ,
                               vBarrio  ,                           
                               vPropertieType  ,
                               vOfferType  ,
                               vCurtainType  ,
                               vVigilanceType  ,
                               vZone  ,
                               vViewType  ,
                               vStatus  ,
                               vKitchenType  ,
                               vKitchenStructure  ,
                               vFloorType  ,
                               vClient  ,
                               vPublicationDate  ,
                               vReceptionDate  ,
                               vOutstandingType ,
                               vLinderos ,
                               vMatriculaInmobiliaria ,
                               vAvaluoCatastral, 
                               vLatitude,
                               vLongitude);


    SET @vidPropertie = LAST_INSERT_ID();	

  
    WHILE (LOCATE(',', vImages) > 0) DO
      /*Se saca el primer campo separado por coma del varchar*/
      SET @V_DESIGNATION = SUBSTRING(vImages,1, LOCATE(',',vImages)-1); 
      /*call log_msg(CONCAT('PARTICIONADO********',@V_DESIGNATION));*/
      /*Se elimina ese primer valor y se reemplaza en la cadena*/
      SET vImages = SUBSTRING(vImages, LOCATE(',',vImages) + 1); 
      /*call log_msg(CONCAT('PRUEBA********',vImages));*/
      /*call log_msg(CONCAT('VAMOS A INSERTAR********',@V_DESIGNATION,'-------',@vidPropertie));*/
      
       /*Se almacena en la tabla, siempre y cuando tenga un dato para almacenar*/
       IF @V_DESIGNATION <> ',' THEN	
    		INSERT INTO imagenInmueble(rutaImagen, idInmueble) 
                VALUES (CONVERT(@V_DESIGNATION,CHAR(200)),@vidPropertie);
	END IF;
    END WHILE;



    WHILE (LOCATE(',', vVideos) > 0) DO
      /*Se saca el primer campo separado por coma del varchar*/
      SET @V_DESIGNATION = SUBSTRING(vVideos,1, LOCATE(',',vVideos)-1); 
      /*call log_msg(CONCAT('PARTICIONADO********',@V_DESIGNATION));*/
      /*Se elimina ese primer valor y se reemplaza en la cadena*/
      SET vVideos = SUBSTRING(vVideos, LOCATE(',',vVideos) + 1); 
      /*call log_msg(CONCAT('PRUEBA********',vVideos));*/
      /*call log_msg(CONCAT('VAMOS A INSERTAR********',@V_DESIGNATION,'-------',@vidPropertie));*/
      
       /*Se almacena en la tabla, siempre y cuando tenga un dato para almacenar*/
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