DROP PROCEDURE IF EXISTS deletepropertie;

DELIMITER //
CREATE FUNCTION deletepropertie(vid INT) RETURNS INT( 1 ) 
COMMENT  'Funcion que elimina un inmueble'
READS SQL DATA 
DETERMINISTIC 
BEGIN 
    DECLARE res INT DEFAULT 0;

    DELETE FROM inmuebles where idinmueble = vid;
    DELETE FROM imageninmueble WHERE idInmueble = vid;
    DELETE FROM videoinmueble WHERE  idInmueble= vid;
    SET res = 1;

    RETURN res;
END//

DELIMITER ;