DROP FUNCTION IF EXISTS updateclient;

DELIMITER $$
CREATE FUNCTION `updateclient`(`vid` INT, `vfirstname` VARCHAR(50), `vsecondname` VARCHAR(50), `vfirstlastname` VARCHAR(50), `vsecondlastname` VARCHAR(50), `vDocumentType` INT, `vDocumentNumber` VARCHAR(11), `vCityExpedition` INT, `vBirthdate` VARCHAR(50), `vClientType` INT, `vAddress` VARCHAR(45), `vHomePhone` VARCHAR(10), `vMobilePhone` VARCHAR(10), `vEmail` VARCHAR(45), `vGender` INT, `vCityResidence` INT, `vProfession` INT, `vMaritalStatus` INT, `vPersonType` INT, `vimageclient` VARCHAR(200), `vtypesclient` VARCHAR(2000) ) RETURNS int(1)
    READS SQL DATA
    DETERMINISTIC
    COMMENT 'Funcion que actualiza un cliente'
BEGIN 
	DECLARE res INT DEFAULT 0;

        call log_msg(CONCAT('ANTES DE IF********',vid));

	IF NOT EXISTS(select 1 from clientes where numeroIdentificacion=vDocumentNumber and idCliente<>vid)
		THEN

                        call log_msg(CONCAT('ENTRE AL IF ********',vid));
			update clientes set
				numeroIdentificacion = vDocumentNumber,
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
                                            imagencliente = vimageclient,
                                            idGenero = vGender                                              
                        where 	idCliente = vid;
				
				set res=1;

                                 call log_msg(CONCAT('ANTES DE DELETE ********',vid));

                                delete from detalleclientestipoclientes 
                                where clientes_cedulaCliente = vid;

				
				WHILE (LOCATE(',', vtypesclient) > 0) DO
					/*Se saca el primer campo separado por coma del varchar*/
					SET @V_DESIGNATION = SUBSTRING(vtypesclient,1, LOCATE(',',vtypesclient)-1); 					
					/*Se elimina ese primer valor y se reemplaza en la cadena*/
					SET vtypesclient = SUBSTRING(vtypesclient,LOCATE(',',vtypesclient) + 1); 
					/*Se almacena en la tabla, siempre y cuando tenga un dato para almacenar*/                                        
					IF @V_DESIGNATION <> '' THEN	
						INSERT INTO detalleclientestipoclientes(tiposClientes_idtipoCliente, clientes_cedulaCliente) 
							VALUES (CONVERT(@V_DESIGNATION,SIGNED),vid);
					END IF;
				END WHILE;
			set res = 1;
		END IF;
	RETURN res;
END$$
DELIMITER ;