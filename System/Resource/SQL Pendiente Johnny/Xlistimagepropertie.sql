DROP PROCEDURE IF EXISTS listimagepropertie;

DELIMITER //
CREATE  PROCEDURE listimagepropertie(vid int)
    COMMENT 'Procedimiento que carga las imagenes asociados a un inmueble'
BEGIN
 	
	SELECT img.rutaImagen as url_file, img.`idInmueble` as id_inmueble             
	FROM imageninmueble  as img
	where img.idInmueble = vid
        ORDER By img.rutaImagen asc;	
	
END//

DELIMITER ;