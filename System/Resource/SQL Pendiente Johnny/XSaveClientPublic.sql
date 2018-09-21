DROP FUNCTION IF EXISTS saveclientpublic;


DELIMITER //
CREATE FUNCTION saveclientpublic (vid INT, 
                               vFirstName varchar(20), 
                               vSecondName varchar(20), 
                               vFirstLastName varchar(20), 
                               vSecondLastName varchar(20),                                
                               vMobilePhone VARCHAR(10), 
                               vEmail VARCHAR(45), 
                               vPassword VARCHAR(32)
                               ) RETURNS int(1)
    READS SQL DATA
    DETERMINISTIC
    COMMENT 'Funcion que almacena un cliente desde la pagina publica'
BEGIN 
    DECLARE res INT DEFAULT 0;     
     
IF NOT EXISTS(select 1 from clientes where correoCliente=vEmail)
		THEN
			insert into clientes(                                                                        
                                    primerNombreCliente,
                                    segundoNombreCliente,
                                    primerApellidoCliente,
                                    segundoApellidoCliente,
                                    telefonoMovilCliente,
                                    correoCliente,
                                    password,
                                    ciudadResidencia_idciudad,
                                    tipoIdentificacion_idtipoIdentificacion,
                                    ciudadExpedicion_idciudad,
                                    profesiones_idprofesion,
                                    tipoPersonaCliente_idtipoPersonCliente,
                                    idEstadoCivil,
                                    idGenero
                                   )
                        VALUES (
                               vFirstName, 
                               vSecondName, 
                               vFirstLastName, 
                               vSecondLastName,
                               vMobilePhone,
                               vEmail,
                               vPassword,
                               0,0,0,0,0,0,0
                              );

    
				
    set res = 1;
			
												 				 
		END IF;

	RETURN res;
	

END//
DELIMITER ;