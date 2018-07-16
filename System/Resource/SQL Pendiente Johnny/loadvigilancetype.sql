DROP PROCEDURE IF EXISTS loadvigilancetype;

DELIMITER //
CREATE PROCEDURE loadvigilancetype (IN idfilter INT)
    COMMENT 'Procedimiento que carga los tipos de vigilancia'
BEGIN
 
	IF idfilter > -1 THEN
	
		select 	         idtipoVigilancia  as id,         nombreTipoVigilancia  as nombre
		from          tiposvigilancias                    
		ORDER BY          nombreTipoVigilancia;
		
        ELSE	
	
		select 	         idtipoVigilancia  as id,         nombreTipoVigilancia  as nombre
		from          tiposvigilancias                
		ORDER BY          nombreTipoVigilancia;
	
        END IF;
END//

DELIMITER ; 