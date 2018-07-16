DROP PROCEDURE IF EXISTS     loadkitchenstructure;

DELIMITER //
CREATE PROCEDURE     loadkitchenstructure (IN idfilter INT)
    COMMENT 'Procedimiento que carga las estructuras  de cocinas'
BEGIN
 
	IF idfilter > -1 THEN
	
		select 	  idestructuraCocina  as id,  nombreEstructuraCocina  as nombre
		from      estructurascocinas                    
		ORDER BY   nombreEstructuraCocina;
		
        ELSE	
	
		select 	  idestructuraCocina  as id,  nombreEstructuraCocina  as nombre
		from      estructurascocinas                
		ORDER BY   nombreEstructuraCocina;
	
        END IF;
END//

DELIMITER ; 