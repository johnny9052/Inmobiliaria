DROP PROCEDURE IF EXISTS loadtotalinmueblesporofertaContrato;

DELIMITER //
CREATE PROCEDURE loadtotalinmueblesporofertaContrato (IN idfilter INT)
    COMMENT 'Procedimiento que carga el total de inmuebles por tipo de oferta que se encuentren contratados'
BEGIN
 
	IF idfilter > -1 THEN

                select tip.nombreTipoOferta as tipo, count(*) total
                from inmuebles as inm 
                inner join tiposOfertas as tip on tip.idtipoOferta = inm.tiposOfertas_idtipoOferta
                inner join contratos as con on con.inmuebles_idinmueble = inm.idinmueble
                group by tip.nombreTipoOferta;
			
        ELSE				
              select tip.nombreTipoOferta as tipo, count(*) total
                from inmuebles as inm 
                inner join tiposOfertas as tip on tip.idtipoOferta = inm.tiposOfertas_idtipoOferta
                inner join contratos as con on con.inmuebles_idinmueble = inm.idinmueble
                group by tip.nombreTipoOferta;
	
        END IF;
END//

DELIMITER ; 