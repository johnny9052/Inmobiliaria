
DROP PROCEDURE IF EXISTS loadtotalclientes;

DELIMITER //
CREATE PROCEDURE loadtotalclientes (IN idfilter INT)
    COMMENT 'Procedimiento que trae el total de clientes'
BEGIN
 
	IF idfilter > -1 THEN

		select count(*) as total
		from clientes as cli;	
		
        ELSE		
		select count(*) as total
		from clientes as cli;
	
        END IF;
END//

DELIMITER ; 