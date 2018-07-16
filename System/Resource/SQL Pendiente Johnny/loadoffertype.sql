DROP PROCEDURE IF EXISTS loadoffertype;

DELIMITER //
CREATE PROCEDURE loadoffertype (IN idfilter INT)
    COMMENT 'Procedimiento que carga los tipos de oferta'
BEGIN
 
	IF idfilter > -1 THEN
	
		select 	    idtipoOferta  as id,    nombreTipoOferta  as nombre
		from     tiposofertas                    
		ORDER BY     nombreTipoOferta;
		
        ELSE	
	
		select 	    idtipoOferta  as id,    nombreTipoOferta  as nombre
		from     tiposofertas                
		ORDER BY     nombreTipoOferta;
	
        END IF;
END//

DELIMITER ; 