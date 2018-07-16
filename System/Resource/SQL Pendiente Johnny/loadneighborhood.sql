DROP PROCEDURE IF EXISTS loadneighborhood;

DELIMITER //
CREATE PROCEDURE loadneighborhood (IN idfilter INT)
    COMMENT 'Procedimiento que carga los barrios'
BEGIN
 
	IF idfilter > -1 THEN
	
		select 	idbarrio  as id,nombreBarrio  as nombre
		from barrios       
                where idCiudad = idfilter
		ORDER BY nombreBarrio;
		
        ELSE	
	
		select 	idbarrio  as id,nombreBarrio  as nombre
		from barrios                
		ORDER BY nombreBarrio;
	
        END IF;
END//

DELIMITER ; 