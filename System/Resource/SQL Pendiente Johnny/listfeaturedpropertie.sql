
DROP PROCEDURE IF EXISTS listfeaturedpropertie;


DELIMITER //
CREATE PROCEDURE listfeaturedpropertie(vfilter int)
COMMENT 'Procedimiento que lista los inmuebles destacados para la pagina web'
BEGIN

   select DISTINCT  inm.idinmueble as id, tip_inm.`nombreTipoInmueble` as tipo,
               tip_ofer.`nombreTipoOferta` as oferta, inm.precio as precio, ciud.`nombreCiudad` as ciudad, 
               zon.`nombreZona` as zona, bar.`nombreBarrio` as barrio, loadimagepropertie(inm.idinmueble) as imagen,
               tip.`nombreTipoInmueble` as tipoinmueble, inm.`linderosInmueble` as linderos
   from inmuebles as inm 
        inner join tiposinmuebles as tip_inm on inm.`tiposInmuebles_idtipoInmueble` = tip_inm.`idtipoInmueble` 
        inner join tiposofertas as tip_ofer on inm.`tiposOfertas_idtipoOferta` = tip_ofer.`idtipoOferta` 
        inner join ciudades as ciud on inm.ciudades_idciudad = ciud.idciudad 
        inner join zonas as zon on inm.zonas_idzona = zon.idzona 
        inner join barrios as bar on inm.barrios_idbarrio = bar.idbarrio
        inner join tiposinmuebles as tip on inm.`tiposInmuebles_idtipoInmueble` = tip.`idtipoInmueble`             
   where inm.estado_idestado = 22
   order by inm.tiposDestacados_idtipoDestacado
   LIMIT 6 OFFSET 0;
END//

DELIMITER ;