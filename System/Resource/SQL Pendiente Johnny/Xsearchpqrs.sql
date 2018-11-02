
DROP PROCEDURE IF EXISTS searchpqrs;

DELIMITER //
CREATE  PROCEDURE searchpqrs(vid int)
    COMMENT 'Procedimiento que carga las pqrs'
BEGIN
 	
	SELECT  pqr.idPQRS as id,
                pqr.fechaPQRS as fechaPQRS,
		pqr.horaPQRS as horaPQRS,
		pqr.descripcionPQRS as descripcionPQRS,
		pqr.respuestaDada as respuestaDada,
		pqr.idtipopqrs as idtipopqrs,
		tip.idtipopqrs as tipopqrs, 
                cli.`idCliente` as cliente,
                CONCAT(cli.`primerNombreCliente`, ' ', cli.`primerApellidoCliente`) as nombre, 
                cli.`correoCliente` as correo
	FROM pqrs as pqr 
        inner join tipopqrs as tip on pqr.idtipopqrs = tip.idtipopqrs
        INNER JOIN clientes as cli on pqr.idusuario = cli.`idCliente`
	where pqr.idPQRS = vid;	
	
END//

DELIMITER ;