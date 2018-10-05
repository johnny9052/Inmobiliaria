DROP PROCEDURE IF EXISTS loadareamaximainmueble;

DELIMITER //
CREATE PROCEDURE loadareamaximainmueble (IN idfilter INT)
    COMMENT 'Procedimiento que carga los tipos de cortinas'
BEGIN
 
	IF idfilter > -1 THEN
	
		select MAX(inm.	areaTotal) as area
		from inmuebles as inm;	
		
        ELSE		
		select MAX(inm.	areaTotal) as area
		from inmuebles as inm;		
	
        END IF;
END//

DELIMITER ; 