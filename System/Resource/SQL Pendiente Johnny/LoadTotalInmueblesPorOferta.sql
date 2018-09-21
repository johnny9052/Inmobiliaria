DROP PROCEDURE IF EXISTS loadtotalinmueblesporoferta;

DELIMITER //
CREATE PROCEDURE loadtotalinmueblesporoferta (IN idfilter INT)
    COMMENT 'Procedimiento que carga el total de inmuebles por tipo de oferta'
BEGIN
 
	IF idfilter > -1 THEN

                select tip.nombreTipoOferta as tipo, count(*) total
                from inmuebles as inm 
                inner join tiposOfertas as tip on tip.idtipoOferta = inm.tiposOfertas_idtipoOferta
                group by tip.nombreTipoOferta;
			
        ELSE				
                select tip.nombreTipoOferta as tipo, count(*) total
                from inmuebles as inm 
                inner join tiposOfertas as tip on tip.idtipoOferta = inm.tiposOfertas_idtipoOferta
                group by tip.nombreTipoOferta;
	
        END IF;
END//

DELIMITER ; 