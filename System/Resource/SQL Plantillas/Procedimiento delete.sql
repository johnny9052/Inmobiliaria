DROP PROCEDURE IF EXISTS deleteclient;

DELIMITER //
CREATE FUNCTION deleteclient(vid INT) RETURNS INT( 1 ) 
COMMENT  'Funcion que elimina un cliente'
READS SQL DATA 
DETERMINISTIC 
BEGIN 
    DECLARE res INT DEFAULT 0;

    DELETE FROM detalleclientestipoclientes where `clientes_cedulaCliente` = vid;
    DELETE FROM clientes WHERE idCliente = vid;
    SET res = 1;
	RETURN res;
END//

DELIMITER ;