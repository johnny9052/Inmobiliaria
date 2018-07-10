DELIMITER //
CREATE PROCEDURE searchclient(vid int)
    COMMENT 'Procedimiento que carga la informacion de un cliente'
BEGIN
 	
	SELECT id,numeroIdentificacion, primerNombreCliente, segundoNombreCliente, primerApellidoCliente, segundoApellidoCliente, direccionCliente,
                 telefonoFijoCliente, telefonoMovilCliente, correoCliente, generoCliente, fechaNacimiento, ciudadResidencia_idciudad, 
	         tipoIdentificacion_idtipoIdentificacion, ciudadExpedicion_idciudad, profesiones_idprofesion, tipoPersonaCliente_idtipoPersonCliente
	FROM clientes
	where id = vid;	
	
END//

DELIMITER ;
