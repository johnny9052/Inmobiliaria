DROP PROCEDURE IF EXISTS listimagepropertie;

DELIMITER //
CREATE  PROCEDURE listimagepropertie(vid int)
    COMMENT 'Procedimiento que carga las imagenes asociados a un inmueble'
BEGIN
 	
	SELECT rutaImagen as url_file              
	FROM imageninmueble   
	where idInmueble = vid;	
	
END//

DELIMITER ;