DROP FUNCTION IF EXISTS savepqrsclient;




DELIMITER //
CREATE FUNCTION savepqrsclient (vpqrstype INT, vdescription VARCHAR(200), vfecha VARCHAR(20),
                                vhora VARCHAR(20), vidclient INT) RETURNS int(1)
    READS SQL DATA
    DETERMINISTIC
    COMMENT 'Funcion que almacena un pqrs del cliente'
BEGIN 
    DECLARE res INT DEFAULT 0;
     
    insert into pqrs(fechaPQRS, 
                        horaPQRS,
                        descripcionPQRS,
                        idtipopqrs, 
                        idusuario
                        )
                        VALUES (vfecha,
                                vhora,
                                vdescription,
                                vpqrstype,
                                vidclient
                                );
			       
				
			set res = 1;
			
		
	RETURN res;
	

END//
DELIMITER ;