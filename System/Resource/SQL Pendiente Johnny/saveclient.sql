DELIMITER $$
CREATE DEFINER=`root`@`localhost` FUNCTION `saveclient`(`vid` INT, `vfirstname` VARCHAR(50), `vsecondname` VARCHAR(50), `vfirstlastname` VARCHAR(50), `vsecondlastname` VARCHAR(50), `vDocumentType` INT, `vDocumentNumber` VARCHAR(11), `vCityExpedition` INT, `vBirthdate` VARCHAR(50), `vClientType` INT, `vAddress` VARCHAR(45), `vHomePhone` VARCHAR(10), `vMobilePhone` VARCHAR(10), `vEmail` VARCHAR(45), `vGender` INT, `vCityResidence` INT, `vProfession` INT, `vMaritalStatus` INT, `vPersonType` INT, `vimageclient` VARCHAR(200), `vtypesclient` VARCHAR(2000) ) RETURNS int(1)
    READS SQL DATA
    DETERMINISTIC
    COMMENT 'Funcion que almacena un cliente'
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
				tipoPersonaCliente_idtipoPersonCliente,                                     
				idEstadoCivil,
				imagencliente)
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
				vPersonType,
				vMaritalStatus,
				vimageclient);
				
				SET @vidClient = LAST_INSERT_ID();	
				call log_msg(CONCAT('LO QUE DA EL PRIMER WHILE********',LOCATE(',', vtypesclient)));
				WHILE (LOCATE(',', vtypesclient) > 0) DO
					/*Se saca el primer campo separado por coma del varchar*/
					SET @V_DESIGNATION = SUBSTRING(vtypesclient,1, LOCATE(',',vtypesclient)-1); 
					call log_msg(CONCAT('PARTICIONADO********',@V_DESIGNATION));
					/*Se elimina ese primer valor y se reemplaza en la cadena*/
					SET vtypesclient = SUBSTRING(vtypesclient, 			      LOCATE(',',vtypesclient) + 1); 
					call log_msg(CONCAT('PRUEBA********',vtypesclient));
					call log_msg(CONCAT('VAMOS A INSERTAR********',@V_DESIGNATION,'-------',@vidClient));
					/*Se almacena en la tabla, siempre y cuando tenga un dato para almacenar*/
					IF @V_DESIGNATION <> '' THEN	
						INSERT INTO detalleclientestipoclientes(tiposClientes_idtipoCliente, clientes_cedulaCliente) 
							VALUES (CONVERT(@V_DESIGNATION,SIGNED),@vidClient);
					END IF;
				END WHILE;
			set res = 1;
		END IF;
	RETURN res;
END$$
DELIMITER ;