--DROP PROCEDURE IF EXISTS saveclient;



DELIMITER //
CREATE FUNCTION saveclient (vid INT, vfirstname VARCHAR(50), vsecondname VARCHAR(50), 
                          vfirstlastname VARCHAR(50), vsecondlastname VARCHAR(50), 
                          vDocumentType INT, vDocumentNumber VARCHAR(11), vCityExpedition INT, 
                          vBirthdate VARCHAR(50), vClientType INT, vAddress VARCHAR(45), 
                          vHomePhone VARCHAR(10), vMobilePhone VARCHAR(10), vEmail VARCHAR(45), 
                          vGender INT, vCityResidence INT, vProfession INT) RETURNS int(1)
	COMMENT 'Funcion que almacena un cliente'
	READS SQL DATA
    DETERMINISTIC    
BEGIN 
    DECLARE res INT DEFAULT 0;
    
IF NOT EXISTS(select 1 from clientes where numeroIdentificacion=vDocumentNumber)
		THEN
			insert into clientes(
                                    numeroIdentificacion, 
                                    tipoIdentificacion_idtipoIdentificacion, 
                                    primerNombreCliente, 
                                    segundoNombreCliente, 
                                    primerApellidoCliente, 
                                    segundoApellidoCliente, 
                                    direccionCliente,
                                    telefonoFijoCliente, 
                                    telefonoMovilCliente, 
                                    correoCliente, 
                                    idGenero , 
                                    fechaNacimiento, 
                                    ciudadResidencia_idciudad, 
                                    ciudadExpedicion_idciudad, 
                                    profesiones_idprofesion, 
                                    tipoPersonaCliente_idtipoPersonCliente)
                        VALUES (
                                    vDocumentNumber, 
                                    vDocumentType ,
                                    vfirstname, 
                                    vsecondname, 
                                    vfirstlastname , 
                                    vsecondlastname , 
                                    vAddress , 
                                    vHomePhone,
                                    vMobilePhone,
                                    vEmail,
                                    vGender , 
                                    vBirthdate,
                                    vCityResidence , 
                                    vCityExpedition , 
                                    vProfession,
                                    vClientType);
			set res = 1;
			
												 				 
		END IF;

	RETURN res;
	

END//
DELIMITER ;