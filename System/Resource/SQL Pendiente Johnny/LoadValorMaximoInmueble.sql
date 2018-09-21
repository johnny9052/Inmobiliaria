DROP PROCEDURE IF EXISTS loadpreciomaximoinmueble;

DELIMITER //
CREATE PROCEDURE loadpreciomaximoinmueble (IN idfilter INT)
    COMMENT 'Procedimiento que carga los tipos de cortinas'
BEGIN
 
	IF idfilter > -1 THEN
	
		select MAX(inm.precio) as precio
		from inmuebles as inm;	
		
        ELSE		
		select MAX(inm.precio) as precio
		from inmuebles as inm;		
	
        END IF;
END//

DELIMITER ; 