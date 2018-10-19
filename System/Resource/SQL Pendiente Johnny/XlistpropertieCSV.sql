
DROP PROCEDURE IF EXISTS listpropertiecsv;

DELIMITER //
CREATE  PROCEDURE listpropertiecsv(idfilter int)
    COMMENT 'Procedimiento que carga la informacion de todos los inmuebles para exportarla a un fichero CSV'
BEGIN
 	
	SELECT distinct                 
               inm.matriculaInmobiliaria as matricula_inmobiliaria,
               inm.precio as precio,
               inm.costoAdministracion as costo_administracion,
               inm.habitaciones as habitaciones,
               inm.banos as banios,
               inm.parqueaderos as parqueaderos,
               inm.areaTotal as area_total,
               inm.areaSinBalcones as area_sin_balcones,
               inm.anoDeConstruccion as anio_de_construccion,
               inm.numeroPiso as numero_piso,
               CASE WHEN inm.chimenea = 1 THEN 'Si' ELSE 'No' END as chimenea,  
               CASE WHEN inm.estudio = 1 THEN 'Si' ELSE 'No' END as estudio,
               CASE WHEN inm.deposito= 1 THEN 'Si' ELSE 'No' END  as deposito,
               CASE WHEN inm.zonaRopas= 1 THEN 'Si' ELSE 'No' END  as zona_ropas,
               CASE WHEN inm.parqueaderoVisitante= 1 THEN 'Si' ELSE 'No' END  as parqueadero_visitantes,
               CASE WHEN inm.ascensor= 1 THEN 'Si' ELSE 'No' END  as ascensor,
               CASE WHEN inm.terraza= 1 THEN 'Si' ELSE 'No' END  as terraza,
               CASE WHEN inm.transportePublicoCercano= 1 THEN 'Si' ELSE 'No' END  as transporte_publico_cercano,
               CASE WHEN inm.precioNegociable= 1 THEN 'Si' ELSE 'No' END  as precio_negociable,
               inm.latitud as latitud,
               inm.longitud as longitud,
               CASE WHEN inm.salonComunal= 1 THEN 'Si' ELSE 'No' END  as salon_comunal,
               CASE WHEN inm.sauna= 1 THEN 'Si' ELSE 'No' END  as sauna,
               CASE WHEN inm.turco= 1 THEN 'Si' ELSE 'No' END  as turco,
               CASE WHEN inm.jacuzzi = 1 THEN 'Si' ELSE 'No' END as jacuzzi,
               CASE WHEN inm.zonaInfantil= 1 THEN 'Si' ELSE 'No' END  as zona_infantil,
               CASE WHEN inm.jardines= 1 THEN 'Si' ELSE 'No' END  as jardines,
               CASE WHEN inm.duplex = 1 THEN 'Si' ELSE 'No' END as duplex,
               CASE WHEN inm.puertaDeSeguridad = 1 THEN 'Si' ELSE 'No' END  as puerta_de_seguridad,
               CASE WHEN inm.gimnasio= 1 THEN 'Si' ELSE 'No' END  as gimnasio,
               inm.clientes_cedulaCliente as cedula_cliente,
               inm.fechaPublicacion as fecha_publicacion,
               inm.fechaRecepcion as fecha_recepcion,
               inm.linderosInmueble as linderos_inmbueble,               
               inm.avaluoCatastral as avaluo_catastral,
               CASE WHEN inm.piscina= 1 THEN 'Si' ELSE 'No' END  as piscina,
               CASE WHEN inm.zonaMascotas = 1 THEN 'Si' ELSE 'No' END as zona_mascotas,
               CASE WHEN inm.parqueaderoCubierto= 1 THEN 'Si' ELSE 'No' END  as parqueadero_cubierto,
               CASE WHEN inm.amoblado= 1 THEN 'Si' ELSE 'No' END  as amoblado,
               dep.`nombreDepartamento` as nombre_departamento,
               ciu.`nombreCiudad` as nombre_ciudad,
               bar.`nombreBarrio` as nombre_barrio,
               estr.`nombreEstrato` as nombre_estrato,
               tipinm.`nombreTipoInmueble` as nombre_tipo_inmueble,
               tipofer.`nombreTipoOferta` as nombre_tipo_oferta,
               tipcort.`nombreTipoCortina` as nombre_tipo_cortina,
               tipvig.`nombreTipoVigilancia` as nombre_tipo_vigilancia,
               zon.`nombreZona` as nombre_zona,
               tipvist.`nombreTipoVista` as nombre_tipo_vista,
               tipcoc.`nombreTipoCocina` as nombre_tipo_cocina,
               estcoc.`nombreEstructuraCocina` as nombre_estructura_cocina,
               tipis.`nombreTipoPiso` as nombre_tipo_piso,
               tipdest.`nombreDestacado` as nombre_tipo_destacado,
               loadimagepropertie(inm.idinmueble) as imagen          
	FROM inmuebles as inm        
        inner join barrios as bar on bar.`idbarrio` = inm.barrios_idbarrio
        inner join ciudades as ciu on inm.ciudades_idciudad = ciu.idciudad        
        inner join departamentos as dep on ciu.`Departamentos_idDepartamento` = dep.`idDepartamento`        
        inner join estratos as estr on estr.idestrato = inm.estratos_idestrato
        inner join tiposinmuebles as tipinm on tipinm.`idtipoInmueble` = inm.`tiposInmuebles_idtipoInmueble`
        inner join tiposofertas as tipofer on tipofer.`idtipoOferta` = inm.`tiposOfertas_idtipoOferta`
        inner join tiposcortinas as tipcort on tipcort.`idtipoCortina` = inm.`tiposCortinas_idtipoCortina`
        inner join tiposvigilancias as tipvig on tipvig.`idtipoVigilancia` = inm.`tiposVigilancias_idtipoVigilancia`
        inner join zonas as zon on zon.idzona = inm.zonas_idzona
        inner join tiposvistas as tipvist on tipvist.`idtipoVista` = inm.`tiposVistas_idtipoVista`
        inner join tiposcocinas as tipcoc on tipcoc.`idtipoCocina` = inm.`tiposCocinas_idtipoCocina`
        inner join estructurascocinas as estcoc on estcoc.`idestructuraCocina` = inm.`estructurasCocinas_idestructuraCocina`
        inner join tipospisos as tipis on tipis.`idtipoPiso` = inm.`tiposPisos_idtipoPiso`
        inner join tiposdestacados as tipdest on tipdest.`idtipoDestacado` = inm.`tiposDestacados_idtipoDestacado`      	
        where (case when idfilter>0 then inm.`clientes_cedulaCliente` = idfilter ELSE TRUE END );
	
END//

DELIMITER ;