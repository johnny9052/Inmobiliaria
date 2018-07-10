DROP PROCEDURE IF EXISTS loadgender;

DELIMITER //
CREATE PROCEDURE loadgender (IN idfilter INT)
    COMMENT 'Procedimiento que carga los generos'
BEGIN
 
	IF idfilter > -1 THEN
	
		select 	idGenero as id,nombreGenero as nombre
		from generos                
		ORDER BY nombreGenero;
		
        ELSE	
	
		select 	idGenero as id,nombreGenero as nombre
		from generos                       
		ORDER BY nombreGenero;
	
        END IF;
END//

DELIMITER ; 