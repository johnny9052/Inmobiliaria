DROP PROCEDURE IF EXISTS updateclient;

DELIMITER //
CREATE FUNCTION updateclient(vid INT, vfirstname VARCHAR(50), vsecondname VARCHAR(50), 
                          vfirstlastname VARCHAR(50), vsecondlastname VARCHAR(50), 
                          vDocumentType INT, vDocumentNumber VARCHAR(11), vCityExpedition INT, 
                          vBirthdate VARCHAR(50), vClientType INT, vAddress VARCHAR(45), 
                          vHomePhone VARCHAR(10), vMobilePhone VARCHAR(10), vEmail VARCHAR(45), 
                          vGender INT, vCityResidence INT, vProfession INT, 
                          vMaritalStatus INT, vPersonType INT) RETURNS INT( 1 ) 
COMMENT  'Funcion que modifica un cliente'
READS SQL DATA 
DETERMINISTIC 
BEGIN 
    DECLARE res INT DEFAULT 0;
    
IF NOT EXISTS(select 1 from clientes where numeroIdentificacion =vDocumentNumber and idCliente<>vId)
		THEN
			update clientes set numeroIdentificacion = vDocumentNumber,
                                            primerNombreCliente = vfirstname, 
                                            segundoNombreCliente = vsecondname,
                                            primerApellidoCliente = vfirstlastname, 
                                            segundoApellidoCliente = vsecondlastname, 
                                            direccionCliente = vAddress,
                                            telefonoFijoCliente = vHomePhone, 
                                            telefonoMovilCliente = vMobilePhone, 
                                            correoCliente = vEmail, 
                                            fechaNacimiento = vBirthdate, 
                                            ciudadResidencia_idciudad = vCityResidence,                                                                                                                                     
                                            tipoIdentificacion_idtipoIdentificacion = vDocumentType,                                             
                                            ciudadExpedicion_idciudad = vCityExpedition, 
                                            profesiones_idprofesion = vProfession,
                                            tipoPersonaCliente_idtipoPersonCliente = vPersonType,
                                            idEstadoCivil = vMaritalStatus,                                          
                                            idGenero = vGender                                                                                                             
                        where 	idCliente = vId;		
			set res=1;
                        
														
		END IF;

	RETURN res;
	

END//

DELIMITER ;
