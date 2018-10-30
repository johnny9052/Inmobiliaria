DROP FUNCTION IF EXISTS updatepqrs;

DELIMITER//
CREATE FUNCTION updatepqrs(vid INT, vgivenResponse VARCHAR(200)) RETURNS INT( 1 )
COMMENT  'Funcion que modifica una PQRS'
READS SQL DATA 
DETERMINISTIC 
BEGIN 
    DECLARE res INT DEFAULT 0;
    
			update pqrs set respuestaDada = vgivenResponse
                        where 	idpqrs = vid;		
			set res=1;
	RETURN res;
END//

DELIMITER ;