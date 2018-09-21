DROP PROCEDURE IF EXISTS saveclientpublic;


DELIMITER //
CREATE FUNCTION saveclientpublic (vid INT, 
                               vFirstName varchar(20), 
                               vSecondName varchar(20), 
                               vFirstLastName varchar(20), 
                               vSecondLastName varchar(20),                                
                               vMobilePhone VARCHAR(10), 
                               vEmail VARCHAR(45), 
                               vPassword VARCHAR(10)
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
                                    password
                                   )
                        VALUES (
                               vFirstName, 
                               vSecondName, 
                               vFirstLastName, 
                               vSecondLastName,
                               vMobilePhone,
                               vEmail,
                               vPassword
                              );

    
				
    set res = 1;
			
												 				 
		END IF;

	RETURN res;
	

END//
DELIMITER ;