
DROP PROCEDURE IF EXISTS searchpropertie;

DELIMITER //
CREATE  PROCEDURE searchpropertie(vid int)
    COMMENT 'Procedimiento que carga la informacion de un inmueble'
BEGIN
 	
	SELECT distinct inm.idinmueble as id,
               inm.precio as precio,
               inm.costoAdministracion as costo_administracion,
               inm.habitaciones as habitaciones,
               inm.banos as banios,
               inm.parqueaderos as parqueaderos,
               inm.areaTotal as area_total,
               inm.areaSinBalcones as area_sin_balcones,
               inm.anoDeConstruccion as anio_de_construccion,
               inm.numeroPiso as numero_piso,
               inm.chimenea as chimenea,
               inm.estudio as estudio,
               inm.deposito as deposito,
               inm.zonaRopas as zona_ropas,
               inm.parqueaderoVisitante as parqueadero_visitantes,
               inm.ascensor as ascensor,
               inm.terraza as terraza,
               inm.transportePublicoCercano as transporte_publico_cercano,
               inm.precioNegociable as precio_negociable,
               inm.latitud as latitud,
               inm.longitud as longitud,
               inm.salonComunal as salon_comunal,
               inm.sauna as sauna,
               inm.turco as turco,
               inm.jacuzzi as jacuzzi,
               inm.zonaInfantil as zona_infantil,
               inm.jardines as jardines,
               inm.duplex as duplex,
               inm.puertaDeSeguridad as puerta_de_seguridad,
               inm.gimnasio as gimnasio,
               inm.ciudades_idciudad as id_ciudad,
               inm.estratos_idestrato as id_estrato,
               inm.tiposInmuebles_idtipoInmueble as id_tipo_inmueble,
               inm.tiposOfertas_idtipoOferta as id_tipo_oferta,
               inm.tiposCortinas_idtipoCortina as id_tipo_cortina,
               inm.tiposVigilancias_idtipoVigilancia as id_tipo_vigilancia,
               inm.zonas_idzona as id_zona,
               inm.tiposVistas_idtipoVista as id_tipo_vista,
               inm.barrios_idbarrio as id_barrio,               
               inm.tiposCocinas_idtipoCocina as id_tipo_cocina,
               inm.estructurasCocinas_idestructuraCocina as id_estructura_cocina,
               inm.tiposPisos_idtipoPiso as id_tipo_piso,
               inm.clientes_cedulaCliente as cedula_cliente,
               inm.fechaPublicacion as fecha_publicacion,
               inm.fechaRecepcion as fecha_recepcion,
               inm.tiposDestacados_idtipoDestacado as id_tipo_destacado,
               inm.linderosInmueble as linderos_inmbueble,
               inm.matriculaInmobiliaria as matricula_inmobiliaria,
               inm.avaluoCatastral as avaluo_catastral,
               inm.piscina as piscina,
               inm.zonaMascotas as zona_mascotas,
               inm.parqueaderoCubierto as parqueadero_cubierto,
               inm.amoblado as amoblado,
               ciu.`Departamentos_idDepartamento` as id_departamento,
               dep.`nombreDepartamento` as nombre_departamento,
               ciu.`nombreCiudad` as nombre_ciudad,
               bar.`nombreBarrio` as nombre_barrio,
               estr.`nombreEstrato` as nombre_estrato,
               tipinm.`nombreTipoInmueble` as nombre_tipo_inmueble,
               tipofer.`nombreTipoOferta` as nombre_tipo_oferta,
               tipcort.`nombreTipoCortina` as nombre_tipo_cortina,
               tipvig.`nombreTipoVigilancia` as nombre_tipo_vigilancia,
               zon.`nombreZona` as nombre_zona,
               inm.estado_idestado as estado,
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
	where idinmueble = vid;	
	
END//

DELIMITER ;