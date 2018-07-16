DROP PROCEDURE IF EXISTS loadcurtaintype;

DELIMITER //
CREATE PROCEDURE loadcurtaintype (IN idfilter INT)
    COMMENT 'Procedimiento que carga los tipos de cortinas'
BEGIN
 
	IF idfilter > -1 THEN
	
		select 	        idtipoCortina  as id,        nombreTipoCortina  as nombre
		from         tiposcortinas                    
		ORDER BY         nombreTipoCortina;
		
        ELSE	
	
		select 	        idtipoCortina  as id,        nombreTipoCortina  as nombre
		from         tiposcortinas                
		ORDER BY         nombreTipoCortina;
	
        END IF;
END//

DELIMITER ; 