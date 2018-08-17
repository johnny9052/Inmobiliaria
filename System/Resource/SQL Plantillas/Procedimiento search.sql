DROP PROCEDURE IF EXISTS searchclient;

DELIMITER //
CREATE  PROCEDURE searchclient(vid int)
    COMMENT 'Procedimiento que carga la informacion de un cliente'
BEGIN
 	
	SELECT cli.idCliente as id ,
               cli.numeroIdentificacion as cedula, 
                  cli.primerNombreCliente as primer_nombre, 
                  cli.segundoNombreCliente as segundo_nombre, 
                  cli.primerApellidoCliente as primer_apellido, 
                  cli.segundoApellidoCliente as segundo_apellido,  
                  cli.direccionCliente as direccion,
                  cli.telefonoFijoCliente as telefono, 
                  cli.telefonoMovilCliente as celular, 
                  cli.correoCliente as email, 
                  cli.idGenero as genero, 
                  cli.fechaNacimiento as fecha, 
                  cli.ciudadResidencia_idciudad as id_ciudad_residencia, 
	          cli.tipoIdentificacion_idtipoIdentificacion as id_tipo_identificacion,
                  cli.ciudadExpedicion_idciudad as id_ciudad_expedicion, 
                  cli.profesiones_idprofesion as id_profesion, 
                  cli.tipoPersonaCliente_idtipoPersonCliente as id_tipo_persona, 
                  cli.idEstadoCivil as estado_civil, 
                  p.`nivelProfesion_idnivelProfesion` as nivel_profesional,
                  ciuExp.`Departamentos_idDepartamento` as departamento_expedicion,
                  ciuRes.`Departamentos_idDepartamento` as departamento_residencia
	FROM clientes as cli 
        inner join profesiones as p on cli.profesiones_idprofesion = p.idprofesion 
        inner join ciudades as ciuExp on cli.`ciudadExpedicion_idciudad` = ciuExp.`idciudad`
        inner join ciudades as ciuRes on cli.`ciudadResidencia_idciudad` = ciuRes.`idciudad`
	where idCliente = vid;	
	
END//

DELIMITER ;