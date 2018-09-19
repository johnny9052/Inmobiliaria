
DROP PROCEDURE IF EXISTS loadtotalarrendatarios;

DELIMITER //
CREATE PROCEDURE loadtotalarrendatarios (IN idfilter INT)
    COMMENT 'Procedimiento que trae el total de clientes'
BEGIN
 
	IF idfilter > -1 THEN

		select count(*) as total
		from contratos as con;	
		
        ELSE		
		select count(*) as total
		from contratos as con;	
	
        END IF;
END//

DELIMITER ; 