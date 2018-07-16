DROP PROCEDURE IF EXISTS loadstratum;

DELIMITER //
CREATE PROCEDURE loadstratum (IN idfilter INT)
    COMMENT 'Procedimiento que carga los estratos'
BEGIN
 
	IF idfilter > -1 THEN
	
		select 	idestrato  as id,nombreEstrato  as nombre
		from estratos                    
		ORDER BY nombreEstrato;
		
        ELSE	
	
		select 	idestrato  as id,nombreEstrato  as nombre
		from estratos                
		ORDER BY nombreEstrato;
	
        END IF;
END//

DELIMITER ; 