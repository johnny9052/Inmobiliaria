DROP PROCEDURE IF EXISTS      loadoutstandingtype;

DELIMITER //
CREATE PROCEDURE      loadoutstandingtype (IN idfilter INT)
    COMMENT 'Procedimiento que carga los tipos  de destacados'
BEGIN
 
	IF idfilter > -1 THEN
	
		select 	    idtipoDestacado  as id,    nombreDestacado  as nombre
		from        tiposdestacados                    
		ORDER BY     nombreDestacado;
		
        ELSE	
	
		select 	    idtipoDestacado  as id,    nombreDestacado  as nombre
		from        tiposdestacados                
		ORDER BY     nombreDestacado;
	
        END IF;
END//

DELIMITER ; 