DROP PROCEDURE IF EXISTS loadclienttypeselected;

DELIMITER //
CREATE PROCEDURE loadclienttypeselected (IN idfilter INT)
    COMMENT 'Procedimiento que carga los tipos de cliente seleccionados previamente'
BEGIN
 
	IF idfilter > -1 THEN
	
		select tiposClientes_idtipoCliente as id
		from detalleclientestipoclientes       
		where clientes_cedulaCliente = idfilter;
		
        ELSE	
	
		select tiposClientes_idtipoCliente as id
		from detalleclientestipoclientes;
	
        END IF;
END//

DELIMITER ; 