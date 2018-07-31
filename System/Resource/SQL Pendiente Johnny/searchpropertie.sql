DROP PROCEDURE IF EXISTS searchpropertie;

DELIMITER //
CREATE  PROCEDURE searchpropertie(vid int)
    COMMENT 'Procedimiento que carga la informacion de un inmueble'
BEGIN
 	
	SELECT inm.idinmueble as id,
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
               inm.fechaPublicación as fecha_publicacion,
               inm.fechaRecepcion as fecha_recepcion,
               inm.tiposDestacados_idtipoDestacado as id_tipo_destacado,
               inm.linderosInmueble as linderos_inmbueble,
               inm.matriculaInmobiliaria as matricula_inmobiliaria,
               inm.avaluoCatastral as avaluo_catastral,
               inm.piscina as piscina,
               inm.zonaMascotas as zona_mascotas,
               inm.parqueaderoCubierto as parqueadero_cubierto,
               inm.amoblado as amoblado,
               ciu.`Departamentos_idDepartamento` as id_departamento
	FROM inmuebles as inm
        inner join ciudades as ciu on inm.ciudades_idciudad = ciu.idciudad
	where idinmueble = vid;	
	
END//

DELIMITER ;