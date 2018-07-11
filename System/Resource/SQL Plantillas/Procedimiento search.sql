DROP PROCEDURE IF EXISTS searchclient;

DELIMITER //
CREATE PROCEDURE searchclient(vid int)
    COMMENT 'Procedimiento que carga la informacion de un cliente'
BEGIN
 	
	SELECT idCliente as id ,
               numeroIdentificacion as cedula, 
                  primerNombreCliente as primer_nombre, 
                  segundoNombreCliente as segundo_nombre, 
                  primerApellidoCliente as primer_apellido, 
                  segundoApellidoCliente as segundo_apellido,  
                  direccionCliente as direccion,
                  telefonoFijoCliente as telefono, 
                  telefonoMovilCliente as celular, 
                  correoCliente as email, 
                  `idGenero` as genero, 
                  fechaNacimiento as fecha, 
                  ciudadResidencia_idciudad as id_ciudad_residencia, 
	          tipoIdentificacion_idtipoIdentificacion as id_tipo_identificacion,
                  ciudadExpedicion_idciudad as id_ciudad_expedicion, 
                  profesiones_idprofesion as id_profesion, 
                  tipoPersonaCliente_idtipoPersonCliente as id_tipo_persona, 
                  `idEstadoCivil` as estado_civil
                  
	FROM clientes
	where idCliente = vid;	
	
END//

DELIMITER ;
