DROP PROCEDURE IF EXISTS loadtypescontractselecteds;

DELIMITER //
CREATE PROCEDURE loadtypescontractselecteds (IN idfilter INT)
    COMMENT 'Procedimiento que carga los los tipos de contrato-empleado'
BEGIN
 
	IF idfilter > -1 THEN
	
		select idobjetoContrato as id
		from detallecontratosobjetos	               
		where contratos_idcontrato = idfilter;
		
        ELSE	
	
		select idobjetoContrato as id
		from detallecontratosobjetos;               
	
        END IF;
END//

DELIMITER ; 



DROP FUNCTION IF EXISTS savecontractpropertie;

DELIMITER //
CREATE FUNCTION `savecontractpropertie` (`vid` INT, `vclient` INT, `vpropertie` INT, `vfirmDate` VARCHAR(50), `vstartDate` VARCHAR(50), `vendDate` VARCHAR(50), `vcontractValue` FLOAT, `vtermContract` INT, `vwayPay` VARCHAR(50), `vurlContract` VARCHAR(500), `vtypescontract` VARCHAR(2000), `vtypesdebtor` VARCHAR(2000)) RETURNS INT(1) READS SQL DATA
    DETERMINISTIC
    COMMENT 'Funcion que almacena un contrato de un inmueble'
BEGIN
    DECLARE res INT DEFAULT 0;
    
IF NOT EXISTS(select 1 from  contratos where idcontrato=vid)
		THEN
			insert into  contratos(
                                    fechaContrato,
									fechaInicioContrato, 
                                    fechaFinContrato, 
                                    valorContrato,
									plazoContrato,
									formaDePago,
									inmuebles_idinmueble,
									rutaContrato,
									idcliente
									)
                        VALUES (
                                    vfirmDate,
									vstartDate,
									vendDate,
									vcontractValue,
									vtermContract,
									vwayPay,
									vpropertie,
									vurlContract,
									vclient
									);
									SET @vidcontrato = LAST_INSERT_ID();

									
  call log_msg(CONCAT('LO QUE DA EL PRIMER WHILE********',vtypescontract));
  
  
    WHILE (LOCATE(',', vtypescontract) > 0) DO
      SET @V_DESIGNATION = SUBSTRING(vtypescontract,1, LOCATE(',',vtypescontract)-1); 
      call log_msg(CONCAT('PARTICIONADO********',@V_DESIGNATION));
      SET vtypescontract = SUBSTRING(vtypescontract, 			      LOCATE(',',vtypescontract) + 1); 
      call log_msg(CONCAT('PRUEBA********',vtypescontract));
      call log_msg(CONCAT('VAMOS A INSERTAR********',@V_DESIGNATION,'-------',@vidcontrato));
       IF @V_DESIGNATION <> '' THEN	
    		INSERT INTO detallecontratosobjetos(idobjetoContrato, contratos_idcontrato) 
            VALUES (CONVERT(@V_DESIGNATION,SIGNED),@vidcontrato);
		END IF;
    END WHILE;
	
	
	call log_msg(CONCAT('LO QUE DA EL segundo WHILE********',vtypesdebtor));
	
	WHILE (LOCATE(',', vtypesdebtor) > 0) DO
      SET @V_DESIGNATION = SUBSTRING(vtypesdebtor,1, LOCATE(',',vtypesdebtor)-1); 
      call log_msg(CONCAT('PARTICIONADO2********',@V_DESIGNATION));
      SET vtypesdebtor = SUBSTRING(vtypesdebtor, 			      LOCATE(',',vtypesdebtor) + 1); 
      call log_msg(CONCAT('PRUEBA2********',vtypesdebtor));
      call log_msg(CONCAT('VAMOS A INSERTAR2********',@V_DESIGNATION,'-------',@vidcontrato));
       IF @V_DESIGNATION <> '' THEN	
    		INSERT INTO detallecontratosdeudores(numeroIdentificacionDeudor	, contratos_idcontrato) 
            VALUES (CONVERT(@V_DESIGNATION,SIGNED),@vidcontrato);
		END IF;
    END WHILE;
			set res = 1;
		END IF;
	RETURN res;

END//

DELIMITER ; 


DROP FUNCTION IF EXISTS updatecontractpropertie;

DELIMITER //
CREATE FUNCTION `updatecontractpropertie` (`vid` INT, `vclient` INT, `vpropertie` INT, `vfirmDate` VARCHAR(50), `vstartDate` VARCHAR(50), `vendDate` VARCHAR(50), `vcontractValue` FLOAT, `vtermContract` INT, `vwayPay` VARCHAR(50), `vurlContract` VARCHAR(500), `vtypescontract` VARCHAR(2000), `vtypesdebtor` VARCHAR(2000)) RETURNS INT(1) READS SQL DATA
    DETERMINISTIC
    COMMENT 'Funcion que almacena un contrato de un inmueble'
BEGIN
    DECLARE res INT DEFAULT 0;
    
			update contratos set fechaContrato = vfirmDate,
									fechaInicioContrato = vstartDate,
                                    fechaFinContrato = vendDate,
                                    valorContrato = vcontractValue,
									plazoContrato = vtermContract,
									formaDePago = vwayPay,
									inmuebles_idinmueble = vpropertie,
									rutaContrato = vurlContract,
									idcliente = vclient
                        where 	idcontrato = vid;		
			set res=1;
			call log_msg(CONCAT('ANTES DE DELETE ********',vid));

                                delete from detallecontratosobjetos 
                                where contratos_idcontrato = vid;

				
				WHILE (LOCATE(',', vtypescontract) > 0) DO
					
					SET @V_DESIGNATION = SUBSTRING(vtypescontract,1, LOCATE(',',vtypescontract)-1); 					
					
					SET vtypescontract = SUBSTRING(vtypescontract,LOCATE(',',vtypescontract) + 1); 
					                                        
					IF @V_DESIGNATION <> '' THEN	
						INSERT INTO detallecontratosobjetos(idobjetoContrato, contratos_idcontrato) 
							VALUES (CONVERT(@V_DESIGNATION,SIGNED),vid);
					END IF;
				END WHILE;
			set res = 1;
			
			call log_msg(CONCAT('ANTES DE DELETE ********',vid));

                                delete from detallecontratosdeudores 
                                where contratos_idcontrato = vid;

				
				WHILE (LOCATE(',', vtypesdebtor) > 0) DO
					
					SET @V_DESIGNATION = SUBSTRING(vtypesdebtor,1, LOCATE(',',vtypesdebtor)-1); 					
					
					SET vtypesdebtor = SUBSTRING(vtypesdebtor,LOCATE(',',vtypesdebtor) + 1); 
					                                        
					IF @V_DESIGNATION <> '' THEN	
						INSERT INTO detallecontratosdeudores(numeroIdentificacionDeudor	, contratos_idcontrato) 
							VALUES (CONVERT(@V_DESIGNATION,SIGNED),vid);
					END IF;
				END WHILE;
			set res = 1;
	RETURN res;
END$$






