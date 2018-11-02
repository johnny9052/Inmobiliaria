
DROP PROCEDURE IF EXISTS listpropertie;


DELIMITER //
CREATE PROCEDURE listpropertie(idfilter int)
COMMENT 'Procedimiento que lista los inmuebles'
BEGIN
    select inm.idinmueble as id, 
           inm.`matriculaInmobiliaria` as matricula, 
           tip_inm.`nombreTipoInmueble` as tipo,
           tip_ofer.`nombreTipoOferta` as oferta, 
           inm.precio as precio, 
           ciud.`nombreCiudad` as ciudad, 
           zon.`nombreZona` as zona, 
           inm.`fechaRecepcion` as fecha, 
           est.`nombreEstado` as estado
   from inmuebles as inm 
        inner join tiposinmuebles as tip_inm on inm.`tiposInmuebles_idtipoInmueble` = tip_inm.`idtipoInmueble` 
        inner join tiposofertas as tip_ofer on inm.`tiposOfertas_idtipoOferta` = tip_ofer.`idtipoOferta` 
        inner join ciudades as ciud on inm.ciudades_idciudad = ciud.idciudad 
        inner join zonas as zon on inm.zonas_idzona = zon.idzona 
        inner join estados as est on inm.estado_idestado = est.idestado
   --https://stackoverflow.com/questions/14614573/using-case-in-the-where-clause
   where (case when idfilter>0 then inm.`clientes_cedulaCliente` = idfilter ELSE TRUE END )

   order by inm.`fechaRecepcion`;
END//

DELIMITER ;