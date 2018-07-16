DROP PROCEDURE IF EXISTS  loadviewtype;

DELIMITER //
CREATE PROCEDURE  loadviewtype (IN idfilter INT)
    COMMENT 'Procedimiento que carga los tipos de vista'
BEGIN
 
	IF idfilter > -1 THEN
	
		select 	          idtipoVista  as id,          nombreTipoVista  as nombre
		from           tiposvistas                    
		ORDER BY           nombreTipoVista;
		
        ELSE	
	
		select 	          idtipoVista  as id,          nombreTipoVista  as nombre
		from           tiposvistas                
		ORDER BY           nombreTipoVista;
	
        END IF;
END//

DELIMITER ; 