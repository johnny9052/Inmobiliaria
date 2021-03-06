DROP PROCEDURE IF EXISTS saveclient;




DELIMITER //
CREATE FUNCTION saveclient (vid INT, vfirstname VARCHAR(50), vsecondname VARCHAR(50), vfirstlastname VARCHAR(50), vsecondlastname VARCHAR(50), vDocumentType INT, vDocumentNumber VARCHAR(11), vCityExpedition INT, vBirthdate VARCHAR(50), vClientType INT, vAddress VARCHAR(45), vHomePhone VARCHAR(10), vMobilePhone VARCHAR(10), vEmail VARCHAR(45), vGender INT, vCityResidence INT, vProfession INT, vMaritalStatus INT, vPersonType INT, vtypesclient VARCHAR(2000)) RETURNS int(1)
    READS SQL DATA
    DETERMINISTIC
    COMMENT 'Funcion que almacena un cliente'
BEGIN 
    DECLARE res INT DEFAULT 0;
     DECLARE vtypeclient varchar(50) DEFAULT ''; 
     
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
                                    idEstadoCivil)
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
                                    vPersonType,vMaritalStatus);

			SET @vidClient = LAST_INSERT_ID();	




 
 WHILE (LOCATE(',', vtypesclient) > 0) DO

        /*Se saca el primer campo separado por coma del varchar*/
    	SET vtypeclient = ELT(1, vtypesclient);
        /*Se elimina ese primer valor y se reemplaza en la cadena*/
    	SET vtypesclient = SUBSTRING(vtypesclient, LOCATE(',',vtypesclient) + 1);
      
        /*Se almacena en la tabla, siempre y cuando tenga un dato para almacenar*/
	IF vtypeclient <> ',' THEN	
            INSERT INTO detalleclientestipoclientes(tiposClientes_idtipoCliente,clientes_cedulaCliente) 
                VALUES (CONVERT(vtypeclient,SIGNED), @vidClient);
	END IF;
    END WHILE;



            

				
			set res = 1;
			
												 				 
		END IF;

	RETURN res;
	

END//
DELIMITER ;