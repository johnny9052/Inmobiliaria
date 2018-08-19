DROP PROCEDURE IF EXISTS listvideopropertie;

DELIMITER //
CREATE  PROCEDURE listvideopropertie(vid int)
    COMMENT 'Procedimiento que carga las rutas de los videos asociados a un inmueble'
BEGIN
 	
	SELECT rutaVideo as dinamic_data              
	FROM videoinmueble       
	where idInmueble = vid;	
	
END//

DELIMITER ;