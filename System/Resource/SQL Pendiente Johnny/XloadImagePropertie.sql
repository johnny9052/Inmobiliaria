DROP FUNCTION IF EXISTS loadimagepropertie;




DELIMITER //
CREATE FUNCTION loadimagepropertie (vid INT) RETURNS varchar(200)
    READS SQL DATA
    DETERMINISTIC
    COMMENT 'Funcion que trae la primera imagen de una propiedad'
BEGIN 
    
    DECLARE vimagen varchar(200) DEFAULT '';      
    SET vimagen = (select CAST(img.rutaImagen AS CHAR) as imagen  
                   from imageninmueble as img 
                   where img.`idInmueble` = vid
                   order by  img.rutaImagen asc 
                   limit 1);
    RETURN vimagen;
	

END//
DELIMITER ;