DROP PROCEDURE IF EXISTS loadpropertietype;

DELIMITER //
CREATE PROCEDURE loadpropertietype (IN idfilter INT)
    COMMENT 'Procedimiento que carga los tipos de inmuebles'
BEGIN
 
	IF idfilter > -1 THEN
	
		select 	 idtipoInmueble  as id, nombreTipoInmueble  as nombre
		from  tiposinmuebles                    
		ORDER BY  nombreTipoInmueble;
		
        ELSE	
	
		select 	 idtipoInmueble  as id, nombreTipoInmueble  as nombre
		from  tiposinmuebles                
		ORDER BY  nombreTipoInmueble;
	
        END IF;
END//

DELIMITER ; 