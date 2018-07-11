DROP PROCEDURE IF EXISTS loadpersontype;

DELIMITER //
CREATE PROCEDURE loadpersontype (IN idfilter INT)
    COMMENT 'Procedimiento que carga los tipos de persona'
BEGIN
 
	IF idfilter > -1 THEN
	
		select idtipoPersonCliente  as id,nombreTipoPersonaCliente  as nombre
		from tipoPersonaCliente                
		ORDER BY nombreTipoPersonaCliente;
		
        ELSE	
	
		select idtipoPersonCliente  as id,nombreTipoPersonaCliente  as nombre
		from tipoPersonaCliente                
		ORDER BY nombreTipoPersonaCliente;
	
        END IF;
END//

DELIMITER ; 