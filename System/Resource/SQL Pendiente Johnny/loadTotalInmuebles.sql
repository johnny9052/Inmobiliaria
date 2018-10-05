
DROP PROCEDURE IF EXISTS loadtotalinmuebles;

DELIMITER //
CREATE PROCEDURE loadtotalinmuebles (IN idfilter INT)
    COMMENT 'Procedimiento que trae el total de inmuebles'
BEGIN
 
	IF idfilter > -1 THEN
	
		select count(*) as total
		from inmuebles as inm;	
		
        ELSE		
			select count(*) as total
		from inmuebles as inm;	
	
        END IF;
END//

DELIMITER ; 