DROP PROCEDURE IF EXISTS     loginPublic;

DELIMITER //
CREATE PROCEDURE   loginPublic (vemail VARCHAR(50),vpassword VARCHAR(50))
    COMMENT 'Procedimiento valida el infreso de un cliente en el portal web'
BEGIN
  select cli.`idCliente` as id, cli.`correoCliente` as email, CONCAT(cli.primerNombreCliente, ' ', 
        cli.primerApellidoCliente) as nombre
   from clientes as cli   
   where cli.password = vpassword and cli.`correoCliente` = vemail	;
END//
DELIMITER ; 