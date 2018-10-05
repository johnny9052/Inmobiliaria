DROP FUNCTION IF EXISTS savedistrict;




DELIMITER //
CREATE FUNCTION savedistrict (vid INT, vname VARCHAR(50), vcity INT ) RETURNS int(1)
    READS SQL DATA
    DETERMINISTIC
    COMMENT 'Funcion que almacena un nuevo barrio'
BEGIN 
    DECLARE res INT DEFAULT 0;
     
     
IF NOT EXISTS(select 1 from barrios where nombreBarrio=vname)
		THEN
			insert into barrios(
                                    nombreBarrio, 
                                    	idCiudad 
                                  )
                        VALUES (                                    
                                    vname ,
                                    vcity 
                                    );
			       
				
			set res = 1;
			
												 				 
		END IF;

	RETURN res;
	

END//
DELIMITER ;