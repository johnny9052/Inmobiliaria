
DROP PROCEDURE IF EXISTS listclient;


DELIMITER //
CREATE PROCEDURE listclient(iduser int)
COMMENT 'Procedimiento que lista los clientes'
BEGIN
   select cli.idCliente,cli.numeroIdentificacion as numero_identificacion, cli.primerNombreCliente as primer_nombre, 
          cli.segundoNombreCliente as segundo_nombre, cli.primerApellidoCliente as primer_apellido, 
          cli.segundoApellidoCliente as segundo_apellido,  
          tip.`nombreTipoPersonaCliente` as tipo_persona
   from clientes as cli inner join tipopersonacliente as tip 
   on cli.`tipoPersonaCliente_idtipoPersonCliente` = tip.`idtipoPersonCliente`
   order by primerApellidoCliente;
END//

DELIMITER ;