DROP PROCEDURE IF EXISTS     loadkitchentype;

DELIMITER //
CREATE PROCEDURE     loadkitchentype (IN idfilter INT)
    COMMENT 'Procedimiento que carga los tipos  de cocinas'
BEGIN
 
	IF idfilter > -1 THEN
	
		select 	  idtipoCocina  as id,  nombreTipoCocina  as nombre
		from      tiposcocinas                    
		ORDER BY   nombreTipoCocina;
		
        ELSE	
	
		select 	  idtipoCocina  as id,  nombreTipoCocina  as nombre
		from      tiposcocinas                
		ORDER BY   nombreTipoCocina;
	
        END IF;
END//

DELIMITER ; 