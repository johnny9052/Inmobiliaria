DELIMITER //
CREATE PROCEDURE listclient(iduser int)
COMMENT 'Procedimiento que lista los clientes'
BEGIN
   select id,numeroIdentificacion as numero_identificacion, primerNombreCliente as primer_nombre, 
          segundoNombreCliente as segundo_nombre, primerApellidoCliente as primer_apellido, 
          segundoApellidoCliente as segundo_apellido,  
          tipoPersonaCliente_idtipoPersonCliente as tipo_cliente
   from clientes
   order by primerApellidoCliente;
END//

DELIMITER ;