
DROP PROCEDURE IF EXISTS listpropertiepublic;


DELIMITER //
CREATE PROCEDURE listpropertiepublic(viduser int,vstate int, vareamax int, vvalorMax int, 
             vcity int, vbarrio int, vzone int, vpropertietype int, 
            voffertype int, vestrato int, vascensor int, vpiscina int, vroom int, 
            vbath int, vparking int)
COMMENT 'Procedimiento que lista los inmuebles para la pagina web'
BEGIN

   select DISTINCT  inm.idinmueble as id, tip_inm.`nombreTipoInmueble` as tipo,
               tip_ofer.`nombreTipoOferta` as oferta, inm.precio as precio, ciud.`nombreCiudad` as ciudad, 
               zon.`nombreZona` as zona, bar.`nombreBarrio` as barrio, loadimagepropertie(inm.idinmueble) as imagen, 
               inm.habitaciones as habitaciones, inm.parqueaderos as parqueaderos, 
               inm.`areaTotal` as area, tip.`nombreTipoInmueble` as tipoinmueble
   from inmuebles as inm 
        inner join tiposinmuebles as tip_inm on inm.`tiposInmuebles_idtipoInmueble` = tip_inm.`idtipoInmueble` 
        inner join tiposofertas as tip_ofer on inm.`tiposOfertas_idtipoOferta` = tip_ofer.`idtipoOferta` 
        inner join ciudades as ciud on inm.ciudades_idciudad = ciud.idciudad 
        inner join zonas as zon on inm.zonas_idzona = zon.idzona 
        inner join barrios as bar on inm.barrios_idbarrio = bar.idbarrio
        inner join tiposinmuebles as tip on inm.`tiposInmuebles_idtipoInmueble` = tip.`idtipoInmueble` 
        inner join estratos as estrato on inm.estratos_idestrato = estrato.idestrato 
    where (case when vareamax>0 then inm.`areaTotal` <= vareamax ELSE TRUE END ) AND        
          (case when vvalorMax>0 then inm.precio <= vvalorMax  ELSE TRUE END ) AND
          (case when vstate>-1 then ciud.Departamentos_idDepartamento = vstate  ELSE TRUE END ) AND
          (case when vcity>-1 then ciud.idciudad = vcity  ELSE TRUE END ) AND
          (case when vbarrio>-1 then bar.idbarrio = vbarrio  ELSE TRUE END ) AND
          (case when vzone>-1 then zon.idzona = vzone  ELSE TRUE END ) AND
          (case when vpropertietype>-1 then tip.idtipoInmueble  = vpropertietype  ELSE TRUE END ) AND 
          (case when voffertype>-1 then tip_ofer.idtipoOferta  = voffertype  ELSE TRUE END ) AND 
          (case when vestrato>-1 then estrato.idestrato = vestrato  ELSE TRUE END ) AND
          (case when vascensor=1 then inm.ascensor = vascensor  ELSE TRUE END ) AND
          (case when vpiscina=1 then inm.piscina = vpiscina  ELSE TRUE END ) AND
          (case when vroom>-1 then inm.habitaciones = vroom  ELSE TRUE END ) AND 
          (case when vbath>-1 then inm.banos = vbath  ELSE TRUE END ) AND 
          (case when vparking>-1 then inm.parqueaderos = vparking  ELSE TRUE END )




   order by inm.`fechaRecepcion`;
END//

DELIMITER ;