DROP PROCEDURE IF EXISTS loadpqrstype;

DELIMITER //
CREATE PROCEDURE loadpqrstype (IN idfilter INT)
    COMMENT 'Procedimiento que carga los tipos de cortinas'
BEGIN
 
	IF idfilter > -1 THEN
	
		select 	        idtipopqrs  as id,        nombretipopqrs  as nombre
		from         tipopqrs                    
		ORDER BY         nombretipopqrs;
		
        ELSE	
	
		select 	        idtipopqrs  as id,        nombretipopqrs  as nombre
		from         tipopqrs                
		ORDER BY         nombretipopqrs;
	
        END IF;
END//

DELIMITER ; 