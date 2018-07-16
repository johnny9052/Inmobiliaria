DROP PROCEDURE IF EXISTS  loadzone;

DELIMITER //
CREATE PROCEDURE  loadzone (IN idfilter INT)
    COMMENT 'Procedimiento que carga las zonas'
BEGIN
 
	IF idfilter > -1 THEN
	
		select 	  idzona  as id,  nombreZona  as nombre
		from   zonas                    
		ORDER BY   nombreZona;
		
        ELSE	
	
		select 	  idzona  as id,  nombreZona  as nombre
		from   zonas                
		ORDER BY   nombreZona;
	
        END IF;
END//

DELIMITER ; 