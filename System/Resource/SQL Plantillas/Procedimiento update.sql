DELIMITER //
CREATE FUNCTION updateclient(vId int, vfirstname varchar(50), vsecondname varchar(50), vfirstlastname varchar(50), 
vsecondlastname varchar(50), vDocumentType int, vDocumentNumber varchar(11), vCityExpedition int, vBirthdate varchar(50), 
vClientType int,vAddress varchar(45), 
vHomePhone varchar(10),vMobilePhone varchar(10), vEmail varchar(45), vGender int, vCityResidence int, vProfession int) RETURNS INT( 1 ) 
COMMENT  'Funcion que modifica un cliente'
READS SQL DATA 
DETERMINISTIC 
BEGIN 
    DECLARE res INT DEFAULT 0;
    
IF NOT EXISTS(select 1 from clientes where numeroIdentificacion =vDocumentNumber and id<>vId)
		THEN
			update clientes set primerNombreCliente = vfirstname, 
                                            segundoNombreCliente = vsecondname,
                                            primerApellidoCliente = vfirstlastname, 
                                            segundoApellidoCliente = vsecondlastname, 
                                            tipoIdentificacion_idtipoIdentificacion = vDocumentType, 
                                            numeroIdentificacion = vDocumentNumber,
                                            ciudadExpedicion_idciudad = vCityExpedition, 
                                            fechaNacimiento = vBirthdate, 
                                            tipoPersonaCliente_idtipoPersonCliente = vClientType,
                                            direccionCliente = vAddress,
                                            telefonoFijoCliente = vHomePhone, 
                                            telefonoMovilCliente = vMobilePhone, 
                                            correoCliente = vEmail, 
                                            generoCliente = vGender,                                             
                                            ciudadResidencia_idciudad = vCityResidence,                                                                                                                                     
                                            profesiones_idprofesion = vProfession                                           
                        where id = vId;		
			set res=1;
														
		END IF;

	RETURN res;
	

END//

DELIMITER ;
