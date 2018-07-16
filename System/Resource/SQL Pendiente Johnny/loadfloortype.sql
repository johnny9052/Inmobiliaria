DROP PROCEDURE IF EXISTS     loadfloortype;

DELIMITER //
CREATE PROCEDURE     loadfloortype (IN idfilter INT)
    COMMENT 'Procedimiento que carga los tipos  de piso'
BEGIN
 
	IF idfilter > -1 THEN
	
		select 	   idtipoPiso  as id,   nombreTipoPiso  as nombre
		from       tipospisos                    
		ORDER BY    nombreTipoPiso;
		
        ELSE	
	
		select 	   idtipoPiso  as id,   nombreTipoPiso  as nombre
		from       tipospisos                
		ORDER BY    nombreTipoPiso;
	
        END IF;
END//

DELIMITER ; 