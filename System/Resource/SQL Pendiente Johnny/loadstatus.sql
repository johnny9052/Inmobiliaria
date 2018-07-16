DROP PROCEDURE IF EXISTS   loadStatus;

DELIMITER //
CREATE PROCEDURE   loadStatus (IN idfilter INT)
    COMMENT 'Procedimiento que carga los estados'
BEGIN
 
	IF idfilter > -1 THEN
	
		select 	  idestado  as id,  nombreEstado  as nombre
		from   estados                    
		ORDER BY   nombreEstado;
		
        ELSE	
	
		select 	  idestado  as id,  nombreEstado  as nombre
		from   estados                
		ORDER BY   nombreEstado;
	
        END IF;
END//

DELIMITER ; 