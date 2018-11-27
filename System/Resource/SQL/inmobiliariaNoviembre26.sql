-- phpMyAdmin SQL Dump
-- version 4.8.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 24-11-2018 a las 00:05:37
-- Versión del servidor: 10.1.34-MariaDB
-- Versión de PHP: 7.2.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `hexagono_inmobiliaria`
--

DELIMITER $$
--
-- Procedimientos
--
CREATE PROCEDURE `listclient` (`iduser` INT)  BEGIN







   select cli.idCliente,cli.numeroIdentificacion as numero_identificacion, cli.primerNombreCliente as primer_nombre, 







          cli.segundoNombreCliente as segundo_nombre, cli.primerApellidoCliente as primer_apellido, 







          cli.segundoApellidoCliente as segundo_apellido,  







          tip.`nombreTipoPersonaCliente` as tipo_persona







   from clientes as cli inner join tipopersonacliente as tip 







   on cli.`tipoPersonaCliente_idtipoPersonCliente` = tip.`idtipoPersonCliente`







   order by primerApellidoCliente;







END$$

CREATE PROCEDURE `listcontract` (`idEmpleado` INT)  BEGIN
  select con.idcontratoEmpleado as id, CONCAT(empl.primerNombreEmpleado, ' ', 
							empl.segundoNombreEmpleado, ' ', empl.primerApellidoEmpleado , ' ', 
							empl.segundoApellidoEmpleado) as nombre,

          tip.nombreContratoEmpleado as tipo_contrato, con.fechaInicio as fecha_inicio,
		  
		  
		  CASE con.fechaTerminacion
				WHEN '1970-01-01' THEN 'Indefinido'
				ELSE con.fechaTerminacion
				
			END "fecha_terminacion",
			
			car.nombretipocargo as cargo

   from contratoempleado as con inner join empleados as empl 

   on con.empleados_idempleado = empl.idempleado 
   
   inner join tipocontratoempleado as tip on con.tipocontratoempleado_idtipoContratoEmpleado = tip.idtipoContratoEmpleado
   
   inner join cargos as car on con.cargos_idCargo = car.idCargo
   
   order by nombre;
END$$

CREATE PROCEDURE `listcontractpropertie` (`idcontrato` INT)  BEGIN
  select con.idcontrato as id, CONCAT(cli.primerNombreCliente, ' ', 
							cli.segundoNombreCliente, ' ', cli.primerApellidoCliente , ' ', 
							cli.segundoApellidoCliente) as cliente,
			inm.matriculainmobiliaria as matricula,
		  
		  con.fechainicioContrato as fecha_inicio,
		  con.fechafinContrato as fecha_fin,
		  con.valorcontrato as valor_contrato

   from contratos as con inner join clientes as cli 

   on con.idcliente = cli.idCliente 
   
   inner join inmuebles as inm on con.inmuebles_idinmueble = inm.idinmueble
   
   order by cliente;
END$$

CREATE PROCEDURE `listdebtor` (`idDebtor` INT)  BEGIN
   select deu.idDeudor,deu.numeroIdentificacion as numero_identificacion, deu.primerNombreDeudor as primer_nombre, 
          deu.segundoNombreDeudor as segundo_nombre, deu.primerApellidoDeudor as primer_apellido, 
          deu.segundoApellidoDeudor as segundo_apellido, deu.direccionResidenciaDeudor as direccion,
		  deu.telefonoMovilDeudor as celular, deu.correoDeudor
   from deudorSolidario as deu 
   order by primerApellidoDeudor;
END$$

CREATE PROCEDURE `listdependent` (`idCliente` INT)  BEGIN




  select cli.idCliente,cli.numeroIdentificacion as numero_identificacion, cli.primerNombreCliente as primer_nombre, 









          cli.segundoNombreCliente as segundo_nombre, cli.primerApellidoCliente as primer_apellido, 









          cli.segundoApellidoCliente as segundo_apellido,  









          tip.`nombreTipoPersonaCliente` as tipo_persona









   from clientes as cli inner join tipopersonacliente as tip 









   on cli.`tipoPersonaCliente_idtipoPersonCliente` = tip.`idtipoPersonCliente` 




   




   where tip.nombreTipoPersonaCliente ="Natural"









   order by primerApellidoCliente;




END$$

CREATE PROCEDURE `listemployee` (`idemployee` INT)  BEGIN
   select empl.idEmpleado,empl.cedulaEmpleado as numero_identificacion, empl.primerNombreEmpleado as primer_nombre, 
          empl.segundoNombreEmpleado as segundo_nombre, empl.primerApellidoEmpleado as primer_apellido, 
          empl.segundoApellidoEmpleado as segundo_apellido,  
          tip.`nombreTipoEmpleado` as tipo_empleado
   from Empleados as empl inner join tiposEmpleados as tip 
   on empl.`idTipoEmpleado` = tip.`idtipoEmpleado`
   order by primerApellidoEmpleado;
END$$

CREATE PROCEDURE `listevent` (`idfilter` INT)  BEGIN
   select eve.ideventoCliente,eve.fechaEvento as fecha_evento, eve.horaEvento as hora_evento, 
          eve.lugarEvento as lugar_evento,  
          CONCAT(cli.primerNombreCliente, ' ', 
		cli.segundoNombreCliente, ' ', cli.primerApellidoCliente,  ' ', 
		cli.segundoApellidoCliente) as nombreCliente 
   from eventosclientes as eve inner join clientes as cli 
   on eve.clientes_cedulaCliente = cli.idCliente
   where (case when idfilter>0 then eve.clientes_cedulaCliente = idfilter ELSE TRUE END )
   order by eve.fechaEvento;
END$$

CREATE PROCEDURE `listexperience` (`idEmpleado` INT)  BEGIN


  select exp.idExperienciaEmpleado as id, CONCAT(empl.primerNombreEmpleado, ' ', 


							empl.segundoNombreEmpleado, ' ', empl.primerApellidoEmpleado , ' ', 


							empl.segundoApellidoEmpleado) as nombre,





          exp.empresa as empresa, exp.fechaIngreso as fecha_ingreso, exp.fechaSalida as fecha_salida


		  





   from experienciaempleado as exp inner join empleados as empl 





   on exp.empleados_idempleado = empl.idempleado


   


   order by nombre;


END$$

CREATE PROCEDURE `listfeaturedpropertie` (`vfilter` INT)  BEGIN

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
END$$

CREATE PROCEDURE `listformation` (`vid` INT)  BEGIN
  select frm.idformacionEmpleado as id, CONCAT(empl.primerNombreEmpleado, ' ', 
							empl.segundoNombreEmpleado, ' ', empl.primerApellidoEmpleado , ' ', 
							empl.segundoApellidoEmpleado) as nombre,

          frm.institucionEducacion as institucion, pro.nombreProfesion as profesion, 
			CASE frm.graduado
				WHEN 0 THEN 'No'
				WHEN 1 THEN 'Si'
			END "graduado"
   from formacionempleado as frm inner join empleados as empl 
   on frm.empleados_idempleado = empl.idempleado inner join profesiones as pro 
   on frm.profesiones_idprofesion = pro.idProfesion
   
   order by nombre;
END$$

CREATE PROCEDURE `listimagepropertie` (`vid` INT)  BEGIN
 	
	SELECT img.rutaImagen as url_file, img.`idInmueble` as id_inmueble             
	FROM imageninmueble  as img
	where img.idInmueble = vid
        ORDER By img.rutaImagen asc;	
	
END$$

CREATE PROCEDURE `listindependent` (`idCliente` INT)  BEGIN




  select cli.idCliente,cli.numeroIdentificacion as numero_identificacion, cli.primerNombreCliente as primer_nombre, 









          cli.segundoNombreCliente as segundo_nombre, cli.primerApellidoCliente as primer_apellido, 









          cli.segundoApellidoCliente as segundo_apellido,  









          tip.`nombreTipoPersonaCliente` as tipo_persona









   from clientes as cli inner join tipopersonacliente as tip 









   on cli.`tipoPersonaCliente_idtipoPersonCliente` = tip.`idtipoPersonCliente` 




   




   where tip.nombreTipoPersonaCliente ="Natural"









   order by primerApellidoCliente;




END$$

CREATE PROCEDURE `listnoticia` (IN `iduser` INT)  BEGIN







   select id,titulo as titulo_noticia,descripcion ,fecha,foto as ruta_foto,video as ruta_video







   from noticia







   order by fecha desc;







END$$

CREATE PROCEDURE `listpqrs` (`idfilter` INT)  BEGIN
   select pqr.idPQRS as id, tip.nombretipopqrs,pqr.fechaPQRS as fechaPQRS, CONCAT(cli.primerNombreCliente, ' ', 
							cli.segundoNombreCliente, ' ', cli.primerApellidoCliente , ' ', 
							cli.segundoApellidoCliente) as cliente, pqr.descripcionPQRS as descripcionPQRS,
		pqr.respuestaDada as respuestaDada
   from pqrs as pqr inner join tipopqrs as tip 
   on tip.idtipopqrs = pqr.idtipopqrs inner join clientes as cli 
   on pqr.idusuario = cli.idCliente 
   order by pqr.fechaPQRS;
END$$

CREATE PROCEDURE `listprofession` (`iduser` INT)  BEGIN







   select p.idprofesion,p.nombreProfesion as nombre_profesion, np.nombreNivelProfesion as nivel_profesional







   from profesiones as p inner join  nivelprofesion as np on 







   p.nivelProfesion_idnivelProfesion = np.idnivelProfesion







   order by p.nombreProfesion;







END$$

CREATE PROCEDURE `listpropertie` (`idfilter` INT)  BEGIN
    select inm.idinmueble as id, 
            CONCAT(cli.primerNombreCliente, ' ', cli.segundoNombreCliente, ' ', 
                    cli.primerApellidoCliente , ' ', cli.segundoApellidoCliente) as nombre,
           inm.`matriculaInmobiliaria` as matricula, 
           tip_inm.`nombreTipoInmueble` as tipo,
           tip_ofer.`nombreTipoOferta` as oferta, 
           inm.precio as precio, 
           ciud.`nombreCiudad` as ciudad, 
           zon.`nombreZona` as zona, 
           inm.`fechaRecepcion` as fecha, 
           est.`nombreEstado` as estado
   from inmuebles as inm 
        inner join clientes as cli on inm.clientes_cedulaCliente = cli.`idCliente` 
        inner join tiposinmuebles as tip_inm on inm.`tiposInmuebles_idtipoInmueble` = tip_inm.`idtipoInmueble` 
        inner join tiposofertas as tip_ofer on inm.`tiposOfertas_idtipoOferta` = tip_ofer.`idtipoOferta` 
        inner join ciudades as ciud on inm.ciudades_idciudad = ciud.idciudad 
        inner join zonas as zon on inm.zonas_idzona = zon.idzona 
        inner join estados as est on inm.estado_idestado = est.idestado
      where (case when idfilter>0 then inm.`clientes_cedulaCliente` = idfilter ELSE TRUE END )

   order by inm.`fechaRecepcion`;
END$$

CREATE PROCEDURE `listpropertiecsv` (`idfilter` INT)  BEGIN
 	
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
	
END$$

CREATE PROCEDURE `listpropertiepublic` (`viduser` INT, `vstate` INT, `vareamax` INT, `vvalorMax` INT, `vcity` INT, `vbarrio` INT, `vzone` INT, `vpropertietype` INT, `voffertype` INT, `vestrato` INT, `vascensor` INT, `vpiscina` INT, `vroom` INT, `vbath` INT, `vparking` INT, `vnombrebarriociudad` VARCHAR(50))  BEGIN

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
          (case when vparking>-1 then inm.parqueaderos = vparking  ELSE TRUE END ) AND
          (case when vnombrebarriociudad<>'' then (ciud.nombreCiudad LIKE concat('%',vnombrebarriociudad,'%') OR bar.nombreBarrio LIKE concat('%',vnombrebarriociudad,'%') ) ELSE TRUE END ) AND          
          inm.estado_idestado = 22
   order by inm.`fechaRecepcion`;
END$$

CREATE PROCEDURE `listreference` (`idreferenciapersonalfamiliar` INT)  BEGIN
  select refe.idreferenciapersonalfamiliar as id, CONCAT(cli.primerNombreCliente, ' ', 
							cli.segundoNombreCliente, ' ', cli.primerApellidoCliente , ' ', 
							cli.segundoApellidoCliente) as cliente,

          tip.nombretiporeferencia as tipo_referencia, CONCAT(refe.nombresReferencia, ' ', 
							refe.apellidosReferencia) as referencia

   from referenciapersonalfamiliar as refe inner join clientes as cli 

   on refe.clientes_idCliente = cli.idCliente 
   
   inner join tiporeferencia as tip on refe.tiporeferencia_idtiporeferencia = tip.idtipoReferencia
   
   order by cliente;
END$$

CREATE PROCEDURE `listreferencebank` (`idreferenciabancaria` INT)  BEGIN
  select refe.idreferenciabancaria as id, CONCAT(cli.primerNombreCliente, ' ', 
							cli.segundoNombreCliente, ' ', cli.primerApellidoCliente , ' ', 
							cli.segundoApellidoCliente) as cliente,

          ban.nombrebanco as banco

   from referenciabancaria as refe inner join clientes as cli 

   on refe.clientes_idCliente = cli.idCliente 
   
   inner join bancos as ban on refe.bancos_idbanco = ban.idbanco
   
   order by cliente;
END$$

CREATE PROCEDURE `listrol` (`iduser` INT)  BEGIN







   select id,nombre as nombre_rol,descripcion 







   from rol







   order by nombre;







END$$

CREATE PROCEDURE `listspouse` (`idconyugue` INT)  BEGIN
  select con.idconyugue as id, CONCAT(con.nombresConyugue, ' ', 
							con.apellidosConyugue) as nombres,
		  
		  con.telefonoMovilConyugue as celular,
		  con.correoElectronicoConyugue as correo,
		  
		  CONCAT(cli.primerNombreCliente, ' ', 
							cli.segundoNombreCliente, ' ', cli.primerApellidoCliente , ' ', 
							cli.segundoApellidoCliente) as cliente

   from conyugues as con inner join clientes as cli 

   on con.clientes_idCliente = cli.idCliente 
   
   order by cliente;
END$$

CREATE PROCEDURE `listuser` (`iduser` INT)  BEGIN







   







	SELECT us.id, us.primer_nombre as primer_nombre, us.primer_apellido as primer_apellido, us.usuario as nickname, r.nombre as rol, 







	       us.descripcion as descripcion







	FROM usuario as us







	INNER JOIN rol as r on r.id = us.rol







	ORDER BY us.primer_nombre;















END$$

CREATE PROCEDURE `listvideopropertie` (`vid` INT)  BEGIN
 	
	SELECT rutaVideo as dinamic_data              
	FROM videoinmueble       
	where idInmueble = vid;	
	
END$$

CREATE PROCEDURE `loadactivityeconomic` (IN `idfilter` INT)  BEGIN




 




	IF idfilter > -1 THEN




	




		select 	idtipoLaborArrendatario  as id,nombreTipoLaboraArrendatario  as nombre




		from tipoactividadeconomicaarrendatario                




		ORDER BY nombreTipoLaboraArrendatario;




		




        ELSE	




	




		select 	idtipoLaborArrendatario  as id,nombreTipoLaboraArrendatario  as nombre




		from tipoactividadeconomicaarrendatario                




		ORDER BY nombreTipoLaboraArrendatario;




	




        END IF;




END$$

CREATE PROCEDURE `loadallmenu` ()  BEGIN







   







	select m.id,m.nombre,m.codigo,m.padre as codpadre,m2.nombre as nombrepadre,m.prioridad







	from menu as m







	left JOIN menu as m2 on m.padre = m2.id	







	order by m.prioridad;















END$$

CREATE PROCEDURE `loadapage` (IN `vpage` VARCHAR(2000), IN `vrol` INT)  BEGIN







   







	select m.codigo







	from menu as m 	







	inner join menu_rol as mr on mr.idmenu = m.id







	where mr.idrol = vrol AND m.codigo = vpage;	















END$$

CREATE PROCEDURE `loadarea` (IN `idfilter` INT)  BEGIN
 
	IF idfilter > -1 THEN
	
		select 	idareaEmpresa as id,nombreArea  as nombre
		from areaempresa                
		ORDER BY nombre;
		
        ELSE	
	
		select 	idareaEmpresa as id,nombreArea  as nombre
		from areaempresa                
		ORDER BY nombre;
	
        END IF;
END$$

CREATE PROCEDURE `loadareamaximainmueble` (IN `idfilter` INT)  BEGIN
 
	IF idfilter > -1 THEN
	
		select MAX(inm.	areaTotal) as area
		from inmuebles as inm;	
		
        ELSE		
		select MAX(inm.	areaTotal) as area
		from inmuebles as inm;		
	
        END IF;
END$$

CREATE PROCEDURE `loadarl` (IN `idfilter` INT)  BEGIN


 


	IF idfilter > -1 THEN


	


		select 	idarl id,nombreArl as nombre


		from  arl                


		ORDER BY nombre;


		


        ELSE	


	


	select 	idarl id,nombreArl as nombre


		from  arl                


		ORDER BY nombre;


	


        END IF;


END$$

CREATE PROCEDURE `loadbank` (IN `idfilter` INT)  BEGIN
 
	IF idfilter > -1 THEN
	
		select idbanco as id,nombrebanco as nombre
		from bancos                
		ORDER BY nombre;
		
        ELSE	
	
		select idbanco as id,nombrebanco as nombre
		from bancos                
		ORDER BY nombre;
	
        END IF;
END$$

CREATE PROCEDURE `loadbloodtype` (IN `idfilter` INT)  BEGIN


 


	IF idfilter > -1 THEN


	


		select 	idtipoSangre  as id,tipoSangre  as nombre


		from tiposangre                


		ORDER BY nombre;


		


        ELSE	


	


	select 	idtipoSangre  as id,tipoSangre  as nombre


		from tiposangre                


		ORDER BY nombre;


	


        END IF;


END$$

CREATE PROCEDURE `loadcity` (IN `idfilter` INT)  BEGIN







 







	IF idfilter > -1 THEN







	







		select idciudad as id,nombreCiudad as nombre







		from ciudades







                where Departamentos_idDepartamento = idfilter







		ORDER BY nombreCiudad;







		







        ELSE	







	







		select idciudad as id,nombreCiudad as nombre







		from ciudades







		ORDER BY nombreCiudad;







	







        END IF;







END$$

CREATE PROCEDURE `loadclient` (IN `idfilter` INT)  BEGIN







 







	IF idfilter > -1 THEN







	







		select idCliente as id,CONCAT(primerNombreCliente, ' ', 







		segundoNombreCliente, ' ', primerApellidoCliente,  ' ', 







		segundoApellidoCliente) as nombre







		from Clientes                







		ORDER BY nombre;







		







        ELSE	







	







		select idCliente as id,CONCAT(primerNombreCliente, ' ', 







		segundoNombreCliente, ' ', primerApellidoCliente , ' ', 







		segundoApellidoCliente) as nombre







		from Clientes                







		ORDER BY nombre;







	







        END IF;







END$$

CREATE PROCEDURE `loadclientType` (IN `idfilter` INT)  BEGIN







 







	IF idfilter > -1 THEN







	







		select idtipoCliente as id,	nombreTipoCliente as nombre







		from tiposClientes                







		ORDER BY 	nombreTipoCliente;







		







        ELSE	







	







		select 	idtipoCliente as id,	nombreTipoCliente as nombre







		from tiposClientes







		ORDER BY 	nombreTipoCliente;







	







        END IF;







END$$

CREATE PROCEDURE `loadclienttypeselected` (IN `idfilter` INT)  BEGIN







 







	IF idfilter > -1 THEN







	







		select tiposClientes_idtipoCliente as id







		from detalleclientestipoclientes       







		where clientes_cedulaCliente = idfilter;







		







        ELSE	







	







		select tiposClientes_idtipoCliente as id







		from detalleclientestipoclientes;







	







        END IF;







END$$

CREATE PROCEDURE `loadcompensationbox` (IN `idfilter` INT)  BEGIN


 


	IF idfilter > -1 THEN


	


		select 	idcajaCompensacion id,nombreCajaCompensacion as nombre


		from  cajacompensacion                


		ORDER BY nombre;


		


        ELSE	


	


	select 	idcajaCompensacion id,nombreCajaCompensacion as nombre


		from  cajacompensacion                


		ORDER BY nombre;


	


        END IF;


END$$

CREATE PROCEDURE `loadcontractType` (IN `idfilter` INT)  BEGIN
	IF idfilter > -1 THEN
		select idobjetoContrato as id,	nombreObjetoContrato as nombre
		from objetoscontratos	                
		ORDER BY nombreObjetoContrato;
        ELSE	
		select idobjetoContrato as id,	nombreObjetoContrato as nombre
		from objetoscontratos	                
		ORDER BY nombreObjetoContrato;
        END IF;
END$$

CREATE PROCEDURE `loadcurtaintype` (IN `idfilter` INT)  BEGIN


 


	IF idfilter > -1 THEN


	


		select 	        idtipoCortina  as id,        nombreTipoCortina  as nombre


		from         tiposcortinas                    


		ORDER BY         nombreTipoCortina;


		


        ELSE	


	


		select 	        idtipoCortina  as id,        nombreTipoCortina  as nombre


		from         tiposcortinas                


		ORDER BY         nombreTipoCortina;


	


        END IF;


END$$

CREATE PROCEDURE `loaddebtor` (IN `idfilter` INT)  BEGIN
 
	IF idfilter > -1 THEN
	
		select 	idDeudor as id,CONCAT(numeroIdentificacion, '-',primerNombreDeudor, ' ', 
		segundoNombreDeudor, ' ', primerApellidoDeudor,  ' ', 
		segundoApellidoDeudor) as nombre 
		from deudorSolidario                
		ORDER BY nombre;
		
        ELSE	
	
		select 	idDeudor as id,CONCAT(numeroIdentificacion, '-',primerNombreDeudor, ' ', 
		segundoNombreDeudor, ' ', primerApellidoDeudor,  ' ', 
		segundoApellidoDeudor) as nombre 
		from deudorSolidario                
		ORDER BY nombre;
	
        END IF;
END$$

CREATE PROCEDURE `loaddepartment` (IN `idfilter` INT)  BEGIN







 







	IF idfilter > -1 THEN







	







		select iddepartamento as id,nombredepartamento as nombre







		from departamentos







		ORDER BY nombredepartamento;







		







        ELSE	







	







		select iddepartamento as id,nombredepartamento as nombre







		from departamentos







		ORDER BY nombredepartamento;







	







        END IF;







END$$

CREATE PROCEDURE `loademployee` (IN `idfilter` INT)  BEGIN







 







	IF idfilter > -1 THEN







	







		select idEmpleado as id,CONCAT(primerNombreEmpleado, ' ', 







		segundoNombreEmpleado, ' ', primerApellidoEmpleado,  ' ', 







		segundoApellidoEmpleado) as nombre







		from Empleados                







		ORDER BY nombre;







		







        ELSE	







	







		select idEmpleado as id,CONCAT(primerNombreEmpleado, ' ', 







		segundoNombreEmpleado, ' ', primerApellidoEmpleado , ' ', 







		segundoApellidoEmpleado) as nombre







		from Empleados                







		ORDER BY nombre;







	







        END IF;







END$$

CREATE PROCEDURE `loademployeeselected` (IN `idfilter` INT)  BEGIN









 









	IF idfilter > -1 THEN









	









		select det.empleados_idempleado as id,




        		concat(emp.primerNombreEmpleado, ' ', 




		segundoNombreEmpleado, ' ', primerApellidoEmpleado,  ' ', 




		segundoApellidoEmpleado) as nombre 




		from detalleeventosempleados as det inner join empleados as emp




        on det.empleados_idempleado = emp.idempleado




		where eventosclientes_ideventoCliente = idfilter;




		




        ELSE	




	




		select det.empleados_idempleado as id,




        		concat(emp.primerNombreEmpleado, ' ', 




		segundoNombreEmpleado, ' ', primerApellidoEmpleado,  ' ', 




		segundoApellidoEmpleado) as nombre 




		from detalleeventosempleados as det inner join empleados as emp




        on det.empleados_idempleado = emp.idempleado;









	









        END IF;









END$$

CREATE PROCEDURE `loademployeesselected` (IN `idfilter` INT)  BEGIN 







	IF idfilter > -1 THEN







	







		select eventosclientes_ideventoCliente as id







		from detalleclientestipoclientes       







		where empleados_idempleado = idfilter;







		







        ELSE	







	







		select eventosclientes_ideventoCliente as id







		from detalleeventosempleados;







	







        END IF;







END$$

CREATE PROCEDURE `loadeps` (IN `idfilter` INT)  BEGIN


 


	IF idfilter > -1 THEN


	


		select 	ideps id,nombreEps as nombre


		from  eps                


		ORDER BY nombre;


		


        ELSE	


	


	select 	ideps id,nombreEps as nombre


		from  eps                


		ORDER BY nombre;


	


        END IF;


END$$

CREATE PROCEDURE `loadfloortype` (IN `idfilter` INT)  BEGIN


 


	IF idfilter > -1 THEN


	


		select 	   idtipoPiso  as id,   nombreTipoPiso  as nombre


		from       tipospisos                    


		ORDER BY    nombreTipoPiso;


		


        ELSE	


	


		select 	   idtipoPiso  as id,   nombreTipoPiso  as nombre


		from       tipospisos                


		ORDER BY    nombreTipoPiso;


	


        END IF;


END$$

CREATE PROCEDURE `loadgender` (IN `idfilter` INT)  BEGIN







 







	IF idfilter > -1 THEN







	







		select 	idGenero as id,nombreGenero as nombre







		from generos                







		ORDER BY nombreGenero;







		







        ELSE	







	







		select 	idGenero as id,nombreGenero as nombre







		from generos                       







		ORDER BY nombreGenero;







	







        END IF;







END$$

CREATE PROCEDURE `loadinmueblestopvisitas` (IN `idfilter` INT)  BEGIN
 
	IF idfilter > -1 THEN
	
		select inm.matriculaInmobiliaria, count(*) as totalvisitas
                from inmuebles as inm 
                inner join  audit_propertie_search as aud 
                on aud.	id_register = inm.idinmueble
                group by inm.matriculaInmobiliaria
                order by totalvisitas desc
                limit 5;

        ELSE		
		select inm.matriculaInmobiliaria, count(*) as totalvisitas
                from inmuebles as inm 
                inner join  audit_propertie_search as aud 
                on aud.	id_register = inm.idinmueble
                group by inm.matriculaInmobiliaria
                order by totalvisitas desc 
                limit 5;
	
        END IF;
END$$

CREATE PROCEDURE `loadkitchenstructure` (IN `idfilter` INT)  BEGIN


 


	IF idfilter > -1 THEN


	


		select 	  idestructuraCocina  as id,  nombreEstructuraCocina  as nombre


		from      estructurascocinas                    


		ORDER BY   nombreEstructuraCocina;


		


        ELSE	


	


		select 	  idestructuraCocina  as id,  nombreEstructuraCocina  as nombre


		from      estructurascocinas                


		ORDER BY   nombreEstructuraCocina;


	


        END IF;


END$$

CREATE PROCEDURE `loadkitchentype` (IN `idfilter` INT)  BEGIN


 


	IF idfilter > -1 THEN


	


		select 	  idtipoCocina  as id,  nombreTipoCocina  as nombre


		from      tiposcocinas                    


		ORDER BY   nombreTipoCocina;


		


        ELSE	


	


		select 	  idtipoCocina  as id,  nombreTipoCocina  as nombre


		from      tiposcocinas                


		ORDER BY   nombreTipoCocina;


	


        END IF;


END$$

CREATE PROCEDURE `loadmaritalstatus` (IN `idfilter` INT)  BEGIN







 







	IF idfilter > -1 THEN







	







		select idEstadoCivil  as id,nombreEstadoCivil  as nombre







		from estadoCivil                







		ORDER BY nombreEstadoCivil;







		







        ELSE	







	







		select idEstadoCivil  as id,nombreEstadoCivil  as nombre







		from estadoCivil                







		ORDER BY nombreEstadoCivil;







	







        END IF;







END$$

CREATE PROCEDURE `loadmenu` (IN `rol` INT)  BEGIN







   







	select m.id,m.nombre,m.codigo,m.padre as codpadre,m2.nombre as nombrepadre,mr.idrol,m.prioridad, m.icono as icono







	from menu as m







	left JOIN menu as m2 on m.padre = m2.id







	LEFT join menu_rol as mr on mr.idmenu = m.id







	where (mr.idrol = rol OR (m.padre = -1 AND (mr.idrol = rol OR mr.idrol IS NULL)))







	order by m.prioridad;







END$$

CREATE PROCEDURE `loadneighborhood` (IN `idfilter` INT)  BEGIN


 


	IF idfilter > -1 THEN


	


		select 	idbarrio  as id,nombreBarrio  as nombre


		from barrios       


                where idCiudad = idfilter


		ORDER BY nombreBarrio;


		


        ELSE	


	


		select 	idbarrio  as id,nombreBarrio  as nombre


		from barrios                


		ORDER BY nombreBarrio;


	


        END IF;


END$$

CREATE PROCEDURE `loadoffertype` (IN `idfilter` INT)  BEGIN


 


	IF idfilter > -1 THEN


	


		select 	    idtipoOferta  as id,    nombreTipoOferta  as nombre


		from     tiposofertas                    


		ORDER BY     nombreTipoOferta;


		


        ELSE	


	


		select 	    idtipoOferta  as id,    nombreTipoOferta  as nombre


		from     tiposofertas                


		ORDER BY     nombreTipoOferta;


	


        END IF;


END$$

CREATE PROCEDURE `loadoutstandingtype` (IN `idfilter` INT)  BEGIN


 


	IF idfilter > -1 THEN


	


		select 	    idtipoDestacado  as id,    nombreDestacado  as nombre


		from        tiposdestacados                    


		ORDER BY     nombreDestacado;


		


        ELSE	


	


		select 	    idtipoDestacado  as id,    nombreDestacado  as nombre


		from        tiposdestacados                


		ORDER BY     nombreDestacado;


	


        END IF;


END$$

CREATE PROCEDURE `loadpensionfund` (IN `idfilter` INT)  BEGIN


 


	IF idfilter > -1 THEN


	


		select 	idfondoPensiones as id,nombreFondoPensiones  as nombre


		from fondopensiones                


		ORDER BY nombre;


		


        ELSE	


	


	select 	idfondoPensiones as id,nombreFondoPensiones  as nombre


		from fondopensiones                


		ORDER BY nombre;


	


        END IF;


END$$

CREATE PROCEDURE `loadperiodicity` (IN `idfilter` INT)  BEGIN

 

	IF idfilter > -1 THEN

	

		select 	idperiodicidad as id,nombrePeriodicidad  as nombre

		from periodicidad                

		ORDER BY nombre;

		

        ELSE	

	

		select 	idperiodicidad as id,nombrePeriodicidad  as nombre

		from periodicidad                

		ORDER BY nombre;

	

        END IF;

END$$

CREATE PROCEDURE `loadpersontype` (IN `idfilter` INT)  BEGIN







 







	IF idfilter > -1 THEN







	







		select idtipoPersonCliente  as id,nombreTipoPersonaCliente  as nombre







		from tipoPersonaCliente                







		ORDER BY nombreTipoPersonaCliente;







		







        ELSE	







	







		select idtipoPersonCliente  as id,nombreTipoPersonaCliente  as nombre







		from tipoPersonaCliente                







		ORDER BY nombreTipoPersonaCliente;







	







        END IF;







END$$

CREATE PROCEDURE `loadposition` (IN `idfilter` INT)  BEGIN




 




	IF idfilter > -1 THEN




	




		select 	idCargo  as id,nombreTipoCargo  as nombre




		from cargos                




		ORDER BY nombreTipoCargo;




		




        ELSE	




	




		select 	idCargo  as id,nombreTipoCargo  as nombre




		from cargos                




		ORDER BY nombreTipoCargo;




	




        END IF;




END$$

CREATE PROCEDURE `loadpqrstype` (IN `idfilter` INT)  BEGIN
 
	IF idfilter > -1 THEN
	
		select 	        idtipopqrs  as id,        nombretipopqrs  as nombre
		from         tipopqrs                    
		ORDER BY         nombretipopqrs;
		
        ELSE	
	
		select 	        idtipopqrs  as id,        nombretipopqrs  as nombre
		from         tipopqrs                
		ORDER BY         nombretipopqrs;
	
        END IF;
END$$

CREATE PROCEDURE `loadpreciomaximoinmueble` (IN `idfilter` INT)  BEGIN
 
	IF idfilter > -1 THEN
	
		select MAX(inm.precio) as precio
		from inmuebles as inm;	
		
        ELSE		
		select MAX(inm.precio) as precio
		from inmuebles as inm;		
	
        END IF;
END$$

CREATE PROCEDURE `loadprofession` (IN `idfilter` INT)  BEGIN







 







	IF idfilter > -1 THEN







	







		select 	idprofesion as id,nombreProfesion as nombre







		from profesiones       







        where nivelProfesion_idnivelProfesion = idfilter







		ORDER BY nombreProfesion;







		







        ELSE	







	







		select 	idprofesion as id,nombreProfesion as nombre







		from profesiones               







		ORDER BY nombreProfesion;







	







        END IF;







END$$

CREATE PROCEDURE `loadprofessionnivel` (IN `idfilter` INT)  BEGIN







 







	IF idfilter > -1 THEN







	







		select 	idnivelProfesion  as id,nombreNivelProfesion  as nombre







		from nivelprofesion                







		ORDER BY nombreNivelProfesion;







		







        ELSE	







	







		select 	idnivelProfesion  as id,nombreNivelProfesion  as nombre







		from nivelprofesion                







		ORDER BY nombreNivelProfesion;







	







        END IF;







END$$

CREATE PROCEDURE `loadpropertie` (IN `idfilter` INT)  BEGIN
 
	IF idfilter > -1 THEN
	
		select 	idinmueble as id,matriculaInmobiliaria  as nombre
		from inmuebles                
		ORDER BY nombre;
		
        ELSE	
	
		select 	idinmueble as id,matriculaInmobiliaria  as nombre
		from inmuebles                
		ORDER BY nombre;
	
        END IF;
END$$

CREATE PROCEDURE `loadpropertietype` (IN `idfilter` INT)  BEGIN


 


	IF idfilter > -1 THEN


	


		select 	 idtipoInmueble  as id, nombreTipoInmueble  as nombre


		from  tiposinmuebles                    


		ORDER BY  nombreTipoInmueble;


		


        ELSE	


	


		select 	 idtipoInmueble  as id, nombreTipoInmueble  as nombre


		from  tiposinmuebles                


		ORDER BY  nombreTipoInmueble;


	


        END IF;


END$$

CREATE PROCEDURE `loadrol` (IN `idfilter` INT)  BEGIN







 







	IF idfilter > -1 THEN







	







		select id,nombre







		from rol







		ORDER BY nombre;







		







   ELSE	







	







		select id,nombre







		from rol







		ORDER BY nombre;







	







   END IF;















END$$

CREATE PROCEDURE `loadseverancefund` (IN `idfilter` INT)  BEGIN


 


	IF idfilter > -1 THEN


	


		select 	idfondoCesantias id,nombreFondoCesantias  as nombre


		from  fondocesantias                


		ORDER BY nombre;


		


        ELSE	


	


	select 	idfondoCesantias id,nombreFondoCesantias  as nombre


		from  fondocesantias                


		ORDER BY nombre;


	


        END IF;


END$$

CREATE PROCEDURE `loadStatus` (IN `idfilter` INT)  BEGIN


 


	IF idfilter > -1 THEN


	


		select 	  idestado  as id,  nombreEstado  as nombre


		from   estados                    


		ORDER BY   nombreEstado;


		


        ELSE	


	


		select 	  idestado  as id,  nombreEstado  as nombre


		from   estados                


		ORDER BY   nombreEstado;


	


        END IF;


END$$

CREATE PROCEDURE `loadstratum` (IN `idfilter` INT)  BEGIN


 


	IF idfilter > -1 THEN


	


		select 	idestrato  as id,nombreEstrato  as nombre


		from estratos                    


		ORDER BY nombreEstrato;


		


        ELSE	


	


		select 	idestrato  as id,nombreEstrato  as nombre


		from estratos                


		ORDER BY nombreEstrato;


	


        END IF;


END$$

CREATE PROCEDURE `loadtipoidentificacion` (IN `idfilter` INT)  BEGIN







 







	IF idfilter > -1 THEN







	







		select idtipoIdentificacion as id,nombreTipoIdentificacion as nombre







		from tipoIdentificacion







		ORDER BY nombreTipoIdentificacion;







		







        ELSE	







	







		select idtipoIdentificacion as id,nombreTipoIdentificacion as nombre







		from tipoIdentificacion







		ORDER BY nombreTipoIdentificacion;







	







        END IF;







END$$

CREATE PROCEDURE `loadtotalarrendatarios` (IN `idfilter` INT)  BEGIN
 
	IF idfilter > -1 THEN

		select count(*) as total
		from contratos as con;	
		
        ELSE		
		select count(*) as total
		from contratos as con;	
	
        END IF;
END$$

CREATE PROCEDURE `loadtotalclientes` (IN `idfilter` INT)  BEGIN
 
	IF idfilter > -1 THEN

		select count(*) as total
		from clientes as cli;	
		
        ELSE		
		select count(*) as total
		from clientes as cli;
	
        END IF;
END$$

CREATE PROCEDURE `loadtotalinmuebles` (IN `idfilter` INT)  BEGIN
 
	IF idfilter > -1 THEN
	
		select count(*) as total
		from inmuebles as inm;	
		
        ELSE		
			select count(*) as total
		from inmuebles as inm;	
	
        END IF;
END$$

CREATE PROCEDURE `loadtotalinmueblesporoferta` (IN `idfilter` INT)  BEGIN
 
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
END$$

CREATE PROCEDURE `loadtotalinmueblesporofertaContrato` (IN `idfilter` INT)  BEGIN
 
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
END$$

CREATE PROCEDURE `loadtypeemployee` (IN `idfilter` INT)  BEGIN







 







	IF idfilter > -1 THEN







	







		select idTipoEmpleado  as id,nombreTipoEmpleado  as nombre







		from tiposEmpleados               







		ORDER BY nombreTipoEmpleado;







		







        ELSE	







	







		select idTipoEmpleado  as id,nombreTipoEmpleado  as nombre







		from tiposEmpleados                







		ORDER BY nombreTipoEmpleado;







	







        END IF;







END$$

CREATE PROCEDURE `loadtypeevent` (IN `idfilter` INT)  BEGIN







 







	IF idfilter > -1 THEN







	







		select idtipoEvento  as id,nombreTipoEvento  as nombre







		from tiposeventos                







		ORDER BY nombreTipoEvento;







		







        ELSE	







	







		select idtipoEvento  as id,nombreTipoEvento  as nombre







		from tiposeventos                







		ORDER BY nombreTipoEvento;







	







        END IF;







END$$

CREATE PROCEDURE `loadtypereference` (IN `idfilter` INT)  BEGIN
 
	IF idfilter > -1 THEN
	
		select 	idtiporeferencia as id,nombretiporeferencia as nombre
		from tiporeferencia                
		ORDER BY nombre;
		
        ELSE	
	
		select 	idtiporeferencia as id,nombretiporeferencia as nombre
		from tiporeferencia                
		ORDER BY nombre;
	
        END IF;
END$$

CREATE PROCEDURE `loadviewtype` (IN `idfilter` INT)  BEGIN


 


	IF idfilter > -1 THEN


	


		select 	          idtipoVista  as id,          nombreTipoVista  as nombre


		from           tiposvistas                    


		ORDER BY           nombreTipoVista;


		


        ELSE	


	


		select 	          idtipoVista  as id,          nombreTipoVista  as nombre


		from           tiposvistas                


		ORDER BY           nombreTipoVista;


	


        END IF;


END$$

CREATE PROCEDURE `loadvigilancetype` (IN `idfilter` INT)  BEGIN


 


	IF idfilter > -1 THEN


	


		select 	         idtipoVigilancia  as id,         nombreTipoVigilancia  as nombre


		from          tiposvigilancias                    


		ORDER BY          nombreTipoVigilancia;


		


        ELSE	


	


		select 	         idtipoVigilancia  as id,         nombreTipoVigilancia  as nombre


		from          tiposvigilancias                


		ORDER BY          nombreTipoVigilancia;


	


        END IF;


END$$

CREATE PROCEDURE `loadzonastopvisitas` (IN `idfilter` INT)  BEGIN
 
	IF idfilter > -1 THEN
	
		select zon.nombreZona, count(*) as totalvisitas
                from inmuebles as inm 
                inner join  audit_propertie_search as aud on aud.id_register = inm.idinmueble 
                inner join  zonas as zon on zon.idzona = inm.zonas_idzona
                group by zon.nombreZona
                order by totalvisitas desc
                limit 5;

        ELSE		
		select zon.nombreZona, count(*) as totalvisitas
                from inmuebles as inm 
                inner join  audit_propertie_search as aud on aud.id_register = inm.idinmueble 
                inner join  zonas as zon on zon.idzona = inm.zonas_idzona
                group by zon.nombreZona
                order by totalvisitas desc
                limit 5;
	
        END IF;
END$$

CREATE PROCEDURE `loadzone` (IN `idfilter` INT)  BEGIN


 


	IF idfilter > -1 THEN


	


		select 	  idzona  as id,  nombreZona  as nombre


		from   zonas                    


		ORDER BY   nombreZona;


		


        ELSE	


	


		select 	  idzona  as id,  nombreZona  as nombre


		from   zonas                


		ORDER BY   nombreZona;


	


        END IF;


END$$

CREATE PROCEDURE `login` (IN `usu` VARCHAR(50), IN `pass` VARCHAR(50))  BEGIN







   select u.usuario,u.primer_nombre,u.primer_apellido,u.rol,u.id,r.nombre as rol_nombre







   from usuario as u







   inner join rol as r on u.rol = r.id







   where password=pass and usuario=usu;		







END$$

CREATE PROCEDURE `loginPublic` (`vemail` VARCHAR(50), `vpassword` VARCHAR(50))  BEGIN
  select cli.`idCliente` as id, cli.`correoCliente` as email, CONCAT(cli.primerNombreCliente, ' ', 
        cli.primerApellidoCliente) as nombre
   from clientes as cli   
   where cli.password = vpassword and cli.`correoCliente` = vemail	;
END$$

CREATE PROCEDURE `log_msg` (`msg` VARCHAR(255))  READS SQL DATA
    DETERMINISTIC
    COMMENT 'Funcion que permite hacer debug'
BEGIN 







    insert into log_msg (log) value (msg);







END$$

CREATE PROCEDURE `searchclient` (`vid` INT)  BEGIN
	SELECT cli.idCliente as id ,
		cli.numeroIdentificacion as cedula, 
		cli.primerNombreCliente as primer_nombre, 
		cli.segundoNombreCliente as segundo_nombre, 
		cli.primerApellidoCliente as primer_apellido, 
		cli.segundoApellidoCliente as segundo_apellido,  
		cli.direccionCliente as direccion,
		cli.telefonoFijoCliente as telefono, 
		cli.telefonoMovilCliente as celular, 
		cli.correoCliente as email, 
		cli.idGenero as genero, 
		cli.fechaNacimiento as fecha, 
		cli.ciudadResidencia_idciudad as id_ciudad_residencia, 
		cli.tipoIdentificacion_idtipoIdentificacion as id_tipo_identificacion,
		cli.ciudadExpedicion_idciudad as id_ciudad_expedicion, 
		cli.profesiones_idprofesion as id_profesion, 
		cli.tipoPersonaCliente_idtipoPersonCliente as id_tipo_persona, 
		cli.idEstadoCivil as estado_civil,
		cli.imagencliente as foto_cliente,
		p.`nivelProfesion_idnivelProfesion` as nivel_profesional,
		ciuExp.`Departamentos_idDepartamento` as departamento_expedicion,
		ciuRes.`Departamentos_idDepartamento` as departamento_residencia
		FROM clientes as cli 
		inner join profesiones as p on cli.profesiones_idprofesion = p.idprofesion 
		inner join ciudades as ciuExp on cli.`ciudadExpedicion_idciudad` = ciuExp.`idciudad`
		inner join ciudades as ciuRes on cli.`ciudadResidencia_idciudad` = ciuRes.`idciudad`
		where idCliente = vid;	
END$$

CREATE PROCEDURE `searchcontract` (`vid` INT)  BEGIN
 	
	SELECT con.idcontratoEmpleado as id ,
				con.fechaInicio	 as fecha_inicio,
				con.fechaTerminacion as fecha_terminacion,
				con.salario as salario,
				con.areaEmpresa_idareaEmpresa as area,
				con.cargos_idCargo as cargo,
				con.empleados_idempleado as empleado,
				con.tipocontratoempleado_idtipoContratoEmpleado as tipo_contrato,
				con.archivocontrato as contrato
				
	FROM contratoempleado as con inner join empleados as empl 
   on empl.idEmpleado = con.empleados_idempleado inner join cargos as car on con.cargos_idCargo = car.idCargo inner join tipocontratoempleado as tip on con.tipocontratoempleado_idtipoContratoEmpleado = tip.idtipoContratoEmpleado inner join areaempresa as ar on con.areaEmpresa_idareaEmpresa = ar.idareaEmpresa
   
	where idcontratoEmpleado = vid;	
	
END$$

CREATE PROCEDURE `searchcontractpropertie` (`vid` INT)  BEGIN
 	
	SELECT con.idcontrato as id ,
				con.idcliente as cliente,
				con.inmuebles_idinmueble as inmueble,
				con.fechacontrato as fecha_contrato,
				con.fechaInicioContrato as fecha_inicio,
				con.fechaFinContrato as fecha_fin,
				con.valorContrato as valor_contrato,
				con.plazoContrato as plazo_contrato,
				con.formaDePago as forma_pago,
				con.rutaContrato as ruta_contrato
				  
	FROM contratos con inner join clientes as cli 
   on con.idcliente = cli.idCliente inner join inmuebles as inm on con.inmuebles_idinmueble = inm.idinmueble
	where idcontrato= vid;	
	
END$$

CREATE PROCEDURE `searchdebtor` (`vid` INT)  BEGIN
 	
	SELECT deu.idDeudor as id ,
               deu.numeroIdentificacion as cedula, 
                  deu.primerNombreDeudor as primer_nombre, 
                  deu.segundoNombreDeudor as segundo_nombre, 
                  deu.primerApellidoDeudor as primer_apellido, 
                  deu.segundoApellidoDeudor as segundo_apellido,  
                  deu.direccionResidenciaDeudor as direccion_residencia,
                  deu.telefonoResidenciaDeudor as telefono_residencia,
				  deu.direccionLaboralDeudor as direccion_laboral,
				  deu.telefonoLaboralDeudor as telefono_laboral,
                  deu.telefonoMovilDeudor as celular, 
                  deu.correoDeudor as email,
				  deu.ingresosMensuales as ingresos,
				  deu.estadoCivilDeudor as estado_civil,
				  deu.tipoIdentificacion_idtipoIdentificacion as tipo_identificacion,
				  deu.`ciudadResidencia_idciudad` as id_ciudad_residencia, 
				  deu.ciudadExpedicion_idciudad as id_ciudad_expedicion,
				  deu.fechaExpedicionIdentificacion	as fecha_expedicion,
			
				  ciu.Departamentos_idDepartamento as id_departamento_residencia,
				  ciures.Departamentos_idDepartamento as id_departamento_expedicion
                  
	FROM deudorsolidario as deu inner join ciudades as ciu 
   on deu.`ciudadResidencia_idciudad` = ciu.`idCiudad` inner join ciudades as ciures 
   on deu.`ciudadExpedicion_idciudad` = ciures.`idCiudad`
	where idDeudor = vid;	
	
END$$

CREATE PROCEDURE `searchdependent` (`vid` INT)  BEGIN









	IF EXISTS(select 1 from arrendatariodependiente where clientes_idCliente=vId)




		THEN




			SELECT cli.numeroIdentificacion as cedula, CONCAT(cli.primerNombreCliente, ' ', 




							cli.segundoNombreCliente, ' ', cli.primerApellidoCliente , ' ', 




							cli.segundoApellidoCliente) as nombre,




							dep.idtipoLaborArrendatario as actividadEconomica,




							dep.nombreEmpresa as nombreEmpresa,




							dep.Cargos_idCargo as cargo,




							dep.direccionOficina as direccionOficina,




							dep.sueldoBasico as salario,




							dep.otrosIngresos as otrosIngresos,




							dep.antiguedadEnEmpresa as antiguedad,




							dep.telefonoOficina as telefonoOficina




			FROM clientes as cli




			




			inner join arrendatariodependiente as dep on cli.idCliente = dep.clientes_idCliente	 









			where idCliente = vid;




	




	ELSE




		SELECT numeroIdentificacion as cedula, CONCAT(primerNombreCliente, ' ', 




					segundoNombreCliente, ' ', primerApellidoCliente , ' ', 




					segundoApellidoCliente) as nombre




					




			FROM clientes




					




		where idCliente = vid;




	END IF;




END$$

CREATE PROCEDURE `searchemployee` (`vid` INT)  BEGIN


 	


	SELECT empl.idEmpleado as id ,


               empl.cedulaEmpleado as cedula, 


                  empl.primerNombreEmpleado as primer_nombre, 


                  empl.segundoNombreEmpleado as segundo_nombre, 


                  empl.primerApellidoEmpleado as primer_apellido, 


                  empl.segundoApellidoEmpleado as segundo_apellido,  


                  empl.direccionEmpleado as direccion,


                  empl.telefonoFijoEmpleado as telefono, 


                  empl.telefonoMovilEmpleado as celular, 


                  empl.correoEmpleado as email, 


                  empl.`idGeneroEmpleado` as genero, 


                  empl.fechaNacimientoEmpleado as fecha, 


				  empl.`idtipoEmpleado` as id_tipo_Empleado,


                  empl.`idCiudadEmpleado` as id_ciudad_residencia, 


                  empl.`idProfesionEmpleado` as id_profesion, 


                  empl.`idEsCivil` as estado_civil,


				  ciu.Departamentos_idDepartamento as id_departamento,


                  pro.nivelProfesion_idnivelProfesion as id_nivel,


				  empl.fechaExpedicion as fecha_Expedicion,


				  empl.archivoCedula as archivo_Cedula,


				  empl.numeroLibretaMilitar as numero_Libreta_Militar,


				  empl.archivoLibretaMilitar as archivo_Libreta_Militar,


				  empl.discapacidad as discapacidad,


				  empl.fotoEmpleado as foto_Empleado,


				  empl.nombreContacto as nombre_Contacto,


				  empl.telefonoContacto as telefono_Contacto,


				  empl.correoContacto as correo_Contacto,


				  empl.lugarExpedicion_idciudad as id_Ciudad_Expedicion,


				  ciu2.Departamentos_idDepartamento as id_Departamento_Expedicion,


				  empl.lugarNacimiento_idciudad as id_Ciudad_Nacimiento,


				  ciu3.Departamentos_idDepartamento as id_Departamento_Nacimiento,


				  empl.tipoSangre_idtipoSangre as id_Tipo_Sangre,


				  empl.fondoPensiones_idfondoPensiones as id_Fondo_Pensiones,


				  empl.eps_ideps as id_Eps,


				  empl.fondoCesantias_idfondoCesantias as id_Fondo_Cesantias,


				  empl.arl_idarl as id_Arl,


				  empl.cajaCompensacion_idcajaCompensacion as id_Caja_Compensacion


				  


	FROM Empleados as empl inner join ciudades as ciu 


   on empl.`idCiudadEmpleado` = ciu.`idCiudad` inner join ciudades as ciu2 


   on empl.`lugarExpedicion_idciudad` = ciu2.`idCiudad` inner join ciudades as ciu3 


   on empl.lugarNacimiento_idciudad = ciu3.`idCiudad` inner join profesiones as pro on empl.`idProfesionEmpleado` = pro.`idProfesion`


	where idEmpleado = vid;	


	


END$$

CREATE PROCEDURE `searchevent` (`vidEvent` INT)  BEGIN







 	







	SELECT eve.ideventoCliente as id ,







               eve.fechaEvento as fecha_evento, 







                  eve.horaEvento as hora_evento, 







                  eve.lugarEvento as lugar_evento, 







                  eve.latitud as latitud,  







                  eve.longitud as longitud,







                  eve.observacionesEvento as observaciones, 







                  eve.clientes_cedulaCliente as cedula_cliente, 







                  eve.tiposEventos_idtipoEvento as id_tipo_evento, 







                  CONCAT(cli.primerNombreCliente, ' ', 







					cli.segundoNombreCliente, ' ', cli.primerApellidoCliente,  ' ', 







					cli.segundoApellidoCliente) as nombreCliente,







                  tip.nombreTipoEvento as tipo_evento







	FROM eventosclientes as eve 







        inner join clientes as cli on eve.clientes_cedulaCliente = cli.idCliente 







        inner join tiposEventos as tip on eve.tiposEventos_idtipoEvento = tip.idtipoEvento







	where idEventoCliente = vidEvent;	







	







END$$

CREATE PROCEDURE `searcheventcomments` (`vidEvent` INT)  BEGIN







 	







	SELECT eve.ideventoCliente as id ,







               eve.fechaEvento as fecha_evento, 







                  eve.horaEvento as hora_evento, 







                  eve.lugarEvento as lugar_evento, 







                  eve.latitud as latitud,  







                  eve.longitud as longitud,







                  eve.observacionesEvento as observaciones, 







                  eve.clientes_cedulaCliente as cedula_cliente, 







                  eve.tiposEventos_idtipoEvento as id_tipo_evento,







				  eve.DescripcionEvento as comentarios,







                  CONCAT(cli.primerNombreCliente, ' ', 







					cli.segundoNombreCliente, ' ', cli.primerApellidoCliente,  ' ', 







					cli.segundoApellidoCliente) as nombreCliente,







                  tip.nombreTipoEvento as tipo_evento







	FROM eventosclientes as eve 







        inner join clientes as cli on eve.clientes_cedulaCliente = cli.idCliente 







        inner join tiposEventos as tip on eve.tiposEventos_idtipoEvento = tip.idtipoEvento







	where idEventoCliente = vidEvent;	







	







END$$

CREATE PROCEDURE `searcheventsclient` (`vid` INT)  BEGIN
			SELECT eve.ideventoCliente as idevento,
					eve.fechaEvento as fecha,
					eve.horaEvento as hora,
					eve.lugarEvento as lugar,
					eve.latitud as latitud,
					eve.longitud as longitud,
					eve.observacionesEvento as observaciones,
					eve.DescripcionEvento as descripcion,
					tip.nombreTipoEvento as tipoEvento,
					loadEmployeeEvent(eve.ideventoCliente) as nombreempleado,
					loadImageEmployee(eve.ideventoCliente) as fotoempleado
			from eventosclientes eve
			inner join tiposeventos as tip on tip.idtipoEvento = eve.tiposeventos_idtipoEvento
			where eve.clientes_cedulaCliente = vid;
END$$

CREATE PROCEDURE `searchexperience` (`vid` INT)  BEGIN


 	


	SELECT exp.idexperienciaEmpleado as id ,


				exp.empresa as empresa,


				exp.fechaIngreso as fecha_ingreso,


				exp.fechaSalida as fecha_salida,


				exp.certificadoLaboral as certificado_laboral,


				exp.cargos_idCargo as cargo,


				exp.empleados_idempleado as empleado


				  


	FROM experienciaempleado as exp inner join empleados as empl 


   on empl.idEmpleado = exp.empleados_idempleado inner join cargos as car on exp.cargos_idCargo = car.idCargo


	where idexperienciaEmpleado = vid;	


	


END$$

CREATE PROCEDURE `searchformation` (`vid` INT)  BEGIN

 	

	SELECT frm.idformacionEmpleado as id,

				frm.institucionEducacion as institucion_educacion,

				frm.nivelAlcanzado as nivel_alcanzado,

				frm.diplomaOActa as certificado,

				frm.empleados_idempleado as empleado,

				frm.profesiones_idprofesion as profesion,

				pro.nivelProfesion_idnivelProfesion as idnivel_Profesion,

				frm.periodicidad_idperiodicidad as periodicidad,

				frm.graduado as graduado

				

				  

	FROM formacionempleado as frm inner join empleados as empl 

	on empl.idEmpleado = frm.empleados_idempleado inner join 

	profesiones as pro on frm.profesiones_idprofesion = pro.idprofesion

	where idformacionEmpleado = vid;	

	

END$$

CREATE PROCEDURE `searchindependent` (`vid` INT)  BEGIN









	IF EXISTS(select 1 from arrendatarioindependiente where clientes_idCliente=vId)




		THEN




			SELECT cli.numeroIdentificacion as cedula, CONCAT(cli.primerNombreCliente, ' ', 




							cli.segundoNombreCliente, ' ', cli.primerApellidoCliente , ' ', 




							cli.segundoApellidoCliente) as nombre,




							dep.tipoactividadeconomicaarrendatario_idtipoLaborArrendatario as actividadEconomica,




							dep.descripcionNegocio as descripcionNegocio,




							dep.registroMercantil as registroMercantil,




							dep.numeroEmpleados as numeroEmpleados,




							dep.ingresos as ingresos,




							dep.egresos as egresos




			FROM clientes as cli




			




			inner join arrendatarioindependiente as dep on cli.idCliente = dep.clientes_idCliente	 









			where idCliente = vid;




	




	ELSE




		SELECT numeroIdentificacion as cedula, CONCAT(primerNombreCliente, ' ', 




					segundoNombreCliente, ' ', primerApellidoCliente , ' ', 




					segundoApellidoCliente) as nombre




					




			FROM clientes




					




		where idCliente = vid;




	END IF;




END$$

CREATE PROCEDURE `searchnoticia` (`idnoticia` INT)  BEGIN







 







	







	select id,titulo,descripcion, fecha,foto,video







	from noticia







	where id = idnoticia;







	







END$$

CREATE PROCEDURE `searchpqrs` (`vid` INT)  BEGIN
 	
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
	
END$$

CREATE PROCEDURE `searchprofession` (`vid` INT)  BEGIN







 	







	SELECT idProfesion as id,nombreProfesion as nombre, nivelProfesion_idnivelProfesion as nivelProfesion







	FROM profesiones







	where idProfesion = vid;	







	







END$$

CREATE PROCEDURE `searchprofileclient` (`vid` INT)  BEGIN
			SELECT cli.idCliente as id, cli.numeroIdentificacion as cedula, CONCAT(cli.primerNombreCliente, ' ', 
							cli.segundoNombreCliente, ' ', cli.primerApellidoCliente , ' ', 
							cli.segundoApellidoCliente) as nombre,
					cli.profesiones_idprofesion as idprofesion,
					cli.imagencliente as foto_cliente,
					pro.nombreProfesion as profesion,
					cli.correoCliente as email,
					loadeventspending(vid) as cantidadeventos,
					tip.nombreTipoPersonaCliente as tipocliente,
					CONCAT(ciu.nombreCiudad, ', ', cli.direccionCliente) as ciudad,
					CONCAT('Fijo: ',cli.telefonoFijoCliente, ' - ', 'Cel: ',cli.telefonoMovilCliente) as telefonos,
					(SELECT COUNT(*) FROM inmuebles inm WHERE inm.clientes_cedulaCliente = vid) as cantidadinmuebles,
					(SELECT COUNT(*) FROM contratos con WHERE con.idcliente = vid) as cantidadcontratos
			from clientes cli
			inner join profesiones as pro on pro.idprofesion = cli.profesiones_idprofesion
			inner join ciudades as ciu on ciu.idciudad = cli.ciudadResidencia_idciudad
			inner join tipopersonacliente as tip on tip.idtipoPersonCliente = cli.tipoPersonaCliente_idtipoPersonCliente

			where idCliente = vid;
END$$

CREATE PROCEDURE `searchpropertie` (`vid` INT)  BEGIN
 	
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
               loadimagepropertie(inm.idinmueble) as imagen, 
               inm.direccion_carrera as direccion_carrera, 
               inm.direccion_calle as direccion_calle,
               inm.direccion_numero as direccion_numero,
               direccion_info_adicional as direccion_info_adicional               
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
	
END$$

CREATE PROCEDURE `searchpropertiebyclient` (`vid` INT)  BEGIN
 	
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
               ciu.`nombreCiudad` as nombre_ciudad,
               bar.`nombreBarrio` as nombre_barrio,
               tipinm.`nombreTipoInmueble` as nombre_tipo_inmueble,
               tipofer.`nombreTipoOferta` as nombre_tipo_oferta,                              
               tipdest.`nombreDestacado` as nombre_tipo_destacado    
	FROM inmuebles as inm        
        inner join barrios as bar on bar.`idbarrio` = inm.barrios_idbarrio
        inner join ciudades as ciu on inm.ciudades_idciudad = ciu.idciudad              
        inner join tiposinmuebles as tipinm on tipinm.`idtipoInmueble` = inm.`tiposInmuebles_idtipoInmueble`
        inner join tiposofertas as tipofer on tipofer.`idtipoOferta` = inm.`tiposOfertas_idtipoOferta`     
        inner join tiposdestacados as tipdest on tipdest.`idtipoDestacado` = inm.`tiposDestacados_idtipoDestacado`        
	where  inm.`clientes_cedulaCliente` = vid;	
	
END$$

CREATE PROCEDURE `searchpropertiepdf` (`vid` INT)  BEGIN
 	
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
	
END$$

CREATE PROCEDURE `searchreference` (`vid` INT)  BEGIN
 	
	SELECT refe.idreferenciapersonalfamiliar as id ,
				refe.clientes_idCliente as cliente,
				refe.tiporeferencia_idtiporeferencia as tipo_referencia,
				refe.nombresReferencia as nombres,
				refe.apellidosreferencia as apellidos,
				refe.telefonoreferencia as telefono
				  
	FROM referenciapersonalfamiliar as refe inner join clientes as cli 
   on refe.clientes_idCliente = cli.idCliente inner join tiporeferencia as tip on refe.tiporeferencia_idtiporeferencia = tip.idtipoReferencia
	where idreferenciapersonalfamiliar = vid;	
	
END$$

CREATE PROCEDURE `searchreferencebank` (`vid` INT)  BEGIN
 	
	SELECT refe.idreferenciabancaria as id ,
				refe.clientes_idCliente as cliente,
				refe.numerocuenta as numero_cuenta,
				refe.bancos_idbanco as banco,
				refe.sucursal as sucursal
				  
	FROM referenciabancaria refe inner join clientes as cli 
   on refe.clientes_idCliente = cli.idCliente inner join bancos as ban on refe.bancos_idbanco = ban.idbanco
	where idreferenciabancaria= vid;	
	
END$$

CREATE PROCEDURE `searchrol` (`idrol` INT)  BEGIN







 







	







	select id,nombre,descripcion







	from rol







	where id = idrol;







	







END$$

CREATE PROCEDURE `searchspouse` (`vid` INT)  BEGIN
 	
	SELECT con.idconyugue as id ,
				con.clientes_idCliente as cliente,
				con.numeroIdentificacionConyugue as cedula,
				con.fechaExpedicionNumeroId as fecha_expedicion,
				con.correoElectronicoConyugue as correo,
				con.nombresConyugue as nombres,
				con.apellidosConyugue as apellidos,
				con.nombreEmpresaLabora as empresa,
				con.direccionLaboralConyugue as direccion,
				con.telefonoLaboralConyugue as telefono_laboral,
				con.telefonoMovilConyugue as telefono_movil,
				con.salarioMensualConyugue as salario
				  
	FROM conyugues con inner join clientes as cli 
   on con.clientes_idCliente = cli.idCliente
	where idconyugue= vid;	
	
END$$

CREATE PROCEDURE `searchtimelineclient` (`vid` INT)  BEGIN
			SELECT eve.ideventoCliente as idevento,
					eve.fechaEvento as fecha,
					eve.horaEvento as hora,
					eve.lugarEvento as lugar,
					eve.latitud as latitud,
					eve.longitud as longitud,
					eve.observacionesEvento as observaciones,
					eve.DescripcionEvento as descripcion,
					tip.nombreTipoEvento as tipoEvento,
					loadEmployeeEvent(eve.ideventoCliente) as nombreempleado,
					loadImageEmployee(eve.ideventoCliente) as fotoempleado
			from eventosclientes eve
			inner join tiposeventos as tip on tip.idtipoEvento = eve.tiposeventos_idtipoEvento
			where eve.clientes_cedulaCliente = vid;
END$$

CREATE PROCEDURE `searchuser` (`vid` INT)  BEGIN







 	







	SELECT id, primer_nombre, segundo_nombre, primer_apellido, segundo_apellido, 







	usuario, rol, descripcion







	FROM usuario







	where id = vid;	







	







END$$

--
-- Funciones
--
CREATE FUNCTION `deleteclient` (`vid` INT) RETURNS INT(1) READS SQL DATA
    DETERMINISTIC
    COMMENT 'Funcion que elimina un cliente'
BEGIN 







    DECLARE res INT DEFAULT 0;















    DELETE FROM detalleclientestipoclientes where `clientes_cedulaCliente` = vid;







    DELETE FROM clientes WHERE idCliente = vid;







    SET res = 1;







	RETURN res;







END$$

CREATE FUNCTION `deletecontract` (`vid` INT) RETURNS INT(1) READS SQL DATA
    DETERMINISTIC
    COMMENT 'Funcion que elimina un contrato'
BEGIN 
    DECLARE res INT DEFAULT 0;
    DELETE FROM contratoempleado WHERE idcontratoEmpleado= vid;
    SET res = 1;
	RETURN res;
END$$

CREATE FUNCTION `deletecontractpropertie` (`vid` INT) RETURNS INT(1) READS SQL DATA
    DETERMINISTIC
    COMMENT 'Funcion que elimina un contrato de un inmueble'
BEGIN 
    DECLARE res INT DEFAULT 0;
    DELETE FROM contratos WHERE idcontrato = vid;
    SET res = 1;
	RETURN res;
END$$

CREATE FUNCTION `deletedebtor` (`vid` INT) RETURNS INT(1) READS SQL DATA
    DETERMINISTIC
    COMMENT 'Funcion que elimina un Deudor'
BEGIN 
    DECLARE res INT DEFAULT 0;
    DELETE FROM deudorSolidario WHERE idDeudor = vid;
    SET res = 1;
	RETURN res;
END$$

CREATE FUNCTION `deletedependent` (`vid` INT) RETURNS INT(1) READS SQL DATA
    DETERMINISTIC
    COMMENT 'Funcion que elimina un arrendatario dependiente'
BEGIN 




    DECLARE res INT DEFAULT 0;




    DELETE FROM arrendatariodependiente WHERE clientes_idCliente = vid;




    SET res = 1;




	RETURN res;




END$$

CREATE FUNCTION `deleteemployee` (`vid` INT) RETURNS INT(1) READS SQL DATA
    DETERMINISTIC
    COMMENT 'Funcion que elimina un Empleado'
BEGIN 







    DECLARE res INT DEFAULT 0;







    DELETE FROM Empleados WHERE idEmpleado = vid;







    SET res = 1;







	RETURN res;







END$$

CREATE FUNCTION `deleteevent` (`vid` INT) RETURNS INT(1) READS SQL DATA
    DETERMINISTIC
    COMMENT 'Funcion que elimina un evento'
BEGIN 







    DECLARE res INT DEFAULT 0;















    DELETE FROM detalleeventosempleados where eventosclientes_ideventoCliente = vid;







    DELETE FROM eventosclientes WHERE idEventoCliente = vid;







    SET res = 1;







	RETURN res;







END$$

CREATE FUNCTION `deleteexperience` (`vid` INT) RETURNS INT(1) READS SQL DATA
    DETERMINISTIC
    COMMENT 'Funcion que elimina formación'
BEGIN 

    DECLARE res INT DEFAULT 0;

    DELETE FROM experienciaempleado WHERE idexperienciaEmpleado= vid;

    SET res = 1;

	RETURN res;

END$$

CREATE FUNCTION `deleteformation` (`vid` INT) RETURNS INT(1) READS SQL DATA
    DETERMINISTIC
    COMMENT 'Funcion que elimina formación'
BEGIN 

    DECLARE res INT DEFAULT 0;

    DELETE FROM formacionempleado WHERE idformacionEmpleado= vid;

    SET res = 1;

	RETURN res;

END$$

CREATE FUNCTION `deleteindependent` (`vid` INT) RETURNS INT(1) READS SQL DATA
    DETERMINISTIC
    COMMENT 'Funcion que elimina un arrendatario dependiente'
BEGIN 




    DECLARE res INT DEFAULT 0;




    DELETE FROM arrendatarioindependiente WHERE clientes_idCliente = vid;




    SET res = 1;




	RETURN res;




END$$

CREATE FUNCTION `deletenoticia` (`vid` INT) RETURNS INT(1) READS SQL DATA
    DETERMINISTIC
    COMMENT 'Funcion que elimina una noticia'
BEGIN 







    DECLARE res INT DEFAULT 0;







    DELETE FROM noticia WHERE id = vid;







SET res = 1;







	RETURN res;







END$$

CREATE FUNCTION `deleteprofession` (`vid` INT) RETURNS INT(1) READS SQL DATA
    DETERMINISTIC
    COMMENT 'Funcion que elimina una profesion'
BEGIN 







    DECLARE res INT DEFAULT 0;







    DELETE FROM profesiones WHERE idProfesion = vid;







SET res = 1;







	RETURN res;







END$$

CREATE FUNCTION `deletepropertie` (`vid` INT) RETURNS INT(1) READS SQL DATA
    DETERMINISTIC
    COMMENT 'Funcion que elimina un inmueble'
BEGIN 
    DECLARE res INT DEFAULT 0;

    DELETE FROM inmuebles where idinmueble = vid;
    DELETE FROM imageninmueble WHERE idInmueble = vid;
    DELETE FROM videoinmueble WHERE  idInmueble= vid;
    SET res = 1;

    RETURN res;
END$$

CREATE FUNCTION `deletereference` (`vid` INT) RETURNS INT(1) READS SQL DATA
    DETERMINISTIC
    COMMENT 'Funcion que elimina una referencia'
BEGIN 
    DECLARE res INT DEFAULT 0;
    DELETE FROM referenciapersonalfamiliar WHERE idreferenciapersonalfamiliar = vid;
    SET res = 1;
	RETURN res;
END$$

CREATE FUNCTION `deletereferencebank` (`vid` INT) RETURNS INT(1) READS SQL DATA
    DETERMINISTIC
    COMMENT 'Funcion que elimina una referencia bancaría'
BEGIN 
    DECLARE res INT DEFAULT 0;
    DELETE FROM referenciabancaria WHERE idreferenciabancaria = vid;
    SET res = 1;
	RETURN res;
END$$

CREATE FUNCTION `deleterol` (`cod` INT) RETURNS INT(1) READS SQL DATA
    DETERMINISTIC
    COMMENT 'Funcion que elimina un rol'
BEGIN







	DECLARE res INT default 0;	







    delete from rol where id = cod;







	SET res = 1;







	RETURN res;







END$$

CREATE FUNCTION `deletespouse` (`vid` INT) RETURNS INT(1) READS SQL DATA
    DETERMINISTIC
    COMMENT 'Funcion que elimina un conyugue'
BEGIN 
    DECLARE res INT DEFAULT 0;
    DELETE FROM conyugues WHERE idconyugue = vid;
    SET res = 1;
	RETURN res;
END$$

CREATE FUNCTION `deleteuser` (`vid` INT) RETURNS INT(1) READS SQL DATA
    DETERMINISTIC
    COMMENT 'Funcion que elimina un usuario'
BEGIN 







    DECLARE res INT DEFAULT 0;







    DELETE FROM usuario WHERE id = vid;







SET res = 1;







	RETURN res;







END$$

CREATE FUNCTION `loadEmployeeEvent` (`vid` INT) RETURNS VARCHAR(200) CHARSET latin1 READS SQL DATA
    DETERMINISTIC
    COMMENT 'Funcion que trae el empleado que atiende un evento'
BEGIN 
    
    DECLARE vemployee VARCHAR (200) DEFAULT '';      
    SET vemployee = (SELECT CONCAT(emp.primerNombreEmpleado, ' ', 
							emp.segundoNombreEmpleado, ' ', emp.primerApellidoEmpleado , ' ', 
							emp.segundoApellidoEmpleado) as nombreempleado
							FROM empleados 
							inner join detalleeventosempleados as det on det.eventosclientes_ideventoCliente = vid
							inner join empleados as emp on emp.idempleado = det.empleados_idempleado
							inner join eventosclientes as eve on eve.ideventoCliente = vid
							where eve.ideventoCliente = vid limit 1);
    RETURN vemployee;
END$$

CREATE FUNCTION `loadeventspending` (`vid` INT) RETURNS INT(11) READS SQL DATA
    DETERMINISTIC
    COMMENT 'Funcion que trae la cantidad de eventos pendientes de un cliente'
BEGIN 
    
    DECLARE vevents INT;      
    SET vevents = (SELECT COUNT(*) FROM eventosclientes eve WHERE eve.clientes_cedulaCliente = vid AND fechaEvento > SYSDATE());
    RETURN vevents;
	

END$$

CREATE FUNCTION `loadImageEmployee` (`vid` INT) RETURNS VARCHAR(2000) CHARSET latin1 READS SQL DATA
    DETERMINISTIC
    COMMENT 'Funcion que trae el empleado que atiende un evento'
BEGIN 
    
    DECLARE vimageemployee VARCHAR (2000) DEFAULT '';            
    SET vimageemployee = (SELECT emp.fotoEmpleado as fotoempleado
							FROM empleados 
							inner join detalleeventosempleados as det on det.eventosclientes_ideventoCliente = vid
							inner join empleados as emp on emp.idempleado = det.empleados_idempleado
							inner join eventosclientes as eve on eve.ideventoCliente = vid
							where eve.ideventoCliente = vid limit 1);
    RETURN vimageemployee;
END$$

CREATE FUNCTION `loadimagepropertie` (`vid` INT) RETURNS VARCHAR(200) CHARSET latin1 READS SQL DATA
    DETERMINISTIC
    COMMENT 'Funcion que trae la primera imagen de una propiedad'
BEGIN 
    
    DECLARE vimagen varchar(200) DEFAULT '';      
    SET vimagen = (select CAST(img.rutaImagen AS CHAR) as imagen  
                   from imageninmueble as img 
                   where img.`idInmueble` = vid
                   order by  img.rutaImagen asc 
                   limit 1);
    RETURN vimagen;
	

END$$

CREATE FUNCTION `saveclient` (`vid` INT, `vfirstname` VARCHAR(50), `vsecondname` VARCHAR(50), `vfirstlastname` VARCHAR(50), `vsecondlastname` VARCHAR(50), `vDocumentType` INT, `vDocumentNumber` VARCHAR(11), `vCityExpedition` INT, `vBirthdate` VARCHAR(50), `vClientType` INT, `vAddress` VARCHAR(45), `vHomePhone` VARCHAR(10), `vMobilePhone` VARCHAR(10), `vEmail` VARCHAR(45), `vGender` INT, `vCityResidence` INT, `vProfession` INT, `vMaritalStatus` INT, `vPersonType` INT, `vimageclient` VARCHAR(200), `vtypesclient` VARCHAR(2000)) RETURNS INT(1) READS SQL DATA
    DETERMINISTIC
    COMMENT 'Funcion que almacena un cliente'
BEGIN 
	DECLARE res INT DEFAULT 0;
	IF NOT EXISTS(select 1 from clientes where numeroIdentificacion=vDocumentNumber)
		THEN
			insert into clientes(
				numeroIdentificacion, 
				tipoIdentificacion_idtipoIdentificacion, 
				primerNombreCliente, 
				segundoNombreCliente, 
				primerApellidoCliente, 
				segundoApellidoCliente, 
				direccionCliente,
				telefonoFijoCliente, 
				telefonoMovilCliente, 
				correoCliente, 
				idGenero , 
				fechaNacimiento, 
				ciudadResidencia_idciudad, 
				ciudadExpedicion_idciudad, 
				profesiones_idprofesion, 
				tipoPersonaCliente_idtipoPersonCliente,                                     
				idEstadoCivil,
				imagencliente)
				VALUES (
				vDocumentNumber, 
				vDocumentType ,
				vfirstname, 
				vsecondname, 
				vfirstlastname , 
				vsecondlastname , 
				vAddress , 
				vHomePhone,
				vMobilePhone,
				vEmail,
				vGender , 
				vBirthdate,
				vCityResidence , 
				vCityExpedition , 
				vProfession,
				vPersonType,
				vMaritalStatus,
				vimageclient);
				
				SET @vidClient = LAST_INSERT_ID();	
				call log_msg(CONCAT('LO QUE DA EL PRIMER WHILE********',LOCATE(',', vtypesclient)));
				WHILE (LOCATE(',', vtypesclient) > 0) DO
					/*Se saca el primer campo separado por coma del varchar*/
					SET @V_DESIGNATION = SUBSTRING(vtypesclient,1, LOCATE(',',vtypesclient)-1); 
					call log_msg(CONCAT('PARTICIONADO********',@V_DESIGNATION));
					/*Se elimina ese primer valor y se reemplaza en la cadena*/
					SET vtypesclient = SUBSTRING(vtypesclient, 			      LOCATE(',',vtypesclient) + 1); 
					call log_msg(CONCAT('PRUEBA********',vtypesclient));
					call log_msg(CONCAT('VAMOS A INSERTAR********',@V_DESIGNATION,'-------',@vidClient));
					/*Se almacena en la tabla, siempre y cuando tenga un dato para almacenar*/
					IF @V_DESIGNATION <> '' THEN	
						INSERT INTO detalleclientestipoclientes(tiposClientes_idtipoCliente, clientes_cedulaCliente) 
							VALUES (CONVERT(@V_DESIGNATION,SIGNED),@vidClient);
					END IF;
				END WHILE;
			set res = 1;
		END IF;
	RETURN res;
END$$

CREATE FUNCTION `saveclientpublic` (`vid` INT, `vFirstName` VARCHAR(20), `vSecondName` VARCHAR(20), `vFirstLastName` VARCHAR(20), `vSecondLastName` VARCHAR(20), `vMobilePhone` VARCHAR(10), `vEmail` VARCHAR(45), `vPassword` VARCHAR(32)) RETURNS INT(1) READS SQL DATA
    DETERMINISTIC
    COMMENT 'Funcion que almacena un cliente desde la pagina publica'
BEGIN 
    DECLARE res INT DEFAULT 0;     
     
IF NOT EXISTS(select 1 from clientes where correoCliente=vEmail)
		THEN
			insert into clientes(                                                                        
                                    primerNombreCliente,
                                    segundoNombreCliente,
                                    primerApellidoCliente,
                                    segundoApellidoCliente,
                                    telefonoMovilCliente,
                                    correoCliente,
                                    password,
                                    ciudadResidencia_idciudad,
                                    tipoIdentificacion_idtipoIdentificacion,
                                    ciudadExpedicion_idciudad,
                                    profesiones_idprofesion,
                                    tipoPersonaCliente_idtipoPersonCliente,
                                    idEstadoCivil,
                                    idGenero
                                   )
                        VALUES (
                               vFirstName, 
                               vSecondName, 
                               vFirstLastName, 
                               vSecondLastName,
                               vMobilePhone,
                               vEmail,
                               vPassword,
                               0,0,0,0,0,0,0
                              );

    
				
    set res = 1;
			
												 				 
		END IF;

	RETURN res;
	

END$$

CREATE FUNCTION `savecontract` (`vid` INT, `vemployee` INT, `varea` INT, `vstartdate` VARCHAR(50), `venddate` VARCHAR(50), `vcontracttype` INT, `vposition` INT, `vsalary` FLOAT, `vurlcontract` VARCHAR(200)) RETURNS INT(1) READS SQL DATA
    DETERMINISTIC
    COMMENT 'Funcion que almacena un contrato de un empleado'
BEGIN
    DECLARE res INT DEFAULT 0;
    
IF NOT EXISTS(select 1 from  contratoempleado where idcontratoEmpleado=vid)
		THEN
			insert into  contratoempleado(
                                    fechaInicio,
									fechaTerminacion, 
                                    salario, 
                                    areaEmpresa_idareaEmpresa, 
                                    cargos_idCargo, 
                                    empleados_idempleado,
									tipocontratoempleado_idtipoContratoEmpleado,
									archivocontrato
									)
                        VALUES (
                                    vstartdate,
									venddate,
									vsalary,
									varea,
									vposition,
									vemployee,
									vcontracttype,
									vurlcontract
									);
			set res = 1;
				 				 
		END IF;

	RETURN res;

END$$

CREATE FUNCTION `savecontractpropertie` (`vid` INT, `vclient` INT, `vpropertie` INT, `vfirmDate` VARCHAR(50), `vstartDate` VARCHAR(50), `vendDate` VARCHAR(50), `vcontractValue` FLOAT, `vtermContract` INT, `vwayPay` VARCHAR(50), `vurlContract` VARCHAR(500), `vtypescontract` VARCHAR(2000)) RETURNS INT(1) READS SQL DATA
    DETERMINISTIC
    COMMENT 'Funcion que almacena un contrato de un inmueble'
BEGIN
    DECLARE res INT DEFAULT 0;
    
IF NOT EXISTS(select 1 from  contratos where idcontrato=vid)
		THEN
			insert into  contratos(
                                    fechaContrato,
									fechaInicioContrato, 
                                    fechaFinContrato, 
                                    valorContrato,
									plazoContrato,
									formaDePago,
									inmuebles_idinmueble,
									rutaContrato,
									idcliente
									)
                        VALUES (
                                    vfirmDate,
									vstartDate,
									vendDate,
									vcontractValue,
									vtermContract,
									vwayPay,
									vpropertie,
									vurlContract,
									vclient
									);
									SET @vidcontrato = LAST_INSERT_ID();	
  call log_msg(CONCAT('LO QUE DA EL PRIMER WHILE********',LOCATE(',', vtypescontract)));
    WHILE (LOCATE(',', vtypescontract) > 0) DO
      SET @V_DESIGNATION = SUBSTRING(vtypescontract,1, LOCATE(',',vtypescontract)-1); 
      call log_msg(CONCAT('PARTICIONADO********',@V_DESIGNATION));
      SET vtypescontract = SUBSTRING(vtypescontract, 			      LOCATE(',',vtypescontract) + 1); 
      call log_msg(CONCAT('PRUEBA********',vtypescontract));
      call log_msg(CONCAT('VAMOS A INSERTAR********',@V_DESIGNATION,'-------',@vidcontrato));
       IF @V_DESIGNATION <> '' THEN	
    		INSERT INTO detallecontratosobjetos(idobjetoContrato, contratos_idcontrato) 
            VALUES (CONVERT(@V_DESIGNATION,SIGNED),@vidcontrato);
		END IF;
    END WHILE;
			set res = 1;
		END IF;
	RETURN res;

END$$

CREATE FUNCTION `savedebtor` (`vid` INT, `vDocumentNumber` VARCHAR(11), `vfirstname` VARCHAR(50), `vsecondname` VARCHAR(50), `vfirstlastname` VARCHAR(50), `vsecondlastname` VARCHAR(50), `vAddress` VARCHAR(45), `vHomePhone` VARCHAR(10), `vAddressOffice` VARCHAR(45), `vOfficePhone` VARCHAR(10), `vMobilePhone` VARCHAR(10), `vEmail` VARCHAR(45), `vMonthlyIncome` FLOAT, `vMaritalStatus` INT, `vDocumentType` INT, `vCityResidence` INT, `vCityExpedition` INT, `vExpeditionDate` VARCHAR(50)) RETURNS INT(1) READS SQL DATA
    DETERMINISTIC
    COMMENT 'Funcion que almacena un Deudor'
BEGIN 
    DECLARE res INT DEFAULT 0;
    
IF NOT EXISTS(select 1 from deudorSolidario where numeroIdentificacion=vDocumentNumber)
		THEN
			insert into deudorSolidario(
                                    numeroIdentificacion, 
                                    primerNombreDeudor, 
                                    segundoNombreDeudor	, 
                                    primerApellidoDeudor, 
                                    segundoApellidoDeudor, 
                                    direccionResidenciaDeudor,
									telefonoResidenciaDeudor,
                                    direccionLaboralDeudor, 
                                    telefonoLaboralDeudor, 
                                    telefonoMovilDeudor	, 
                                    correoDeudor, 
                                    ingresosMensuales, 
                                    estadoCivilDeudor, 
                                    tipoIdentificacion_idtipoIdentificacion,
									ciudadResidencia_idciudad,
									ciudadExpedicion_idciudad,
									fechaExpedicionIdentificacion)
                        VALUES (
                                    vDocumentNumber, 
                                    vfirstname, 
                                    vsecondname, 
                                    vfirstlastname , 
                                    vsecondlastname , 
                                    vAddress ,
									vHomePhone,
									vAddressOffice,
									vOfficePhone,
									vMobilePhone,
                                    vEmail,
									vMonthlyIncome,
                                    vMaritalStatus, 
                                    vDocumentType,
                                    vCityResidence, 
                                    vCityExpedition,
                                    vExpeditionDate
									);
			set res = 1;
			
												 				 
		END IF;

	RETURN res;
	

END$$

CREATE FUNCTION `savedistrict` (`vid` INT, `vname` VARCHAR(50), `vcity` INT) RETURNS INT(1) READS SQL DATA
    DETERMINISTIC
    COMMENT 'Funcion que almacena un nuevo barrio'
BEGIN 
    DECLARE res INT DEFAULT 0;
     
     
IF NOT EXISTS(select 1 from barrios where nombreBarrio=vname)
		THEN
			insert into barrios(
                                    nombreBarrio, 
                                    	idCiudad 
                                  )
                        VALUES (                                    
                                    vname ,
                                    vcity 
                                    );
			       
				
			set res = 1;
			
												 				 
		END IF;

	RETURN res;
	

END$$

CREATE FUNCTION `saveemployee` (`vid` INT, `vfirstname` VARCHAR(50), `vsecondname` VARCHAR(50), `vfirstlastname` VARCHAR(50), `vsecondlastname` VARCHAR(50), `vdocumentnumber` VARCHAR(11), `vexpeditiondate` VARCHAR(50), `vbirthdate` VARCHAR(50), `vaddress` VARCHAR(45), `vhomephone` VARCHAR(10), `vmobilephone` VARCHAR(10), `vemail` VARCHAR(45), `vgender` INT, `vtypeemployee` INT, `vcityresidence` INT, `vprofession` INT, `vmaritalstatus` INT, `vcityexpedition` INT, `vfileidentification` VARCHAR(200), `vcitybirth` INT, `vmilitarycard` VARCHAR(20), `vbloodtype` INT, `vfilemilitarycard` VARCHAR(200), `vpensionFund` INT, `vseverancefund` INT, `varl` INT, `veps` INT, `vcompensationbox` INT, `vdisability` INT, `vimageemployee` VARCHAR(200), `vcontactname` VARCHAR(50), `vcontactphone` VARCHAR(10), `vcontactemail` VARCHAR(45)) RETURNS INT(1) READS SQL DATA
    DETERMINISTIC
    COMMENT 'Funcion que almacena un Empleado'
BEGIN
    DECLARE res INT DEFAULT 0;
IF NOT EXISTS(select 1 from empleados where cedulaEmpleado=vdocumentnumber)
		THEN
			insert into Empleados(

                                    cedulaEmpleado, 

                                    primerNombreEmpleado, 

                                    segundoNombreEmpleado, 

                                    primerApellidoEmpleado, 

                                    segundoApellidoEmpleado, 

                                    direccionEmpleado,

									telefonoMovilEmpleado,

                                    telefonoFijoEmpleado, 

                                    correoEmpleado, 

                                    idGeneroEmpleado, 

                                    fechaNacimientoEmpleado, 

                                    idCiudadEmpleado, 

                                    idProfesionEmpleado, 

                                    idTipoEmpleado,

									idEsCivil,

									fechaExpedicion,

									archivoCedula,

									numeroLibretaMilitar,

									archivoLibretaMilitar,

									discapacidad,

									fotoEmpleado,

									nombreContacto,

									telefonoContacto,

									correoContacto,

									lugarExpedicion_idCiudad,

									lugarNacimiento_idCiudad,

									tipoSangre_idTipoSangre,

									fondoPensiones_idFondoPensiones,

									eps_ideps,

									fondoCesantias_idFondoCesantias,

									arl_idarl,

									cajaCompensacion_idCajaCompensacion

									)

                        VALUES (

                                    vdocumentnumber, 

                                    vfirstname, 

                                    vsecondname, 

                                    vfirstlastname , 

                                    vsecondlastname , 

                                    vaddress ,

									vmobilephone,

									vhomephone,

                                    vemail,

                                    vgender , 

                                    vbirthdate,

                                    vcityresidence, 

                                    vprofession,

                                    vtypeemployee,

									vmaritalstatus,

									vexpeditiondate,

									vfileidentification,

									vmilitarycard,

									vfilemilitarycard,

									vdisability,

									vimageemployee,

									vcontactname,

									vcontactphone,

									vcontactemail,

									vcityexpedition,

									vcitybirth,

									vbloodtype,

									vpensionFund,

									veps,

									vseverancefund,

									varl,

									vcompensationbox

									);

			set res = 1;

			

												 				 

		END IF;



	RETURN res;

	



END$$

CREATE FUNCTION `saveevent` (`vidEvent` INT, `vdateEvent` VARCHAR(50), `vtimeEvent` VARCHAR(50), `vplaceEvent` VARCHAR(100), `vlatitude` FLOAT, `vlength` FLOAT, `vclient` INT, `veventType` INT, `vobservations` VARCHAR(100), `vemployees` VARCHAR(2000)) RETURNS INT(1) READS SQL DATA
    DETERMINISTIC
    COMMENT 'Funcion que almacena un evento'
BEGIN 







    DECLARE res INT DEFAULT 0;







    







			insert into eventosclientes(







                                    fechaEvento, 







                                    horaEvento, 







                                    lugarEvento, 







                                    latitud, 







                                    longitud, 








									clientes_cedulaCliente,







                                    tiposEventos_idtipoEvento,







									observacionesEvento)







                        VALUES (







                                    vdateEvent, 







                                    vtimeEvent, 







                                    vplaceEvent, 







                                    vlatitude , 







                                    vlength , 







									vclient,







									veventType,







									vobservations);







			







			







			SET @vidEvent = LAST_INSERT_ID();







			







			WHILE (LOCATE(',', vemployees) > 0) DO







					/*Se saca el primer campo separado por coma del varchar*/







					SET @V_DESIGNATION = SUBSTRING(vemployees,1, LOCATE(',',vemployees)-1); 					







					/*Se elimina ese primer valor y se reemplaza en la cadena*/







					SET vemployees = SUBSTRING(vemployees, LOCATE(',',vemployees) + 1); 







				







					/*Se almacena en la tabla, siempre y cuando tenga un dato para almacenar*/







					IF @V_DESIGNATION <> ',' THEN	







							INSERT INTO detalleeventosempleados(empleados_idempleado, eventosclientes_ideventoCliente) 







							VALUES (CONVERT(@V_DESIGNATION,SIGNED),@vidEvent);







				







					END IF;







			END WHILE;







			







			set res = 1;								 				 















	RETURN res;







	















END$$

CREATE FUNCTION `saveexperience` (`vid` INT, `vemployee` INT, `vcompanyname` VARCHAR(50), `vadmissiondate` VARCHAR(50), `vdeparturedate` VARCHAR(50), `vurlworkcertificate` VARCHAR(200), `vposition` INT) RETURNS INT(1) READS SQL DATA
    DETERMINISTIC
    COMMENT 'Funcion que almacena la experiencia de un empleado'
BEGIN


    DECLARE res INT DEFAULT 0;


    


IF NOT EXISTS(select 1 from experienciaempleado where idexperienciaEmpleado=vid)


		THEN


			insert into experienciaempleado(


                                    empleados_idempleado,


									empresa, 


                                    fechaIngreso, 


                                    fechaSalida, 


                                    certificadoLaboral, 


                                    cargos_idCargo


									)


                        VALUES (


                                    vemployee,


									vcompanyname,


									vadmissiondate,


									vdeparturedate,


									vurlworkcertificate,


									vposition


									);


			set res = 1;


				 				 


		END IF;





	RETURN res;





END$$

CREATE FUNCTION `saveformation` (`vid` INT, `vinstitute` VARCHAR(50), `vlevel` INT, `vcertificate` VARCHAR(200), `vemployee` INT, `vprofession` INT, `vperiodicity` INT, `vgraduate` INT) RETURNS INT(1) READS SQL DATA
    DETERMINISTIC
    COMMENT 'Funcion que almacena la formación de un empleado'
BEGIN

    DECLARE res INT DEFAULT 0;

    

IF NOT EXISTS(select 1 from formacionempleado where idformacionEmpleado=vid)

		THEN

			insert into formacionempleado(

                                    institucionEducacion,

									nivelAlcanzado, 

                                    diplomaOActa, 

                                    empleados_idempleado, 

                                    profesiones_idprofesion, 

                                    periodicidad_idperiodicidad,

									graduado

									)

                        VALUES (

                                    vinstitute,

									vlevel,

									vcertificate,

									vemployee,

									vprofession,

									vperiodicity,

									vgraduate

									);

			set res = 1;

		END IF;

	RETURN res;

END$$

CREATE FUNCTION `savenoticia` (`cod` INT, `titl` VARCHAR(200), `des` VARCHAR(10000), `fech` VARCHAR(20), `phot` VARCHAR(2000), `vid` VARCHAR(2000)) RETURNS INT(1) READS SQL DATA
    DETERMINISTIC
    COMMENT 'Funcion que almacena una noticia'
BEGIN 







    DECLARE res INT DEFAULT 0;







    







IF NOT EXISTS(select titulo from noticia where titulo=titl)







		THEN







			insert into noticia(titulo,descripcion,fecha,foto,video) values(titl,des,fech,phot,vid);	







			set res = 1;							







			







		END IF;















	RETURN res;







	







END$$

CREATE FUNCTION `savepqrsclient` (`vpqrstype` INT, `vdescription` VARCHAR(200), `vfecha` VARCHAR(20), `vhora` VARCHAR(20), `vidclient` INT) RETURNS INT(1) READS SQL DATA
    DETERMINISTIC
    COMMENT 'Funcion que almacena un pqrs del cliente'
BEGIN 
    DECLARE res INT DEFAULT 0;
     
    insert into pqrs(fechaPQRS, 
                        horaPQRS,
                        descripcionPQRS,
                        idtipopqrs, 
                        idusuario
                        )
                        VALUES (vfecha,
                                vhora,
                                vdescription,
                                vpqrstype,
                                vidclient
                                );
			       
				
			set res = 1;
			
		
	RETURN res;
	

END$$

CREATE FUNCTION `saveprofession` (`vid` INT, `vname` VARCHAR(50), `vprofessionnivel` INT) RETURNS INT(1) READS SQL DATA
    DETERMINISTIC
    COMMENT 'Funcion que almacena una profesion'
BEGIN 







    DECLARE res INT DEFAULT 0;







    







IF NOT EXISTS(select 1 from profesiones where nombreProfesion=vname and vProfessionNivel = nivelProfesion_idnivelProfesion)







		THEN







			insert into profesiones(







                                    nombreProfesion, 







                                    nivelProfesion_idnivelProfesion)







                        VALUES (







                                    vname, 







                                    vprofessionnivel);







			set res = 1;







			







												 				 







		END IF;















	RETURN res;







	















END$$

CREATE FUNCTION `savepropertieauditpublic` (`vusuario_id` VARCHAR(20), `vid_register` INT, `vdia` VARCHAR(20), `vmes` VARCHAR(20), `vanio` VARCHAR(5), `vhora` VARCHAR(20), `vip` VARCHAR(20), `vdispositivo` VARCHAR(20), `vsistema_operativo` VARCHAR(20), `vnavegador` VARCHAR(20)) RETURNS INT(1) READS SQL DATA
    DETERMINISTIC
    COMMENT 'Funcion que almacena una auditoria de la busqueda de un inmueble en el portal'
BEGIN 
    DECLARE res INT DEFAULT 0;        
            insert into audit_propertie_search(usuario_id,id_register,dia,mes,anio,hora,ip,dispositivo,sistema_operativo,navegador)
            VALUES (vusuario_id,vid_register,vdia,vmes,vanio,vhora,vip,vdispositivo,vsistema_operativo,vnavegador);			       				
	    set res = 1;															 				 
	RETURN res;
	

END$$

CREATE FUNCTION `savereference` (`vid` INT, `vclient` INT, `vtypereference` INT, `vname` VARCHAR(50), `vlastname` VARCHAR(50), `vphone` VARCHAR(10)) RETURNS INT(1) READS SQL DATA
    DETERMINISTIC
    COMMENT 'Funcion que almacena un contrato de una referencia'
BEGIN
    DECLARE res INT DEFAULT 0;
    
IF NOT EXISTS(select 1 from  referenciapersonalfamiliar where idreferenciapersonalfamiliar=vid)
		THEN
			insert into  referenciapersonalfamiliar(
                                    nombresreferencia,
									apellidosreferencia, 
                                    telefonoreferencia, 
                                    clientes_idcliente, 
                                    tiporeferencia_idtiporeferencia
									)
                        VALUES (
                                    vname,
									vlastname,
									vphone,
									vclient,
									vtypereference
									);
			set res = 1;
				 				 
		END IF;

	RETURN res;

END$$

CREATE FUNCTION `savereferencebank` (`vid` INT, `vclient` INT, `vaccountnumber` VARCHAR(50), `vbank` INT, `vbranchOffice` VARCHAR(50)) RETURNS INT(1) READS SQL DATA
    DETERMINISTIC
    COMMENT 'Funcion que almacena un contrato de una referencia bancaría'
BEGIN
    DECLARE res INT DEFAULT 0;
    
IF NOT EXISTS(select 1 from  referenciabancaria where idreferenciabancaria=vid)
		THEN
			insert into  referenciabancaria(
                                    numerocuenta,
									sucursal, 
                                    bancos_idbanco, 
                                    clientes_idcliente
									)
                        VALUES (
                                    vaccountnumber,
									vbranchOffice,
									vbank,
									vclient
									);
			set res = 1;
				 				 
		END IF;

	RETURN res;

END$$

CREATE FUNCTION `saverol` (`cod` INT, `nom` VARCHAR(50), `des` VARCHAR(2000)) RETURNS INT(1) READS SQL DATA
    DETERMINISTIC
    COMMENT 'Funcion que almacena un rol'
BEGIN 







    DECLARE res INT DEFAULT 0;







    







IF NOT EXISTS(select nombre from rol where nombre=nom)







		THEN







			insert into rol(nombre,descripcion) values(nom,des);	







			set res = 1;							







			







		END IF;















	RETURN res;







	















END$$

CREATE FUNCTION `savespouse` (`vid` INT, `vclient` INT, `vdocumentNumber` INT, `vexpeditionDate` VARCHAR(50), `vemail` VARCHAR(50), `vfirstName` VARCHAR(50), `vlastName` VARCHAR(50), `vmobilePhone` VARCHAR(50), `vcompany` VARCHAR(50), `vaddress` VARCHAR(100), `vofficePhone` VARCHAR(50), `vsalary` FLOAT) RETURNS INT(1) READS SQL DATA
    DETERMINISTIC
    COMMENT 'Funcion que almacena un conyugue'
BEGIN
    DECLARE res INT DEFAULT 0;
    
IF NOT EXISTS(select 1 from  conyugues where idconyugue=vid)
		THEN
			insert into  conyugues(
                                    numeroIdentificacionConyugue,
									fechaExpedicionNumeroId, 
                                    correoElectronicoConyugue, 
                                    nombresConyugue,
									apellidosConyugue,
									nombreEmpresaLabora,
									direccionLaboralConyugue,
									telefonoLaboralConyugue,
									telefonoMovilConyugue,
									salarioMensualConyugue,
									clientes_idCliente
									)
                        VALUES (
                                    vdocumentNumber,
									vexpeditionDate,
									vemail,
									vfirstName,
									vlastName,
									vcompany,
									vaddress,
									vofficePhone,
									vmobilePhone,
									vsalary,
									vclient
									);
			set res = 1;
				 				 
		END IF;

	RETURN res;

END$$

CREATE FUNCTION `saveupdatedependent` (`vid` INT, `vactivityEconomic` INT, `vcompany` VARCHAR(50), `vposition` INT, `vaddress` VARCHAR(200), `vsalary` FLOAT, `votherIncome` FLOAT, `vantiquity` INT, `vofficePhone` VARCHAR(10)) RETURNS INT(1) READS SQL DATA
    DETERMINISTIC
    COMMENT 'Funcion que almacena un arrendatario dependiente'
BEGIN 




    DECLARE res INT DEFAULT 0;




    




IF NOT EXISTS(select 1 from  arrendatariodependiente where clientes_idCliente=vId)




		THEN




				




			insert into arrendatariodependiente(




                                    Cargos_idCargo, 




                                    nombreEmpresa, 




                                    sueldoBasico, 




                                    otrosIngresos, 




                                    direccionOficina, 




                                    telefonoOficina,




									antiguedadEnEmpresa,




                                    clientes_idCliente, 




                                    idtipoLaborArrendatario)




                        VALUES (




                                    vposition, 




                                    vcompany, 




                                    vsalary, 




                                    votherIncome, 




                                    vaddress, 




                                    vofficePhone,




									vantiquity,




                                    vid,




                                    vactivityEconomic




                                    );




			set res = 1;




		ELSE




			update arrendatariodependiente set Cargos_idCargo = vposition, 




                                    nombreEmpresa = vcompany, 




                                    sueldoBasico = vsalary, 




                                    otrosIngresos = votherIncome, 




                                    direccionOficina = vaddress, 




                                    telefonoOficina = vofficePhone,




									antiguedadEnEmpresa = vantiquity,




                                    idtipoLaborArrendatario = vactivityEconomic




					where clientes_idCliente=vId;




			set res = 1;




		END IF;




	RETURN res;




END$$

CREATE FUNCTION `saveupdateindependent` (`vid` INT, `vactivityEconomic` INT, `vbusinessDescription` VARCHAR(100), `vmerchantRecord` VARCHAR(50), `vnumberEmployees` INT, `vincome` FLOAT, `vexpenses` FLOAT) RETURNS INT(1) READS SQL DATA
    DETERMINISTIC
    COMMENT 'Funcion que almacena un arrendatario independiente'
BEGIN 




    DECLARE res INT DEFAULT 0;




    




IF NOT EXISTS(select 1 from  arrendatarioindependiente where clientes_idCliente=vId)




		THEN




				




			insert into arrendatarioindependiente(




                                    descripcionNegocio, 




                                    registroMercantil, 




                                    ingresos, 




                                    egresos, 




                                    numeroEmpleados, 




                                    clientes_idCliente,




									tipoactividadeconomicaarrendatario_idtipoLaborArrendatario




                                    )




                        VALUES (




                                    vbusinessDescription, 




                                    vmerchantRecord, 




                                    vincome, 




                                    vexpenses, 




                                    vnumberEmployees, 




                                    vid,




									vactivityEconomic




                                    );




			set res = 1;




		ELSE




			update arrendatarioindependiente set descripcionNegocio = vbusinessDescription, 




                                    registroMercantil = vmerchantRecord, 




                                    ingresos = vincome, 




                                    egresos = vexpenses, 




                                    numeroEmpleados = vnumberEmployees,




                                    tipoactividadeconomicaarrendatario_idtipoLaborArrendatario = vactivityEconomic




				where clientes_idCliente=vId;




			set res = 1;




		END IF;




	RETURN res;




END$$

CREATE FUNCTION `saveuser` (`id` INT, `vfirstname` VARCHAR(50), `vsecondname` VARCHAR(50), `vfirstlastname` VARCHAR(50), `vsecondlastname` VARCHAR(50), `vuser` VARCHAR(50), `vpass` VARCHAR(50), `vrol` INT, `vdescription` VARCHAR(50)) RETURNS INT(1) READS SQL DATA
    DETERMINISTIC
    COMMENT 'Funcion que almacena un rol'
BEGIN 







    DECLARE res INT DEFAULT 0;







    







IF NOT EXISTS(select usuario from usuario where usuario=vuser)







		THEN







			insert into usuario(primer_nombre, segundo_nombre, primer_apellido, segundo_apellido, 







					   usuario, password, rol,descripcion)







			VALUES (vfirstname,vsecondname,vfirstlastname,vsecondlastname,vuser,vpass,vrol,vdescription);







			set res = 1;







			







				







			







		END IF;















	RETURN res;







	







	















END$$

CREATE FUNCTION `updateclient` (`vid` INT, `vfirstname` VARCHAR(50), `vsecondname` VARCHAR(50), `vfirstlastname` VARCHAR(50), `vsecondlastname` VARCHAR(50), `vDocumentType` INT, `vDocumentNumber` VARCHAR(11), `vCityExpedition` INT, `vBirthdate` VARCHAR(50), `vClientType` INT, `vAddress` VARCHAR(45), `vHomePhone` VARCHAR(10), `vMobilePhone` VARCHAR(10), `vEmail` VARCHAR(45), `vGender` INT, `vCityResidence` INT, `vProfession` INT, `vMaritalStatus` INT, `vPersonType` INT, `vimageclient` VARCHAR(200), `vtypesclient` VARCHAR(2000)) RETURNS INT(1) READS SQL DATA
    DETERMINISTIC
    COMMENT 'Funcion que actualiza un cliente'
BEGIN 
	DECLARE res INT DEFAULT 0;

        call log_msg(CONCAT('ANTES DE IF********',vid));

	IF NOT EXISTS(select 1 from clientes where numeroIdentificacion=vDocumentNumber and idCliente<>vid)
		THEN

                        call log_msg(CONCAT('ENTRE AL IF ********',vid));
			update clientes set
				numeroIdentificacion = vDocumentNumber,
                                            primerNombreCliente = vfirstname, 
                                            segundoNombreCliente = vsecondname,
                                            primerApellidoCliente = vfirstlastname,
                                            segundoApellidoCliente = vsecondlastname,
                                            direccionCliente = vAddress,
                                            telefonoFijoCliente = vHomePhone,
                                            telefonoMovilCliente = vMobilePhone, 
                                            correoCliente = vEmail, 
                                            fechaNacimiento = vBirthdate, 
                                            ciudadResidencia_idciudad = vCityResidence,
                                            tipoIdentificacion_idtipoIdentificacion = vDocumentType,
                                            ciudadExpedicion_idciudad = vCityExpedition,
                                            profesiones_idprofesion = vProfession,
                                            tipoPersonaCliente_idtipoPersonCliente = vPersonType,
                                            idEstadoCivil = vMaritalStatus,
                                            imagencliente = vimageclient,
                                            idGenero = vGender                                              
                        where 	idCliente = vid;
				
				set res=1;

                                 call log_msg(CONCAT('ANTES DE DELETE ********',vid));

                                delete from detalleclientestipoclientes 
                                where clientes_cedulaCliente = vid;

				
				WHILE (LOCATE(',', vtypesclient) > 0) DO
					
					SET @V_DESIGNATION = SUBSTRING(vtypesclient,1, LOCATE(',',vtypesclient)-1); 					
					
					SET vtypesclient = SUBSTRING(vtypesclient,LOCATE(',',vtypesclient) + 1); 
					                                        
					IF @V_DESIGNATION <> '' THEN	
						INSERT INTO detalleclientestipoclientes(tiposClientes_idtipoCliente, clientes_cedulaCliente) 
							VALUES (CONVERT(@V_DESIGNATION,SIGNED),vid);
					END IF;
				END WHILE;
			set res = 1;
		END IF;
	RETURN res;
END$$

CREATE FUNCTION `updatecommentevents` (`vid` INT, `vcomments` VARCHAR(16383)) RETURNS INT(1) READS SQL DATA
    DETERMINISTIC
    COMMENT 'Funcion que modifica los comentarios de un evento'
BEGIN 







    DECLARE res INT DEFAULT 0;







    







			update eventosclientes set DescripcionEvento = vcomments                                                                                                             







                        where 	ideventoCliente = vId;		







			set res=1;







                        







												







	RETURN res;







	















END$$

CREATE FUNCTION `updatecontract` (`vid` INT, `vemployee` INT, `varea` INT, `vstartdate` VARCHAR(50), `venddate` VARCHAR(50), `vcontracttype` INT, `vposition` INT, `vsalary` FLOAT, `vurlcontract` VARCHAR(200)) RETURNS INT(1) READS SQL DATA
    DETERMINISTIC
    COMMENT 'Funcion que modifica un contrato de un empleado'
BEGIN 
    DECLARE res INT DEFAULT 0;
    
			update contratoempleado set 
									fechaInicio = vstartdate,
									fechaTerminacion = venddate,
                                    salario= vsalary , 
                                    areaEmpresa_idareaEmpresa = varea, 
                                    cargos_idCargo = vposition, 
                                    empleados_idempleado = vemployee,
									tipocontratoempleado_idtipoContratoEmpleado = vcontracttype,
									archivocontrato = vurlcontract
                        where 	idcontratoEmpleado = vid;		
			set res=1;
	RETURN res;
END$$

CREATE FUNCTION `updatecontractpropertie` (`vid` INT, `vclient` INT, `vpropertie` INT, `vfirmDate` VARCHAR(50), `vstartDate` VARCHAR(50), `vendDate` VARCHAR(50), `vcontractValue` FLOAT, `vtermContract` INT, `vwayPay` VARCHAR(50), `vurlContract` VARCHAR(500)) RETURNS INT(1) READS SQL DATA
    DETERMINISTIC
    COMMENT 'Funcion que modifica el contrato de un inmueble'
BEGIN 
    DECLARE res INT DEFAULT 0;
    
			update contratos set fechaContrato = vfirmDate,
									fechaInicioContrato = vstartDate,
                                    fechaFinContrato = vendDate,
                                    valorContrato = vcontractValue,
									plazoContrato = vtermContract,
									formaDePago = vwayPay,
									inmuebles_idinmueble = vpropertie,
									rutaContrato = vurlContract,
									idcliente = vclient
                        where 	idcontrato = vid;		
			set res=1;
	RETURN res;
END$$

CREATE FUNCTION `updatedebtor` (`vid` INT, `vDocumentNumber` VARCHAR(11), `vfirstname` VARCHAR(50), `vsecondname` VARCHAR(50), `vfirstlastname` VARCHAR(50), `vsecondlastname` VARCHAR(50), `vAddress` VARCHAR(45), `vHomePhone` VARCHAR(10), `vAddressOffice` VARCHAR(45), `vOfficePhone` VARCHAR(10), `vMobilePhone` VARCHAR(10), `vEmail` VARCHAR(45), `vMonthlyIncome` FLOAT, `vMaritalStatus` INT, `vDocumentType` INT, `vCityResidence` INT, `vCityExpedition` INT, `vExpeditionDate` VARCHAR(50)) RETURNS INT(1) READS SQL DATA
    DETERMINISTIC
    COMMENT 'Funcion que modifica un Deudor'
BEGIN 
    DECLARE res INT DEFAULT 0;
    
IF NOT EXISTS(select 1 from deudorSolidario where numeroIdentificacion =vDocumentNumber and idDeudor<>vId)
		THEN
			update deudorSolidario set numeroIdentificacion = vDocumentNumber,
                                            primerNombreDeudor = vfirstname, 
                                            segundoNombreDeudor = vsecondname,
                                            primerApellidoDeudor = vfirstlastname, 
                                            segundoApellidoDeudor = vsecondlastname, 
                                            direccionResidenciaDeudor = vAddress,
                                            telefonoResidenciaDeudor = vHomePhone,
											direccionLaboralDeudor = vAddressOffice,
											telefonoLaboralDeudor = vOfficePhone,
                                            telefonoMovilDeudor = vMobilePhone, 
                                            correoDeudor = vEmail, 
											ingresosMensuales = vMonthlyIncome,
											estadoCivilDeudor = vMaritalStatus,
											tipoIdentificacion_idtipoIdentificacion = vDocumentType,
                                            ciudadResidencia_idciudad = vCityResidence,
											ciudadExpedicion_idciudad = vCityResidence,
											fechaExpedicionIdentificacion = vExpeditionDate
                        where 	idDeudor = vId;		
			set res=1;
                        
														
		END IF;

	RETURN res;
	

END$$

CREATE FUNCTION `updateemployee` (`vid` INT, `vfirstname` VARCHAR(50), `vsecondname` VARCHAR(50), `vfirstlastname` VARCHAR(50), `vsecondlastname` VARCHAR(50), `vdocumentnumber` VARCHAR(11), `vexpeditiondate` VARCHAR(50), `vbirthdate` VARCHAR(50), `vaddress` VARCHAR(45), `vhomephone` VARCHAR(10), `vmobilephone` VARCHAR(10), `vemail` VARCHAR(45), `vgender` INT, `vtypeemployee` INT, `vcityresidence` INT, `vprofession` INT, `vmaritalstatus` INT, `vcityexpedition` INT, `vfileidentification` VARCHAR(200), `vcitybirth` INT, `vmilitarycard` VARCHAR(20), `vbloodtype` INT, `vfilemilitarycard` VARCHAR(200), `vpensionFund` INT, `vseverancefund` INT, `varl` INT, `veps` INT, `vcompensationbox` INT, `vdisability` INT, `vimageemployee` VARCHAR(200), `vcontactname` VARCHAR(50), `vcontactphone` VARCHAR(10), `vcontactemail` VARCHAR(45)) RETURNS INT(1) READS SQL DATA
    DETERMINISTIC
    COMMENT 'Funcion que modifica un Empleado'
BEGIN 

    DECLARE res INT DEFAULT 0;

    

IF NOT EXISTS(select 1 from Empleados where cedulaEmpleado =vDocumentNumber and idEmpleado<>vId)

		THEN

			update Empleados set cedulaEmpleado = vDocumentNumber,

									primerNombreEmpleado=vfirstname,

									segundoNombreEmpleado =vsecondname,

									primerApellidoEmpleado=vfirstlastname ,

									segundoApellidoEmpleado=vsecondlastname ,

									direccionEmpleado=vaddress ,

									telefonoMovilEmpleado=vmobilephone,

									telefonoFijoEmpleado=vhomephone,

									correoEmpleado=vemail,

									idGeneroEmpleado=vgender ,

									fechaNacimientoEmpleado=vbirthdate,

									idCiudadEmpleado=vcityresidence,

									idProfesionEmpleado=vprofession,

									idTipoEmpleado=vtypeemployee,

									idEsCivil=vmaritalstatus,

									fechaExpedicion=vexpeditiondate,

									archivoCedula=vfileidentification,

									numeroLibretaMilitar=vmilitarycard,

									archivoLibretaMilitar=vfilemilitarycard,

									discapacidad=vdisability,

									fotoEmpleado=vimageemployee,

									nombreContacto=vcontactname,

									telefonoContacto=vcontactphone,

									correoContacto=vcontactemail,

									lugarExpedicion_idCiudad=vcityexpedition,

									lugarNacimiento_idCiudad=vcitybirth,

									tipoSangre_idTipoSangre=vbloodtype,

									fondoPensiones_idFondoPensiones=vpensionFund,

									eps_ideps=veps,

									fondoCesantias_idfondoCesantias=vseverancefund,

									arl_idarl=varl,

									cajaCompensacion_idCajaCompensacion=vcompensationbox

                        where 	idEmpleado = vId;		

			set res=1;

		END IF;



	RETURN res;

	



END$$

CREATE FUNCTION `updateevent` (`vid` INT, `vdateEvent` VARCHAR(50), `vtimeEvent` VARCHAR(50), `vplaceEvent` VARCHAR(100), `vlatitude` FLOAT, `vlength` FLOAT, `vclient` INT, `veventType` INT, `vobservations` VARCHAR(100), `vemployees` VARCHAR(2000)) RETURNS INT(1) READS SQL DATA
    DETERMINISTIC
    COMMENT 'Funcion que almacena un evento'
BEGIN 







    DECLARE res INT DEFAULT 0;







    







			update eventosclientes set 







                                    fechaEvento = vdateEvent, 







                                    horaEvento = vtimeEvent, 







                                    lugarEvento=vplaceEvent, 







                                    latitud=vlatitude, 







                                    longitud=vlength, 







									clientes_cedulaCliente=vclient,







                                    tiposEventos_idtipoEvento=veventType,







									observacionesEvento=vobservations







                        where 	ideventoCliente = vId;







			set res=1;















                        delete from detalleeventosempleados 







                        where eventosclientes_ideventoCliente = vId;







						







			WHILE (LOCATE(',', vemployees) > 0) DO







					/*Se saca el primer campo separado por coma del varchar*/







					SET @V_DESIGNATION = SUBSTRING(vemployees,1, LOCATE(',',vemployees)-1); 					







					/*Se elimina ese primer valor y se reemplaza en la cadena*/







					SET vemployees = SUBSTRING(vemployees, LOCATE(',',vemployees) + 1); 







				







					/*Se almacena en la tabla, siempre y cuando tenga un dato para almacenar*/







					IF @V_DESIGNATION <> ',' THEN	







							INSERT INTO detalleeventosempleados(empleados_idempleado, eventosclientes_ideventoCliente) 







							VALUES (CONVERT(@V_DESIGNATION,SIGNED),vId);







				







					END IF;







			END WHILE;







			







			set res = 1;								 				 















	RETURN res;







	















END$$

CREATE FUNCTION `updateexperience` (`vid` INT, `vemployee` INT, `vcompanyname` VARCHAR(50), `vadmissiondate` VARCHAR(50), `vdeparturedate` VARCHAR(50), `vurlworkcertificate` VARCHAR(200), `vposition` INT) RETURNS INT(1) READS SQL DATA
    DETERMINISTIC
    COMMENT 'Funcion que modifica la experiencia de un empleado'
BEGIN 


    DECLARE res INT DEFAULT 0;


    


			update experienciaempleado set empresa = vcompanyname,


									fechaIngreso=vadmissiondate,


                                    fechaSalida = vdeparturedate,


                                    certificadoLaboral = vurlworkcertificate,


                                    cargos_idCargo = vposition


                        where 	idexperienciaEmpleado = vid;		


			set res=1;


	RETURN res;


END$$

CREATE FUNCTION `updateformation` (`vid` INT, `vinstitute` VARCHAR(50), `vlevel` INT, `vcertificate` VARCHAR(200), `vemployee` INT, `vprofession` INT, `vperiodicity` INT, `vgraduate` INT) RETURNS INT(1) READS SQL DATA
    DETERMINISTIC
    COMMENT 'Funcion que modifica la formación de un empleado'
BEGIN 

    DECLARE res INT DEFAULT 0;

    

			update formacionempleado set institucionEducacion = vinstitute,

										nivelAlcanzado = vlevel,

										diplomaOActa = vcertificate,

										empleados_idempleado = vemployee,

										profesiones_idprofesion = vprofession,

										periodicidad_idperiodicidad = vperiodicity,

										graduado = vgraduate

                        where 	idformacionEmpleado = vid;		

			set res=1;

	RETURN res;

END$$

CREATE FUNCTION `updatenoticia` (`cod` INT, `titl` VARCHAR(200), `des` VARCHAR(10000), `fech` VARCHAR(20), `phot` VARCHAR(2000), `vid` VARCHAR(2000)) RETURNS INT(1) READS SQL DATA
    DETERMINISTIC
    COMMENT 'Funcion que modifica una noticia'
BEGIN 







    DECLARE res INT DEFAULT 0;







    







IF NOT EXISTS(select titulo from noticia where titulo=titl and id<>cod)







		THEN







			update noticia set titulo = titl,descripcion = des, fecha = fech,foto = phot, video = vid







                        where id = cod;		







			set res=1;







														







		END IF;















	RETURN res;







	















END$$

CREATE FUNCTION `updatepermission` (`vid` INTEGER, `vpermission` VARCHAR(2000)) RETURNS INT(1) READS SQL DATA
    DETERMINISTIC
    COMMENT 'Funcion que actualiza los permisos de un rol'
BEGIN 







    DECLARE res INT DEFAULT 0;







    /*Variable que contendra el permiso a almacenar*/







    DECLARE permiso varchar(50) DEFAULT '';    















    /*Se borra todos los permisos existentes del usuario*/







    delete from menu_rol where idrol = vid;







    







   







 WHILE (LOCATE(',', vpermission) > 0) DO







      /*Se saca el primer campo separado por coma del varchar*/







      SET @V_DESIGNATION = SUBSTRING(vpermission,1, LOCATE(',',vpermission)-1); 







      /*call log_msg(CONCAT('PARTICIONADO********',@V_DESIGNATION));*/







      /*Se elimina ese primer valor y se reemplaza en la cadena*/







      SET vpermission = SUBSTRING(vpermission, LOCATE(',',vpermission) + 1); 







      /*call log_msg(CONCAT('PRUEBA********',vpermission));*/







      /*call log_msg(CONCAT('VAMOS A INSERTAR********',@V_DESIGNATION,'-------',@vidClient));*/







      







       /*Se almacena en la tabla, siempre y cuando tenga un dato para almacenar*/







       IF @V_DESIGNATION <> ',' THEN	







    		INSERT INTO menu_rol(idrol, idmenu) VALUES (vid, @V_DESIGNATION);







       END IF;







    END WHILE;















    SET res = 1;















    RETURN res;	







END$$

CREATE FUNCTION `updatepqrs` (`vid` INT, `vgivenResponse` VARCHAR(200)) RETURNS INT(1) READS SQL DATA
    DETERMINISTIC
    COMMENT 'Funcion que modifica una PQRS'
BEGIN 
    DECLARE res INT DEFAULT 0;
    
			update pqrs set respuestaDada = vgivenResponse
                        where 	idpqrs = vid;		
			set res=1;
	RETURN res;
END$$

CREATE FUNCTION `updateprofession` (`vId` INT, `vName` VARCHAR(50), `vProfessionNivel` INT) RETURNS INT(1) READS SQL DATA
    DETERMINISTIC
    COMMENT 'Funcion que modifica una profesion'
BEGIN 







    DECLARE res INT DEFAULT 0;







    







IF NOT EXISTS(select 1 from profesiones where nombreProfesion =vName and 







                            vProfessionNivel = nivelProfesion_idnivelProfesion  and 







                            idProfesion<>vId)







		THEN







			update profesiones set nombreProfesion = vName, 







                                            nivelProfesion_idnivelProfesion = vProfessionNivel







                        where idProfesion = vId;		







			set res=1;







														







		END IF;















	RETURN res;







	















END$$

CREATE FUNCTION `updatepropertie` (`vid` INT, `vPrecio` FLOAT, `vAdministrationCost` FLOAT, `vRoom` INT, `vBath` INT, `vParking` INT, `vTotalArea` FLOAT, `vAreasWithoutBalconies` FLOAT, `vBuildYear` VARCHAR(4), `vNumeroPiso` VARCHAR(3), `vChimenea` TINYINT, `vEstudio` TINYINT, `vDeposito` TINYINT, `vZonaRopas` TINYINT, `vParqueaderoVisitante` TINYINT, `vAscensor` TINYINT, `vTerraza` TINYINT, `vTransportePublicoCercano` TINYINT, `vSalonComunal` TINYINT, `vSauna` TINYINT, `vTurco` TINYINT, `vJacuzzi` TINYINT, `vZonaInfantil` TINYINT, `vJardines` TINYINT, `vDuplex` TINYINT, `vPuertaSeguridad` TINYINT, `vGimnasio` TINYINT, `vPrecioNegociable` TINYINT, `vPiscina` TINYINT, `vZonaMascotas` TINYINT, `vParqueaderoCubierto` TINYINT, `vAmoblado` TINYINT, `vCity` INT, `vBarrio` INT, `vEstrato` INT, `vPropertieType` INT, `vOfferType` INT, `vCurtainType` INT, `vVigilanceType` INT, `vZone` INT, `vViewType` INT, `vStatus` INT, `vKitchenType` INT, `vKitchenStructure` INT, `vFloorType` INT, `vClient` INT, `vPublicationDate` VARCHAR(50), `vReceptionDate` VARCHAR(50), `vOutstandingType` INT, `vLinderos` VARCHAR(200), `vMatriculaInmobiliaria` VARCHAR(45), `vAvaluoCatastral` FLOAT, `vLatitude` VARCHAR(45), `vLongitude` VARCHAR(45), `vDireccionCarrera` VARCHAR(50), `vDireccionCalle` VARCHAR(50), `vDireccionNumero` VARCHAR(50), `vDireccionInfoAdicional` VARCHAR(50), `vImages` VARCHAR(2000), `vVideos` VARCHAR(2000)) RETURNS INT(1) READS SQL DATA
    DETERMINISTIC
    COMMENT 'Funcion que almacena un inmueble'
BEGIN 
    DECLARE res INT DEFAULT 0;     
     
   
IF NOT EXISTS(select 1 from inmuebles where matriculaInmobiliaria=vMatriculaInmobiliaria and idinmueble<>vid)
		THEN
			update inmuebles set                                                                      
                                    precio = vPrecio,
                                    costoAdministracion = vAdministrationCost,
                                    habitaciones = vRoom,
                                    banos = vBath,
                                    parqueaderos = vParking,
                                    areaTotal = vTotalArea,
                                    areaSinBalcones = vAreasWithoutBalconies,
                                    anoDeConstruccion = vBuildYear,
                                    numeroPiso = vNumeroPiso,
                                    chimenea = vChimenea,
                                    estudio = vEstudio ,
                                    deposito = vDeposito,
                                    zonaRopas = vZonaRopas,
                                    parqueaderoVisitante = vParqueaderoVisitante,
                                    ascensor = vAscensor ,
                                    terraza = vTerraza,
                                    transportePublicoCercano = vTransportePublicoCercano ,
                                    precioNegociable = vPrecioNegociable,                                  
                                    piscina = vPiscina,
                                    zonaMascotas = vZonaMascotas ,
                                    parqueaderoCubierto = vParqueaderoCubierto,
                                    amoblado = vAmoblado,
                                    salonComunal = vSalonComunal,
                                    sauna = vSauna,
                                    turco = vTurco,
                                    jacuzzi = vJacuzzi,
                                    zonaInfantil = vZonaInfantil,
                                    jardines = vJardines,
                                    duplex = vDuplex,
                                    puertaDeSeguridad = vPuertaSeguridad,
                                    gimnasio = vGimnasio,
                                    ciudades_idciudad = vCity,
                                    estratos_idestrato = vEstrato,
                                    barrios_idbarrio = vBarrio,
                                    tiposInmuebles_idtipoInmueble = vPropertieType ,
                                    tiposOfertas_idtipoOferta = vOfferType,
                                    tiposCortinas_idtipoCortina = vCurtainType,
                                    tiposVigilancias_idtipoVigilancia = vVigilanceType ,
                                    zonas_idzona = vZone,
                                    tiposVistas_idtipoVista = vViewType ,                                    
                                    estado_idestado = vStatus ,
                                    tiposCocinas_idtipoCocina = vKitchenType,
                                    estructurasCocinas_idestructuraCocina = vKitchenStructure,
                                    tiposPisos_idtipoPiso = vFloorType,
                                    clientes_cedulaCliente = vClient,
                                    fechaPublicacion = vPublicationDate,
                                    fechaRecepcion = vReceptionDate,
                                    tiposDestacados_idtipoDestacado = vOutstandingType,
                                    linderosInmueble =vLinderos,
                                    matriculaInmobiliaria = vMatriculaInmobiliaria,
                                    avaluoCatastral = vAvaluoCatastral,
                                    latitud = vLatitude,
                                    longitud = vLongitude, 
                                    direccion_carrera = vDireccionCarrera,
                                    direccion_calle = vDireccionCalle,
                                    direccion_numero = vDireccionNumero,
                                    direccion_info_adicional = vDireccionInfoAdicional                                 
                                where idinmueble=vid;


    SET @vidPropertie = vid;	
    
    delete from imagenInmueble where `idInmueble` = vid;
    
  
    WHILE (LOCATE(',', vImages) > 0) DO
            SET @V_DESIGNATION = SUBSTRING(vImages,1, LOCATE(',',vImages)-1); 
                  SET vImages = SUBSTRING(vImages, LOCATE(',',vImages) + 1); 
                  
              IF @V_DESIGNATION <> ',' THEN	
    		INSERT INTO imagenInmueble(rutaImagen, idInmueble) 
                VALUES (CONVERT(@V_DESIGNATION,CHAR(200)),@vidPropertie);
	END IF;
    END WHILE;


    delete from videoInmueble where idInmueble= vid;

    WHILE (LOCATE(',', vVideos) > 0) DO
            SET @V_DESIGNATION = SUBSTRING(vVideos,1, LOCATE(',',vVideos)-1); 
                  SET vVideos = SUBSTRING(vVideos, LOCATE(',',vVideos) + 1); 
                  
              IF @V_DESIGNATION <> ',' THEN	
    		INSERT INTO videoInmueble(rutaVideo, idInmueble) 
                VALUES (CONVERT(@V_DESIGNATION,CHAR(200)),@vidPropertie);
	END IF;
    END WHILE;
		          
				
    set res = 1;
			
												 				 
		END IF;

	RETURN res;
	
	

END$$

CREATE FUNCTION `updatereference` (`vid` INT, `vclient` INT, `vtypereference` INT, `vname` VARCHAR(50), `vlastname` VARCHAR(50), `vphone` VARCHAR(10)) RETURNS INT(1) READS SQL DATA
    DETERMINISTIC
    COMMENT 'Funcion que modifica la referencia de un cliente'
BEGIN 
    DECLARE res INT DEFAULT 0;
    
			update referenciapersonalfamiliar set clientes_idCliente = vclient,
									tiporeferencia_idtiporeferencia=vtypereference,
                                    nombresReferencia = vname,
                                    apellidosReferencia = vlastname,
                                    telefonoreferencia= vphone
                        where 	idreferenciapersonalfamiliar = vid;		
			set res=1;
	RETURN res;
END$$

CREATE FUNCTION `updatereferencebank` (`vid` INT, `vclient` INT, `vaccountnumber` VARCHAR(50), `vbank` INT, `vbranchOffice` VARCHAR(50)) RETURNS INT(1) READS SQL DATA
    DETERMINISTIC
    COMMENT 'Funcion que modifica la referencia bancaria de un cliente'
BEGIN 
    DECLARE res INT DEFAULT 0;
    
			update referenciabancaria set clientes_idCliente = vclient,
									numerocuenta = vaccountnumber,
                                    bancos_idbanco = vbank,
                                    sucursal= vbranchOffice
                        where 	idreferenciabancaria = vid;		
			set res=1;
	RETURN res;
END$$

CREATE FUNCTION `updaterol` (`cod` INT, `nom` VARCHAR(50), `des` VARCHAR(2000)) RETURNS INT(1) READS SQL DATA
    DETERMINISTIC
    COMMENT 'Funcion que modifica un rol'
BEGIN 







    DECLARE res INT DEFAULT 0;







    







IF NOT EXISTS(select nombre from rol where nombre=nom and id<>cod)







		THEN







			update rol set nombre = nom,descripcion = des where id = cod;		







			set res=1;







														







		END IF;















	RETURN res;







	















END$$

CREATE FUNCTION `updatespouse` (`vid` INT, `vclient` INT, `vdocumentNumber` INT, `vexpeditionDate` VARCHAR(50), `vemail` VARCHAR(50), `vfirstName` VARCHAR(50), `vlastName` VARCHAR(50), `vmobilePhone` VARCHAR(50), `vcompany` VARCHAR(50), `vaddress` VARCHAR(100), `vofficePhone` VARCHAR(50), `vsalary` FLOAT) RETURNS INT(1) READS SQL DATA
    DETERMINISTIC
    COMMENT 'Funcion que modifica un conyugue'
BEGIN 
    DECLARE res INT DEFAULT 0;
    
			update conyugues set numeroIdentificacionConyugue = vdocumentNumber,
									fechaExpedicionNumeroId = vexpeditionDate,
                                    correoElectronicoConyugue = vemail,
                                    nombresConyugue = vfirstName,
									apellidosConyugue = vlastName,
									nombreEmpresaLabora = vcompany,
									direccionLaboralConyugue = vaddress,
									telefonoLaboralConyugue = vofficePhone,
									telefonoMovilConyugue = vmobilePhone,
									salarioMensualConyugue = vsalary,
									clientes_idCliente = vclient
                        where 	idconyugue = vid;		
			set res=1;
	RETURN res;
END$$

CREATE FUNCTION `updateuser` (`vid` INT, `vfirstname` VARCHAR(50), `vsecondname` VARCHAR(50), `vfirstlastname` VARCHAR(50), `vsecondlastname` VARCHAR(50), `vuser` VARCHAR(50), `vpass` VARCHAR(50), `vrol` INT, `vdescription` VARCHAR(50)) RETURNS INT(1) READS SQL DATA
    DETERMINISTIC
    COMMENT 'Funcion que modifica un rol'
BEGIN 







    DECLARE res INT DEFAULT 0;







    







IF NOT EXISTS(select usuario from usuario where usuario=vuser and id<>vid)







		THEN















UPDATE usuario







   SET  primer_nombre=vfirstname, segundo_nombre=vsecondname, primer_apellido=vfirstlastname, segundo_apellido=vsecondlastname, 







       usuario=vuser, password= vpass, rol=vrol, descripcion=vdescription







 WHERE id=vid;















			







			set res=1;







								







			







		END IF;















	RETURN res;







	















END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `areaempresa`
--

CREATE TABLE `areaempresa` (
  `idareaEmpresa` int(11) NOT NULL,
  `nombreArea` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `areaempresa`
--

INSERT INTO `areaempresa` (`idareaEmpresa`, `nombreArea`) VALUES
(1, 'Administración y finanzas'),
(2, 'Recursos humanos'),
(3, 'Juridica'),
(4, 'Operaciones'),
(5, 'Comercial'),
(6, 'T.I'),
(7, 'Marketing');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `arl`
--

CREATE TABLE `arl` (
  `idarl` int(11) NOT NULL,
  `nombreArl` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `arl`
--

INSERT INTO `arl` (`idarl`, `nombreArl`) VALUES
(21, 'Seguros de Vida Colpatria S.A.'),
(22, 'Compañía de Seguros Bolívar S.A.'),
(23, 'Seguros de Vida Aurora'),
(24, 'ARP Alfa'),
(25, 'Liberty Seguros de Vida S.A.'),
(26, 'Positiva Compañía de Seguros'),
(27, 'Colmena Riesgos Profesionales'),
(28, 'Sura'),
(29, 'La Equidad Seguros de Vida'),
(30, 'Mapfre Colombia Vida Seguros S.A');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `arrendatariodependiente`
--

CREATE TABLE `arrendatariodependiente` (
  `idarrendatarioDependiente` int(11) NOT NULL,
  `Cargos_idCargo` int(11) NOT NULL,
  `nombreEmpresa` varchar(45) DEFAULT NULL,
  `sueldoBasico` float DEFAULT NULL,
  `otrosIngresos` float DEFAULT NULL,
  `direccionOficina` varchar(100) DEFAULT NULL,
  `telefonoOficina` varchar(10) DEFAULT NULL,
  `antiguedadEnEmpresa` int(11) DEFAULT NULL,
  `clientes_idCliente` int(11) NOT NULL,
  `idtipoLaborArrendatario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `arrendatarioindependiente`
--

CREATE TABLE `arrendatarioindependiente` (
  `idarrendatarioIndependiente` int(11) NOT NULL,
  `descripcionNegocio` varchar(45) NOT NULL,
  `registroMercantil` varchar(45) DEFAULT NULL,
  `ingresos` float DEFAULT NULL,
  `egresos` float DEFAULT NULL,
  `numeroEmpleados` int(11) DEFAULT NULL,
  `clientes_idCliente` int(11) NOT NULL,
  `tipoactividadeconomicaarrendatario_idtipoLaborArrendatario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `audit_propertie_search`
--

CREATE TABLE `audit_propertie_search` (
  `id` int(11) NOT NULL,
  `usuario_id` varchar(20) DEFAULT NULL,
  `id_register` int(11) DEFAULT NULL,
  `dia` varchar(20) DEFAULT NULL,
  `mes` varchar(20) DEFAULT NULL,
  `anio` varchar(5) DEFAULT NULL,
  `hora` varchar(20) DEFAULT NULL,
  `ip` varchar(20) DEFAULT NULL,
  `dispositivo` varchar(20) DEFAULT NULL,
  `sistema_operativo` varchar(20) DEFAULT NULL,
  `navegador` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `audit_propertie_search`
--

INSERT INTO `audit_propertie_search` (`id`, `usuario_id`, `id_register`, `dia`, `mes`, `anio`, `hora`, `ip`, `dispositivo`, `sistema_operativo`, `navegador`) VALUES
(1, '7Agxh0KQ79mWri', 5, '22', '10', '2018', '15:07', '167.249.42.171', 'not mobile', 'Windows 7', 'Chrome'),
(2, '7Agxh0KQ79mWri', 4, '22', '10', '2018', '18:14', '167.249.42.171', 'not mobile', 'Windows 7', 'Chrome'),
(3, 'enHWpFzga4VSDP', 5, '26', '10', '2018', '14:28', '167.249.42.171', 'not mobile', 'Windows 7', 'Firefox'),
(4, '?lFoVpUzAaRfoi', 6, '02', '11', '2018', '08:43', '167.249.42.171', 'not mobile', 'Windows 7', 'Chrome'),
(5, '?lFoVpUzAaRfoi', 6, '02', '11', '2018', '08:45', '167.249.42.171', 'not mobile', 'Windows 7', 'Chrome'),
(6, '?lFoVpUzAaRfoi', 5, '02', '11', '2018', '08:46', '167.249.42.171', 'not mobile', 'Windows 7', 'Chrome'),
(7, '?lFoVpUzAaRfoi', 5, '02', '11', '2018', '08:47', '167.249.42.171', 'not mobile', 'Windows 7', 'Chrome'),
(8, '?lFoVpUzAaRfoi', 5, '02', '11', '2018', '08:53', '167.249.42.171', 'not mobile', 'Windows 7', 'Chrome'),
(9, '?lFoVpUzAaRfoi', 6, '02', '11', '2018', '08:54', '167.249.42.171', 'not mobile', 'Windows 7', 'Chrome'),
(10, '?lFoVpUzAaRfoi', 6, '02', '11', '2018', '15:23', '167.249.42.171', 'not mobile', 'Windows 7', 'Chrome'),
(11, '?lFoVpUzAaRfoi', 4, '02', '11', '2018', '15:27', '167.249.42.171', 'not mobile', 'Windows 7', 'Chrome'),
(12, '?lFoVpUzAaRfoi', 7, '03', '11', '2018', '19:07', '167.249.42.171', 'not mobile', 'Windows 7', 'Chrome'),
(13, '?lFoVpUzAaRfoi', 8, '03', '11', '2018', '19:08', '167.249.42.171', 'not mobile', 'Windows 7', 'Chrome'),
(14, '?lFoVpUzAaRfoi', 4, '06', '11', '2018', '14:37', '167.249.42.171', 'not mobile', 'Windows 7', 'Chrome'),
(15, '?lFoVpUzAaRfoi', 4, '06', '11', '2018', '14:38', '167.249.42.171', 'not mobile', 'Windows 7', 'Chrome'),
(16, '?lFoVpUzAaRfoi', 4, '06', '11', '2018', '14:38', '167.249.42.171', 'not mobile', 'Windows 7', 'Chrome'),
(17, '?lFoVpUzAaRfoi', 8, '06', '11', '2018', '14:39', '167.249.42.171', 'not mobile', 'Windows 7', 'Chrome'),
(18, '?lFoVpUzAaRfoi', 8, '06', '11', '2018', '14:40', '167.249.42.171', 'not mobile', 'Windows 7', 'Chrome'),
(19, '?lFoVpUzAaRfoi', 8, '06', '11', '2018', '14:41', '167.249.42.171', 'not mobile', 'Windows 7', 'Chrome'),
(20, '?lFoVpUzAaRfoi', 5, '06', '11', '2018', '14:45', '167.249.42.171', 'not mobile', 'Windows 7', 'Chrome'),
(21, '?lFoVpUzAaRfoi', 6, '06', '11', '2018', '14:50', '167.249.42.171', 'not mobile', 'Windows 7', 'Chrome'),
(22, '?lFoVpUzAaRfoi', 6, '06', '11', '2018', '14:53', '167.249.42.171', 'not mobile', 'Windows 7', 'Chrome'),
(23, '?lFoVpUzAaRfoi', 4, '06', '11', '2018', '15:01', '167.249.42.171', 'not mobile', 'Windows 7', 'Chrome'),
(24, '?lFoVpUzAaRfoi', 6, '06', '11', '2018', '19:35', '167.249.42.171', 'not mobile', 'Windows 7', 'Chrome'),
(25, '?lFoVpUzAaRfoi', 5, '07', '11', '2018', '17:46', '167.249.42.171', 'not mobile', 'Windows 7', 'Chrome'),
(26, '?lFoVpUzAaRfoi', 8, '07', '11', '2018', '17:47', '167.249.42.171', 'not mobile', 'Windows 7', 'Chrome'),
(27, '?lFoVpUzAaRfoi', 5, '07', '11', '2018', '17:53', '167.249.42.171', 'not mobile', 'Windows 7', 'Chrome'),
(28, '?lFoVpUzAaRfoi', 5, '08', '11', '2018', '21:40', '167.249.42.171', 'not mobile', 'Windows 7', 'Chrome'),
(29, 'ycKYgGJf!ATnuB', 5, '09', '11', '2018', '13:53', '167.249.42.170', 'not mobile', 'Windows 7', 'Chrome'),
(30, 'ycKYgGJf!ATnuB', 8, '09', '11', '2018', '18:46', '167.249.42.170', 'not mobile', 'Windows 7', 'Chrome'),
(31, 'ycKYgGJf!ATnuB', 5, '10', '11', '2018', '21:58', '167.249.42.170', 'not mobile', 'Windows 7', 'Chrome'),
(32, 'ycKYgGJf!ATnuB', 4, '10', '11', '2018', '21:59', '167.249.42.170', 'not mobile', 'Windows 7', 'Chrome'),
(33, 'ycKYgGJf!ATnuB', 5, '13', '11', '2018', '15:16', '167.249.42.170', 'not mobile', 'Windows 7', 'Chrome'),
(34, 'ycKYgGJf!ATnuB', 5, '16', '11', '2018', '15:12', '167.249.42.170', 'not mobile', 'Windows 7', 'Chrome'),
(35, 'ycKYgGJf!ATnuB', 6, '16', '11', '2018', '15:13', '167.249.42.170', 'not mobile', 'Windows 7', 'Chrome'),
(36, 'ycKYgGJf!ATnuB', 6, '16', '11', '2018', '15:19', '167.249.42.170', 'not mobile', 'Windows 7', 'Chrome'),
(37, 'ycKYgGJf!ATnuB', 6, '16', '11', '2018', '15:21', '167.249.42.170', 'not mobile', 'Windows 7', 'Chrome'),
(38, 'ycKYgGJf!ATnuB', 6, '16', '11', '2018', '15:21', '167.249.42.170', 'not mobile', 'Windows 7', 'Chrome'),
(39, 'ycKYgGJf!ATnuB', 6, '16', '11', '2018', '15:22', '167.249.42.170', 'not mobile', 'Windows 7', 'Chrome'),
(40, 'ycKYgGJf!ATnuB', 6, '16', '11', '2018', '15:23', '167.249.42.170', 'not mobile', 'Windows 7', 'Chrome'),
(41, 'ycKYgGJf!ATnuB', 6, '16', '11', '2018', '15:24', '167.249.42.170', 'not mobile', 'Windows 7', 'Chrome'),
(42, 'ycKYgGJf!ATnuB', 6, '16', '11', '2018', '15:24', '167.249.42.170', 'not mobile', 'Windows 7', 'Chrome'),
(43, 'ycKYgGJf!ATnuB', 6, '16', '11', '2018', '15:39', '167.249.42.170', 'not mobile', 'Windows 7', 'Chrome'),
(44, 'ycKYgGJf!ATnuB', 6, '16', '11', '2018', '15:41', '167.249.42.170', 'not mobile', 'Windows 7', 'Chrome'),
(45, 'ycKYgGJf!ATnuB', 6, '16', '11', '2018', '15:43', '167.249.42.170', 'not mobile', 'Windows 7', 'Chrome'),
(46, 'ycKYgGJf!ATnuB', 6, '16', '11', '2018', '15:45', '167.249.42.170', 'not mobile', 'Windows 7', 'Chrome'),
(47, 'ycKYgGJf!ATnuB', 6, '16', '11', '2018', '15:46', '167.249.42.170', 'not mobile', 'Windows 7', 'Chrome'),
(48, 'ycKYgGJf!ATnuB', 6, '16', '11', '2018', '15:53', '167.249.42.170', 'not mobile', 'Windows 7', 'Chrome'),
(49, 'ycKYgGJf!ATnuB', 6, '16', '11', '2018', '16:01', '167.249.42.170', 'not mobile', 'Windows 7', 'Chrome'),
(50, 'ycKYgGJf!ATnuB', 6, '16', '11', '2018', '16:01', '167.249.42.170', 'not mobile', 'Windows 7', 'Chrome'),
(51, 'ycKYgGJf!ATnuB', 6, '16', '11', '2018', '16:07', '167.249.42.170', 'not mobile', 'Windows 7', 'Chrome'),
(52, 'ycKYgGJf!ATnuB', 6, '16', '11', '2018', '16:07', '167.249.42.170', 'not mobile', 'Windows 7', 'Chrome'),
(53, 'ycKYgGJf!ATnuB', 6, '16', '11', '2018', '16:08', '167.249.42.170', 'not mobile', 'Windows 7', 'Chrome'),
(54, 'ycKYgGJf!ATnuB', 6, '16', '11', '2018', '16:11', '167.249.42.170', 'not mobile', 'Windows 7', 'Chrome'),
(55, 'ycKYgGJf!ATnuB', 6, '16', '11', '2018', '16:11', '167.249.42.170', 'not mobile', 'Windows 7', 'Chrome'),
(56, 'ycKYgGJf!ATnuB', 6, '16', '11', '2018', '16:12', '167.249.42.170', 'not mobile', 'Windows 7', 'Chrome'),
(57, 'ycKYgGJf!ATnuB', 6, '16', '11', '2018', '16:15', '167.249.42.170', 'not mobile', 'Windows 7', 'Chrome'),
(58, 'ycKYgGJf!ATnuB', 6, '16', '11', '2018', '16:16', '167.249.42.170', 'not mobile', 'Windows 7', 'Chrome'),
(59, 'ycKYgGJf!ATnuB', 6, '16', '11', '2018', '16:17', '167.249.42.170', 'not mobile', 'Windows 7', 'Chrome'),
(60, 'ycKYgGJf!ATnuB', 6, '16', '11', '2018', '16:17', '167.249.42.170', 'not mobile', 'Windows 7', 'Chrome'),
(61, 'ycKYgGJf!ATnuB', 6, '16', '11', '2018', '16:24', '167.249.42.170', 'not mobile', 'Windows 7', 'Chrome'),
(62, 'ycKYgGJf!ATnuB', 6, '16', '11', '2018', '16:26', '167.249.42.170', 'not mobile', 'Windows 7', 'Chrome'),
(63, 'ycKYgGJf!ATnuB', 6, '16', '11', '2018', '16:26', '167.249.42.170', 'not mobile', 'Windows 7', 'Chrome'),
(64, 'ycKYgGJf!ATnuB', 6, '16', '11', '2018', '16:28', '167.249.42.170', 'not mobile', 'Windows 7', 'Chrome'),
(65, 'ycKYgGJf!ATnuB', 6, '16', '11', '2018', '16:30', '167.249.42.170', 'not mobile', 'Windows 7', 'Chrome'),
(66, 'ycKYgGJf!ATnuB', 6, '16', '11', '2018', '16:33', '167.249.42.170', 'not mobile', 'Windows 7', 'Chrome'),
(67, 'ycKYgGJf!ATnuB', 6, '16', '11', '2018', '16:34', '167.249.42.170', 'not mobile', 'Windows 7', 'Chrome'),
(68, 'ycKYgGJf!ATnuB', 6, '16', '11', '2018', '16:34', '167.249.42.170', 'not mobile', 'Windows 7', 'Chrome'),
(69, 'ycKYgGJf!ATnuB', 6, '16', '11', '2018', '16:36', '167.249.42.170', 'not mobile', 'Windows 7', 'Chrome'),
(70, 'ycKYgGJf!ATnuB', 6, '16', '11', '2018', '16:37', '167.249.42.170', 'not mobile', 'Windows 7', 'Chrome'),
(71, 'ycKYgGJf!ATnuB', 6, '16', '11', '2018', '16:37', '167.249.42.170', 'not mobile', 'Windows 7', 'Chrome'),
(72, 'ycKYgGJf!ATnuB', 6, '16', '11', '2018', '16:40', '167.249.42.170', 'not mobile', 'Windows 7', 'Chrome'),
(73, 'ycKYgGJf!ATnuB', 6, '16', '11', '2018', '16:41', '167.249.42.170', 'not mobile', 'Windows 7', 'Chrome'),
(74, 'ycKYgGJf!ATnuB', 6, '16', '11', '2018', '16:42', '167.249.42.170', 'not mobile', 'Windows 7', 'Chrome'),
(75, 'ycKYgGJf!ATnuB', 6, '16', '11', '2018', '16:42', '167.249.42.170', 'not mobile', 'Windows 7', 'Chrome'),
(76, 'ycKYgGJf!ATnuB', 6, '16', '11', '2018', '16:42', '167.249.42.170', 'not mobile', 'Windows 7', 'Chrome'),
(77, 'ycKYgGJf!ATnuB', 6, '16', '11', '2018', '16:42', '167.249.42.170', 'not mobile', 'Windows 7', 'Chrome'),
(78, 'ycKYgGJf!ATnuB', 6, '16', '11', '2018', '16:43', '167.249.42.170', 'not mobile', 'Windows 7', 'Chrome'),
(79, 'ycKYgGJf!ATnuB', 6, '16', '11', '2018', '16:43', '167.249.42.170', 'not mobile', 'Windows 7', 'Chrome'),
(80, 'ycKYgGJf!ATnuB', 6, '16', '11', '2018', '16:43', '167.249.42.170', 'not mobile', 'Windows 7', 'Chrome'),
(81, 'ycKYgGJf!ATnuB', 6, '16', '11', '2018', '16:44', '167.249.42.170', 'not mobile', 'Windows 7', 'Chrome'),
(82, 'ycKYgGJf!ATnuB', 6, '16', '11', '2018', '16:44', '167.249.42.170', 'not mobile', 'Windows 7', 'Chrome'),
(83, 'ycKYgGJf!ATnuB', 6, '16', '11', '2018', '16:44', '167.249.42.170', 'not mobile', 'Windows 7', 'Chrome'),
(84, 'ycKYgGJf!ATnuB', 6, '16', '11', '2018', '16:45', '167.249.42.170', 'not mobile', 'Windows 7', 'Chrome'),
(85, 'ycKYgGJf!ATnuB', 6, '16', '11', '2018', '16:45', '167.249.42.170', 'not mobile', 'Windows 7', 'Chrome'),
(86, 'ycKYgGJf!ATnuB', 6, '16', '11', '2018', '16:45', '167.249.42.170', 'not mobile', 'Windows 7', 'Chrome'),
(87, 'ycKYgGJf!ATnuB', 6, '16', '11', '2018', '16:45', '167.249.42.170', 'not mobile', 'Windows 7', 'Chrome'),
(88, 'ycKYgGJf!ATnuB', 6, '16', '11', '2018', '16:46', '167.249.42.170', 'not mobile', 'Windows 7', 'Chrome'),
(89, 'ycKYgGJf!ATnuB', 6, '16', '11', '2018', '16:46', '167.249.42.170', 'not mobile', 'Windows 7', 'Chrome'),
(90, 'ycKYgGJf!ATnuB', 6, '16', '11', '2018', '16:47', '167.249.42.170', 'not mobile', 'Windows 7', 'Chrome'),
(91, 'ycKYgGJf!ATnuB', 6, '16', '11', '2018', '16:47', '167.249.42.170', 'not mobile', 'Windows 7', 'Chrome'),
(92, 'ycKYgGJf!ATnuB', 6, '16', '11', '2018', '16:48', '167.249.42.170', 'not mobile', 'Windows 7', 'Chrome'),
(93, 'ycKYgGJf!ATnuB', 6, '16', '11', '2018', '16:48', '167.249.42.170', 'not mobile', 'Windows 7', 'Chrome'),
(94, 'ycKYgGJf!ATnuB', 6, '16', '11', '2018', '16:48', '167.249.42.170', 'not mobile', 'Windows 7', 'Chrome'),
(95, 'ycKYgGJf!ATnuB', 6, '16', '11', '2018', '16:49', '167.249.42.170', 'not mobile', 'Windows 7', 'Chrome'),
(96, 'ycKYgGJf!ATnuB', 6, '16', '11', '2018', '16:49', '167.249.42.170', 'not mobile', 'Windows 7', 'Chrome'),
(97, 'ycKYgGJf!ATnuB', 6, '16', '11', '2018', '16:50', '167.249.42.170', 'not mobile', 'Windows 7', 'Chrome'),
(98, 'ycKYgGJf!ATnuB', 6, '16', '11', '2018', '16:51', '167.249.42.170', 'not mobile', 'Windows 7', 'Chrome'),
(99, 'ycKYgGJf!ATnuB', 6, '16', '11', '2018', '16:51', '167.249.42.170', 'not mobile', 'Windows 7', 'Chrome'),
(100, 'ycKYgGJf!ATnuB', 6, '16', '11', '2018', '16:51', '167.249.42.170', 'not mobile', 'Windows 7', 'Chrome'),
(101, 'ycKYgGJf!ATnuB', 6, '16', '11', '2018', '16:52', '167.249.42.170', 'not mobile', 'Windows 7', 'Chrome'),
(102, 'ycKYgGJf!ATnuB', 6, '16', '11', '2018', '16:52', '167.249.42.170', 'not mobile', 'Windows 7', 'Chrome'),
(103, 'ycKYgGJf!ATnuB', 6, '16', '11', '2018', '16:53', '167.249.42.170', 'not mobile', 'Windows 7', 'Chrome'),
(104, 'ycKYgGJf!ATnuB', 6, '16', '11', '2018', '16:53', '167.249.42.170', 'not mobile', 'Windows 7', 'Chrome'),
(105, 'ycKYgGJf!ATnuB', 6, '16', '11', '2018', '16:54', '167.249.42.170', 'not mobile', 'Windows 7', 'Chrome'),
(106, 'ycKYgGJf!ATnuB', 6, '16', '11', '2018', '16:54', '167.249.42.170', 'not mobile', 'Windows 7', 'Chrome'),
(107, 'ycKYgGJf!ATnuB', 6, '16', '11', '2018', '16:54', '167.249.42.170', 'not mobile', 'Windows 7', 'Chrome'),
(108, 'ycKYgGJf!ATnuB', 6, '16', '11', '2018', '16:54', '167.249.42.170', 'not mobile', 'Windows 7', 'Chrome'),
(109, 'ycKYgGJf!ATnuB', 6, '16', '11', '2018', '16:55', '167.249.42.170', 'not mobile', 'Windows 7', 'Chrome'),
(110, 'ycKYgGJf!ATnuB', 6, '16', '11', '2018', '16:55', '167.249.42.170', 'not mobile', 'Windows 7', 'Chrome'),
(111, 'ycKYgGJf!ATnuB', 6, '16', '11', '2018', '16:55', '167.249.42.170', 'not mobile', 'Windows 7', 'Chrome'),
(112, 'ycKYgGJf!ATnuB', 6, '16', '11', '2018', '16:56', '167.249.42.170', 'not mobile', 'Windows 7', 'Chrome'),
(113, 'ycKYgGJf!ATnuB', 6, '16', '11', '2018', '16:57', '167.249.42.170', 'not mobile', 'Windows 7', 'Chrome'),
(114, 'ycKYgGJf!ATnuB', 6, '16', '11', '2018', '16:57', '167.249.42.170', 'not mobile', 'Windows 7', 'Chrome'),
(115, 'ycKYgGJf!ATnuB', 6, '16', '11', '2018', '16:57', '167.249.42.170', 'not mobile', 'Windows 7', 'Chrome'),
(116, 'ycKYgGJf!ATnuB', 6, '16', '11', '2018', '16:57', '167.249.42.170', 'not mobile', 'Windows 7', 'Chrome'),
(117, 'ycKYgGJf!ATnuB', 6, '16', '11', '2018', '16:58', '167.249.42.170', 'not mobile', 'Windows 7', 'Chrome'),
(118, 'ycKYgGJf!ATnuB', 6, '16', '11', '2018', '16:58', '167.249.42.170', 'not mobile', 'Windows 7', 'Chrome'),
(119, 'ycKYgGJf!ATnuB', 6, '16', '11', '2018', '16:59', '167.249.42.170', 'not mobile', 'Windows 7', 'Chrome'),
(120, 'ycKYgGJf!ATnuB', 6, '16', '11', '2018', '17:00', '167.249.42.170', 'not mobile', 'Windows 7', 'Chrome'),
(121, 'ycKYgGJf!ATnuB', 6, '16', '11', '2018', '17:01', '167.249.42.170', 'not mobile', 'Windows 7', 'Chrome'),
(122, 'ycKYgGJf!ATnuB', 6, '16', '11', '2018', '17:02', '167.249.42.170', 'not mobile', 'Windows 7', 'Chrome'),
(123, 'ycKYgGJf!ATnuB', 6, '16', '11', '2018', '17:02', '167.249.42.170', 'not mobile', 'Windows 7', 'Chrome'),
(124, 'ycKYgGJf!ATnuB', 6, '16', '11', '2018', '17:02', '167.249.42.170', 'not mobile', 'Windows 7', 'Chrome'),
(125, 'ycKYgGJf!ATnuB', 6, '16', '11', '2018', '17:04', '167.249.42.170', 'not mobile', 'Windows 7', 'Chrome'),
(126, 'ycKYgGJf!ATnuB', 6, '16', '11', '2018', '17:04', '167.249.42.170', 'not mobile', 'Windows 7', 'Chrome'),
(127, 'ycKYgGJf!ATnuB', 6, '16', '11', '2018', '17:05', '167.249.42.170', 'not mobile', 'Windows 7', 'Chrome'),
(128, 'ycKYgGJf!ATnuB', 6, '16', '11', '2018', '17:06', '167.249.42.170', 'not mobile', 'Windows 7', 'Chrome'),
(129, 'ycKYgGJf!ATnuB', 6, '16', '11', '2018', '17:06', '167.249.42.170', 'not mobile', 'Windows 7', 'Chrome'),
(130, 'ycKYgGJf!ATnuB', 6, '16', '11', '2018', '17:06', '167.249.42.170', 'not mobile', 'Windows 7', 'Chrome'),
(131, 'ycKYgGJf!ATnuB', 6, '16', '11', '2018', '17:06', '167.249.42.170', 'not mobile', 'Windows 7', 'Chrome'),
(132, 'ycKYgGJf!ATnuB', 6, '16', '11', '2018', '17:07', '167.249.42.170', 'not mobile', 'Windows 7', 'Chrome'),
(133, 'ycKYgGJf!ATnuB', 6, '16', '11', '2018', '17:08', '167.249.42.170', 'not mobile', 'Windows 7', 'Chrome'),
(134, 'ycKYgGJf!ATnuB', 6, '16', '11', '2018', '17:11', '167.249.42.170', 'not mobile', 'Windows 7', 'Chrome'),
(135, 'ycKYgGJf!ATnuB', 6, '16', '11', '2018', '17:12', '167.249.42.170', 'not mobile', 'Windows 7', 'Chrome'),
(136, 'ycKYgGJf!ATnuB', 6, '16', '11', '2018', '17:13', '167.249.42.170', 'not mobile', 'Windows 7', 'Chrome'),
(137, 'ycKYgGJf!ATnuB', 6, '16', '11', '2018', '17:15', '167.249.42.170', 'not mobile', 'Windows 7', 'Chrome'),
(138, 'ycKYgGJf!ATnuB', 6, '16', '11', '2018', '17:18', '167.249.42.170', 'not mobile', 'Windows 7', 'Chrome'),
(139, 'ycKYgGJf!ATnuB', 6, '16', '11', '2018', '17:19', '167.249.42.170', 'not mobile', 'Windows 7', 'Chrome'),
(140, 'ycKYgGJf!ATnuB', 6, '16', '11', '2018', '17:22', '167.249.42.170', 'not mobile', 'Windows 7', 'Chrome'),
(141, 'ycKYgGJf!ATnuB', 6, '16', '11', '2018', '17:29', '167.249.42.170', 'not mobile', 'Windows 7', 'Chrome'),
(142, 'ycKYgGJf!ATnuB', 6, '16', '11', '2018', '17:29', '167.249.42.170', 'not mobile', 'Windows 7', 'Chrome'),
(143, 'ycKYgGJf!ATnuB', 6, '16', '11', '2018', '17:32', '167.249.42.170', 'not mobile', 'Windows 7', 'Chrome'),
(144, 'ycKYgGJf!ATnuB', 6, '16', '11', '2018', '17:34', '167.249.42.170', 'not mobile', 'Windows 7', 'Chrome'),
(145, 'ycKYgGJf!ATnuB', 6, '16', '11', '2018', '17:35', '167.249.42.170', 'not mobile', 'Windows 7', 'Chrome'),
(146, 'ycKYgGJf!ATnuB', 6, '16', '11', '2018', '17:36', '167.249.42.170', 'not mobile', 'Windows 7', 'Chrome'),
(147, 'ycKYgGJf!ATnuB', 6, '16', '11', '2018', '17:37', '167.249.42.170', 'not mobile', 'Windows 7', 'Chrome'),
(148, 'ycKYgGJf!ATnuB', 6, '16', '11', '2018', '17:37', '167.249.42.170', 'not mobile', 'Windows 7', 'Chrome'),
(149, 'ycKYgGJf!ATnuB', 6, '16', '11', '2018', '17:41', '167.249.42.170', 'not mobile', 'Windows 7', 'Chrome'),
(150, 'ycKYgGJf!ATnuB', 6, '16', '11', '2018', '17:43', '167.249.42.170', 'not mobile', 'Windows 7', 'Chrome'),
(151, 'ycKYgGJf!ATnuB', 6, '16', '11', '2018', '17:45', '167.249.42.170', 'not mobile', 'Windows 7', 'Chrome'),
(152, 'ycKYgGJf!ATnuB', 6, '16', '11', '2018', '17:45', '167.249.42.170', 'not mobile', 'Windows 7', 'Chrome'),
(153, 'ycKYgGJf!ATnuB', 6, '16', '11', '2018', '17:46', '167.249.42.170', 'not mobile', 'Windows 7', 'Chrome'),
(154, 'ycKYgGJf!ATnuB', 6, '16', '11', '2018', '17:46', '167.249.42.170', 'not mobile', 'Windows 7', 'Chrome'),
(155, 'ycKYgGJf!ATnuB', 6, '16', '11', '2018', '17:46', '167.249.42.170', 'not mobile', 'Windows 7', 'Chrome'),
(156, 'ycKYgGJf!ATnuB', 6, '16', '11', '2018', '17:47', '167.249.42.170', 'not mobile', 'Windows 7', 'Chrome'),
(157, 'ycKYgGJf!ATnuB', 6, '16', '11', '2018', '17:48', '167.249.42.170', 'not mobile', 'Windows 7', 'Chrome'),
(158, 'ycKYgGJf!ATnuB', 6, '16', '11', '2018', '17:49', '167.249.42.170', 'not mobile', 'Windows 7', 'Chrome'),
(159, 'ycKYgGJf!ATnuB', 6, '16', '11', '2018', '17:50', '167.249.42.170', 'not mobile', 'Windows 7', 'Chrome'),
(160, 'ycKYgGJf!ATnuB', 6, '16', '11', '2018', '17:50', '167.249.42.170', 'not mobile', 'Windows 7', 'Chrome'),
(161, 'ycKYgGJf!ATnuB', 6, '16', '11', '2018', '17:55', '167.249.42.170', 'not mobile', 'Windows 7', 'Chrome'),
(162, 'ycKYgGJf!ATnuB', 6, '16', '11', '2018', '17:56', '167.249.42.170', 'not mobile', 'Windows 7', 'Chrome'),
(163, 'ycKYgGJf!ATnuB', 6, '16', '11', '2018', '17:56', '167.249.42.170', 'not mobile', 'Windows 7', 'Chrome'),
(164, 'ycKYgGJf!ATnuB', 6, '16', '11', '2018', '17:57', '167.249.42.170', 'not mobile', 'Windows 7', 'Chrome'),
(165, 'ycKYgGJf!ATnuB', 6, '16', '11', '2018', '17:57', '167.249.42.170', 'not mobile', 'Windows 7', 'Chrome'),
(166, 'ycKYgGJf!ATnuB', 6, '16', '11', '2018', '17:57', '167.249.42.170', 'not mobile', 'Windows 7', 'Chrome'),
(167, 'ycKYgGJf!ATnuB', 6, '16', '11', '2018', '17:58', '167.249.42.170', 'not mobile', 'Windows 7', 'Chrome'),
(168, 'ycKYgGJf!ATnuB', 6, '16', '11', '2018', '17:58', '167.249.42.170', 'not mobile', 'Windows 7', 'Chrome'),
(169, 'ycKYgGJf!ATnuB', 6, '16', '11', '2018', '17:59', '167.249.42.170', 'not mobile', 'Windows 7', 'Chrome'),
(170, 'ycKYgGJf!ATnuB', 6, '16', '11', '2018', '17:59', '167.249.42.170', 'not mobile', 'Windows 7', 'Chrome'),
(171, 'ycKYgGJf!ATnuB', 6, '16', '11', '2018', '18:00', '167.249.42.170', 'not mobile', 'Windows 7', 'Chrome'),
(172, 'ycKYgGJf!ATnuB', 6, '16', '11', '2018', '18:00', '167.249.42.170', 'not mobile', 'Windows 7', 'Chrome'),
(173, 'ycKYgGJf!ATnuB', 6, '16', '11', '2018', '18:00', '167.249.42.170', 'not mobile', 'Windows 7', 'Chrome'),
(174, 'ycKYgGJf!ATnuB', 6, '16', '11', '2018', '18:01', '167.249.42.170', 'not mobile', 'Windows 7', 'Chrome'),
(175, 'ycKYgGJf!ATnuB', 6, '16', '11', '2018', '18:06', '167.249.42.170', 'not mobile', 'Windows 7', 'Chrome'),
(176, 'ycKYgGJf!ATnuB', 6, '16', '11', '2018', '18:06', '167.249.42.170', 'not mobile', 'Windows 7', 'Chrome'),
(177, 'ycKYgGJf!ATnuB', 6, '16', '11', '2018', '18:07', '167.249.42.170', 'not mobile', 'Windows 7', 'Chrome'),
(178, 'ycKYgGJf!ATnuB', 6, '16', '11', '2018', '18:08', '167.249.42.170', 'not mobile', 'Windows 7', 'Chrome'),
(179, 'ycKYgGJf!ATnuB', 6, '16', '11', '2018', '18:09', '167.249.42.170', 'not mobile', 'Windows 7', 'Chrome'),
(180, 'enHWpFzga4VSDP', 4, '16', '11', '2018', '18:10', '167.249.42.171', 'not mobile', 'Windows 7', 'Firefox'),
(181, 'ycKYgGJf!ATnuB', 6, '16', '11', '2018', '18:11', '167.249.42.170', 'not mobile', 'Windows 7', 'Chrome'),
(182, 'ycKYgGJf!ATnuB', 6, '16', '11', '2018', '18:12', '167.249.42.170', 'not mobile', 'Windows 7', 'Chrome'),
(183, 'ycKYgGJf!ATnuB', 6, '16', '11', '2018', '18:13', '167.249.42.170', 'not mobile', 'Windows 7', 'Chrome'),
(184, 'ycKYgGJf!ATnuB', 8, '16', '11', '2018', '18:25', '167.249.42.170', 'not mobile', 'Windows 7', 'Chrome'),
(185, 'ycKYgGJf!ATnuB', 8, '16', '11', '2018', '21:15', '167.249.42.170', 'not mobile', 'Windows 7', 'Chrome'),
(186, 'ycKYgGJf!ATnuB', 8, '21', '11', '2018', '19:10', '167.249.42.170', 'not mobile', 'Windows 7', 'Chrome'),
(187, 'ycKYgGJf!ATnuB', 8, '21', '11', '2018', '19:10', '167.249.42.170', 'not mobile', 'Windows 7', 'Chrome'),
(188, 'ycKYgGJf!ATnuB', 8, '21', '11', '2018', '19:12', '167.249.42.170', 'not mobile', 'Windows 7', 'Chrome');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `bancos`
--

CREATE TABLE `bancos` (
  `idbanco` int(11) NOT NULL,
  `nombreBanco` varchar(45) DEFAULT NULL,
  `direccionPrincipal` varchar(45) DEFAULT NULL,
  `telefonoPrincipal` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `bancos`
--

INSERT INTO `bancos` (`idbanco`, `nombreBanco`, `direccionPrincipal`, `telefonoPrincipal`) VALUES
(226, 'Arco Grupo Bancoldex', NULL, NULL),
(227, 'Banca de Inversión Bancolombia', NULL, NULL),
(228, 'Bancamía S.A.', NULL, NULL),
(229, 'Banco  de  Occidente S.A.', NULL, NULL),
(230, 'Banco Agrario de Colombia', NULL, NULL),
(231, 'Banco AV Villas', NULL, NULL),
(232, 'Banco Caja Social', NULL, NULL),
(233, 'Banco Compartir', NULL, NULL),
(234, 'Banco Coomeva', NULL, NULL),
(235, 'Banco Cooperativo Coopcentral', NULL, NULL),
(236, 'Banco Corpobanca', NULL, NULL),
(237, 'Banco Davivienda', NULL, NULL),
(238, 'Banco de Bogotá', NULL, NULL),
(239, 'Banco Falabella', NULL, NULL),
(240, 'Banco Finandina', NULL, NULL),
(241, 'Banco GNB Sudameris', NULL, NULL),
(242, 'Banco Multibank', NULL, NULL),
(243, 'Banco Mundo Mujer', NULL, NULL),
(244, 'Banco Pichincha', NULL, NULL),
(245, 'Banco Popular S.A.', NULL, NULL),
(246, 'Banco ProCredit', NULL, NULL),
(247, 'Banco Santander', NULL, NULL),
(248, 'Banco W S.A.', NULL, NULL),
(249, 'Bancolombia S.A.', NULL, NULL),
(250, 'BBVA Colombia', NULL, NULL),
(251, 'BNP Paribas Colombia Corporación Financiera', NULL, NULL),
(252, 'Citibank-Colombia', NULL, NULL),
(253, 'Colpatria', NULL, NULL),
(254, 'Coltefinanciera', NULL, NULL),
(255, 'Compañía de Financiamiento TUYA', NULL, NULL),
(256, 'Corporación Financiera Colombiana', NULL, NULL),
(257, 'Credifamilia Compañía de Financiamiento', NULL, NULL),
(258, 'Credifinanciera', NULL, NULL),
(259, 'Financiera DANN ', NULL, NULL),
(260, 'Financiera Juriscoop', NULL, NULL),
(261, 'Financiera Pagos Internacionales', NULL, NULL),
(262, 'Giros & Finanzas Compañía de Financiamiento', NULL, NULL),
(263, 'GM Financial Colombia', NULL, NULL),
(264, 'ITAÚ BBA Colombia', NULL, NULL),
(265, 'JPMorgan Corporación Financiera', NULL, NULL),
(266, 'La Hipotecaria Compañía de Financiamiento', NULL, NULL),
(267, 'Leasing Corficolombiana', NULL, NULL),
(268, 'Opportunity International Colombia', NULL, NULL),
(269, 'RCI Colombia', NULL, NULL),
(270, 'Serfinansa', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `barrios`
--

CREATE TABLE `barrios` (
  `idbarrio` int(11) NOT NULL,
  `nombreBarrio` varchar(45) NOT NULL,
  `idCiudad` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `barrios`
--

INSERT INTO `barrios` (`idbarrio`, `nombreBarrio`, `idCiudad`) VALUES
(0, 'sdsadas', 1),
(1386, 'Asentamiento  25 de enero', 886),
(1387, 'Asentamiento  el milagro', 886),
(1388, 'Asentamiento  el recuerdo', 886),
(1389, 'Asentamiento  los fundadores', 886),
(1390, 'Asentamiento las veraneras', 886),
(1391, 'Asentamiento puerto rico', 886),
(1392, 'Asentamiento salvador allende', 886),
(1393, 'Asentamiento vieja libertad', 886),
(1394, 'Barrio  25 de mayo', 886),
(1395, 'Barrio  7 de agosto', 886),
(1396, 'Barrio  buenos aires', 886),
(1397, 'Barrio  el recreo', 886),
(1398, 'Barrio  el silencio', 886),
(1399, 'Barrio  galan', 886),
(1400, 'Barrio  granada', 886),
(1401, 'Barrio  la adiela', 886),
(1402, 'Barrio  la campina', 886),
(1403, 'Barrio  la castellana', 886),
(1404, 'Barrio  la montana', 886),
(1405, 'Barrio  las sesenta casas', 886),
(1406, 'Barrio  los fundadores', 886),
(1407, 'Barrio  niagara', 886),
(1408, 'Barrio  providencia', 886),
(1409, 'Barrio  uribe', 886),
(1410, 'Barrio 14 de octubre', 886),
(1411, 'Barrio 19 de enero', 886),
(1412, 'Barrio 7 de agosto', 886),
(1413, 'Barrio 8 de marzo', 886),
(1414, 'Barrio alcazar', 886),
(1415, 'Barrio alfonso lopez', 886),
(1416, 'Barrio antonio narino', 886),
(1417, 'Barrio arenales', 886),
(1418, 'Barrio arrayanes', 886),
(1419, 'Barrio belen', 886),
(1420, 'Barrio belencito', 886),
(1421, 'Barrio bello horizonte', 886),
(1422, 'Barrio berlin', 886),
(1423, 'Barrio bosques de gibraltar', 886),
(1424, 'Barrio boyaca', 886),
(1425, 'Barrio buenos aires bajo', 886),
(1426, 'Barrio buenos aires plano', 886),
(1427, 'Barrio calima', 886),
(1428, 'Barrio cincuentenario', 886),
(1429, 'Barrio colinas centro', 886),
(1430, 'Barrio cooperativo', 886),
(1431, 'Barrio corbones', 886),
(1432, 'Barrio el bosque', 886),
(1433, 'Barrio el emperador', 886),
(1434, 'Barrio el nogal', 886),
(1435, 'Barrio el paraiso', 886),
(1436, 'Barrio el placer', 886),
(1437, 'Barrio el porvenir', 886),
(1438, 'Barrio el prado', 886),
(1439, 'Barrio el recreo', 886),
(1440, 'Barrio espana', 886),
(1441, 'Barrio farallones', 886),
(1442, 'Barrio gaitan', 886),
(1443, 'Barrio gibraltar', 886),
(1444, 'Barrio guayaquil', 886),
(1445, 'Barrio jesus maria ocampo', 886),
(1446, 'Barrio la anunciacion', 886),
(1447, 'Barrio la arboleda', 886),
(1448, 'Barrio la brasilia', 886),
(1449, 'Barrio la cabana', 886),
(1450, 'Barrio la clarita', 886),
(1451, 'Barrio la esperanza', 886),
(1452, 'Barrio la isabela', 886),
(1453, 'Barrio la lorena', 886),
(1454, 'Barrio la milagrosa', 886),
(1455, 'Barrio la miranda', 886),
(1456, 'Barrio la union', 886),
(1457, 'Barrio las acacias', 886),
(1458, 'Barrio las americas', 886),
(1459, 'Barrio las margaritas', 886),
(1460, 'Barrio las mercedes', 886),
(1461, 'Barrio las palmas', 886),
(1462, 'Barrio laureles', 886),
(1463, 'Barrio los alamos', 886),
(1464, 'Barrio los cambulos', 886),
(1465, 'Barrio los libertadores', 886),
(1466, 'Barrio los naranjos', 886),
(1467, 'Barrio los profesionales', 886),
(1468, 'Barrio los quindos', 886),
(1469, 'Barrio loteros', 886),
(1470, 'Barrio manuela beltran', 886),
(1471, 'Barrio marco fidel suarez', 886),
(1472, 'Barrio miraflores', 886),
(1473, 'Barrio modelo', 886),
(1474, 'Barrio monteprado', 886),
(1475, 'Barrio montevideo', 886),
(1476, 'Barrio nueva cecilia', 886),
(1477, 'Barrio nueva libertad', 886),
(1478, 'Barrio obrero', 886),
(1479, 'Barrio patio bonito', 886),
(1480, 'Barrio patio bonito bajo', 886),
(1481, 'Barrio patricia', 886),
(1482, 'Barrio piamonte', 886),
(1483, 'Barrio pinares', 886),
(1484, 'Barrio popular', 886),
(1485, 'Barrio quindio', 886),
(1486, 'Barrio rincon santo', 886),
(1487, 'Barrio salazar', 886),
(1488, 'Barrio san andres', 886),
(1489, 'Barrio san fernando', 886),
(1490, 'Barrio san jose', 886),
(1491, 'Barrio san nicolas', 886),
(1492, 'Barrio san vicente de paul', 886),
(1493, 'Barrio santa helena', 886),
(1494, 'Barrio santa maria', 886),
(1495, 'Barrio santa rita', 886),
(1496, 'Barrio santafe', 886),
(1497, 'Barrio santander', 886),
(1498, 'Barrio tigreros', 886),
(1499, 'Barrio velez', 886),
(1500, 'Barrio zuldemayda', 886),
(1501, 'Sector  aborigenes', 886),
(1502, 'Sector  av centenario', 886),
(1503, 'Sector  bavaria', 886),
(1504, 'Sector  centro', 886),
(1505, 'Sector  coinca', 886),
(1506, 'Sector  crq', 886),
(1507, 'Sector  el coliseo', 886),
(1508, 'Sector  el mirador', 886),
(1509, 'Sector  estadio centenario', 886),
(1510, 'Sector  jardines', 886),
(1511, 'Sector  la aldea', 886),
(1512, 'Sector  la florida', 886),
(1513, 'Sector  la fogata', 886),
(1514, 'Sector  la maria', 886),
(1515, 'Sector  monterredondo', 886),
(1516, 'Sector  norte avenida 19', 886),
(1517, 'Sector  parque cafetero', 886),
(1518, 'Sector  parque valencia', 886),
(1519, 'Sector  proviteq', 886),
(1520, 'Sector  quebrada la clarita-san jose', 886),
(1521, 'Sector  regivit', 886),
(1522, 'Sector  san juan', 886),
(1523, 'Sector  san nicolas', 886),
(1524, 'Sector  santa ana', 886),
(1525, 'Sector  sinai', 886),
(1526, 'Sector  tigreros', 886),
(1527, 'Sector  tres esquinas', 886),
(1528, 'Sector  yulima', 886),
(1529, 'Urbanizacion  bosques de viena', 886),
(1530, 'Urbanizacion  el limonar', 886),
(1531, 'Urbanizacion  el silencio', 886),
(1532, 'Urbanizacion  el tesorito', 886),
(1533, 'Urbanizacion  la fachada', 886),
(1534, 'Urbanizacion  la virginia', 886),
(1535, 'Urbanizacion  los almendros', 886),
(1536, 'Urbanizacion  nuevo recreo', 886),
(1537, 'Urbanizacion  palmares del recreo', 886),
(1538, 'Urbanizacion  primero de mayo', 886),
(1539, 'Urbanizacion  sara', 886),
(1540, 'Urbanizacion  venecia', 886),
(1541, 'Urbanizacion  villa andrea', 886),
(1542, 'Urbanizacion  villa celmira', 886),
(1543, 'Urbanizacion  villa de las americas', 886),
(1544, 'Urbanizacion  villa jardin', 886),
(1545, 'Urbanizacion  villa maraveles', 886),
(1546, 'Urbanizacion 13 de junio', 886),
(1547, 'Urbanizacion aguazul', 886),
(1548, 'Urbanizacion ahitamara', 886),
(1549, 'Urbanizacion alameda del norte', 886),
(1550, 'Urbanizacion alcazar del caf?', 886),
(1551, 'Urbanizacion alejandria', 886),
(1552, 'Urbanizacion altos de la pavona', 886),
(1553, 'Urbanizacion arco iris', 886),
(1554, 'Urbanizacion bambusa', 886),
(1555, 'Urbanizacion baru', 886),
(1556, 'Urbanizacion bosques de pinares', 886),
(1557, 'Urbanizacion brasilia nueva', 886),
(1558, 'Urbanizacion cabo de la vela', 886),
(1559, 'Urbanizacion canas gordas', 886),
(1560, 'Urbanizacion cano cristales', 886),
(1561, 'Urbanizacion casablanca', 886),
(1562, 'Urbanizacion castilla grande', 886),
(1563, 'Urbanizacion centenario', 886),
(1564, 'Urbanizacion chalets de monteblanco', 886),
(1565, 'Urbanizacion ciudad dorada', 886),
(1566, 'Urbanizacion ciudadela el poblado', 886),
(1567, 'Urbanizacion ciudadela el sol', 886),
(1568, 'Urbanizacion ciudadela la patria', 886),
(1569, 'Urbanizacion ciudadela las colinas', 886),
(1570, 'Urbanizacion ciudadela los andes', 886),
(1571, 'Urbanizacion ciudadela nueva armenia', 886),
(1572, 'Urbanizacion ciudadela nuevo horizonte', 886),
(1573, 'Urbanizacion ciudadela puerto espejo', 886),
(1574, 'Urbanizacion ciudadela simon bolivar', 886),
(1575, 'Urbanizacion cristales', 886),
(1576, 'Urbanizacion el carmelo', 886),
(1577, 'Urbanizacion el cortijo', 886),
(1578, 'Urbanizacion el jubileo', 886),
(1579, 'Urbanizacion el palmar', 886),
(1580, 'Urbanizacion el parque', 886),
(1581, 'Urbanizacion el refugio', 886),
(1582, 'Urbanizacion el remanso', 886),
(1583, 'Urbanizacion el sinai', 886),
(1584, 'Urbanizacion francisco jose de caldas', 886),
(1585, 'Urbanizacion genesis', 886),
(1586, 'Urbanizacion guaduales de la villa', 886),
(1587, 'Urbanizacion guaduales del eden', 886),
(1588, 'Urbanizacion la alhambra', 886),
(1589, 'Urbanizacion la arcadia', 886),
(1590, 'Urbanizacion la castilla', 886),
(1591, 'Urbanizacion la cecilia', 886),
(1592, 'Urbanizacion la cristalina', 886),
(1593, 'Urbanizacion la divisa', 886),
(1594, 'Urbanizacion la esmeralda', 886),
(1595, 'Urbanizacion la gran bretana', 886),
(1596, 'Urbanizacion la grecia', 886),
(1597, 'Urbanizacion la irlanda', 886),
(1598, 'Urbanizacion la linda', 886),
(1599, 'Urbanizacion la mariela', 886),
(1600, 'Urbanizacion la montana', 886),
(1601, 'Urbanizacion la pavona', 886),
(1602, 'Urbanizacion la rivera', 886),
(1603, 'Urbanizacion las brisas', 886),
(1604, 'Urbanizacion las serranias', 886),
(1605, 'Urbanizacion lindaraja', 886),
(1606, 'Urbanizacion loma verde', 886),
(1607, 'Urbanizacion lomas de la union', 886),
(1608, 'Urbanizacion los arcades', 886),
(1609, 'Urbanizacion los artesanos', 886),
(1610, 'Urbanizacion los girasoles', 886),
(1611, 'Urbanizacion los kioscos', 886),
(1612, 'Urbanizacion los sauces', 886),
(1613, 'Urbanizacion luis carlos galan sarmiento', 886),
(1614, 'Urbanizacion manantiales', 886),
(1615, 'Urbanizacion marbella', 886),
(1616, 'Urbanizacion maria cristina', 886),
(1617, 'Urbanizacion mercedes del norte', 886),
(1618, 'Urbanizacion monteblanco', 886),
(1619, 'Urbanizacion montecarlo', 886),
(1620, 'Urbanizacion murano', 886),
(1621, 'Urbanizacion nuestra senora de la paz', 886),
(1622, 'Urbanizacion nuevo amanecer', 886),
(1623, 'Urbanizacion nuevo berlin', 886),
(1624, 'Urbanizacion nuevo recreo', 886),
(1625, 'Urbanizacion nuevo sol', 886),
(1626, 'Urbanizacion palmares del recreo', 886),
(1627, 'Urbanizacion portal de pinares', 886),
(1628, 'Urbanizacion portal del eden', 886),
(1629, 'Urbanizacion primero de mayo', 886),
(1630, 'Urbanizacion provivienda universal', 886),
(1631, 'Urbanizacion quintas de juliana', 886),
(1632, 'Urbanizacion quintas de la marina', 886),
(1633, 'Urbanizacion quintas de los andes', 886),
(1634, 'Urbanizacion rojas pinilla_1', 886),
(1635, 'Urbanizacion rojas pinilla_2', 886),
(1636, 'Urbanizacion san diego', 886),
(1637, 'Urbanizacion san francisco', 886),
(1638, 'Urbanizacion santa sofia', 886),
(1639, 'Urbanizacion terranova el alba', 886),
(1640, 'Urbanizacion tres esquinas', 886),
(1641, 'Urbanizacion veracruz', 886),
(1642, 'Urbanizacion villa alejandra', 886),
(1643, 'Urbanizacion villa angela', 886),
(1644, 'Urbanizacion villa angela_cordillera', 886),
(1645, 'Urbanizacion villa carolina', 886),
(1646, 'Urbanizacion villa claudia', 886),
(1647, 'Urbanizacion villa de la vida y el trabajo', 886),
(1648, 'Urbanizacion villa del caf?', 886),
(1649, 'Urbanizacion villa del carmen', 886),
(1650, 'Urbanizacion villa del centenario', 886),
(1651, 'Urbanizacion villa hermosa', 886),
(1652, 'Urbanizacion villa inglesa', 886),
(1653, 'Urbanizacion villa italia', 886),
(1654, 'Urbanizacion villa juliana', 886),
(1655, 'Urbanizacion villa laura', 886),
(1656, 'Urbanizacion villa liliana', 886),
(1657, 'Urbanizacion villa marcela', 886),
(1658, 'Urbanizacion villa sofia', 886),
(1659, 'Urbanizacion villa ximena', 886),
(1660, 'Urbanizacion vista hermosa', 886),
(1661, 'qqqq', 13),
(1662, 'sddsdasds', 12);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cajacompensacion`
--

CREATE TABLE `cajacompensacion` (
  `idcajaCompensacion` int(11) NOT NULL,
  `nombreCajaCompensacion` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `cajacompensacion`
--

INSERT INTO `cajacompensacion` (`idcajaCompensacion`, `nombreCajaCompensacion`) VALUES
(87, 'Camacol'),
(88, 'Comfenalco Antioquia CCF'),
(89, 'Caja de Compensación Familiar de Antioquia'),
(90, 'Caja de Compensación Familiar Cajacopi Atlánt'),
(91, 'Combarranquilla'),
(92, 'Comfamiliar Atlántico'),
(93, 'Comfenalco Cartagena'),
(94, 'Caja de Compensación Familiar de Cartagena'),
(95, 'Comfaboy'),
(96, 'CCF de Caldas'),
(97, 'Comfaca'),
(98, 'Comfacauca'),
(99, 'Caja de Compensación Familiar Cesar'),
(100, 'Comfacor'),
(101, 'Cafam'),
(102, 'Colsubsidio'),
(103, 'Caja de Compensación Familiar Compensar'),
(104, 'Comfacundi'),
(105, 'CCF del Chocó'),
(106, 'Caja de Compensación Familiar de La Guajira'),
(107, 'Comfamiliar del Huila'),
(108, 'CCF del Magdalena'),
(109, 'Cofrem Meta'),
(110, 'CCF de Nariño'),
(111, 'Caja de Compensación Familiar del Oriente'),
(112, 'Caja de Comp. Familiar Comfanorte '),
(113, 'Caja de Comp. Familiar de Barrancabermeja Caf'),
(114, 'Cajasan '),
(115, 'Comfenalco Santander'),
(116, 'Caja de Compensación Familiar del Sucre'),
(117, 'Comfenalco Quindío'),
(118, 'Comfamiliar Risaralda'),
(119, 'CCF del Sur del Tolima Cafasur '),
(120, 'Comfatolima '),
(121, 'Comfenalco –Tolima'),
(122, 'Comfenalco Valle'),
(123, 'Comfandi '),
(124, 'Caja de Compensación Familiar del Putumayo'),
(125, 'Cajasai '),
(126, 'Caja de Comp Familiar del Amazonas Cafamaz'),
(127, 'Comfiar Caja de Compensacion Familiar de Arau'),
(128, 'Comcaja'),
(129, 'Comfacasanare');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `calificaciones`
--

CREATE TABLE `calificaciones` (
  `idcalificacion` int(11) NOT NULL,
  `valorCalificacion` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cargos`
--

CREATE TABLE `cargos` (
  `idCargo` int(11) NOT NULL,
  `nombreTipoCargo` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `cargos`
--

INSERT INTO `cargos` (`idCargo`, `nombreTipoCargo`) VALUES
(1151, ' Ajustador de electricista'),
(1152, ' Asistente médico'),
(1153, ' Avicultor'),
(1154, ' Ingeniero catastral'),
(1155, ' Ingeniero textil'),
(1156, ' Instalador de material aislante e isonorizac'),
(1157, ' Instalador y reparadores de  líneas eléctric'),
(1158, ' Peluquero'),
(1159, 'Abogado'),
(1160, 'Acarreador de agua'),
(1161, 'Acompañante de personas'),
(1162, 'Actor'),
(1163, 'Administrador de Base de Datos'),
(1164, 'Administrador de equipos informáticos'),
(1165, 'Administrador de redes'),
(1166, 'Administrador de Redes/ Servidores'),
(1167, 'Administrador de sistemas'),
(1168, 'Administrativo Área Stock'),
(1169, 'Administrativo Área Ventas'),
(1170, 'Agente de seguros'),
(1171, 'Agente de Servicios Post Venta'),
(1172, 'Agente de viajes'),
(1173, 'Agricultor '),
(1174, 'Agrónomo '),
(1175, 'Ajustador e instalador en electrónica'),
(1176, 'Albañil'),
(1177, 'Alfarero'),
(1178, 'Analista de Control de Gestión'),
(1179, 'Analista de Costos'),
(1180, 'Analista de Créditos y Riesgos'),
(1181, 'Analista de Créditos y Riesgos Junior'),
(1182, 'Analista de Finanzas'),
(1183, 'Analista de Finanzas Junior'),
(1184, 'Analista de gestión y organización '),
(1185, 'Analista de Impuestos'),
(1186, 'Analista de infraestructura'),
(1187, 'Analista de Marketing'),
(1188, 'Analista de Marketing Junior'),
(1189, 'Analista de Organización y Métodos'),
(1190, 'Analista de Organización y Métodos Junior'),
(1191, 'Analista de Procesos Industriales'),
(1192, 'Analista de sistemas'),
(1193, 'Analista de Sistemas Informáticos'),
(1194, 'Analista de Sistemas Informáticos Junior'),
(1195, 'Analista de Trade Marketing'),
(1196, 'Analista de Ventas'),
(1197, 'Analista financiero'),
(1198, 'Analista Programador'),
(1199, 'Antropólogo'),
(1200, 'Aparejador y espalmador de cables'),
(1201, 'Apelambrador'),
(1202, 'Arquitecto'),
(1203, 'Arquitecto de Sistemas Informáticos'),
(1204, 'Artesano '),
(1205, 'Artista'),
(1206, 'Asesor financiero de inversiones'),
(1207, 'Asistente de Archivo'),
(1208, 'Asistente de Control de Calidad Industrial'),
(1209, 'Asistente de Eventos'),
(1210, 'Asistente de Impuestos'),
(1211, 'Asistente de Investigación y Desarrollo Indus'),
(1212, 'Asistente de Marketing'),
(1213, 'Asistente de Planta Industrial'),
(1214, 'Asistente de Procesos Industriales'),
(1215, 'Asistente de Relaciones Públicas'),
(1216, 'Asistente de Secretaría'),
(1217, 'Asistente de Servicios Generales'),
(1218, 'Asistente de Ventas'),
(1219, 'Asistente Informático'),
(1220, 'Asistente odontológico '),
(1221, 'Asistente terapeuta'),
(1222, 'Astrólogo'),
(1223, 'Astrónomo'),
(1224, 'Atención al Cliente/ Recepcionista'),
(1225, 'Atleta'),
(1226, 'Auditor'),
(1227, 'Auditor contable'),
(1228, 'Auditor de calidad.'),
(1229, 'Auditor Informático'),
(1230, 'Auditor Junior'),
(1231, 'Auditor Senior'),
(1232, 'Auditores financieros'),
(1233, 'Auxiliar Administrativo'),
(1234, 'Auxiliar Contable'),
(1235, 'Auxiliar contable'),
(1236, 'Auxiliar de Cobranzas/ Telecobranzas'),
(1237, 'Auxiliar de Comercio Exterior'),
(1238, 'Auxiliar de Compras'),
(1239, 'Auxiliar de Créditos'),
(1240, 'Auxiliar de Depósito'),
(1241, 'Auxiliar de Facturación y/o Cuentas Corriente'),
(1242, 'Auxiliar de Licitaciones'),
(1243, 'Auxiliar de Logística'),
(1244, 'Auxiliar de maestro'),
(1245, 'Auxiliar de nómina'),
(1246, 'Auxiliar de Recursos Humanos'),
(1247, 'Auxiliar de seguros'),
(1248, 'Auxiliar de servicios estadísticos'),
(1249, 'Auxiliar de Tesorería'),
(1250, 'Auxiliar financiero '),
(1251, 'Auxiliar laico'),
(1252, 'Avicultor'),
(1253, 'Ayudante de cocina'),
(1254, 'Ayudante de elaboración de alimentos y bebida'),
(1255, 'Bailarines'),
(1256, 'Bárman'),
(1257, 'Barnizador y afin'),
(1258, 'Barrendero y afin'),
(1259, 'Biólogo'),
(1260, 'Bisutero'),
(1261, 'Bombero'),
(1262, 'Botánico'),
(1263, 'Brand Manager'),
(1264, 'Buzo'),
(1265, 'Cadete u Ordenanza'),
(1266, 'Cajero'),
(1267, 'Camarógrafo'),
(1268, 'Cantante'),
(1269, 'Carnicero'),
(1270, 'Carpintero'),
(1271, 'Carpinteros'),
(1272, 'Cartógrafo'),
(1273, 'Catador'),
(1274, 'Cazador'),
(1275, 'Ceramista'),
(1276, 'Cestero mimbreras'),
(1277, 'Chapista calderero'),
(1278, 'Chef de cocina'),
(1279, 'Chofer'),
(1280, 'Chofer-Cobrador'),
(1281, 'Clasificador de desechos'),
(1282, 'Cobrador'),
(1283, 'Cocinero'),
(1284, 'Codificador de datos'),
(1285, 'Comercial Unidad de Negocios'),
(1286, 'Comercialnte al por menor'),
(1287, 'Comerciante al por mayor'),
(1288, 'Community Manager'),
(1289, 'Compositor'),
(1290, 'Conductor'),
(1291, 'Constructor'),
(1292, 'Consultor Analista de Planificación'),
(1293, 'Consultor Asistente de Planificación'),
(1294, 'Consultor de Procesos Industriales'),
(1295, 'Consultor de tecnología'),
(1296, 'Consultor en Ingeniería Industrial'),
(1297, 'Consultor Gerente/ Jefe de Planificación'),
(1298, 'Contador General'),
(1299, 'Contadores'),
(1300, 'Controlador de tráfico aéreo'),
(1301, 'Coordinador de Eventos'),
(1302, 'Coreógrafo'),
(1303, 'Cortador de tela cuero y afines'),
(1304, 'Costurero'),
(1305, 'Criador de ganado'),
(1306, 'Cristalera'),
(1307, 'Cuidador de animales domésticos'),
(1308, 'Cuidador de niños'),
(1309, 'Decorador'),
(1310, 'Deportista'),
(1311, 'Desarrollador de Negocios'),
(1312, 'Desarrollador de software'),
(1313, 'Desarrollador Web'),
(1314, 'Desarrollador Web Junior'),
(1315, 'Detective privado'),
(1316, 'Dibujante técnico'),
(1317, 'Digitador/ Operador de Computadoras'),
(1318, 'Director de cine teatro y afines'),
(1319, 'Diseñador gráfico y multimedia'),
(1320, 'Diseñador y administrador de bases de datos'),
(1321, 'Diseñador y decorador de interiores'),
(1322, 'Docente'),
(1323, 'Docente Universitario'),
(1324, 'Ebanista'),
(1325, 'Ejecutivo de Marketing'),
(1326, 'Ejecutivo de Ventas/ Cuentas'),
(1327, 'Ejecutivo de Ventas/ Cuentas Junior'),
(1328, 'Electricista de obra'),
(1329, 'Empacador manual'),
(1330, 'Encargado Comercio Exterior'),
(1331, 'Encargado de Administración de Personal'),
(1332, 'Encargado de Archivo'),
(1333, 'Encargado de Compras'),
(1334, 'Encargado de Créditos'),
(1335, 'Encargado de Cuentas a Pagar'),
(1336, 'Encargado de Desarrollo Organizacional'),
(1337, 'Encargado de Facturación y/o Cuentas Corrient'),
(1338, 'Encargado de Informática'),
(1339, 'Encargado de Local Comercial'),
(1340, 'Encargado de Reclutamiento y/o Selección'),
(1341, 'Encargado de Recursos Humanos'),
(1342, 'Encargado de Stock Comercio Minorista - Merch'),
(1343, 'Encargado en Infraestructura Tecnológica'),
(1344, 'Encargado o Asistente de Codificación'),
(1345, 'Encargado(a) de Limpieza *'),
(1346, 'Encargado/ Agente de Cobranzas/ Telecobranzas'),
(1347, 'Encargado/ Asistente de Escrituraciones'),
(1348, 'Encargado/ Auxiliar de Patrimonio'),
(1349, 'Encuadernador'),
(1350, 'Encuestador Área Marketing'),
(1351, 'Entrevistador'),
(1352, 'Epidemiólogo'),
(1353, 'Escolta'),
(1354, 'Escritor'),
(1355, 'Escultor'),
(1356, 'Especialista en métodos pedagógicos'),
(1357, 'Especialista en tratamientos de belleza y afi'),
(1358, 'Estadístico'),
(1359, 'Evaluador de bienes raíces'),
(1360, 'Fabricante de instrumentos musicales'),
(1361, 'Fabricante de lácteos'),
(1362, 'Farmacéutico'),
(1363, 'Filósofo'),
(1364, 'Físico'),
(1365, 'Fisioterapeuta'),
(1366, 'Fonoaudiólogo'),
(1367, 'Fontanero'),
(1368, 'Fotografo'),
(1369, 'Fumigador'),
(1370, 'Geólogo'),
(1371, 'Gerente Administrativo y Financiero'),
(1372, 'Gerente Administrativo/ Operacional'),
(1373, 'Gerente Área Informática'),
(1374, 'Gerente Comercial'),
(1375, 'Gerente de Análisis de Sistemas'),
(1376, 'Gerente de Canal'),
(1377, 'Gerente de Compras'),
(1378, 'Gerente de Control de Calidad Industrial'),
(1379, 'Gerente de Desarrollo de Sistemas'),
(1380, 'Gerente de Infraestructura Tecnológica'),
(1381, 'Gerente de Investigación y Desarrollo Industr'),
(1382, 'Gerente de Marketing'),
(1383, 'Gerente de Planta Industrial'),
(1384, 'Gerente de Producción Industrial'),
(1385, 'Gerente de Producto (Marketing)'),
(1386, 'Gerente de Recursos Humanos'),
(1387, 'Gerente de Relaciones Públicas'),
(1388, 'Gerente de Servicios Generales'),
(1389, 'Gerente de Sucursal/ Unidad de Negocios'),
(1390, 'Gerente de Ventas'),
(1391, 'Gerente Departamental/ Sucursal'),
(1392, 'Gerente Financiero'),
(1393, 'Gerente Financiero y Administrativo'),
(1394, 'Gerente General'),
(1395, 'Gerente Propietario'),
(1396, 'Gestor'),
(1397, 'Grabador de datos'),
(1398, 'Guardafrenos'),
(1399, 'Guia de museos'),
(1400, 'Guía de turismo'),
(1401, 'Herrero'),
(1402, 'Impresor'),
(1403, 'Ingeniero aeronáutico'),
(1404, 'Ingeniero automotriz'),
(1405, 'Ingeniero civiles.'),
(1406, 'Ingeniero de energía nuclear'),
(1407, 'Ingeniero de minas'),
(1408, 'ingeniero de salvamento marítimo'),
(1409, 'Ingeniero de seguridad.'),
(1410, 'Ingeniero de telecomunicaciones'),
(1411, 'Ingeniero de tráfico'),
(1412, 'Ingeniero electricistas'),
(1413, 'Ingeniero eléctrico'),
(1414, 'Ingeniero industriales'),
(1415, 'Ingeniero marino'),
(1416, 'Ingeniero Mecánico'),
(1417, 'Ingeniero medio ambiental'),
(1418, 'Ingeniero químico'),
(1419, 'Ingenieros electrónicos'),
(1420, 'Inspector de seguridad'),
(1421, 'Instructor'),
(1422, 'Instructor de conducción'),
(1423, 'Instructor de educación física'),
(1424, 'Instructor de Informática'),
(1425, 'Instructor de tecnologías de la información'),
(1426, 'Investigador de Mercado'),
(1427, 'Jefe Comercio Exteror'),
(1428, 'Jefe de Depósito'),
(1429, 'Jefe de Laboratorio Industrial'),
(1430, 'Jefe de Logística'),
(1431, 'Jefe de Mantenimiento Industrial'),
(1432, 'Jefe de Organización y Métodos'),
(1433, 'Jefe de Planificación de la Producción Indust'),
(1434, 'Jefe de Procesamiento de Datos'),
(1435, 'Jefe de Seguridad Informática'),
(1436, 'Jefe de Soporte a Usuarios de Informática'),
(1437, 'Jefe de Suministros'),
(1438, 'Jefe de Turno (Producción Industrial)'),
(1439, 'Jefe Desarrollo Web'),
(1440, 'Joyero'),
(1441, 'Labrante'),
(1442, 'Lavador de autos'),
(1443, 'Lavandero'),
(1444, 'Limpiador de fachadas'),
(1445, 'Limpiador de ventanas'),
(1446, 'Liquidador de Sueldos y Jornales'),
(1447, 'Locutor'),
(1448, 'Maquinista de locomotoras'),
(1449, 'Maquinista en navegación'),
(1450, 'Mecánico'),
(1451, 'Médico'),
(1452, 'Medico alternativo'),
(1453, 'Mensajeros'),
(1454, 'Mesero'),
(1455, 'Meteorólogo'),
(1456, 'Modelo de modas'),
(1457, 'Moldeador y machero'),
(1458, 'Montador de estructuras metálicas'),
(1459, 'Músico'),
(1460, 'Nutricionista'),
(1461, 'Odontólogo'),
(1462, 'Oficial de la construcción'),
(1463, 'Oficios varios'),
(1464, 'Operador audiométrico'),
(1465, 'Operador de Call Center'),
(1466, 'Operador de Garantías Post Venta'),
(1467, 'Operador de instalaciones de refinación de pe'),
(1468, 'Operador de máquinas'),
(1469, 'Operador de Máquinas/ Equipamiento Industrial'),
(1470, 'Operador de montacargas'),
(1471, 'Operador turístico'),
(1472, 'Operario de Industria (general) *'),
(1473, 'Operario de limpieza'),
(1474, 'Operario de Limpieza *'),
(1475, 'Optómetra'),
(1476, 'Orfebre'),
(1477, 'Organizador de conferencias y eventos'),
(1478, 'Panadero'),
(1479, 'Parrillero'),
(1480, 'Periodistas'),
(1481, 'Personal de servicios de protección'),
(1482, 'Personal de servicios funerarios'),
(1483, 'Pescador'),
(1484, 'Piloto'),
(1485, 'Pintor'),
(1486, 'Preventista'),
(1487, 'Profesional de gestión y de talento humano'),
(1488, 'Profesional de la protección medio ambiental'),
(1489, 'Programador'),
(1490, 'Programador Junior'),
(1491, 'Programador Senior'),
(1492, 'Promotor'),
(1493, 'Proyectista / Diseñador Industrial - Asistent'),
(1494, 'Proyectista/ Diseñador Industrial'),
(1495, 'Psicólogo'),
(1496, 'Publicista'),
(1497, 'Químico'),
(1498, 'Radiólogo oral'),
(1499, 'Recolector de basura'),
(1500, 'Recontador de billetes'),
(1501, 'Relacionista publico'),
(1502, 'Reparador'),
(1503, 'Repositor'),
(1504, 'Revisor fiscal '),
(1505, 'Revocador'),
(1506, 'Sastre'),
(1507, 'Secretaria(o) de Gerencia/ Directorio'),
(1508, 'Secretario(a)'),
(1509, 'Secretario(a) General - Secretario(a) Ejecuti'),
(1510, 'Silvicultor'),
(1511, 'Socilogo'),
(1512, 'Soldador'),
(1513, 'Sombrerero'),
(1514, 'Soporte a Usuarios de Informática- Help Desk'),
(1515, 'Subgerente de Ventas'),
(1516, 'Supervisor'),
(1517, 'Supervisor Administrativo/ Operaciones'),
(1518, 'Supervisor de Cajas'),
(1519, 'Supervisor de Call Center'),
(1520, 'Supervisor de Cobranzas/ Telecobranzas'),
(1521, 'Supervisor de Compras'),
(1522, 'Supervisor de Contabilidad'),
(1523, 'Supervisor de Finanzas'),
(1524, 'Supervisor de Licitaciones'),
(1525, 'Supervisor de Marketing'),
(1526, 'Supervisor de Planta Industrial'),
(1527, 'Supervisor de Producción Industrial'),
(1528, 'Supervisor de Telemarketing'),
(1529, 'Supervisor de Ventas'),
(1530, 'Surtidor'),
(1531, 'Tapicero'),
(1532, 'Técnico en Control de Calidad Industrial'),
(1533, 'Técnico en Implementación de Sistemas Informá'),
(1534, 'Técnico en Investigación y Desarrollo en Info'),
(1535, 'Técnico en Laboratorio Industrial'),
(1536, 'Técnico en Mantenimiento Industrial'),
(1537, 'Técnico en Seguridad e Higiene Industrial'),
(1538, 'Tejedor'),
(1539, 'Telefonista'),
(1540, 'Telemarketero'),
(1541, 'Terapeuta'),
(1542, 'Tesorero'),
(1543, 'Tester de Control de Calidad de Software'),
(1544, 'Topógrafo'),
(1545, 'Trabajador de cuidados personales a domicilio'),
(1546, 'Trabajador de cultivos'),
(1547, 'Trabajador de jardinería y horticultura'),
(1548, 'Trabajador de servicios de transporte'),
(1549, 'Trabajador forestal'),
(1550, 'Trabajador pecuario'),
(1551, 'Trabajador Social'),
(1552, 'Vendedor'),
(1553, 'Vendedor de Salón Comercial'),
(1554, 'Veterinarios'),
(1555, 'Webmaster'),
(1556, 'Zapatero'),
(1557, 'Zoólogo '),
(1558, 'Zootecnista');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ciudades`
--

CREATE TABLE `ciudades` (
  `idciudad` int(11) NOT NULL,
  `nombreCiudad` varchar(45) NOT NULL,
  `Departamentos_idDepartamento` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `ciudades`
--

INSERT INTO `ciudades` (`idciudad`, `nombreCiudad`, `Departamentos_idDepartamento`) VALUES
(0, 'Sin especificar', 0),
(1, 'El Encanto', 1),
(2, 'La Chorrera', 1),
(3, 'La Pedrera', 1),
(4, 'La Victoria', 1),
(5, 'Leticia', 1),
(6, 'Miriti Paraná', 1),
(7, 'Puerto Alegría', 1),
(8, 'Puerto Arica', 1),
(9, 'Puerto Nariño', 1),
(10, 'Puerto Santander', 1),
(11, 'Tarapacá', 1),
(12, 'Abejorral', 2),
(13, 'Abriaquí', 2),
(14, 'Alejandría', 2),
(15, 'Amagá', 2),
(16, 'Amalfi', 2),
(17, 'Andes', 2),
(18, 'Angelópolis', 2),
(19, 'Angostura', 2),
(20, 'Anorí', 2),
(21, 'Anza', 2),
(22, 'Apartadó', 2),
(23, 'Arboletes', 2),
(24, 'Argelia', 2),
(25, 'Armenia', 2),
(26, 'Barbosa', 2),
(27, 'Bello', 2),
(28, 'Belmira', 2),
(29, 'Betania', 2),
(30, 'Betulia', 2),
(31, 'Briceño', 2),
(32, 'Buriticá', 2),
(33, 'Cáceres', 2),
(34, 'Caicedo', 2),
(35, 'Caldas', 2),
(36, 'Campamento', 2),
(37, 'Cañasgordas', 2),
(38, 'Caracolí', 2),
(39, 'Caramanta', 2),
(40, 'Carepa', 2),
(41, 'Carolina', 2),
(42, 'Caucasia', 2),
(43, 'Chigorodó', 2),
(44, 'Cisneros', 2),
(45, 'Ciudad Bolívar', 2),
(46, 'Cocorná', 2),
(47, 'Concepción', 2),
(48, 'Concordia', 2),
(49, 'Copacabana', 2),
(50, 'Dabeiba', 2),
(51, 'Don Matías', 2),
(52, 'Ebéjico', 2),
(53, 'El Bagre', 2),
(54, 'El Carmen de Viboral', 2),
(55, 'El Santuario', 2),
(56, 'Entrerrios', 2),
(57, 'Envigado', 2),
(58, 'Fredonia', 2),
(59, 'Frontino', 2),
(60, 'Giraldo', 2),
(61, 'Girardota', 2),
(62, 'Gómez Plata', 2),
(63, 'Granada', 2),
(64, 'Guadalupe', 2),
(65, 'Guarne', 2),
(66, 'Guatapé', 2),
(67, 'Heliconia', 2),
(68, 'Hispania', 2),
(69, 'Itagui', 2),
(70, 'Ituango', 2),
(71, 'Jardín', 2),
(72, 'Jericó', 2),
(73, 'La Ceja', 2),
(74, 'La Estrella', 2),
(75, 'La Pintada', 2),
(76, 'La Unión', 2),
(77, 'Liborina', 2),
(78, 'Maceo', 2),
(79, 'Marinilla', 2),
(80, 'Medellín', 2),
(81, 'Montebello', 2),
(82, 'Murindó', 2),
(83, 'Mutatá', 2),
(84, 'Nariño', 2),
(85, 'Nechí', 2),
(86, 'Necoclí', 2),
(87, 'Olaya', 2),
(88, 'Peñol', 2),
(89, 'Peque', 2),
(90, 'Pueblorrico', 2),
(91, 'Puerto Berrío', 2),
(92, 'Puerto Nare', 2),
(93, 'Puerto Triunfo', 2),
(94, 'Remedios', 2),
(95, 'Retiro', 2),
(96, 'Rionegro', 2),
(97, 'Sabanalarga', 2),
(98, 'Sabaneta', 2),
(99, 'Salgar', 2),
(100, 'San Andrés de Cuerquía', 2),
(101, 'San Carlos', 2),
(102, 'San Francisco', 2),
(103, 'San Jerónimo', 2),
(104, 'San José de La Montaña', 2),
(105, 'San Juan de Urabá', 2),
(106, 'San Luis', 2),
(107, 'San Pedro', 2),
(108, 'San Pedro de Uraba', 2),
(109, 'San Rafael', 2),
(110, 'San Roque', 2),
(111, 'San Vicente', 2),
(112, 'Santa Bárbara', 2),
(113, 'Santa Rosa de Osos', 2),
(114, 'Santafé de Antioquia', 2),
(115, 'Santo Domingo', 2),
(116, 'Segovia', 2),
(117, 'Sonsón', 2),
(118, 'Sopetrán', 2),
(119, 'Támesis', 2),
(120, 'Tarazá', 2),
(121, 'Tarso', 2),
(122, 'Titiribí', 2),
(123, 'Toledo', 2),
(124, 'Turbo', 2),
(125, 'Uramita', 2),
(126, 'Urrao', 2),
(127, 'Valdivia', 2),
(128, 'Valparaíso', 2),
(129, 'Vegachí', 2),
(130, 'Venecia', 2),
(131, 'Vigía del Fuerte', 2),
(132, 'Yalí', 2),
(133, 'Yarumal', 2),
(134, 'Yolombó', 2),
(135, 'Yondó', 2),
(136, 'Zaragoza', 2),
(137, 'Arauca', 3),
(138, 'Arauquita', 3),
(139, 'Cravo Norte', 3),
(140, 'Fortul', 3),
(141, 'Puerto Rondón', 3),
(142, 'Saravena', 3),
(143, 'Tame', 3),
(144, 'Providencia', 4),
(145, 'San Andrés', 4),
(146, 'Baranoa', 5),
(147, 'Barranquilla', 5),
(148, 'Campo de La Cruz', 5),
(149, 'Candelaria', 5),
(150, 'Galapa', 5),
(151, 'Juan de Acosta', 5),
(152, 'Luruaco', 5),
(153, 'Malambo', 5),
(154, 'Manatí', 5),
(155, 'Palmar de Varela', 5),
(156, 'Piojó', 5),
(157, 'Polonuevo', 5),
(158, 'Ponedera', 5),
(159, 'Puerto Colombia', 5),
(160, 'Repelón', 5),
(161, 'Sabanagrande', 5),
(162, 'Sabanalarga', 5),
(163, 'Santa Lucía', 5),
(164, 'Santo Tomás', 5),
(165, 'Soledad', 5),
(166, 'Suan', 5),
(167, 'Tubará', 5),
(168, 'Usiacurí', 5),
(169, 'Bogotá D.C.', 6),
(170, 'Achí', 7),
(171, 'Altos del Rosario', 7),
(172, 'Arenal', 7),
(173, 'Arjona', 7),
(174, 'Arroyohondo', 7),
(175, 'Barranco de Loba', 7),
(176, 'Calamar', 7),
(177, 'Cantagallo', 7),
(178, 'Cartagena', 7),
(179, 'Cicuco', 7),
(180, 'Clemencia', 7),
(181, 'Córdoba', 7),
(182, 'El Carmen de Bolívar', 7),
(183, 'El Guamo', 7),
(184, 'El Peñón', 7),
(185, 'Hatillo de Loba', 7),
(186, 'Magangué', 7),
(187, 'Mahates', 7),
(188, 'Margarita', 7),
(189, 'María la Baja', 7),
(190, 'Mompós', 7),
(191, 'Montecristo', 7),
(192, 'Morales', 7),
(193, 'Norosí', 7),
(194, 'Pinillos', 7),
(195, 'Regidor', 7),
(196, 'Río Viejo', 7),
(197, 'San Cristóbal', 7),
(198, 'San Estanislao', 7),
(199, 'San Fernando', 7),
(200, 'San Jacinto', 7),
(201, 'San Jacinto del Cauca', 7),
(202, 'San Juan Nepomuceno', 7),
(203, 'San Martín de Loba', 7),
(204, 'San Pablo de Borbur', 7),
(205, 'Santa Catalina', 7),
(206, 'Santa Rosa', 7),
(207, 'Santa Rosa del Sur', 7),
(208, 'Simití', 7),
(209, 'Soplaviento', 7),
(210, 'Talaigua Nuevo', 7),
(211, 'Tiquisio', 7),
(212, 'Turbaco', 7),
(213, 'Turbaná', 7),
(214, 'Villanueva', 7),
(215, 'Zambrano', 7),
(216, 'Almeida', 8),
(217, 'Aquitania', 8),
(218, 'Arcabuco', 8),
(219, 'Belén', 8),
(220, 'Berbeo', 8),
(221, 'Betéitiva', 8),
(222, 'Boavita', 8),
(223, 'Boyacá', 8),
(224, 'Briceño', 8),
(225, 'Buena Vista', 8),
(226, 'Busbanzá', 8),
(227, 'Caldas', 8),
(228, 'Campohermoso', 8),
(229, 'Cerinza', 8),
(230, 'Chinavita', 8),
(231, 'Chiquinquirá', 8),
(232, 'Chíquiza', 8),
(233, 'Chiscas', 8),
(234, 'Chita', 8),
(235, 'Chitaraque', 8),
(236, 'Chivatá', 8),
(237, 'Chivor', 8),
(238, 'Ciénega', 8),
(239, 'Cómbita', 8),
(240, 'Coper', 8),
(241, 'Corrales', 8),
(242, 'Covarachía', 8),
(243, 'Cubará', 8),
(244, 'Cucaita', 8),
(245, 'Cuítiva', 8),
(246, 'Duitama', 8),
(247, 'El Cocuy', 8),
(248, 'El Espino', 8),
(249, 'Firavitoba', 8),
(250, 'Floresta', 8),
(251, 'Gachantivá', 8),
(252, 'Gameza', 8),
(253, 'Garagoa', 8),
(254, 'Guacamayas', 8),
(255, 'Guateque', 8),
(256, 'Guayatá', 8),
(257, 'Güicán', 8),
(258, 'Iza', 8),
(259, 'Jenesano', 8),
(260, 'Jericó', 8),
(261, 'La Capilla', 8),
(262, 'La Uvita', 8),
(263, 'La Victoria', 8),
(264, 'Labranzagrande', 8),
(265, 'Macanal', 8),
(266, 'Maripí', 8),
(267, 'Miraflores', 8),
(268, 'Mongua', 8),
(269, 'Monguí', 8),
(270, 'Moniquirá', 8),
(271, 'Motavita', 8),
(272, 'Muzo', 8),
(273, 'Nobsa', 8),
(274, 'Nuevo Colón', 8),
(275, 'Oicatá', 8),
(276, 'Otanche', 8),
(277, 'Pachavita', 8),
(278, 'Páez', 8),
(279, 'Paipa', 8),
(280, 'Pajarito', 8),
(281, 'Panqueba', 8),
(282, 'Pauna', 8),
(283, 'Paya', 8),
(284, 'Paz de Río', 8),
(285, 'Pesca', 8),
(286, 'Pisba', 8),
(287, 'Puerto Boyacá', 8),
(288, 'Quípama', 8),
(289, 'Ramiriquí', 8),
(290, 'Ráquira', 8),
(291, 'Rondón', 8),
(292, 'Saboyá', 8),
(293, 'Sáchica', 8),
(294, 'Samacá', 8),
(295, 'San Eduardo', 8),
(296, 'San José de Pare', 8),
(297, 'San Luis de Gaceno', 8),
(298, 'San Mateo', 8),
(299, 'San Miguel de Sema', 8),
(300, 'San Pablo de Borbur', 8),
(301, 'Socha', 8),
(302, 'Santa María', 8),
(303, 'Santa Rosa de Viterbo', 8),
(304, 'Santa Sofía', 8),
(305, 'Santana', 8),
(306, 'Sativanorte', 8),
(307, 'Sativasur', 8),
(308, 'Siachoque', 8),
(309, 'Soatá', 8),
(310, 'Socotá', 8),
(311, 'Sogamoso', 8),
(312, 'Somondoco', 8),
(313, 'Sora', 8),
(314, 'Soracá', 8),
(315, 'Sotaquirá', 8),
(316, 'Susacón', 8),
(317, 'Sutamarchán', 8),
(318, 'Sutatenza', 8),
(319, 'Tasco', 8),
(320, 'Tenza', 8),
(321, 'Tibaná', 8),
(322, 'Tibasosa', 8),
(323, 'Tinjacá', 8),
(324, 'Tipacoque', 8),
(325, 'Toca', 8),
(326, 'Togüí', 8),
(327, 'Tópaga', 8),
(328, 'Tota', 8),
(329, 'Tunja', 8),
(330, 'Tununguá', 8),
(331, 'Turmequé', 8),
(332, 'Tuta', 8),
(333, 'Tutazá', 8),
(334, 'Umbita', 8),
(335, 'Ventaquemada', 8),
(336, 'Villa de Leyva', 8),
(337, 'Viracachá', 8),
(338, 'Zetaquira', 8),
(339, 'Aguadas', 9),
(340, 'Anserma', 9),
(341, 'Aranzazu', 9),
(342, 'Belalcázar', 9),
(343, 'Chinchiná', 9),
(344, 'Filadelfia', 9),
(345, 'La Dorada', 9),
(346, 'La Merced', 9),
(347, 'Manizales', 9),
(348, 'Manzanares', 9),
(349, 'Marmato', 9),
(350, 'Marquetalia', 9),
(351, 'Marulanda', 9),
(352, 'Neira', 9),
(353, 'Norcasia', 9),
(354, 'Pácora', 9),
(355, 'Palestina', 9),
(356, 'Pensilvania', 9),
(357, 'Riosucio', 9),
(358, 'Risaralda', 9),
(359, 'Salamina', 9),
(360, 'Samaná', 9),
(361, 'San José', 9),
(362, 'Supía', 9),
(363, 'Victoria', 9),
(364, 'Villamaría', 9),
(365, 'Viterbo', 9),
(366, 'Albania', 10),
(367, 'Belén de Los Andaquies', 10),
(368, 'Cartagena del Chairá', 10),
(369, 'Curillo', 10),
(370, 'El Doncello', 10),
(371, 'El Paujil', 10),
(372, 'Florencia', 10),
(373, 'La Montañita', 10),
(374, 'Milán', 10),
(375, 'Morelia', 10),
(376, 'Puerto Rico', 10),
(377, 'San José del Fragua', 10),
(378, 'San Vicente del Caguán', 10),
(379, 'Solano', 10),
(380, 'Solita', 10),
(381, 'Valparaíso', 10),
(382, 'Aguazul', 11),
(383, 'Chámeza', 11),
(384, 'Hato Corozal', 11),
(385, 'La Salina', 11),
(386, 'Maní', 11),
(387, 'Monterrey', 11),
(388, 'Nunchía', 11),
(389, 'Orocué', 11),
(390, 'Paz de Ariporo', 11),
(391, 'Pore', 11),
(392, 'Recetor', 11),
(393, 'Sabanalarga', 11),
(394, 'Sácama', 11),
(395, 'San Luis de Gaceno', 11),
(396, 'Támara', 11),
(397, 'Tauramena', 11),
(398, 'Trinidad', 11),
(399, 'Villanueva', 11),
(400, 'Yopal', 11),
(401, 'Almaguer', 12),
(402, 'Argelia', 12),
(403, 'Balboa', 12),
(404, 'Bolívar', 12),
(405, 'Buenos Aires', 12),
(406, 'Cajibío', 12),
(407, 'Caldono', 12),
(408, 'Caloto', 12),
(409, 'Corinto', 12),
(410, 'El Tambo', 12),
(411, 'Florencia', 12),
(412, 'Guachené', 12),
(413, 'Guapi', 12),
(414, 'Inzá', 12),
(415, 'Jambaló', 12),
(416, 'La Sierra', 12),
(417, 'La Vega', 12),
(418, 'López', 12),
(419, 'Mercaderes', 12),
(420, 'Miranda', 12),
(421, 'Morales', 12),
(422, 'Padilla', 12),
(423, 'Páez', 12),
(424, 'Patía', 12),
(425, 'Piamonte', 12),
(426, 'Piendamó', 12),
(427, 'Popayán', 12),
(428, 'Puerto Tejada', 12),
(429, 'Puracé', 12),
(430, 'Rosas', 12),
(431, 'San Sebastián', 12),
(432, 'Santa Rosa', 12),
(433, 'Santander de Quilichao', 12),
(434, 'Silvia', 12),
(435, 'Sotara', 12),
(436, 'Suárez', 12),
(437, 'Sucre', 12),
(438, 'Timbío', 12),
(439, 'Timbiquí', 12),
(440, 'Toribio', 12),
(441, 'Totoró', 12),
(442, 'Villa Rica', 12),
(443, 'Aguachica', 13),
(444, 'Agustín Codazzi', 13),
(445, 'Astrea', 13),
(446, 'Becerril', 13),
(447, 'Bosconia', 13),
(448, 'Chimichagua', 13),
(449, 'Chiriguaná', 13),
(450, 'Curumaní', 13),
(451, 'El Copey', 13),
(452, 'El Paso', 13),
(453, 'Gamarra', 13),
(454, 'González', 13),
(455, 'La Gloria', 13),
(456, 'La Jagua de Ibirico', 13),
(457, 'La Paz', 13),
(458, 'Manaure', 13),
(459, 'Pailitas', 13),
(460, 'Pelaya', 13),
(461, 'Pueblo Bello', 13),
(462, 'Río de Oro', 13),
(463, 'San Alberto', 13),
(464, 'San Diego', 13),
(465, 'San Martín', 13),
(466, 'Tamalameque', 13),
(467, 'Valledupar', 13),
(468, 'Acandí', 14),
(469, 'Alto Baudo', 14),
(470, 'Atrato', 14),
(471, 'Bagadó', 14),
(472, 'Bahía Solano', 14),
(473, 'Bajo Baudó', 14),
(474, 'Belén de Bajira', 14),
(475, 'Bojaya', 14),
(476, 'Carmen del Darien', 14),
(477, 'Cértegui', 14),
(478, 'Condoto', 14),
(479, 'El Cantón del San Pablo', 14),
(480, 'El Carmen de Atrato', 14),
(481, 'El Litoral del San Juan', 14),
(482, 'Istmina', 14),
(483, 'Juradó', 14),
(484, 'Lloró', 14),
(485, 'Medio Atrato', 14),
(486, 'Medio Baudó', 14),
(487, 'Medio San Juan', 14),
(488, 'Nóvita', 14),
(489, 'Nuquí', 14),
(490, 'Quibdó', 14),
(491, 'Río Iro', 14),
(492, 'Río Quito', 14),
(493, 'Riosucio', 14),
(494, 'San José del Palmar', 14),
(495, 'Sipí', 14),
(496, 'Tadó', 14),
(497, 'Unguía', 14),
(498, 'Unión Panamericana', 14),
(499, 'Ayapel', 15),
(500, 'Buenavista', 15),
(501, 'Canalete', 15),
(502, 'Cereté', 15),
(503, 'Chimá', 15),
(504, 'Chinú', 15),
(505, 'Ciénaga de Oro', 15),
(506, 'Cotorra', 15),
(507, 'La Apartada', 15),
(508, 'Lorica', 15),
(509, 'Los Córdobas', 15),
(510, 'Momil', 15),
(511, 'Montelíbano', 15),
(512, 'Montería', 15),
(513, 'Moñitos', 15),
(514, 'Planeta Rica', 15),
(515, 'Pueblo Nuevo', 15),
(516, 'Puerto Escondido', 15),
(517, 'Puerto Libertador', 15),
(518, 'Purísima', 15),
(519, 'Sahagún', 15),
(520, 'San Andrés Sotavento', 15),
(521, 'San Antero', 15),
(522, 'San Bernardo del Viento', 15),
(523, 'San Carlos', 15),
(524, 'San José de Uré', 15),
(525, 'San Pelayo', 15),
(526, 'Tierralta', 15),
(527, 'Tuchín', 15),
(528, 'Valencia', 15),
(529, 'Agua de Dios', 16),
(530, 'Albán', 16),
(531, 'Anapoima', 16),
(532, 'Anolaima', 16),
(533, 'Apulo', 16),
(534, 'Arbeláez', 16),
(535, 'Beltrán', 16),
(536, 'Bituima', 16),
(537, 'Bojacá', 16),
(538, 'Cabrera', 16),
(539, 'Cachipay', 16),
(540, 'Cajicá', 16),
(541, 'Caparrapí', 16),
(542, 'Caqueza', 16),
(543, 'Carmen de Carupa', 16),
(544, 'Chaguaní', 16),
(545, 'Chía', 16),
(546, 'Chipaque', 16),
(547, 'Choachí', 16),
(548, 'Chocontá', 16),
(549, 'Cogua', 16),
(550, 'Cota', 16),
(551, 'Cucunubá', 16),
(552, 'El Colegio', 16),
(553, 'El Peñón', 16),
(554, 'El Rosal', 16),
(555, 'Facatativá', 16),
(556, 'Fomeque', 16),
(557, 'Fosca', 16),
(558, 'Funza', 16),
(559, 'Fúquene', 16),
(560, 'Fusagasugá', 16),
(561, 'Gachala', 16),
(562, 'Gachancipá', 16),
(563, 'Gachetá', 16),
(564, 'Gama', 16),
(565, 'Girardot', 16),
(566, 'Granada', 16),
(567, 'Guachetá', 16),
(568, 'Guaduas', 16),
(569, 'Guasca', 16),
(570, 'Guataquí', 16),
(571, 'Guatavita', 16),
(572, 'Guayabal de Siquima', 16),
(573, 'Guayabetal', 16),
(574, 'Gutiérrez', 16),
(575, 'Jerusalén', 16),
(576, 'Junín', 16),
(577, 'La Calera', 16),
(578, 'La Mesa', 16),
(579, 'La Palma', 16),
(580, 'La Peña', 16),
(581, 'La Vega', 16),
(582, 'Lenguazaque', 16),
(583, 'Macheta', 16),
(584, 'Madrid', 16),
(585, 'Manta', 16),
(586, 'Medina', 16),
(587, 'Mosquera', 16),
(588, 'Nariño', 16),
(589, 'Nemocón', 16),
(590, 'Nilo', 16),
(591, 'Nimaima', 16),
(592, 'Nocaima', 16),
(593, 'Pacho', 16),
(594, 'Paime', 16),
(595, 'Pandi', 16),
(596, 'Paratebueno', 16),
(597, 'Pasca', 16),
(598, 'Puerto Salgar', 16),
(599, 'Pulí', 16),
(600, 'Quebradanegra', 16),
(601, 'Quetame', 16),
(602, 'Quipile', 16),
(603, 'Ricaurte', 16),
(604, 'San Antonio del Tequendama', 16),
(605, 'San Bernardo', 16),
(606, 'San Cayetano', 16),
(607, 'San Francisco', 16),
(608, 'San Juan de Río Seco', 16),
(609, 'Sasaima', 16),
(610, 'Sesquilé', 16),
(611, 'Sibaté', 16),
(612, 'Silvania', 16),
(613, 'Simijaca', 16),
(614, 'Soacha', 16),
(615, 'Sopó', 16),
(616, 'Subachoque', 16),
(617, 'Suesca', 16),
(618, 'Supatá', 16),
(619, 'Susa', 16),
(620, 'Sutatausa', 16),
(621, 'Tabio', 16),
(622, 'Tausa', 16),
(623, 'Tena', 16),
(624, 'Tenjo', 16),
(625, 'Tibacuy', 16),
(626, 'Tibirita', 16),
(627, 'Tocaima', 16),
(628, 'Tocancipá', 16),
(629, 'Topaipí', 16),
(630, 'Ubalá', 16),
(631, 'Ubaque', 16),
(632, 'Une', 16),
(633, 'Útica', 16),
(634, 'Venecia', 16),
(635, 'Vergara', 16),
(636, 'Vianí', 16),
(637, 'Villa de San Diego de Ubate', 16),
(638, 'Villagómez', 16),
(639, 'Villapinzón', 16),
(640, 'Villeta', 16),
(641, 'Viotá', 16),
(642, 'Yacopí', 16),
(643, 'Zipacón', 16),
(644, 'Zipaquirá', 16),
(645, 'Barranco Minas', 17),
(646, 'Cacahual', 17),
(647, 'Inírida', 17),
(648, 'La Guadalupe', 17),
(649, 'Mapiripana', 17),
(650, 'Morichal', 17),
(651, 'Pana Pana', 17),
(652, 'Puerto Colombia', 17),
(653, 'San Felipe', 17),
(654, 'Calamar', 18),
(655, 'El Retorno', 18),
(656, 'Miraflores', 18),
(657, 'San José del Guaviare', 18),
(658, 'Acevedo', 19),
(659, 'Agrado', 19),
(660, 'Aipe', 19),
(661, 'Algeciras', 19),
(662, 'Altamira', 19),
(663, 'Baraya', 19),
(664, 'Campoalegre', 19),
(665, 'Colombia', 19),
(666, 'Elías', 19),
(667, 'Garzón', 19),
(668, 'Gigante', 19),
(669, 'Guadalupe', 19),
(670, 'Hobo', 19),
(671, 'Iquira', 19),
(672, 'Isnos', 19),
(673, 'La Argentina', 19),
(674, 'La Plata', 19),
(675, 'Nátaga', 19),
(676, 'Neiva', 19),
(677, 'Oporapa', 19),
(678, 'Paicol', 19),
(679, 'Palermo', 19),
(680, 'Palestina', 19),
(681, 'Pital', 19),
(682, 'Pitalito', 19),
(683, 'Rivera', 19),
(684, 'Saladoblanco', 19),
(685, 'San Agustín', 19),
(686, 'Santa María', 19),
(687, 'Suaza', 19),
(688, 'Tarqui', 19),
(689, 'Tello', 19),
(690, 'Teruel', 19),
(691, 'Tesalia', 19),
(692, 'Timaná', 19),
(693, 'Villavieja', 19),
(694, 'Yaguará', 19),
(695, 'Albania', 20),
(696, 'Barrancas', 20),
(697, 'Dibula', 20),
(698, 'Distracción', 20),
(699, 'El Molino', 20),
(700, 'Fonseca', 20),
(701, 'Hatonuevo', 20),
(702, 'La Jagua del Pilar', 20),
(703, 'Maicao', 20),
(704, 'Manaure', 20),
(705, 'Riohacha', 20),
(706, 'San Juan del Cesar', 20),
(707, 'Uribia', 20),
(708, 'Urumita', 20),
(709, 'Villanueva', 20),
(710, 'Algarrobo', 21),
(711, 'Aracataca', 21),
(712, 'Ariguaní', 21),
(713, 'Cerro San Antonio', 21),
(714, 'Chivolo', 21),
(715, 'Ciénaga', 21),
(716, 'Concordia', 21),
(717, 'El Banco', 21),
(718, 'El Piñon', 21),
(719, 'El Retén', 21),
(720, 'Fundación', 21),
(721, 'Guamal', 21),
(722, 'Nueva Granada', 21),
(723, 'Pedraza', 21),
(724, 'Pijiño del Carmen', 21),
(725, 'Pivijay', 21),
(726, 'Plato', 21),
(727, 'Pueblo Viejo', 21),
(728, 'Remolino', 21),
(729, 'Sabanas de San Angel', 21),
(730, 'Salamina', 21),
(731, 'San Sebastián de Buenavista', 21),
(732, 'San Zenón', 21),
(733, 'Santa Ana', 21),
(734, 'Santa Bárbara de Pinto', 21),
(735, 'Santa Marta', 21),
(736, 'Sitionuevo', 21),
(737, 'Tenerife', 21),
(738, 'Zapayán', 21),
(739, 'Zona Bananera', 21),
(740, 'Acacias', 22),
(741, 'Barranca de Upía', 22),
(742, 'Cabuyaro', 22),
(743, 'Castilla la Nueva', 22),
(744, 'Cubarral', 22),
(745, 'Cumaral', 22),
(746, 'El Calvario', 22),
(747, 'El Castillo', 22),
(748, 'El Dorado', 22),
(749, 'Fuente de Oro', 22),
(750, 'Granada', 22),
(751, 'Guamal', 22),
(752, 'La Macarena', 22),
(753, 'Lejanías', 22),
(754, 'Mapiripán', 22),
(755, 'Mesetas', 22),
(756, 'Puerto Concordia', 22),
(757, 'Puerto Gaitán', 22),
(758, 'Puerto Lleras', 22),
(759, 'Puerto López', 22),
(760, 'Puerto Rico', 22),
(761, 'Restrepo', 22),
(762, 'San Carlos de Guaroa', 22),
(763, 'San Juan de Arama', 22),
(764, 'San Juanito', 22),
(765, 'San Martín', 22),
(766, 'Uribe', 22),
(767, 'Villavicencio', 22),
(768, 'Vista Hermosa', 22),
(769, 'Albán', 23),
(770, 'Aldana', 23),
(771, 'Ancuyá', 23),
(772, 'Arboleda', 23),
(773, 'Barbacoas', 23),
(774, 'Belén', 23),
(775, 'Buesaco', 23),
(776, 'Chachagüí', 23),
(777, 'Colón', 23),
(778, 'Consaca', 23),
(779, 'Contadero', 23),
(780, 'Córdoba', 23),
(781, 'Cuaspud', 23),
(782, 'Cumbal', 23),
(783, 'Cumbitara', 23),
(784, 'El Charco', 23),
(785, 'El Peñol', 23),
(786, 'El Rosario', 23),
(787, 'El Tablón de Gómez', 23),
(788, 'El Tambo', 23),
(789, 'Francisco Pizarro', 23),
(790, 'Funes', 23),
(791, 'Guachucal', 23),
(792, 'Guaitarilla', 23),
(793, 'Gualmatán', 23),
(794, 'Iles', 23),
(795, 'Imués', 23),
(796, 'Ipiales', 23),
(797, 'La Cruz', 23),
(798, 'La Florida', 23),
(799, 'La Llanada', 23),
(800, 'La Tola', 23),
(801, 'La Unión', 23),
(802, 'Leiva', 23),
(803, 'Linares', 23),
(804, 'Los Andes', 23),
(805, 'Magüí', 23),
(806, 'Mallama', 23),
(807, 'Mosquera', 23),
(808, 'Nariño', 23),
(809, 'Olaya Herrera', 23),
(810, 'Ospina', 23),
(811, 'Pasto', 23),
(812, 'Policarpa', 23),
(813, 'Potosí', 23),
(814, 'Providencia', 23),
(815, 'Puerres', 23),
(816, 'Pupiales', 23),
(817, 'Ricaurte', 23),
(818, 'Roberto Payán', 23),
(819, 'Samaniego', 23),
(820, 'San Andrés de Tumaco', 23),
(821, 'San Bernardo', 23),
(822, 'San Lorenzo', 23),
(823, 'San Pablo', 23),
(824, 'San Pedro de Cartago', 23),
(825, 'Sandoná', 23),
(826, 'Santa Bárbara', 23),
(827, 'Santacruz', 23),
(828, 'Sapuyes', 23),
(829, 'Taminango', 23),
(830, 'Tangua', 23),
(831, 'Túquerres', 23),
(832, 'Yacuanquer', 23),
(833, 'Abrego', 24),
(834, 'Arboledas', 24),
(835, 'Bochalema', 24),
(836, 'Bucarasica', 24),
(837, 'Cachirá', 24),
(838, 'Cácota', 24),
(839, 'Chinácota', 24),
(840, 'Chitagá', 24),
(841, 'Convención', 24),
(842, 'Cúcuta', 24),
(843, 'Cucutilla', 24),
(844, 'Durania', 24),
(845, 'El Carmen', 24),
(846, 'El Tarra', 24),
(847, 'El Zulia', 24),
(848, 'Gramalote', 24),
(849, 'Hacarí', 24),
(850, 'Herrán', 24),
(851, 'La Esperanza', 24),
(852, 'La Playa', 24),
(853, 'Labateca', 24),
(854, 'Los Patios', 24),
(855, 'Lourdes', 24),
(856, 'Mutiscua', 24),
(857, 'Ocaña', 24),
(858, 'Pamplona', 24),
(859, 'Pamplonita', 24),
(860, 'Puerto Santander', 24),
(861, 'Ragonvalia', 24),
(862, 'Salazar', 24),
(863, 'San Calixto', 24),
(864, 'San Cayetano', 24),
(865, 'Santiago', 24),
(866, 'Sardinata', 24),
(867, 'Silos', 24),
(868, 'Teorama', 24),
(869, 'Tibú', 24),
(870, 'Toledo', 24),
(871, 'Villa Caro', 24),
(872, 'Villa del Rosario', 24),
(873, 'Colón', 25),
(874, 'Leguízamo', 25),
(875, 'Mocoa', 25),
(876, 'Orito', 25),
(877, 'Puerto Asís', 25),
(878, 'Puerto Caicedo', 25),
(879, 'Puerto Guzmán', 25),
(880, 'San Francisco', 25),
(881, 'San Miguel', 25),
(882, 'Santiago', 25),
(883, 'Sibundoy', 25),
(884, 'Valle de Guamez', 25),
(885, 'Villagarzón', 25),
(886, 'Armenia', 26),
(887, 'Buenavista', 26),
(888, 'Calarcá', 26),
(889, 'Circasia', 26),
(890, 'Córdoba', 26),
(891, 'Filandia', 26),
(892, 'Génova', 26),
(893, 'La Tebaida', 26),
(894, 'Montenegro', 26),
(895, 'Pijao', 26),
(896, 'Quimbaya', 26),
(897, 'Salento', 26),
(898, 'Apía', 27),
(899, 'Balboa', 27),
(900, 'Belén de Umbría', 27),
(901, 'Dosquebradas', 27),
(902, 'Guática', 27),
(903, 'La Celia', 27),
(904, 'La Virginia', 27),
(905, 'Marsella', 27),
(906, 'Mistrató', 27),
(907, 'Pereira', 27),
(908, 'Pueblo Rico', 27),
(909, 'Quinchía', 27),
(910, 'Santa Rosa de Cabal', 27),
(911, 'Santuario', 27),
(912, 'Aguada', 28),
(913, 'Albania', 28),
(914, 'Aratoca', 28),
(915, 'Barbosa', 28),
(916, 'Barichara', 28),
(917, 'Barrancabermeja', 28),
(918, 'Betulia', 28),
(919, 'Bolívar', 28),
(920, 'Bucaramanga', 28),
(921, 'Cabrera', 28),
(922, 'California', 28),
(923, 'Capitanejo', 28),
(924, 'Carcasí', 28),
(925, 'Cepitá', 28),
(926, 'Cerrito', 28),
(927, 'Charalá', 28),
(928, 'Charta', 28),
(929, 'Chimá', 28),
(930, 'Chipatá', 28),
(931, 'Cimitarra', 28),
(932, 'Concepción', 28),
(933, 'Confines', 28),
(934, 'Contratación', 28),
(935, 'Coromoro', 28),
(936, 'Curití', 28),
(937, 'El Carmen de Chucurí', 28),
(938, 'El Guacamayo', 28),
(939, 'El Peñón', 28),
(940, 'El Playón', 28),
(941, 'Encino', 28),
(942, 'Enciso', 28),
(943, 'Florián', 28),
(944, 'Floridablanca', 28),
(945, 'Galán', 28),
(946, 'Gambita', 28),
(947, 'Girón', 28),
(948, 'Guaca', 28),
(949, 'Guadalupe', 28),
(950, 'Guapotá', 28),
(951, 'Guavatá', 28),
(952, 'Güepsa', 28),
(953, 'Hato', 28),
(954, 'Jesús María', 28),
(955, 'Jordán', 28),
(956, 'La Belleza', 28),
(957, 'La Paz', 28),
(958, 'Landázuri', 28),
(959, 'Lebríja', 28),
(960, 'Los Santos', 28),
(961, 'Macaravita', 28),
(962, 'Málaga', 28),
(963, 'Matanza', 28),
(964, 'Mogotes', 28),
(965, 'Molagavita', 28),
(966, 'Ocamonte', 28),
(967, 'Oiba', 28),
(968, 'Onzaga', 28),
(969, 'Palmar', 28),
(970, 'Palmas del Socorro', 28),
(971, 'Páramo', 28),
(972, 'Piedecuesta', 28),
(973, 'Pinchote', 28),
(974, 'Puente Nacional', 28),
(975, 'Puerto Parra', 28),
(976, 'Puerto Wilches', 28),
(977, 'Rionegro', 28),
(978, 'Sabana de Torres', 28),
(979, 'San Andrés', 28),
(980, 'San Benito', 28),
(981, 'San Gil', 28),
(982, 'San Joaquín', 28),
(983, 'San José de Miranda', 28),
(984, 'San Miguel', 28),
(985, 'San Vicente de Chucurí', 28),
(986, 'Santa Bárbara', 28),
(987, 'Santa Helena del Opón', 28),
(988, 'Simacota', 28),
(989, 'Socorro', 28),
(990, 'Suaita', 28),
(991, 'Sucre', 28),
(992, 'Suratá', 28),
(993, 'Tona', 28),
(994, 'Valle de San José', 28),
(995, 'Vélez', 28),
(996, 'Vetas', 28),
(997, 'Villanueva', 28),
(998, 'Zapatoca', 28),
(999, 'Buenavista', 29),
(1000, 'Caimito', 29),
(1001, 'Chalán', 29),
(1002, 'Coloso', 29),
(1003, 'Corozal', 29),
(1004, 'Coveñas', 29),
(1005, 'El Roble', 29),
(1006, 'Galeras', 29),
(1007, 'Guaranda', 29),
(1008, 'La Unión', 29),
(1009, 'Los Palmitos', 29),
(1010, 'Majagual', 29),
(1011, 'Morroa', 29),
(1012, 'Ovejas', 29),
(1013, 'Palmito', 29),
(1014, 'Sampués', 29),
(1015, 'San Benito Abad', 29),
(1016, 'San Juan de Betulia', 29),
(1017, 'San Luis de Sincé', 29),
(1018, 'San Marcos', 29),
(1019, 'San Onofre', 29),
(1020, 'San Pedro', 29),
(1021, 'Santiago de Tolú', 29),
(1022, 'Sincelejo', 29),
(1023, 'Sucre', 29),
(1024, 'Tolú Viejo', 29),
(1025, 'Alpujarra', 30),
(1026, 'Alvarado', 30),
(1027, 'Ambalema', 30),
(1028, 'Anzoátegui', 30),
(1029, 'Armero', 30),
(1030, 'Ataco', 30),
(1031, 'Cajamarca', 30),
(1032, 'Carmen de Apicala', 30),
(1033, 'Casabianca', 30),
(1034, 'Chaparral', 30),
(1035, 'Coello', 30),
(1036, 'Coyaima', 30),
(1037, 'Cunday', 30),
(1038, 'Dolores', 30),
(1039, 'Espinal', 30),
(1040, 'Falan', 30),
(1041, 'Flandes', 30),
(1042, 'Fresno', 30),
(1043, 'Guamo', 30),
(1044, 'Herveo', 30),
(1045, 'Honda', 30),
(1046, 'Ibagué', 30),
(1047, 'Icononzo', 30),
(1048, 'Lérida', 30),
(1049, 'Líbano', 30),
(1050, 'Mariquita', 30),
(1051, 'Melgar', 30),
(1052, 'Murillo', 30),
(1053, 'Natagaima', 30),
(1054, 'Ortega', 30),
(1055, 'Palocabildo', 30),
(1056, 'Piedras', 30),
(1057, 'Planadas', 30),
(1058, 'Prado', 30),
(1059, 'Purificación', 30),
(1060, 'Rio Blanco', 30),
(1061, 'Roncesvalles', 30),
(1062, 'Rovira', 30),
(1063, 'Saldaña', 30),
(1064, 'San Antonio', 30),
(1065, 'San Luis', 30),
(1066, 'Santa Isabel', 30),
(1067, 'Suárez', 30),
(1068, 'Valle de San Juan', 30),
(1069, 'Venadillo', 30),
(1070, 'Villahermosa', 30),
(1071, 'Villarrica', 30),
(1072, 'Alcalá', 31),
(1073, 'Andalucía', 31),
(1074, 'Ansermanuevo', 31),
(1075, 'Argelia', 31),
(1076, 'Bolívar', 31),
(1077, 'Buenaventura', 31),
(1078, 'Bugalagrande', 31),
(1079, 'Caicedonia', 31),
(1080, 'Cali', 31),
(1081, 'Calima', 31),
(1082, 'Candelaria', 31),
(1083, 'Cartago', 31),
(1084, 'Dagua', 31),
(1085, 'El Águila', 31),
(1086, 'El Cairo', 31),
(1087, 'El Cerrito', 31),
(1088, 'El Dovio', 31),
(1089, 'Florida', 31),
(1090, 'Ginebra', 31),
(1091, 'Guacarí', 31),
(1092, 'Guadalajara de Buga', 31),
(1093, 'Jamundí', 31),
(1094, 'La Cumbre', 31),
(1095, 'La Unión', 31),
(1096, 'La Victoria', 31),
(1097, 'Obando', 31),
(1098, 'Palmira', 31),
(1099, 'Pradera', 31),
(1100, 'Restrepo', 31),
(1101, 'Riofrío', 31),
(1102, 'Roldanillo', 31),
(1103, 'San Pedro', 31),
(1104, 'Sevilla', 31),
(1105, 'Toro', 31),
(1106, 'Trujillo', 31),
(1107, 'Tuluá', 31),
(1108, 'Ulloa', 31),
(1109, 'Versalles', 31),
(1110, 'Vijes', 31),
(1111, 'Yotoco', 31),
(1112, 'Yumbo', 31),
(1113, 'Zarzal', 31),
(1114, 'Caruru', 32),
(1115, 'Mitú', 32),
(1116, 'Pacoa', 32),
(1117, 'Papunaua', 32),
(1118, 'Taraira', 32),
(1119, 'Yavaraté', 32),
(1120, 'Cumaribo', 32),
(1121, 'La Primavera', 32),
(1122, 'Puerto Carreño', 32),
(1123, 'Santa Rosalía', 32);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `idCliente` int(11) NOT NULL,
  `numeroIdentificacion` int(11) DEFAULT NULL,
  `primerNombreCliente` varchar(45) NOT NULL,
  `segundoNombreCliente` varchar(45) DEFAULT NULL,
  `primerApellidoCliente` varchar(45) NOT NULL,
  `segundoApellidoCliente` varchar(45) DEFAULT NULL,
  `direccionCliente` varchar(200) DEFAULT NULL,
  `telefonoFijoCliente` varchar(10) DEFAULT NULL,
  `telefonoMovilCliente` varchar(10) DEFAULT NULL,
  `correoCliente` varchar(45) DEFAULT NULL,
  `fechaNacimiento` date DEFAULT NULL,
  `ciudadResidencia_idciudad` int(11) NOT NULL,
  `tipoIdentificacion_idtipoIdentificacion` int(11) NOT NULL,
  `ciudadExpedicion_idciudad` int(11) NOT NULL,
  `profesiones_idprofesion` int(11) NOT NULL,
  `tipoPersonaCliente_idtipoPersonCliente` int(11) NOT NULL,
  `idEstadoCivil` int(11) NOT NULL,
  `idGenero` int(11) NOT NULL,
  `password` varchar(32) CHARACTER SET utf8 DEFAULT NULL,
  `imagencliente` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`idCliente`, `numeroIdentificacion`, `primerNombreCliente`, `segundoNombreCliente`, `primerApellidoCliente`, `segundoApellidoCliente`, `direccionCliente`, `telefonoFijoCliente`, `telefonoMovilCliente`, `correoCliente`, `fechaNacimiento`, `ciudadResidencia_idciudad`, `tipoIdentificacion_idtipoIdentificacion`, `ciudadExpedicion_idciudad`, `profesiones_idprofesion`, `tipoPersonaCliente_idtipoPersonCliente`, `idEstadoCivil`, `idGenero`, `password`, `imagencliente`) VALUES
(1, 1053802815, 'johnny', 'alexander', 'salazar', 'cardona', 'Carrera 16 # 2- 41 Edificio Habitat Apto 904', '232432', '2343423', 'skjf@jaskdas.com', '2018-08-15', 1, 16, 1077, 5024, 11, 44, 13, NULL, 'System/Resource/Files/Clients/Images/1053802815_johnny.jpg'),
(2, 44235652, 'Diana', 'Cristina', 'García', 'Quintero', 'Edificio Boston', '7324242', '3213445566', 'dianagar@hotmail.com', '1960-12-15', 80, 16, 886, 5024, 11, 48, 14, NULL, 'System/Resource/Files/Clients/Images/44235652_photo3.jpg'),
(3, 99876776, 'Carlos', 'Andres', 'Garcia', 'Quintero', 'Sorrento', '7342231', '3145342211', 'carlosgarcia@gmail.com', '2018-11-14', 886, 16, 886, 4981, 11, 43, 13, NULL, 'System/Resource/Files/Clients/Images/99876776_andres.jpg'),
(4, 1094882984, 'David', 'Alberto', 'Angarita ', 'Garcia', 'Carrera 14 # 54 Norte -10 La primavera Mz 5 C', '7445454', '3002680564', 'davidangaritag@gmail.com', '1986-09-01', 886, 16, 886, 5026, 11, 48, 13, 'e10adc3949ba59abbe56e057f20f883e', 'System/Resource/Files/Clients/Images/1094882984_david.jpg'),
(5, 1094904532, 'Laura', 'Sofia', 'Quintero', 'Montoya', 'Carrera 54 Norte # 10', '7458888', '3148797255', 'laurasof8@hotmail.com', '1989-04-27', 886, 16, 886, 4599, 11, 48, 0, 'e10adc3949ba59abbe56e057f20f883e', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `contratoempleado`
--

CREATE TABLE `contratoempleado` (
  `idcontratoEmpleado` int(11) NOT NULL,
  `fechaInicio` date DEFAULT NULL,
  `fechaTerminacion` date DEFAULT NULL,
  `salario` float DEFAULT NULL,
  `areaEmpresa_idareaEmpresa` int(11) NOT NULL,
  `cargos_idCargo` int(11) NOT NULL,
  `empleados_idempleado` int(11) NOT NULL,
  `tipocontratoempleado_idtipoContratoEmpleado` int(11) NOT NULL,
  `archivocontrato` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `contratoempleado`
--

INSERT INTO `contratoempleado` (`idcontratoEmpleado`, `fechaInicio`, `fechaTerminacion`, `salario`, `areaEmpresa_idareaEmpresa`, `cargos_idCargo`, `empleados_idempleado`, `tipocontratoempleado_idtipoContratoEmpleado`, `archivocontrato`) VALUES
(32, '2018-08-07', '2018-08-03', 5344, 5, 1160, 5, 18, 'System/Resource/Files/Contract/5_13cccpaper264.pdf'),
(33, '2018-08-14', '2018-08-07', 43234300, 3, 1162, 5, 18, 'System/Resource/Files/Contract/5_consolidado201712cc1053802815.pdf'),
(34, '2018-08-27', '2018-10-03', 3000000, 6, 1425, 7, 13, 'System/Resource/Files/Contract/7_introducci-on.pdf'),
(35, '2018-09-26', '2018-10-04', 1000000, 2, 1207, 10, 13, 'System/Resource/Files/Contract/10_pagohotel.pdf'),
(36, '2018-08-30', '2018-09-26', 1000000, 2, 1207, 10, 13, 'System/Resource/Files/Contract/10_pagohotel.pdf'),
(37, '2018-09-03', '2018-09-24', 3000000, 2, 1386, 5, 13, 'System/Resource/Files/Contract/5_introducci-on.pdf'),
(38, '2018-09-18', '2018-10-04', 2000000, 6, 1313, 11, 14, 'System/Resource/Files/Contract/11_notasc1principios.pdf'),
(39, '2018-08-26', '2018-10-04', 2000000, 3, 1159, 6, 14, 'System/Resource/Files/Contract/6_introducci-on.pdf');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `contratos`
--

CREATE TABLE `contratos` (
  `idcontrato` int(11) NOT NULL,
  `fechaContrato` date DEFAULT NULL,
  `fechaInicioContrato` date DEFAULT NULL,
  `fechaFinContrato` date DEFAULT NULL,
  `valorContrato` float DEFAULT NULL,
  `plazoContrato` int(11) DEFAULT NULL,
  `formaDePago` varchar(45) DEFAULT NULL,
  `inmuebles_idinmueble` int(11) NOT NULL,
  `rutaContrato` varchar(100) DEFAULT NULL,
  `idcliente` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `contratos`
--

INSERT INTO `contratos` (`idcontrato`, `fechaContrato`, `fechaInicioContrato`, `fechaFinContrato`, `valorContrato`, `plazoContrato`, `formaDePago`, `inmuebles_idinmueble`, `rutaContrato`, `idcliente`) VALUES
(2, '2018-09-17', '2018-10-04', '2018-10-06', 1000000, 12, 'Mensual', 6, 'System/Resource/Files/Properties/Contracts/6_introducci-on.pdf', 1),
(3, '2018-09-05', '2018-09-20', '2018-10-06', 2000000, 20, 'Credito', 5, 'System/Resource/Files/Properties/Contracts/5_itinerariovueloida.pdf', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `conyugues`
--

CREATE TABLE `conyugues` (
  `idConyugue` int(11) NOT NULL,
  `numeroIdentificacionConyugue` int(11) NOT NULL,
  `fechaExpedicionNumeroId` date DEFAULT NULL,
  `correoElectronicoConyugue` varchar(45) DEFAULT NULL,
  `nombresConyugue` varchar(45) DEFAULT NULL,
  `apellidosConyugue` varchar(45) DEFAULT NULL,
  `nombreEmpresaLabora` varchar(45) DEFAULT NULL,
  `direccionLaboralConyugue` varchar(45) DEFAULT NULL,
  `telefonoLaboralConyugue` varchar(10) DEFAULT NULL,
  `telefonoMovilConyugue` varchar(10) DEFAULT NULL,
  `salarioMensualConyugue` float DEFAULT NULL,
  `clientes_idCliente` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `conyugues`
--

INSERT INTO `conyugues` (`idConyugue`, `numeroIdentificacionConyugue`, `fechaExpedicionNumeroId`, `correoElectronicoConyugue`, `nombresConyugue`, `apellidosConyugue`, `nombreEmpresaLabora`, `direccionLaboralConyugue`, `telefonoLaboralConyugue`, `telefonoMovilConyugue`, `salarioMensualConyugue`, `clientes_idCliente`) VALUES
(1, 55664883, '2018-09-26', 'lanena@gmail.com', 'Luz Helena', 'Sabogal', 'CRQ', 'Crq armenia', '7443565', '3104233333', 2000000, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cuentaempleado`
--

CREATE TABLE `cuentaempleado` (
  `idcuentaEmpleado` int(11) NOT NULL,
  `numeroCuenta` varchar(45) NOT NULL,
  `tipoCuenta_idtipoCuenta` int(11) NOT NULL,
  `bancos_idbanco` int(11) NOT NULL,
  `empleados_idempleado` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `departamentos`
--

CREATE TABLE `departamentos` (
  `idDepartamento` int(11) NOT NULL,
  `nombreDepartamento` varchar(45) NOT NULL,
  `paises_idpais` int(11) NOT NULL,
  `idRegion` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `departamentos`
--

INSERT INTO `departamentos` (`idDepartamento`, `nombreDepartamento`, `paises_idpais`, `idRegion`) VALUES
(0, 'Sin especificar', 0, 0),
(1, 'Amazonas', 1, 3),
(2, 'Antioquia', 1, 4),
(3, 'Arauca', 1, 5),
(4, 'Archipiélago de San Andrés, Providencia y San', 1, 1),
(5, 'Atlántico', 1, 1),
(6, 'Bogotá D.C.', 1, 2),
(7, 'Bolívar', 1, 1),
(8, 'Boyacá', 1, 2),
(9, 'Caldas', 1, 4),
(10, 'Caquetá', 1, 3),
(11, 'Casanare', 1, 5),
(12, 'Cauca', 1, 6),
(13, 'Cesar', 1, 1),
(14, 'Chocó', 1, 6),
(15, 'Córdoba', 1, 1),
(16, 'Cundinamarca', 1, 2),
(17, 'Guainía', 1, 5),
(18, 'Guaviare', 1, 5),
(19, 'Huila', 1, 3),
(20, 'La Guajira', 1, 1),
(21, 'Magdalena', 1, 1),
(22, 'Meta', 1, 5),
(23, 'Nariño', 1, 6),
(24, 'Norte de Santander', 1, 2),
(25, 'Putumayo', 1, 3),
(26, 'Quindío', 1, 4),
(27, 'Risaralda', 1, 4),
(28, 'Santander', 1, 2),
(29, 'Sucre', 1, 1),
(30, 'Tolima', 1, 3),
(31, 'Valle del Cauca', 1, 6),
(32, 'Vaupés', 1, 5),
(33, 'Vichada', 1, 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalleclientestipoclientes`
--

CREATE TABLE `detalleclientestipoclientes` (
  `iddetalleClientesTipoClientes` int(11) NOT NULL,
  `tiposClientes_idtipoCliente` int(11) NOT NULL,
  `clientes_cedulaCliente` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `detalleclientestipoclientes`
--

INSERT INTO `detalleclientestipoclientes` (`iddetalleClientesTipoClientes`, `tiposClientes_idtipoCliente`, `clientes_cedulaCliente`) VALUES
(15, 22, 2),
(16, 23, 1),
(17, 24, 1),
(20, 21, 4),
(21, 22, 5),
(22, 22, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detallecontratosdeudores`
--

CREATE TABLE `detallecontratosdeudores` (
  `iddetalleContratoDeudore` int(11) NOT NULL,
  `numeroIdentificacionDeudor` int(11) NOT NULL,
  `contratos_idcontrato` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detallecontratosobjetos`
--

CREATE TABLE `detallecontratosobjetos` (
  `iddetalleContratoObjeto` int(11) NOT NULL,
  `idobjetoContrato` int(11) NOT NULL,
  `contratos_idcontrato` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `detallecontratosobjetos`
--

INSERT INTO `detallecontratosobjetos` (`iddetalleContratoObjeto`, `idobjetoContrato`, `contratos_idcontrato`) VALUES
(1, 1, 3),
(2, 2, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalleeventosempleados`
--

CREATE TABLE `detalleeventosempleados` (
  `iddetalleEventoEmpleado` int(11) NOT NULL,
  `empleados_idempleado` int(11) NOT NULL,
  `eventosclientes_ideventoCliente` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `detalleeventosempleados`
--

INSERT INTO `detalleeventosempleados` (`iddetalleEventoEmpleado`, `empleados_idempleado`, `eventosclientes_ideventoCliente`) VALUES
(8, 10, 3),
(9, 7, 3),
(10, 10, 1),
(11, 7, 1),
(12, 6, 1),
(13, 5, 4),
(14, 10, 2),
(15, 6, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detallevideoinmueble`
--

CREATE TABLE `detallevideoinmueble` (
  `iddetalleVideoInmueble` int(11) NOT NULL,
  `videos_idvideo` int(11) NOT NULL,
  `inmuebles_idinmueble` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `deudorsolidario`
--

CREATE TABLE `deudorsolidario` (
  `idDeudor` int(11) NOT NULL,
  `numeroIdentificacion` int(11) NOT NULL,
  `primerNombreDeudor` varchar(45) DEFAULT NULL,
  `segundoNombreDeudor` varchar(45) DEFAULT NULL,
  `primerApellidoDeudor` varchar(45) DEFAULT NULL,
  `segundoApellidoDeudor` varchar(45) DEFAULT NULL,
  `direccionResidenciaDeudor` varchar(100) DEFAULT NULL,
  `telefonoResidenciaDeudor` varchar(10) DEFAULT NULL,
  `direccionLaboralDeudor` varchar(100) DEFAULT NULL,
  `telefonoLaboralDeudor` varchar(100) DEFAULT NULL,
  `telefonoMovilDeudor` varchar(10) DEFAULT NULL,
  `correoDeudor` varchar(45) DEFAULT NULL,
  `ingresosMensuales` float DEFAULT NULL,
  `estadoCivilDeudor` int(1) DEFAULT NULL,
  `tipoIdentificacion_idtipoIdentificacion` int(11) NOT NULL,
  `ciudadResidencia_idciudad` int(11) NOT NULL,
  `ciudadExpedicion_idciudad` int(11) NOT NULL,
  `fechaExpedicionIdentificacion` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `deudorsolidario`
--

INSERT INTO `deudorsolidario` (`idDeudor`, `numeroIdentificacion`, `primerNombreDeudor`, `segundoNombreDeudor`, `primerApellidoDeudor`, `segundoApellidoDeudor`, `direccionResidenciaDeudor`, `telefonoResidenciaDeudor`, `direccionLaboralDeudor`, `telefonoLaboralDeudor`, `telefonoMovilDeudor`, `correoDeudor`, `ingresosMensuales`, `estadoCivilDeudor`, `tipoIdentificacion_idtipoIdentificacion`, `ciudadResidencia_idciudad`, `ciudadExpedicion_idciudad`, `fechaExpedicionIdentificacion`) VALUES
(1, 1094882984, 'David', 'Alberto', 'Angarita', 'Garcia', 'Calle 5 Norte', '7456322', 'Av. Bolivar # 3-11', '7456342', '3002680564', 'davidangaritag@gmail.com', 3000000, 48, 16, 886, 886, '2018-09-20'),
(2, 1094904532, 'Laura', 'Sofia', 'Quintero', 'Montoya', 'calle 5 ', '7456532', 'Av Bolivar', '7445566', '3148797255', 'laurasof8@hotmail.com', 2000000, 48, 18, 886, 886, '2018-09-18');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleados`
--

CREATE TABLE `empleados` (
  `idempleado` int(11) NOT NULL,
  `primerNombreEmpleado` varchar(45) NOT NULL,
  `segundoNombreEmpleado` varchar(45) DEFAULT NULL,
  `primerApellidoEmpleado` varchar(45) NOT NULL,
  `segundoApellidoEmpleado` varchar(45) DEFAULT NULL,
  `direccionEmpleado` varchar(45) NOT NULL,
  `telefonoMovilEmpleado` varchar(10) NOT NULL,
  `telefonoFijoEmpleado` varchar(10) DEFAULT NULL,
  `fechaNacimientoEmpleado` date NOT NULL,
  `correoEmpleado` varchar(45) NOT NULL,
  `idtipoEmpleado` int(11) NOT NULL,
  `idEsCivil` int(11) DEFAULT NULL,
  `idGeneroEmpleado` int(11) DEFAULT NULL,
  `idCiudadEmpleado` int(11) DEFAULT NULL,
  `idProfesionEmpleado` int(11) DEFAULT NULL,
  `cedulaEmpleado` varchar(10) NOT NULL,
  `fechaExpedicion` date DEFAULT NULL,
  `archivoCedula` varchar(200) DEFAULT NULL,
  `numeroLibretaMilitar` varchar(20) DEFAULT NULL,
  `archivoLibretaMilitar` varchar(200) DEFAULT NULL,
  `discapacidad` tinyint(1) DEFAULT NULL,
  `fotoEmpleado` varchar(200) DEFAULT NULL,
  `nombreContacto` varchar(45) DEFAULT NULL,
  `telefonoContacto` varchar(10) DEFAULT NULL,
  `correoContacto` varchar(45) DEFAULT NULL,
  `lugarExpedicion_idciudad` int(11) NOT NULL,
  `lugarNacimiento_idciudad` int(11) NOT NULL,
  `tipoSangre_idtipoSangre` int(11) NOT NULL,
  `fondoPensiones_idfondoPensiones` int(11) NOT NULL,
  `eps_ideps` int(11) NOT NULL,
  `fondoCesantias_idfondoCesantias` int(11) NOT NULL,
  `arl_idarl` int(11) NOT NULL,
  `cajaCompensacion_idcajaCompensacion` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `empleados`
--

INSERT INTO `empleados` (`idempleado`, `primerNombreEmpleado`, `segundoNombreEmpleado`, `primerApellidoEmpleado`, `segundoApellidoEmpleado`, `direccionEmpleado`, `telefonoMovilEmpleado`, `telefonoFijoEmpleado`, `fechaNacimientoEmpleado`, `correoEmpleado`, `idtipoEmpleado`, `idEsCivil`, `idGeneroEmpleado`, `idCiudadEmpleado`, `idProfesionEmpleado`, `cedulaEmpleado`, `fechaExpedicion`, `archivoCedula`, `numeroLibretaMilitar`, `archivoLibretaMilitar`, `discapacidad`, `fotoEmpleado`, `nombreContacto`, `telefonoContacto`, `correoContacto`, `lugarExpedicion_idciudad`, `lugarNacimiento_idciudad`, `tipoSangre_idtipoSangre`, `fondoPensiones_idfondoPensiones`, `eps_ideps`, `fondoCesantias_idfondoCesantias`, `arl_idarl`, `cajaCompensacion_idcajaCompensacion`) VALUES
(5, 'Laura', 'Sofia', 'Quintero', 'Montoya', 'Calle 5 Norte ', '3148797255', '7456532', '2018-08-08', 'laurasof8@hotmail.com', 39, 44, 14, 1072, 4192, '1094904532', '2018-08-16', 'System/Resource/Files/Employees/Identification/1094904532_instructivoparacondonaci-ondelcr-editodelfondodecompetenciastransversales.pdf', '', 'System/Resource/Files/Employees/MilitaryCard/1094904532_libretamilitar.pdf', 0, 'System/Resource/Files/Employees/Images/1094904532_laura.jpg', 'David Angarita', '3002680564', 'davidangaritag@gmail.com', 529, 658, 19, 25, 152, 23, 23, 114),
(6, 'Paola', 'Andrea', 'Angarita', 'Garcia', 'Las Americas', '3214432343', '7467655', '2018-09-10', 'paolanagaritag@gmail.com', 39, 43, 14, 886, 4592, '1094563443', '1970-01-01', 'System/Resource/Files/Employees/Identification/1094563443_instructivoparacondonaci-ondelcr-editodelfondodecompetenciastransversales.pdf', '', '', 0, 'System/Resource/Files/Employees/Images/1094563443_paola.jpg', 'cesar augusto velez', '7463231', 'cesarvelez@gmail.com', 886, 169, 24, 23, 107, 27, 24, 101),
(7, 'David', 'Alberto', 'Angarita', 'García', 'Calle 5 Norte', '3002680564', '7456532', '1986-09-01', 'davidangaritag@gmail.com', 41, 48, 13, 886, 4754, '1094882984', '1970-01-01', 'System/Resource/Files/Employees/Identification/1094882984_ceduladavid.pdf', '1094882984', 'System/Resource/Files/Employees/MilitaryCard/1094882984_libretamilitar.pdf', 0, 'System/Resource/Files/Employees/Images/1094882984_fotoperfil.jpg', 'Laura Quintero', '3148797255', 'laurasof8@hotmail.com', 886, 169, 19, 20, 112, 20, 28, 117),
(10, 'Angela', 'Maria', 'Angarita', 'García', 'Calle 4 # 21', '3212445533', '7343434', '2018-09-13', 'angelaangarita@gmail.com', 38, 43, 14, 80, 5024, '1094883553', '1970-01-01', 'System/Resource/Files/Employees/Identification/1094883553_notasc1principios.pdf', '', '', 0, 'System/Resource/Files/Employees/Images/1094883553_user5-128x128.jpg', 'Diana Garcia', '7464545', 'dianagarcia@gmail.com', 80, 888, 22, 24, 145, 24, 27, 126),
(11, 'Johnny', 'Alexander', 'Salazar', 'Cardona', 'CALLE 55', '3219877766', '7446644', '2018-09-07', 'johnny@gmail.com', 43, 49, 13, 886, 4752, '998767766', '0000-00-00', 'System/Resource/Files/Employees/Identification/998767766_notasc1principios.pdf', '882378723', 'System/Resource/Files/Employees/MilitaryCard/998767766_pagohotel.pdf', 0, 'System/Resource/Files/Employees/Images/998767766_hydrangeas.jpg', '', '7456565', 'angela@gmail.com', 886, 886, 20, 22, 154, 23, 27, 87);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `eps`
--

CREATE TABLE `eps` (
  `ideps` int(11) NOT NULL,
  `nombreEps` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `eps`
--

INSERT INTO `eps` (`ideps`, `nombreEps`) VALUES
(105, 'Empresas Públicas de Medellín Departamento Mé'),
(106, 'Fondo de Pasivo Social de Ferrocarriles'),
(107, 'Aliansalud EPS'),
(108, 'Salud Total S.A.'),
(109, 'Cafesalud EPS'),
(110, 'Sanitas'),
(111, 'Compensar Entidad Promotora de Salud'),
(112, 'Sura'),
(113, 'Comfenalco Valle EPS'),
(114, 'Coomeva EPS'),
(115, 'Famisanar'),
(116, 'Servicio Occidental de Salud S.O.S. S.A.'),
(117, 'Cruz Blanca S.A'),
(118, 'Saludvida S.A EPS'),
(119, 'Nueva EPS'),
(120, 'Fondo de Solidaridad y Garantía Fosyga'),
(121, 'Universidad del Atlántico'),
(122, 'Universidad Industrial de Santander'),
(123, 'Universidad del Valle'),
(124, 'Universidad Nacional de Colombia'),
(125, 'Universidad del Cauca'),
(126, 'Universidad de Antioquia'),
(127, 'Universidad de Córdoba'),
(128, 'Universidad Pedagógica y Tecnológica de Colom'),
(129, 'Cafesalud'),
(130, 'Convida'),
(131, 'Capresoca EPS'),
(132, 'Capital Salud EPSS S.A.S.'),
(133, 'Dusakawi'),
(134, 'Manexka'),
(135, 'Asociación Indígena del Cauca - A.I.C.'),
(136, 'Anas Wayuu EPSI'),
(137, 'Mallamas EPSI'),
(138, 'Pijaosalud EPSI'),
(139, 'Emdisalud ESS'),
(140, 'ESS'),
(141, 'Emssanar E.S.S.'),
(142, 'Coosalud E.S.S.'),
(143, 'Comparta'),
(144, 'Asmet Salud'),
(145, 'AMBUQ'),
(146, 'Ecoopsos'),
(147, 'Savia Salud EPS'),
(148, 'Comfaboy'),
(149, 'Comfacor '),
(150, 'Comfachoco'),
(151, 'Caja de Compensación Familiar de La Guajira'),
(152, 'Comfamiliar Huila EPS'),
(153, 'Comfamiliar de Nariño EPS'),
(154, 'Comfasucre EPS-CCF'),
(155, 'Comfacundi - CCF'),
(156, 'Cajacopi Atlántico  - CCF');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estadocivil`
--

CREATE TABLE `estadocivil` (
  `idEstadoCivil` int(11) NOT NULL,
  `nombreEstadoCivil` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `estadocivil`
--

INSERT INTO `estadocivil` (`idEstadoCivil`, `nombreEstadoCivil`) VALUES
(0, 'Sin especificar'),
(43, 'Soltero'),
(44, 'Casado'),
(45, 'Viudo'),
(46, 'Separado'),
(47, 'Divorciado'),
(48, 'Unión marital de hec'),
(49, 'Comprometido');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estados`
--

CREATE TABLE `estados` (
  `idestado` int(11) NOT NULL,
  `nombreEstado` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `estados`
--

INSERT INTO `estados` (`idestado`, `nombreEstado`) VALUES
(21, 'Registrado'),
(22, 'Publicado'),
(23, 'Arrendado'),
(24, 'Vendido');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estratos`
--

CREATE TABLE `estratos` (
  `idestrato` int(11) NOT NULL,
  `nombreEstrato` varchar(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `estratos`
--

INSERT INTO `estratos` (`idestrato`, `nombreEstrato`) VALUES
(31, '1'),
(32, '2'),
(33, '3'),
(34, '4'),
(35, '5'),
(36, '6');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estructurascocinas`
--

CREATE TABLE `estructurascocinas` (
  `idestructuraCocina` int(11) NOT NULL,
  `nombreEstructuraCocina` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `estructurascocinas`
--

INSERT INTO `estructurascocinas` (`idestructuraCocina`, `nombreEstructuraCocina`) VALUES
(11, 'Abierta'),
(12, 'Cerrada');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `eventosclientes`
--

CREATE TABLE `eventosclientes` (
  `ideventoCliente` int(11) NOT NULL,
  `fechaEvento` date DEFAULT NULL,
  `horaEvento` time DEFAULT NULL,
  `lugarEvento` varchar(100) DEFAULT NULL,
  `latitud` varchar(45) DEFAULT NULL,
  `longitud` varchar(45) DEFAULT NULL,
  `observacionesEvento` varchar(200) DEFAULT NULL,
  `clientes_cedulaCliente` int(11) NOT NULL,
  `DescripcionEvento` varchar(16383) DEFAULT NULL,
  `tiposeventos_idtipoEvento` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `eventosclientes`
--

INSERT INTO `eventosclientes` (`ideventoCliente`, `fechaEvento`, `horaEvento`, `lugarEvento`, `latitud`, `longitud`, `observacionesEvento`, `clientes_cedulaCliente`, `DescripcionEvento`, `tiposeventos_idtipoEvento`) VALUES
(1, '2018-12-05', '17:15:00', 'Notaria Quinta', '4.554264068603516', '-75.65519714355469', 'Llevar documentos', 1, NULL, 34),
(2, '2018-11-14', '17:00:00', 'Centro Comercial Bambusa', '4.554264068603516', '-75.65519714355469', 'Llevar información de casas en el norte', 1, NULL, 33),
(3, '2018-11-29', '14:00:00', 'Notaria Primera', '4.554264068603516', '-75.65519714355469', 'Llevar promesa de compra y venta', 4, NULL, 35),
(4, '2018-11-29', '16:45:00', 'Mall avenida', '4.554264068603516', '-75.65519714355469', 'Oportunidad de venta de inmueble', 4, NULL, 33);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `experienciaempleado`
--

CREATE TABLE `experienciaempleado` (
  `idexperienciaEmpleado` int(11) NOT NULL,
  `empresa` varchar(45) DEFAULT NULL,
  `fechaIngreso` date DEFAULT NULL,
  `fechaSalida` date DEFAULT NULL,
  `certificadoLaboral` varchar(200) DEFAULT NULL,
  `cargos_idCargo` int(11) NOT NULL,
  `empleados_idempleado` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `experienciaempleado`
--

INSERT INTO `experienciaempleado` (`idexperienciaEmpleado`, `empresa`, `fechaIngreso`, `fechaSalida`, `certificadoLaboral`, `cargos_idCargo`, `empleados_idempleado`) VALUES
(2, 'Rama Judicial', '2009-08-13', '2018-08-22', 'System/Resource/Files/Experience/5_certificadoramajudicialjunio2018.pdf', 1233, 5),
(3, 'Camara de comercio', '2009-08-04', '2018-08-30', 'System/Resource/Files/Experience/6_certificadoramajudicialjunio2018.pdf', 1372, 6),
(4, 'EAM', '2018-09-25', '2018-10-06', 'System/Resource/Files/Experience/11_casasenchiaparalaventaexclusivascampestresyconpreciosaccesibles.pdf', 1323, 11),
(5, 'EAM', '2018-08-26', '2018-10-03', 'System/Resource/Files/Experience/7_pagohotel.pdf', 1323, 7),
(6, 'Cámara de Comercio', '2018-08-20', '2018-11-07', 'System/Resource/Files/Experience/7_introducci-on.pdf', 1424, 7),
(7, 'Rama Judicial', '2018-09-27', '2018-10-04', 'System/Resource/Files/Experience/6_introducci-on.pdf', 1159, 6),
(8, 'Rama Judicial', '2018-09-20', '2018-09-20', 'System/Resource/Files/Experience/5_notasc1principios.pdf', 1168, 5),
(9, 'Hexagono', '2018-09-20', '2018-09-20', 'System/Resource/Files/Experience/10_introducci-on.pdf', 1152, 10),
(10, 'Maxirepuestos', '2018-09-06', '2018-10-02', 'System/Resource/Files/Experience/5_firmadavidangaritamzccasa20.pdf', 1169, 5),
(11, 'Comfenalco', '2018-09-10', '2018-10-03', 'System/Resource/Files/Experience/7_introducci-on.pdf', 1322, 7);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fondocesantias`
--

CREATE TABLE `fondocesantias` (
  `idfondoCesantias` int(11) NOT NULL,
  `nombreFondoCesantias` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `fondocesantias`
--

INSERT INTO `fondocesantias` (`idfondoCesantias`, `nombreFondoCesantias`) VALUES
(19, 'Protección'),
(20, 'Porvenir'),
(21, 'Old Mutual Fondo de Pensiones Obligatorias'),
(22, 'Old Mutual Fondo Alternativo de Pensiones'),
(23, 'Colfondos'),
(24, 'Caja de Auxilios y de Prestaciones de ACDAC'),
(25, 'Fondo de Previsión Social del Congreso'),
(26, 'Pensiones de Antioquia'),
(27, 'Administradora Colombiana de Pensiones Colpen');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fondopensiones`
--

CREATE TABLE `fondopensiones` (
  `idfondoPensiones` int(11) NOT NULL,
  `nombreFondoPensiones` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `fondopensiones`
--

INSERT INTO `fondopensiones` (`idfondoPensiones`, `nombreFondoPensiones`) VALUES
(19, 'Protección'),
(20, 'Porvenir'),
(21, 'Old Mutual Fondo de Pensiones Obligatorias'),
(22, 'Old Mutual Fondo Alternativo de Pensiones'),
(23, 'Colfondos'),
(24, 'Caja de Auxilios y de Prestaciones de ACDAC'),
(25, 'Fondo de Previsión Social del Congreso'),
(26, 'Pensiones de Antioquia'),
(27, 'Administradora Colombiana de Pensiones Colpensiones');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `formacionempleado`
--

CREATE TABLE `formacionempleado` (
  `idformacionEmpleado` int(11) NOT NULL,
  `institucionEducacion` varchar(100) DEFAULT NULL,
  `nivelAlcanzado` int(11) DEFAULT NULL,
  `diplomaOActa` varchar(200) DEFAULT NULL,
  `empleados_idempleado` int(11) NOT NULL,
  `profesiones_idprofesion` int(11) NOT NULL,
  `periodicidad_idperiodicidad` int(11) NOT NULL,
  `graduado` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `formacionempleado`
--

INSERT INTO `formacionempleado` (`idformacionEmpleado`, `institucionEducacion`, `nivelAlcanzado`, `diplomaOActa`, `empleados_idempleado`, `profesiones_idprofesion`, `periodicidad_idperiodicidad`, `graduado`) VALUES
(1, 'CAMARA JUNIOR', 11, 'System/Resource/Files/Formation/6_ruteam2018.pdf', 6, 5024, 5, 1),
(2, 'EAM', 9, 'System/Resource/Files/Formation/7_introducci-on.pdf', 7, 4754, 4, 1),
(4, 'Institución Educativa  El Caimo', 11, 'System/Resource/Files/Formation/7_notasc1principios.pdf', 7, 5025, 5, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `generos`
--

CREATE TABLE `generos` (
  `idGenero` int(11) NOT NULL,
  `nombreGenero` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `generos`
--

INSERT INTO `generos` (`idGenero`, `nombreGenero`) VALUES
(0, 'Sin especificar'),
(13, 'Masculino'),
(14, 'Femenino');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `imageninmueble`
--

CREATE TABLE `imageninmueble` (
  `idImagenInmueble` int(11) NOT NULL,
  `rutaImagen` varchar(200) DEFAULT NULL,
  `idInmueble` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `imageninmueble`
--

INSERT INTO `imageninmueble` (`idImagenInmueble`, `rutaImagen`, `idInmueble`) VALUES
(18, 'System/Resource/Images/Properties/321213_firmasinfondo.jpg', 2),
(19, 'System/Resource/Images/Properties/321213_marcaeamconfondo.jpg', 2),
(20, 'System/Resource/Images/Properties/321213_marcaeam.jpg', 2),
(355, 'System/Resource/Images/Properties/987654321_file8none-dnqnp936209-mco28296034047102018-f.jpg', 5),
(356, 'System/Resource/Images/Properties/987654321_file9none-dnqnp753537-mco28296034041102018-f.jpg', 5),
(298, 'System/Resource/Images/Properties/454545454_file8none-dnqnp825468-mco28465407590102018-f.jpg', 6),
(296, 'System/Resource/Images/Properties/454545454_file11none-dnqnp885737-mco28465407594102018-f.jpg', 6),
(297, 'System/Resource/Images/Properties/454545454_file2none-dnqnp647255-mco28465407595102018-f.jpg', 6),
(299, 'System/Resource/Images/Properties/454545454_file9none-dnqnp846769-mco28465407592102018-f.jpg', 6),
(354, 'System/Resource/Images/Properties/987654321_file7none-dnqnp906994-mco28296034045102018-f.jpg', 5),
(353, 'System/Resource/Images/Properties/987654321_file6none-dnqnp903246-mco28296034040102018-f.jpg', 5),
(352, 'System/Resource/Images/Properties/987654321_file5none-dnqnp871779-mco28296034043102018-f.jpg', 5),
(351, 'System/Resource/Images/Properties/987654321_file4none-dnqnp859658-mco28296034046102018-f.jpg', 5),
(348, 'System/Resource/Images/Properties/987654321_file0none-dnqnp729624-mco28296034048102018-f.jpg', 5),
(349, 'System/Resource/Images/Properties/987654321_file2none-dnqnp720860-mco28296034036102018-f.jpg', 5),
(344, 'System/Resource/Images/Properties/123456789_file8none-dnqnp942599-mco28419903981102018-f.jpg', 4),
(345, 'System/Resource/Images/Properties/123456789_file9none-dnqnp944494-mco28420062511102018-f.jpg', 4),
(346, 'System/Resource/Images/Properties/123456789_file10none-dnqnp995885-mco28420062512102018-f.jpg', 4),
(347, 'System/Resource/Images/Properties/123456789_file3none-dnqnp819954-mco28419903987102018-f.jpg', 4),
(295, 'System/Resource/Images/Properties/454545454_file10none-dnqnp863176-mco28368297857102018-f.jpg', 6),
(294, 'System/Resource/Images/Properties/454545454_file7none-dnqnp803788-mco28465407589102018-f.jpg', 6),
(293, 'System/Resource/Images/Properties/454545454_file6none-dnqnp776156-mco28465407591102018-f.jpg', 6),
(292, 'System/Resource/Images/Properties/454545454_file5none-dnqnp767657-mco28465407588102018-f.jpg', 6),
(291, 'System/Resource/Images/Properties/454545454_file3none-dnqnp706989-mco28465407597102018-f.jpg', 6),
(290, 'System/Resource/Images/Properties/454545454_file4none-dnqnp762996-mco28368297850102018-f.jpg', 6),
(289, 'System/Resource/Images/Properties/454545454_file0none-dnqnp722939-mco28465407593102018-f.jpg', 6),
(350, 'System/Resource/Images/Properties/987654321_file3none-dnqnp801250-mco28296034037102018-f.jpg', 5),
(325, 'System/Resource/Images/Properties/234334323_file12none-dnqnp917383-mco28443735628102018-f.jpg', 7),
(324, 'System/Resource/Images/Properties/234334323_file11none-dnqnp913763-mco28443735623102018-f.jpg', 7),
(323, 'System/Resource/Images/Properties/234334323_file10none-dnqnp848801-mco28443735619102018-f.jpg', 7),
(322, 'System/Resource/Images/Properties/234334323_file9none-dnqnp836462-mco28443735621102018-f.jpg', 7),
(321, 'System/Resource/Images/Properties/234334323_file6none-dnqnp770673-mco28443735622102018-f.jpg', 7),
(320, 'System/Resource/Images/Properties/234334323_file5none-dnqnp690338-mco28443735630102018-f.jpg', 7),
(319, 'System/Resource/Images/Properties/234334323_file4none-dnqnp673196-mco28443735625102018-f.jpg', 7),
(318, 'System/Resource/Images/Properties/234334323_file2none-dnqnp648248-mco28443735620102018-f.jpg', 7),
(317, 'System/Resource/Images/Properties/234334323_file0none-dnqnp686210-mco28443735624102018-f.jpg', 7),
(279, 'System/Resource/Images/Properties/88748474_file14none-dnqnp810834-mco28488074287102018-f.jpg', 8),
(275, 'System/Resource/Images/Properties/88748474_file13none-dnqnp963492-mco28488074294102018-f.jpg', 8),
(277, 'System/Resource/Images/Properties/88748474_file12none-dnqnp942486-mco28488074291102018-f.jpg', 8),
(276, 'System/Resource/Images/Properties/88748474_file2none-dnqnp676952-mco28488074295102018-f.jpg', 8),
(343, 'System/Resource/Images/Properties/123456789_file7none-dnqnp937366-mco28419903989102018-f.jpg', 4),
(278, 'System/Resource/Images/Properties/88748474_file6none-dnqnp740083-mco28488074289102018-f.jpg', 8),
(274, 'System/Resource/Images/Properties/88748474_file11none-dnqnp892181-mco28488074297102018-f.jpg', 8),
(273, 'System/Resource/Images/Properties/88748474_file10none-dnqnp889213-mco28488074288102018-f.jpg', 8),
(272, 'System/Resource/Images/Properties/88748474_file9none-dnqnp835260-mco28488074293102018-f.jpg', 8),
(271, 'System/Resource/Images/Properties/88748474_file8none-dnqnp789812-mco28488074285102018-f.jpg', 8),
(270, 'System/Resource/Images/Properties/88748474_file7none-dnqnp761077-mco28488074298102018-f.jpg', 8),
(269, 'System/Resource/Images/Properties/88748474_file5none-dnqnp730839-mco28488074296102018-f.jpg', 8),
(268, 'System/Resource/Images/Properties/88748474_file4none-dnqnp700979-mco28488074290102018-f.jpg', 8),
(267, 'System/Resource/Images/Properties/88748474_file3none-dnqnp687632-mco28488074292102018-f.jpg', 8),
(266, 'System/Resource/Images/Properties/88748474_file0none-dnqnp839159-mco28488074286102018-f.jpg', 8),
(342, 'System/Resource/Images/Properties/123456789_file6none-dnqnp930535-mco28420062513102018-f.jpg', 4),
(341, 'System/Resource/Images/Properties/123456789_file4none-dnqnp863940-mco28419903983102018-f.jpg', 4),
(340, 'System/Resource/Images/Properties/123456789_file5none-dnqnp922410-mco28419903984102018-f.jpg', 4),
(339, 'System/Resource/Images/Properties/123456789_file2none-dnqnp686201-mco28419903990102018-f.jpg', 4),
(338, 'System/Resource/Images/Properties/123456789_file0none-dnqnp705630-mco28419903985102018-f.jpg', 4),
(326, 'System/Resource/Images/Properties/234334323_file3none-dnqnp667597-mco28443735629102018-f.jpg', 7),
(327, 'System/Resource/Images/Properties/234334323_file8none-dnqnp823211-mco28443735626102018-f.jpg', 7),
(328, 'System/Resource/Images/Properties/234334323_file7none-dnqnp809968-mco28443735627102018-f.jpg', 7);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inmuebles`
--

CREATE TABLE `inmuebles` (
  `idinmueble` int(11) NOT NULL,
  `precio` float NOT NULL,
  `costoAdministracion` float DEFAULT NULL,
  `habitaciones` int(11) DEFAULT NULL,
  `banos` int(11) DEFAULT NULL,
  `parqueaderos` int(11) DEFAULT NULL,
  `areaTotal` float DEFAULT NULL,
  `areaSinBalcones` float DEFAULT NULL,
  `anoDeConstruccion` varchar(4) DEFAULT NULL,
  `numeroPiso` varchar(3) DEFAULT NULL,
  `chimenea` tinyint(1) DEFAULT NULL,
  `estudio` tinyint(1) DEFAULT NULL,
  `deposito` tinyint(1) DEFAULT NULL,
  `zonaRopas` tinyint(1) DEFAULT NULL,
  `parqueaderoVisitante` tinyint(1) DEFAULT NULL,
  `ascensor` tinyint(1) DEFAULT NULL,
  `terraza` tinyint(1) DEFAULT NULL,
  `transportePublicoCercano` tinyint(1) DEFAULT NULL,
  `precioNegociable` tinyint(1) DEFAULT NULL,
  `latitud` varchar(45) DEFAULT NULL,
  `longitud` varchar(45) DEFAULT NULL,
  `salonComunal` tinyint(1) DEFAULT NULL,
  `sauna` tinyint(1) DEFAULT NULL,
  `turco` tinyint(1) DEFAULT NULL,
  `jacuzzi` tinyint(1) DEFAULT NULL,
  `zonaInfantil` tinyint(1) DEFAULT NULL,
  `jardines` tinyint(1) DEFAULT NULL,
  `duplex` tinyint(1) DEFAULT NULL,
  `puertaDeSeguridad` tinyint(1) DEFAULT NULL,
  `gimnasio` tinyint(1) DEFAULT NULL,
  `ciudades_idciudad` int(11) NOT NULL,
  `estratos_idestrato` int(11) NOT NULL,
  `tiposInmuebles_idtipoInmueble` int(11) NOT NULL,
  `tiposOfertas_idtipoOferta` int(11) NOT NULL,
  `tiposCortinas_idtipoCortina` int(11) NOT NULL,
  `tiposVigilancias_idtipoVigilancia` int(11) NOT NULL,
  `zonas_idzona` int(11) NOT NULL,
  `tiposVistas_idtipoVista` int(11) NOT NULL,
  `barrios_idbarrio` int(11) NOT NULL,
  `estado_idestado` int(11) NOT NULL,
  `tiposCocinas_idtipoCocina` int(11) NOT NULL,
  `estructurasCocinas_idestructuraCocina` int(11) NOT NULL,
  `tiposPisos_idtipoPiso` int(11) NOT NULL,
  `clientes_cedulaCliente` int(11) NOT NULL,
  `fechaPublicacion` date DEFAULT NULL,
  `fechaRecepcion` date DEFAULT NULL,
  `tiposDestacados_idtipoDestacado` int(11) NOT NULL,
  `linderosInmueble` varchar(2000) DEFAULT NULL,
  `matriculaInmobiliaria` varchar(45) DEFAULT NULL,
  `avaluoCatastral` float DEFAULT NULL,
  `piscina` tinyint(1) DEFAULT NULL,
  `zonaMascotas` tinyint(1) DEFAULT NULL,
  `parqueaderoCubierto` tinyint(1) DEFAULT NULL,
  `amoblado` tinyint(1) DEFAULT NULL,
  `direccion_carrera` varchar(50) DEFAULT NULL,
  `direccion_calle` varchar(50) DEFAULT NULL,
  `direccion_numero` varchar(50) DEFAULT NULL,
  `direccion_info_adicional` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `inmuebles`
--

INSERT INTO `inmuebles` (`idinmueble`, `precio`, `costoAdministracion`, `habitaciones`, `banos`, `parqueaderos`, `areaTotal`, `areaSinBalcones`, `anoDeConstruccion`, `numeroPiso`, `chimenea`, `estudio`, `deposito`, `zonaRopas`, `parqueaderoVisitante`, `ascensor`, `terraza`, `transportePublicoCercano`, `precioNegociable`, `latitud`, `longitud`, `salonComunal`, `sauna`, `turco`, `jacuzzi`, `zonaInfantil`, `jardines`, `duplex`, `puertaDeSeguridad`, `gimnasio`, `ciudades_idciudad`, `estratos_idestrato`, `tiposInmuebles_idtipoInmueble`, `tiposOfertas_idtipoOferta`, `tiposCortinas_idtipoCortina`, `tiposVigilancias_idtipoVigilancia`, `zonas_idzona`, `tiposVistas_idtipoVista`, `barrios_idbarrio`, `estado_idestado`, `tiposCocinas_idtipoCocina`, `estructurasCocinas_idestructuraCocina`, `tiposPisos_idtipoPiso`, `clientes_cedulaCliente`, `fechaPublicacion`, `fechaRecepcion`, `tiposDestacados_idtipoDestacado`, `linderosInmueble`, `matriculaInmobiliaria`, `avaluoCatastral`, `piscina`, `zonaMascotas`, `parqueaderoCubierto`, `amoblado`, `direccion_carrera`, `direccion_calle`, `direccion_numero`, `direccion_info_adicional`) VALUES
(4, 100000000, 200000, 3, 2, 2, 200, 190, '2018', '14', 0, 0, 1, 0, 0, 0, 0, 1, 1, '4.547359782956471', '-75.66334115587523', 1, 1, 1, 1, 0, 0, 1, 1, 0, 888, 34, 32, 16, 12, 21, 46, 12, 1501, 22, 16, 12, 72, 1, '2018-09-08', '2018-09-01', 16, 'Consta de seis habitaciones con closet, cuatro baños completos, cocina integral, gas natural, sala comedor independientes, calentador, estudio, patio, zona de ropas, piso en m', '123456789', 90000000, 0, 0, 1, 0, NULL, NULL, NULL, NULL),
(5, 200000000, 300000, 4, 2, 2, 300, 280, '2018', '1', 1, 1, 1, 1, 0, 0, 0, 1, 0, '4.547455209982011', '-75.6641847050879', 0, 1, 0, 0, 1, 1, 0, 0, 0, 886, 35, 31, 16, 12, 21, 46, 12, 1403, 22, 18, 11, 71, 3, '2018-09-17', '2018-08-29', 16, 'Se vende casa en conjunto cerrado con un áre de 335 M2 , estrato 5 de dos pisos distribuida así: \n\nPrimer piso:\n\n2 Salas principales, Sala de T.V, baño social, comedor, cocina tipo americano, habitaci', '987654321', 88000000, 0, 1, 1, 0, '20 Norte', '10', '10', 'Condominio Residencial La Primavera'),
(6, 1000000, 125000, 3, 2, 1, 78, 70, '2017', '5', 1, 0, 1, 0, 1, 0, 1, 0, 1, '4.550400272476861', '-75.66232143349214', 0, 0, 1, 1, 1, 1, 0, 0, 1, 886, 34, 32, 15, 11, 23, 48, 12, 1555, 22, 18, 12, 81, 1, '2018-09-20', '2018-09-03', 16, 'Descripción inmueble', '454545454', 99000000, 1, 0, 0, 0, NULL, NULL, NULL, NULL),
(7, 130000000, 230000, 4, 3, 2, 200, 170, '2015', '1', 0, 0, 1, 1, 0, 0, 1, 0, 1, '4.5407162342170055', '-75.66036004309996', 1, 0, 1, 0, 1, 0, 1, 0, 1, 886, 34, 31, 16, 12, 21, 46, 12, 1560, 22, 18, 11, 72, 4, '2018-11-28', '2018-11-19', 16, 'Descripción del inmueble ', '234334323', 70000000, 1, 1, 0, 0, NULL, NULL, NULL, NULL),
(8, 45000000, 100000, 2, 2, 1, 88, 77, '2014', '1', 0, 0, 0, 0, 0, 0, 1, 0, 0, '4.540372431574355', '-75.66086769104004', 0, 0, 1, 1, 0, 1, 1, 1, 0, 886, 34, 31, 16, 12, 21, 46, 12, 1386, 22, 18, 12, 81, 1, '2018-11-01', '2018-10-24', 17, 'Descripción de la casa', '88748474', 44000000, 0, 0, 0, 0, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `log_msg`
--

CREATE TABLE `log_msg` (
  `id` int(11) NOT NULL,
  `log` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `log_msg`
--

INSERT INTO `log_msg` (`id`, `log`) VALUES
(115, 'ANTES DE DELETE ********2'),
(114, 'ENTRE AL IF ********2'),
(113, 'ANTES DE IF********2'),
(116, 'ANTES DE IF********2'),
(117, 'ENTRE AL IF ********2'),
(118, 'ANTES DE DELETE ********2'),
(119, 'ANTES DE IF********2'),
(120, 'ENTRE AL IF ********2'),
(121, 'ANTES DE DELETE ********2'),
(122, 'ANTES DE IF********2'),
(123, 'ENTRE AL IF ********2'),
(124, 'ANTES DE DELETE ********2'),
(125, 'ANTES DE IF********1'),
(126, 'ENTRE AL IF ********1'),
(127, 'ANTES DE DELETE ********1'),
(128, 'ANTES DE IF********4'),
(129, 'ENTRE AL IF ********4'),
(130, 'ANTES DE DELETE ********4'),
(131, 'ANTES DE IF********4'),
(132, 'ENTRE AL IF ********4'),
(133, 'ANTES DE DELETE ********4'),
(134, 'ANTES DE IF********4'),
(135, 'ENTRE AL IF ********4'),
(136, 'ANTES DE DELETE ********4'),
(137, 'ANTES DE IF********5'),
(138, 'ENTRE AL IF ********5'),
(139, 'ANTES DE DELETE ********5'),
(140, 'ANTES DE IF********3'),
(141, 'ENTRE AL IF ********3'),
(142, 'ANTES DE DELETE ********3');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `menu`
--

CREATE TABLE `menu` (
  `id` int(11) NOT NULL,
  `nombre` varchar(30) DEFAULT NULL,
  `codigo` varchar(2000) DEFAULT NULL,
  `padre` int(11) DEFAULT NULL,
  `descripcion` varchar(2000) DEFAULT NULL,
  `prioridad` int(11) DEFAULT NULL,
  `icono` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `menu`
--

INSERT INTO `menu` (`id`, `nombre`, `codigo`, `padre`, `descripcion`, `prioridad`, `icono`) VALUES
(1, 'Parametrización', NULL, -1, NULL, 4, 'fa-gear'),
(2, 'Configuración', NULL, -1, NULL, 3, 'fa-group'),
(3, 'Roles', 'Configuration/Rol', 2, NULL, 1, ''),
(4, 'Usuarios', 'Configuration/User', 2, NULL, 2, ''),
(5, 'Inicio', NULL, -1, NULL, 1, 'fa-home'),
(6, 'Permisos', 'Configuration/Permission', 2, NULL, 3, ''),
(7, 'Noticias', 'Parameterized/New', 1, NULL, 1, ''),
(8, 'Clientes', NULL, -1, NULL, 5, 'fa-address-book-o'),
(9, 'Clientes', 'Client/Client', 8, NULL, 1, ''),
(10, 'Inmuebles', NULL, -1, NULL, 6, 'fa-cube'),
(11, 'PQRS', NULL, -1, NULL, 7, 'fa-envelope-o'),
(12, 'Inmuebles', 'Propertie/Propertie', 10, NULL, 1, ''),
(13, 'PQRS', 'Client/Pqrs', 11, NULL, 1, ''),
(14, 'Portales', NULL, -1, NULL, 7, 'fa-globe'),
(15, 'Inmobiliarios', 'PropertiePortal/PropertiePortal', 14, NULL, 1, ''),
(16, 'Profesiones', 'Parameterized/Profession', 1, NULL, 5, ''),
(17, 'Empleados', '', -1, NULL, 6, 'fa-group'),
(18, 'Empleados', 'Employee/Employee', 17, NULL, 5, ''),
(19, 'Eventos', 'Client/event', 8, NULL, 6, ''),
(20, 'Dependiente', 'Client/DependentPerson', 29, NULL, 8, ''),
(21, 'Independiente', 'Client/IndependentPerson', 29, NULL, 8, ''),
(22, 'Experiencia', 'Employee/EmployeeExperience', 17, NULL, 6, ''),
(23, 'Formación', 'Employee/EmployeeFormation', 17, NULL, 6, ''),
(24, 'Contratos', 'Employee/EmployeeContract', 17, NULL, 6, ''),
(26, 'Ref. Personal y Familiar', 'Client/ReferenceClient', 29, NULL, 9, ''),
(27, 'Ref. Bancaría', 'Client/bankReferenceClient', 29, NULL, 8, ''),
(29, 'Contratos', NULL, -1, NULL, 7, 'fa-handshake-o'),
(30, 'Contratos', 'Contract/PropertieContract', 29, NULL, 7, ''),
(31, 'Conyugue', 'Contract/Spouse', 29, NULL, 7, ''),
(32, 'Deudor', 'Contract/Debtor', 29, NULL, 8, ''),
(33, 'Perfil Cliente', 'Client/ProfileClient', 8, NULL, 1, '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `menu_rol`
--

CREATE TABLE `menu_rol` (
  `idrol` int(11) DEFAULT NULL,
  `idmenu` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `menu_rol`
--

INSERT INTO `menu_rol` (`idrol`, `idmenu`) VALUES
(85, 3),
(85, 4),
(85, 6),
(85, 12),
(85, 15),
(1, 3),
(1, 4),
(1, 6),
(1, 7),
(1, 16),
(1, 9),
(1, 33),
(1, 19),
(1, 12),
(1, 18),
(1, 22),
(1, 23),
(1, 24),
(1, 13),
(1, 15),
(1, 30),
(1, 31),
(1, 20),
(1, 21),
(1, 27),
(1, 32),
(1, 26);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `nivelprofesion`
--

CREATE TABLE `nivelprofesion` (
  `idnivelProfesion` int(11) NOT NULL,
  `nombreNivelProfesion` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `nivelprofesion`
--

INSERT INTO `nivelprofesion` (`idnivelProfesion`, `nombreNivelProfesion`) VALUES
(0, 'Sin especificar'),
(1, 'Ténico'),
(2, 'Tecnológico'),
(3, 'Profesional'),
(4, 'Básica primaria'),
(5, 'Bachiller académico'),
(6, 'Bachiller técnico');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `objetoscontratos`
--

CREATE TABLE `objetoscontratos` (
  `idobjetoContrato` int(11) NOT NULL,
  `nombreObjetoContrato` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `objetoscontratos`
--

INSERT INTO `objetoscontratos` (`idobjetoContrato`, `nombreObjetoContrato`) VALUES
(1, 'arrendamiento'),
(2, 'compraventa');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `paises`
--

CREATE TABLE `paises` (
  `idpais` int(11) NOT NULL,
  `nombrePais` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `paises`
--

INSERT INTO `paises` (`idpais`, `nombrePais`) VALUES
(0, 'Sin especificar'),
(1, 'Colombia'),
(2, 'Afganistan '),
(3, 'Albania '),
(4, 'Alemania '),
(5, 'Andorra '),
(6, 'Angola '),
(7, 'Anguilla '),
(8, 'Antigua y barbuda '),
(9, 'Antillas holandesas '),
(10, 'Arabia saudi '),
(11, 'Argelia '),
(12, 'Argentina '),
(13, 'Armenia '),
(14, 'Aruba '),
(15, 'Australia '),
(16, 'Austria '),
(17, 'Azerbaiyan '),
(18, 'Bahamas '),
(19, 'Bahrein '),
(20, 'Bangladesh '),
(21, 'Barbados '),
(22, 'Belarus '),
(23, 'Belgica '),
(24, 'Belice '),
(25, 'Benin '),
(26, 'Bermudas '),
(27, 'Bhután '),
(28, 'Bolivia '),
(29, 'Bosnia y herzegovina '),
(30, 'Botswana '),
(31, 'Brasil '),
(32, 'Brunei '),
(33, 'Bulgaria '),
(34, 'Burkina faso '),
(35, 'Burundi '),
(36, 'Cabo verde '),
(37, 'Camboya '),
(38, 'Camerun '),
(39, 'Canada '),
(40, 'Chad '),
(41, 'Chile '),
(42, 'China '),
(43, 'Chipre '),
(44, 'Comores '),
(45, 'Congo '),
(46, 'Corea '),
(47, 'Corea del norte  '),
(48, 'Costa de marfil '),
(49, 'Costa rica '),
(50, 'Croacia '),
(51, 'Cuba '),
(52, 'Dinamarca '),
(53, 'Djibouti '),
(54, 'Dominica '),
(55, 'Ecuador '),
(56, 'Egipto '),
(57, 'El salvador '),
(58, 'Emiratos arabes unidos '),
(59, 'Eritrea '),
(60, 'Eslovenia '),
(61, 'España '),
(62, 'Estados unidos de america '),
(63, 'Estonia '),
(64, 'Etiopia '),
(65, 'Fiji '),
(66, 'Filipinas '),
(67, 'Finlandia '),
(68, 'Francia '),
(69, 'Gabon '),
(70, 'Gambia '),
(71, 'Georgia '),
(72, 'Ghana '),
(73, 'Gibraltar '),
(74, 'Granada '),
(75, 'Grecia '),
(76, 'Groenlandia '),
(77, 'Guadalupe '),
(78, 'Guam '),
(79, 'Guatemala '),
(80, 'Guayana francesa '),
(81, 'Guernesey '),
(82, 'Guinea '),
(83, 'Guinea ecuatorial '),
(84, 'Guinea-bissau '),
(85, 'Guyana '),
(86, 'Haiti '),
(87, 'Honduras '),
(88, 'Hong kong '),
(89, 'Hungria '),
(90, 'India '),
(91, 'Indonesia '),
(92, 'Iran '),
(93, 'Iraq '),
(94, 'Irlanda '),
(95, 'Isla de man '),
(96, 'Isla norfolk '),
(97, 'Islandia '),
(98, 'Islas aland '),
(99, 'Islas caimán '),
(100, 'Islas cook '),
(101, 'Islas del canal '),
(102, 'Islas feroe '),
(103, 'Islas malvinas '),
(104, 'Islas marianas del norte '),
(105, 'Islas marshall '),
(106, 'Islas pitcairn '),
(107, 'Islas salomon '),
(108, 'Islas turcas y caicos '),
(109, 'Islas virgenes britanicas '),
(110, 'Islas vírgenes de los estados unidos '),
(111, 'Israel '),
(112, 'Italia '),
(113, 'Jamaica '),
(114, 'Japon '),
(115, 'Jersey '),
(116, 'Jordania '),
(117, 'Kazajstan '),
(118, 'Kenia '),
(119, 'Kirguistan '),
(120, 'Kiribati '),
(121, 'Kuwait '),
(122, 'Laos '),
(123, 'Lesotho '),
(124, 'Letonia '),
(125, 'Libano '),
(126, 'Liberia '),
(127, 'Libia '),
(128, 'Liechtenstein '),
(129, 'Lituania '),
(130, 'Luxemburgo '),
(131, 'Macao '),
(132, 'Macedonia  '),
(133, 'Madagascar '),
(134, 'Malasia '),
(135, 'Malawi '),
(136, 'Maldivas '),
(137, 'Mali '),
(138, 'Malta '),
(139, 'Marruecos '),
(140, 'Martinica '),
(141, 'Mauricio '),
(142, 'Mauritania '),
(143, 'Mayotte '),
(144, 'Mexico '),
(145, 'Micronesia '),
(146, 'Moldavia '),
(147, 'Monaco '),
(148, 'Mongolia '),
(149, 'Montenegro '),
(150, 'Montserrat '),
(151, 'Mozambique '),
(152, 'Myanmar '),
(153, 'Namibia '),
(154, 'Nauru '),
(155, 'Nepal '),
(156, 'Nicaragua '),
(157, 'Niger '),
(158, 'Nigeria '),
(159, 'Niue '),
(160, 'Noruega '),
(161, 'Nueva caledonia '),
(162, 'Nueva zelanda '),
(163, 'Oman '),
(164, 'Otros paises o territorios  de sudamerica '),
(165, 'Otros paises o territorios de asia '),
(166, 'Otros paises o territorios de oceania '),
(167, 'Otros paises o territorios del caribe y ameri'),
(168, 'Paises bajos '),
(169, 'Pakistan '),
(170, 'Palaos '),
(171, 'Palestina '),
(172, 'Panama '),
(173, 'Papua nueva guinea '),
(174, 'Paraguay '),
(175, 'Peru '),
(176, 'Polinesia francesa '),
(177, 'Polonia '),
(178, 'Portugal '),
(179, 'Puerto rico '),
(180, 'Qatar '),
(181, 'Reino unido '),
(182, 'Rep.democratica del congo '),
(183, 'Republica centroafricana '),
(184, 'Republica checa '),
(185, 'Republica dominicana '),
(186, 'Republica eslovaca '),
(187, 'Reunion '),
(188, 'Ruanda '),
(189, 'Rumania '),
(190, 'Rusia '),
(191, 'Sahara occidental '),
(192, 'Samoa '),
(193, 'Samoa americana '),
(194, 'San bartolome '),
(195, 'San cristobal y nieves '),
(196, 'San marino '),
(197, 'San martin (parte francesa) '),
(198, 'San pedro y miquelon  '),
(199, 'San vicente y las granadinas '),
(200, 'Santa helena '),
(201, 'Santa lucia '),
(202, 'Santa sede '),
(203, 'Santo tome y principe '),
(204, 'Senegal '),
(205, 'Serbia '),
(206, 'Seychelles '),
(207, 'Sierra leona '),
(208, 'Singapur '),
(209, 'Siria '),
(210, 'Somalia '),
(211, 'Sri lanka '),
(212, 'Sudafrica '),
(213, 'Sudan '),
(214, 'Suecia '),
(215, 'Suiza '),
(216, 'Surinam '),
(217, 'Svalbard y jan mayen '),
(218, 'Swazilandia '),
(219, 'Tadyikistan '),
(220, 'Tailandia '),
(221, 'Tanzania '),
(222, 'Timor oriental '),
(223, 'Togo '),
(224, 'Tokelau '),
(225, 'Tonga '),
(226, 'Trinidad y tobago '),
(227, 'Tunez '),
(228, 'Turkmenistan '),
(229, 'Turquia '),
(230, 'Tuvalu '),
(231, 'Ucrania '),
(232, 'Uganda '),
(233, 'Uruguay '),
(234, 'Uzbekistan '),
(235, 'Vanuatu '),
(236, 'Venezuela '),
(237, 'Vietnam '),
(238, 'Wallis y fortuna '),
(239, 'Yemen '),
(240, 'Zambia '),
(241, 'Zimbabwe ');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `periodicidad`
--

CREATE TABLE `periodicidad` (
  `idperiodicidad` int(11) NOT NULL,
  `nombrePeriodicidad` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `periodicidad`
--

INSERT INTO `periodicidad` (`idperiodicidad`, `nombrePeriodicidad`) VALUES
(4, 'Semestral'),
(5, 'Anual'),
(6, 'Trimestral');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personajuridica`
--

CREATE TABLE `personajuridica` (
  `idpersonaJuridica` int(11) NOT NULL,
  `direccionEmpresa` varchar(100) DEFAULT NULL,
  `telefonoEmpresa` varchar(10) DEFAULT NULL,
  `idtipoEmpresa` int(11) NOT NULL,
  `idtipoSociedad` int(11) NOT NULL,
  `numeroIdentificacionCliente` int(11) NOT NULL,
  `tiempoConstitucion` int(11) DEFAULT NULL,
  `patrimonio` float DEFAULT NULL,
  `afectacionFamiliar` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pqrs`
--

CREATE TABLE `pqrs` (
  `idPQRS` int(11) NOT NULL,
  `fechaPQRS` date NOT NULL,
  `horaPQRS` time NOT NULL,
  `descripcionPQRS` varchar(200) NOT NULL,
  `respuestaDada` varchar(2000) DEFAULT NULL,
  `idtipopqrs` int(11) NOT NULL,
  `idusuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `pqrs`
--

INSERT INTO `pqrs` (`idPQRS`, `fechaPQRS`, `horaPQRS`, `descripcionPQRS`, `respuestaDada`, `idtipopqrs`, `idusuario`) VALUES
(1, '2018-11-01', '15:00:00', 'Queja puesta por cliente', NULL, 2, 1),
(2, '2018-10-01', '08:00:00', 'Petición hecha por cliente', NULL, 1, 4),
(3, '2018-11-02', '08:50:00', 'Petición hecha por david ', 'Respuesta dada a la petición de david', 1, 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `profesiones`
--

CREATE TABLE `profesiones` (
  `idprofesion` int(11) NOT NULL,
  `nombreProfesion` varchar(200) NOT NULL,
  `nivelProfesion_idnivelProfesion` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `profesiones`
--

INSERT INTO `profesiones` (`idprofesion`, `nombreProfesion`, `nivelProfesion_idnivelProfesion`) VALUES
(0, 'Sin especificar', 0),
(4187, 'Administración agropecuaria', 1),
(4188, 'Administración bancaria y financiera', 1),
(4189, 'Administración de comercio exterior', 1),
(4190, 'Administración de construcciones', 1),
(4191, 'Administración de costos y auditoria', 1),
(4192, 'Administración de empresas', 1),
(4193, 'Administración de empresas agropecuarias', 1),
(4194, 'Administración de la construcción', 1),
(4195, 'Administración de obras civiles', 1),
(4196, 'Administración de servicio de salud', 1),
(4197, 'Administración empresarial e informática', 1),
(4198, 'Administración hospitalaria', 1),
(4199, 'Administración hotelera', 1),
(4200, 'Administración industrial', 1),
(4201, 'Administración informática', 1),
(4202, 'Administración inmobiliaria', 1),
(4203, 'Administración municipal', 1),
(4204, 'Administración turística', 1),
(4205, 'Administración turística y hotelera', 1),
(4206, 'Administración y auditoria de sistemas', 1),
(4207, 'Administración y avalúos de finca raíz', 1),
(4208, 'Administración y finanzas', 1),
(4209, 'Administración y mercadotecnia', 1),
(4210, 'Administrativo en contabilidad y finanzas', 1),
(4211, 'Administrativo en relaciones industriales', 1),
(4212, 'Admón. Bancaria de instituciones financier', 1),
(4213, 'Admón. De empresas con énfasis en agroindu', 1),
(4214, 'Admón. De empresas de economía solidaria', 1),
(4215, 'Admón. De planteles de educa. Básica primar', 1),
(4216, 'Agropecuaria', 1),
(4217, 'Análisis químico industrial', 1),
(4218, 'Análisis y diseño de sistemas de computación', 1),
(4219, 'Análisis y programación de computadores', 1),
(4220, 'Arquitectura de interiores', 1),
(4221, 'Arte grafico y publicitario', 1),
(4222, 'Arte publicitario', 1),
(4223, 'Arte y decoración', 1),
(4224, 'Auxiliar de arquitectura e ingeniería', 1),
(4225, 'Balística', 1),
(4226, 'Catequesis', 1),
(4227, 'Ciencias contables', 1),
(4228, 'Ciencias de la computación', 1),
(4229, 'Citohistologia', 1),
(4230, 'Cocina internacional', 1),
(4231, 'Comercio exterior', 1),
(4232, 'Comercio internacional', 1),
(4233, 'Comercio internacional y legislación aduan', 1),
(4234, 'Comercio y negocios internacionales', 1),
(4235, 'Computación', 1),
(4236, 'Computación y sistemas', 1),
(4237, 'Confección, acabados y supervisión', 1),
(4238, 'Construcción y administración de obras civile', 1),
(4239, 'Construcciones', 1),
(4240, 'Contabilidad', 1),
(4241, 'Contabilidad comercial', 1),
(4242, 'Contabilidad sistematizada', 1),
(4243, 'Contabilidad y costos', 1),
(4244, 'Contabilidad y finanzas', 1),
(4245, 'Contaduría', 1),
(4246, 'Contaduría técnica', 1),
(4247, 'Costos y contabilidad', 1),
(4248, 'Dactiloscopia', 1),
(4249, 'Decoración de espacios arquitectónicos', 1),
(4250, 'Decoración y diseño de interiores', 1),
(4251, 'Delineante y auxiliar de ingeniería mecani', 1),
(4252, 'Delineantes de arquitectura  e ingeniería', 1),
(4253, 'Delineantes de arquitectura y decoración', 1),
(4254, 'Deporte y recreación', 1),
(4255, 'Dibujo arquitectónico', 1),
(4256, 'Dibujo arquitectónico y de ingeniería', 1),
(4257, 'Dibujo arquitectónico y decoración', 1),
(4258, 'Dibujo de ingeniería mecánica y arquitectu', 1),
(4259, 'Dibujo publicitario', 1),
(4260, 'Diseño asistido por computador', 1),
(4261, 'Diseño de alta costura', 1),
(4262, 'Diseño de ambientes', 1),
(4263, 'Diseño de artes graficas', 1),
(4264, 'Diseño de interiores', 1),
(4265, 'Diseño de maquinas', 1),
(4266, 'Diseño de modas', 1),
(4267, 'Diseño e industria de la moda', 1),
(4268, 'Diseño grafico', 1),
(4269, 'Diseño industrial', 1),
(4270, 'Diseño mecánico', 1),
(4271, 'Diseño publicitario', 1),
(4272, 'Diseño textil', 1),
(4273, 'Diseño textil y de modas', 1),
(4274, 'Diseño y confección de la moda', 1),
(4275, 'Diseño y decoración de ambientes', 1),
(4276, 'Diseño y decoración de espacios arquitectónic', 1),
(4277, 'Diseño y producción de televisión', 1),
(4278, 'Documento logia', 1),
(4279, 'Educación artística', 1),
(4280, 'Educación básica primaria bilingüe', 1),
(4281, 'Educación especial', 1),
(4282, 'Educación física', 1),
(4283, 'Educación física y recreación', 1),
(4284, 'Educación preescolar', 1),
(4285, 'Electromecánica', 1),
(4286, 'Electromedicina', 1),
(4287, 'Electrónica', 1),
(4288, 'Electrónica industrial', 1),
(4289, 'Electrónica y telecomunicaciones', 1),
(4290, 'Explosivos', 1),
(4291, 'Finanzas y sistemas contables', 1),
(4292, 'Fotografía', 1),
(4293, 'Fotografía judicial', 1),
(4294, 'Fotografía y camarografita', 1),
(4295, 'Gestión de pequeñas y medianas empresas', 1),
(4296, 'Gestión de servicios gerontológicos', 1),
(4297, 'Gestión empresarial', 1),
(4298, 'Hotelería', 1),
(4299, 'Identificación de automotores', 1),
(4300, 'Informática contable y financiera', 1),
(4301, 'Informática gerencial', 1),
(4302, 'Informática secretarial', 1),
(4303, 'Ingeniería agropecuaria', 1),
(4304, 'Ingeniería automotriz', 1),
(4305, 'Ingeniería comercial', 1),
(4306, 'Ingeniería de alimentos', 1),
(4307, 'Ingeniería de sistemas', 1),
(4308, 'Ingeniería industrial', 1),
(4309, 'Ingeniería térmica', 1),
(4310, 'Ingeniería textil', 1),
(4311, 'Instrumentación quirúrgica', 1),
(4312, 'Inteligencia', 1),
(4313, 'Laboratorio dental', 1),
(4314, 'Laboratorio medico', 1),
(4315, 'Logística de producción y distribución', 1),
(4316, 'Mantenimiento de computadores', 1),
(4317, 'Mantenimiento electrónico', 1),
(4318, 'Marketing internacional', 1),
(4319, 'Mecánica automotriz', 1),
(4320, 'Mercadeo e informática', 1),
(4321, 'Mercadeo y comercialización', 1),
(4322, 'Mercadeo y ventas', 1),
(4323, 'Mercadeo, publicidad y ventas', 1),
(4324, 'Mercado y finanzas', 1),
(4325, 'Mercadotecnia', 1),
(4326, 'Microempresas y cooperativas', 1),
(4327, 'Minería', 1),
(4328, 'Nuevas tecnologías informáticas', 1),
(4329, 'Optometría', 1),
(4330, 'Periodismo', 1),
(4331, 'Periodismo deportivo', 1),
(4332, 'Planimetría', 1),
(4333, 'Policía judicial', 1),
(4334, 'Procesos industriales', 1),
(4335, 'Procesos mecánicos con énfasis producción agr', 1),
(4336, 'Producción agropecuaria', 1),
(4337, 'Producción de semillas', 1),
(4338, 'Producción de televisión', 1),
(4339, 'Producción y desarrollo industrial', 1),
(4340, 'Programación de computadores', 1),
(4341, 'Promoción social', 1),
(4342, 'Publicidad', 1),
(4343, 'Publicidad y diseño', 1),
(4344, 'Publicidad y diseño publicitario', 1),
(4345, 'Radiología medica', 1),
(4346, 'Realización de video', 1),
(4347, 'Recreación dirigida', 1),
(4348, 'Recursos energéticos', 1),
(4349, 'Relaciones industriales', 1),
(4350, 'Relaciones públicas y comunicación', 1),
(4351, 'Rendimiento deportivo', 1),
(4352, 'Salud ocupacional y seguridad industrial', 1),
(4353, 'Salud y rendimiento humano', 1),
(4354, 'Secretariado', 1),
(4355, 'Secretariado bilingüe', 1),
(4356, 'Secretariado bilingüe y de sistemas', 1),
(4357, 'Secretariado comercial', 1),
(4358, 'Secretariado contable de sistemas', 1),
(4359, 'Secretariado ejecutivo', 1),
(4360, 'Secretariado ejecutivo bilingüe', 1),
(4361, 'Secretariado ejecutivo de sistemas', 1),
(4362, 'Secretariado ejecutivo y de sistemas bilingüe', 1),
(4363, 'Secretariado gerencial', 1),
(4364, 'Seguridad e higiene industrial', 1),
(4365, 'Seguridad e higiene ocupacional', 1),
(4366, 'Servicios a bordo', 1),
(4367, 'Sistemas', 1),
(4368, 'Sistemas contables y financieros', 1),
(4369, 'Sistemas y análisis de la computación', 1),
(4370, 'Sistemas y computación', 1),
(4371, 'Sistematización', 1),
(4372, 'Técnicas agropecuarias', 1),
(4373, 'Técnicas forestales', 1),
(4374, 'Técnico de laboratorio', 1),
(4375, 'Técnico hotelero', 1),
(4376, 'Tecnología de plásticos', 1),
(4377, 'Telecomunicaciones', 1),
(4378, 'Topografía', 1),
(4379, 'Turismo', 1),
(4380, 'Agrícola', 2),
(4381, 'Agroindustrial', 2),
(4382, 'Agropecuaria', 2),
(4383, 'Bilingüe en administración de empresas', 2),
(4384, 'Bilingüe en comercio exterior', 2),
(4385, 'De alimentos', 2),
(4386, 'Deportiva', 2),
(4387, 'Eléctrica', 2),
(4388, 'Electrónica', 2),
(4389, 'Empresarial', 2),
(4390, 'Empresarial y de negocios', 2),
(4391, 'Acuicultura', 2),
(4392, 'Administración aeronáutica', 2),
(4393, 'Administración agropecuaria', 2),
(4394, 'Administración bancaria', 2),
(4395, 'Administración comercial', 2),
(4396, 'Administración comercial y financiera', 2),
(4397, 'Administración de empresas', 2),
(4398, 'Administración de empresas turísticas', 2),
(4399, 'Administración de la producción', 2),
(4400, 'Administración de la producción industrial', 2),
(4401, 'Administración de negocios', 2),
(4402, 'Administración de obras civiles', 2),
(4403, 'Administración de oficinas', 2),
(4404, 'Administración de oficinas bilingües', 2),
(4405, 'Administración de personal', 2),
(4406, 'Administración de redes de computadores', 2),
(4407, 'Administración de redes de datos', 2),
(4408, 'Administración de riesgos y seguros', 2),
(4409, 'Administración de seguros', 2),
(4410, 'Administración de servicios de salud', 2),
(4411, 'Administración de sistemas', 2),
(4412, 'Administración de sistemas de información', 2),
(4413, 'Administración de ventas', 2),
(4414, 'Administración del transporte', 2),
(4415, 'Administración del turismo social', 2),
(4416, 'Administración deportivas', 2),
(4417, 'Administración documental', 2),
(4418, 'Administración financiera', 2),
(4419, 'Administración hospitalaria', 2),
(4420, 'Administración hotelera', 2),
(4421, 'Administración industrial', 2),
(4422, 'Administración informática', 2),
(4423, 'Administración judicial', 2),
(4424, 'Administración municipal', 2),
(4425, 'Administración naviera y portuaria', 2),
(4426, 'Administración tributaria', 2),
(4427, 'Administración turística', 2),
(4428, 'Administración y finanzas', 2),
(4429, 'Admón. De aerolíneas y agencias de viaje', 2),
(4430, 'Admón. De empresas de economía solidaria', 2),
(4431, 'Admón. De negocios internacionales', 2),
(4432, 'Alimentos', 2),
(4433, 'Análisis y diseño de sistemas', 2),
(4434, 'Análisis y programación de computadores', 2),
(4435, 'Arte y decoración arquitectónica', 2),
(4436, 'Auditoria y control interno', 2),
(4437, 'Auditoria y costos', 2),
(4438, 'Automatización industrial', 2),
(4439, 'Banca e instituciones financieras', 2),
(4440, 'Café y diversificación', 2),
(4441, 'Cerámica', 2),
(4442, 'Cine y fotografía', 2),
(4443, 'Citohistologia', 2),
(4444, 'Comercio exterior', 2),
(4445, 'Comercio internacional', 2),
(4446, 'Computación', 2),
(4447, 'Computación grafica', 2),
(4448, 'Comunicación publicitaria', 2),
(4449, 'Comunicaciones aeronáuticas', 2),
(4450, 'Conmutación', 2),
(4451, 'Construcción', 2),
(4452, 'Construcción de obras civiles', 2),
(4453, 'Contabilidad', 2),
(4454, 'Contabilidad sistematizada', 2),
(4455, 'Contaduría', 2),
(4456, 'Contaduría publica', 2),
(4457, 'Control de calidad', 2),
(4458, 'Criminalística', 2),
(4459, 'Desarrollo del software', 2),
(4460, 'Dibujo arquitectónico de ingeniería', 2),
(4461, 'Dibujo industrial', 2),
(4462, 'Dirección de ventas', 2),
(4463, 'Dirección y producción de televisión', 2),
(4464, 'Diseño de interiores', 2),
(4465, 'Diseño de modas', 2),
(4466, 'Diseño grafico', 2),
(4467, 'Diseño industrial', 2),
(4468, 'Diseño textil', 2),
(4469, 'Diseño y decoración de espacios arqu', 2),
(4470, 'Docencia rural', 2),
(4471, 'Educación básica primaria', 2),
(4472, 'Educación especial', 2),
(4473, 'Educación física', 2),
(4474, 'Educación para el desarrollo de la c', 2),
(4475, 'Educación preescolar', 2),
(4476, 'Electricidad', 2),
(4477, 'Electricidad industrial', 2),
(4478, 'Electrificación y telefonía rural', 2),
(4479, 'Electromecánica', 2),
(4480, 'Electrónica aeronáutica', 2),
(4481, 'Electrónica y automatización industr', 2),
(4482, 'Electrónica y comunicaciones', 2),
(4483, 'Electrónica y telecomunicaciones', 2),
(4484, 'Electroquímica', 2),
(4485, 'Empresas turísticas y hoteleras', 2),
(4486, 'Estadística e informática', 2),
(4487, 'Estudios policiales', 2),
(4488, 'Finanzas y comercio internacional', 2),
(4489, 'Finanzas y sistemas contables', 2),
(4490, 'Fisioterapia', 2),
(4491, 'Gerontología', 2),
(4492, 'Gestión agropecuaria', 2),
(4493, 'Gestión bancaria y financiera', 2),
(4494, 'Gestión comercial y de negocios', 2),
(4495, 'Gestión de empresas asoc. Y organiz.', 2),
(4496, 'Gestión de obras civiles y construci', 2),
(4497, 'Gestión de servicios públicos sanita', 2),
(4498, 'Gestión de transportes', 2),
(4499, 'Gestión empresarial', 2),
(4500, 'Gestión empresarial y de negocios', 2),
(4501, 'Gestión industrial', 2),
(4502, 'Gestión informática', 2),
(4503, 'Gestión y administración de empresas', 2),
(4504, 'Higiene y seguridad industrial', 2),
(4505, 'Informática', 2),
(4506, 'Instrumentación industrial', 2),
(4507, 'Instrumentación quirúrgica', 2),
(4508, 'Instrumentación y controles industria', 2),
(4509, 'Investigación judicial', 2),
(4510, 'Laboratorio de prótesis dental', 2),
(4511, 'Laboratorio de rehabilitación dental', 2),
(4512, 'Laboratorio dental', 2),
(4513, 'Lácteos', 2),
(4514, 'Logística de producción distribución', 2),
(4515, 'Maderas', 2),
(4516, 'Mantenimiento aeronáutico', 2),
(4517, 'Mecánica automotriz', 2),
(4518, 'Medicina veterinaria y zootecnia', 2),
(4519, 'Mercadeo agropecuario', 2),
(4520, 'Mercadeo y comercialización', 2),
(4521, 'Mercadeo y finanzas', 2),
(4522, 'Mercadeo y negocios internacionales', 2),
(4523, 'Mercadeo y publicidad', 2),
(4524, 'Mercadeo y ventas', 2),
(4525, 'Mercadotecnia', 2),
(4526, 'Mercadotecnia y publicidad', 2),
(4527, 'Mercadotecnia y ventas', 2),
(4528, 'Minas', 2),
(4529, 'Minería', 2),
(4530, 'Negocios internacionales', 2),
(4531, 'Obras civiles', 2),
(4532, 'Periodismo', 2),
(4533, 'Plásticos', 2),
(4534, 'Producción agraria', 2),
(4535, 'Producción agrícola', 2),
(4536, 'Producción agropecuaria', 2),
(4537, 'Producción animal', 2),
(4538, 'Producción industrial', 2),
(4539, 'Promoción social', 2),
(4540, 'Publicidad', 2),
(4541, 'Publicidad y comercialización', 2),
(4542, 'Publicidad y comunicación', 2),
(4543, 'Publicidad y mercadeo', 2),
(4544, 'Química de productos vegetales', 2),
(4545, 'Química industrial', 2),
(4546, 'Radiología e imágenes', 2),
(4547, 'Recreación dirigida', 2),
(4548, 'Recursos hídricos', 2),
(4549, 'Recursos naturales renovables', 2),
(4550, 'Redes y comunicaciones de datos', 2),
(4551, 'Regencia de farmacia', 2),
(4552, 'Relaciones industriales', 2),
(4553, 'Salud comunitaria', 2),
(4554, 'Salud ocupacional', 2),
(4555, 'Saneamiento ambiental', 2),
(4556, 'Secretariado bilingüe', 2),
(4557, 'Secretariado bilingüe y computación', 2),
(4558, 'Secretariado comercial bilingüe', 2),
(4559, 'Secretariado ejecutivo', 2),
(4560, 'Secretariado ejecutivo bilingüe', 2),
(4561, 'Secretariado ejecutivo bilingüe espa', 2),
(4562, 'Secretariado ejecutivo con énfasis e', 2),
(4563, 'Seguridad aeronáutica', 2),
(4564, 'Seguridad e higiene ocupacional', 2),
(4565, 'Sistemas', 2),
(4566, 'Sistemas contables', 2),
(4567, 'Sistemas de información', 2),
(4568, 'Sistemas de información en salud', 2),
(4569, 'Sistemas industriales', 2),
(4570, 'Sistemas y computación', 2),
(4571, 'Sistematización de datos', 2),
(4572, 'Supervisión de industria y comercio', 2),
(4573, 'Terapia del lenguaje', 2),
(4574, 'Terapia recreativa', 2),
(4575, 'Terapia respiratoria', 2),
(4576, 'Textiles y moda', 2),
(4577, 'Topografía', 2),
(4578, 'Traducción turística', 2),
(4579, 'Tributación', 2),
(4580, 'Turismo recreativo', 2),
(4581, 'Turismo y relaciones industriales', 2),
(4582, 'Zootecnia', 2),
(4583, 'Forestal', 2),
(4584, 'Industrial', 2),
(4585, 'Mecánica', 2),
(4586, 'Naval en electromecánica', 2),
(4587, 'Naval en electrónica', 2),
(4588, 'Naviera', 2),
(4589, 'Pecuaria', 2),
(4590, 'Química', 2),
(4591, 'Textil', 2),
(4592, 'Abogado', 3),
(4593, 'Administración', 3),
(4594, 'Administración aeronáutica', 3),
(4595, 'Administración agroindustrial', 3),
(4596, 'Administración agropecuaria', 3),
(4597, 'Administración de comercio exterior', 3),
(4598, 'Administración de desarrollo agroindustrial', 3),
(4599, 'Administración de empresas', 3),
(4600, 'Administración de empresas agrarias', 3),
(4601, 'Administración de empresas agroindustriales', 3),
(4602, 'Administración de empresas agropecuarias', 3),
(4603, 'Administración de empresas cooperativas', 3),
(4604, 'Administración de empresas turísticas', 3),
(4605, 'Administración de empresas turísticas y hotel', 3),
(4606, 'Administración de instituciones de servicio', 3),
(4607, 'Administración de mercadeo agropecuario', 3),
(4608, 'Administración de negocios', 3),
(4609, 'Administración de negocios con énfasis en fin', 3),
(4610, 'Administración de obras civiles', 3),
(4611, 'Administración de recursos costeros y marinos', 3),
(4612, 'Administración de sistemas de información', 3),
(4613, 'Administración del desarrollo social', 3),
(4614, 'Administración del medio ambiente', 3),
(4615, 'Administración empresarial y publica', 3),
(4616, 'Administración en recursos humanos', 3),
(4617, 'Administración financiera', 3),
(4618, 'Administración financiera y de sistemas', 3),
(4619, 'Administración hotelera', 3),
(4620, 'Administración hotelera y de turismo', 3),
(4621, 'Administración industrial', 3),
(4622, 'Administración informática', 3),
(4623, 'Administración marítima', 3),
(4624, 'Administración para el desarrollo regional', 3),
(4625, 'Administración policial', 3),
(4626, 'Administración regional y urbana', 3),
(4627, 'Administración turística y hotelera', 3),
(4628, 'Administración y finanzas', 3),
(4629, 'Admon. Empresas nefas. Desarrollo de la capac', 3),
(4630, 'Agrología', 3),
(4631, 'Agronomía', 3),
(4632, 'Anatomopatologo', 3),
(4633, 'Antropología', 3),
(4634, 'Arquitectura', 3),
(4635, 'Arquitectura de interiores', 3),
(4636, 'Arquitectura y urbanismo', 3),
(4637, 'Artes escénicas', 3),
(4638, 'Artes musicales', 3),
(4639, 'Artes plásticas', 3),
(4640, 'Artes representativas', 3),
(4641, 'Bachiller académico', 3),
(4642, 'Bacteriología', 3),
(4643, 'Bacteriología y laboratorio clínico', 3),
(4644, 'Bellas artes', 3),
(4645, 'Bibliotecología', 3),
(4646, 'Bibliotecología y archivística', 3),
(4647, 'Biología con énfasis en biotecnología', 3),
(4648, 'Biología con énfasis en recursos naturales', 3),
(4649, 'Biología marina', 3),
(4650, 'Biología y química', 3),
(4651, 'Biólogo', 3),
(4652, 'Castellano - literatura', 3),
(4653, 'Ciencia política', 3),
(4654, 'Ciencias de enfermería y biología', 3),
(4655, 'Ciencias de la comercialización', 3),
(4656, 'Ciencias de la información y la documentación', 3),
(4657, 'Ciencias del deporte', 3),
(4658, 'Ciencias políticas', 3),
(4659, 'Ciencias políticas y administrativas', 3),
(4660, 'Cine y televisión', 3),
(4661, 'Comercio exterior', 3),
(4662, 'Comercio internacional', 3),
(4663, 'Comunicación social', 3),
(4664, 'Comunicación social énfasis en producción y a', 3),
(4665, 'Comunicación social formación básica en perio', 3),
(4666, 'Comunicación social institucional', 3),
(4667, 'Comunicación social- periodismo', 3),
(4668, 'Conservación y restauración de bienes muebles', 3),
(4669, 'Construcción', 3),
(4670, 'Contaduría publica', 3),
(4671, 'Contaduría pública- énfasis en sistemas y eco', 3),
(4672, 'Criminalística', 3),
(4673, 'Cultura física y deporte', 3),
(4674, 'Deporte y recreación', 3),
(4675, 'Derecho', 3),
(4676, 'Derecho ciencias políticas y sociales', 3),
(4677, 'Derecho y ciencias administrativas', 3),
(4678, 'Derecho y ciencias políticas', 3),
(4679, 'Derecho y ciencias sociales', 3),
(4680, 'Desarrollo familiar', 3),
(4681, 'Dibujo arquitectónico', 3),
(4682, 'Dirección musical', 3),
(4683, 'Dirección y producción de radio y televisión', 3),
(4684, 'Diseño de modas y textiles', 3),
(4685, 'Diseño grafico', 3),
(4686, 'Diseño industrial', 3),
(4687, 'Diseño visual', 3),
(4688, 'Ecología', 3),
(4689, 'Economía', 3),
(4690, 'Economía agraria', 3),
(4691, 'Economía agrícola', 3),
(4692, 'Economía de empresas', 3),
(4693, 'Economía general', 3),
(4694, 'Economía industrial', 3),
(4695, 'Economía y desarrollo', 3),
(4696, 'Educación musical', 3),
(4697, 'Ejecución instrumental', 3),
(4698, 'Enfermería', 3),
(4699, 'Enfermería comunitaria', 3),
(4700, 'Estadística', 3),
(4701, 'Estadística administrativa', 3),
(4702, 'Estadística e informática', 3),
(4703, 'Estudios diplomáticos en internacionales', 3),
(4704, 'Estudios en ciencia política', 3),
(4705, 'Estudios musicales', 3),
(4706, 'Estudios superiores en instrumento o canto', 3),
(4707, 'Farmacia', 3),
(4708, 'Filología e idiomas - alemán', 3),
(4709, 'Filología e idiomas - español', 3),
(4710, 'Filología e idiomas - francés', 3),
(4711, 'Filología e idiomas - humanidades', 3),
(4712, 'Filología e idiomas - ingles', 3),
(4713, 'Filología espa? Ola', 3),
(4714, 'Filosofía', 3),
(4715, 'Filosofía y humanidades', 3),
(4716, 'Filosofía y letras', 3),
(4717, 'Finanzas y comercio exterior', 3),
(4718, 'Finanzas y comercio internacional', 3),
(4719, 'Finanzas y negocios internacionales', 3),
(4720, 'Finanzas y relaciones internacionales', 3),
(4721, 'Física', 3),
(4722, 'Fisioterapia', 3),
(4723, 'Fonoaudiología', 3),
(4724, 'Geografía', 3),
(4725, 'Geología', 3),
(4726, 'Gerontología', 3),
(4727, 'Gestión empresarial', 3),
(4728, 'Guitarrista', 3),
(4729, 'Historia', 3),
(4730, 'Idiomas', 3),
(4731, 'Industrias pecuarias', 3),
(4732, 'Ingeniería administrativa', 3),
(4733, 'Ingeniería agrícola', 3),
(4734, 'Ingeniería agroindustrial', 3),
(4735, 'Ingeniería agronómica', 3),
(4736, 'Ingeniería ambiental', 3),
(4737, 'Ingeniería ambiental y sanitaria', 3),
(4738, 'Ingeniería biomédica', 3),
(4739, 'Ingeniería catastral y geodesia', 3),
(4740, 'Ingeniería civil', 3),
(4741, 'Ingeniería de alimentos', 3),
(4742, 'Ingeniería de diseño y automatización electró', 3),
(4743, 'Ingeniería de materiales', 3),
(4744, 'Ingeniería de mercados', 3),
(4745, 'Ingeniería de minas', 3),
(4746, 'Ingeniería de minas y metalurgia', 3),
(4747, 'Ingeniería de petróleos', 3),
(4748, 'Ingeniería de procesos', 3),
(4749, 'Ingeniería de producción', 3),
(4750, 'Ingeniería de producción agroindustrial', 3),
(4751, 'Ingeniería de recursos naturales y medio ambi', 3),
(4752, 'Ingeniería de sistemas', 3),
(4753, 'Ingeniería de sistemas con énfasis en admón. ', 3),
(4754, 'Ingeniería de sistemas con énfasis en software', 3),
(4755, 'Ingeniería de sistemas con énfasis en tele co', 3),
(4756, 'Ingeniería de sistemas de información', 3),
(4757, 'Ingeniería de sistemas y computación', 3),
(4758, 'Ingeniería de sistemas: énfasis en administra', 3),
(4759, 'Ingeniería de transporte y vías', 3),
(4760, 'Ingeniería del desarrollo ambiental', 3),
(4761, 'Ingeniería del medio ambiente', 3),
(4762, 'Ingeniería eléctrica', 3),
(4763, 'Ingeniería electricista', 3),
(4764, 'Ingeniería electromecánica', 3),
(4765, 'Ingeniería electrónica', 3),
(4766, 'Ingeniería electrónica y de computadores', 3),
(4767, 'Ingeniería electrónica y telecomunicaciones', 3),
(4768, 'Ingeniería en automatización industrial', 3),
(4769, 'Ingeniería en instrumentación y control', 3),
(4770, 'Ingeniería energética', 3),
(4771, 'Ingeniería financiera', 3),
(4772, 'Ingeniería forestal', 3),
(4773, 'Ingeniería geográfica', 3),
(4774, 'Ingeniería geológica', 3),
(4775, 'Ingeniería industrial', 3),
(4776, 'Ingeniería industrial de alimentos', 3),
(4777, 'Ingeniería mecánica', 3),
(4778, 'Ingeniería metalúrgica', 3),
(4779, 'Ingeniería naval - especialidad construccione', 3),
(4780, 'Ingeniería naval - especialidad electrónica', 3),
(4781, 'Ingeniería naval - especialidad mecánica', 3),
(4782, 'Ingeniería pesquera', 3),
(4783, 'Ingeniería química', 3),
(4784, 'Ingeniería sanitaria', 3),
(4785, 'Ingeniería telemática', 3),
(4786, 'Ingeniería textil', 3),
(4787, 'Instrumentación quirúrgica', 3),
(4788, 'Lenguas clásicas', 3),
(4789, 'Lic.  Educ. Especial- problemas del aprendiz.', 3),
(4790, 'Lic. Educ. Especial: problemas desarrollo y a', 3),
(4791, 'Lic. En ciencias religiosas énfasis catequesi', 3),
(4792, 'Lic. En ciencias sociales: gestión del desarr', 3),
(4793, 'Lic. En educación básica primaria:enf. En cie', 3),
(4794, 'Licenciatura educación preescolar y promoción', 3),
(4795, 'Licenciatura educación primaria y promoción d', 3),
(4796, 'Licenciatura en administración educativa', 3),
(4797, 'Licenciatura en administración y supervisión ', 3),
(4798, 'Licenciatura en agropecuarias', 3),
(4799, 'Licenciatura en arte dramático', 3),
(4800, 'Licenciatura en arte escénico', 3),
(4801, 'Licenciatura en artes graficas', 3),
(4802, 'Licenciatura en artes plásticas', 3),
(4803, 'Licenciatura en artes visuales', 3),
(4804, 'Licenciatura en bacteriología y ciencias natu', 3),
(4805, 'Licenciatura en básica primaria con énfasis e', 3),
(4806, 'Licenciatura en bellas artes', 3),
(4807, 'Licenciatura en biología', 3),
(4808, 'Licenciatura en biología y educación ambienta', 3),
(4809, 'Licenciatura en biología y química', 3),
(4810, 'Licenciatura en catequesis', 3),
(4811, 'Licenciatura en ciencias agropecuarias', 3),
(4812, 'Licenciatura en ciencias de la educación', 3),
(4813, 'Licenciatura en ciencias de la educación filo', 3),
(4814, 'Licenciatura en ciencias de la educación filo', 3),
(4815, 'Licenciatura en ciencias de la educación físi', 3),
(4816, 'Licenciatura en ciencias de la educación mate', 3),
(4817, 'Licenciatura en ciencias de la educación quím', 3),
(4818, 'Licenciatura en ciencias físicas', 3),
(4819, 'Licenciatura en ciencias naturales', 3),
(4820, 'Licenciatura en ciencias pedagógicas', 3),
(4821, 'Licenciatura en ciencias políticas y administ', 3),
(4822, 'Licenciatura en ciencias religiosa y éticas', 3),
(4823, 'Licenciatura en ciencias religiosas', 3),
(4824, 'Licenciatura en ciencias sociales', 3),
(4825, 'Licenciatura en ciencias sociales e historia', 3),
(4826, 'Licenciatura en ciencias sociales y construcc', 3),
(4827, 'Licenciatura en ciencias sociales y económica', 3),
(4828, 'Licenciatura en ciencias sociales y geografía', 3),
(4829, 'Licenciatura en comercio', 3),
(4830, 'Licenciatura en comercio y contaduría', 3),
(4831, 'Licenciatura en danzas y teatro', 3),
(4832, 'Licenciatura en decoración arquitectónico', 3),
(4833, 'Licenciatura en dibujo de la construcción', 3),
(4834, 'Licenciatura en dibujo mecánico', 3),
(4835, 'Licenciatura en didáctica y dificultades del ', 3),
(4836, 'Licenciatura en docencia comercial', 3),
(4837, 'Licenciatura en docencia de computadores', 3),
(4838, 'Licenciatura en docencia de procesos industri', 3),
(4839, 'Licenciatura en docencia de sistemas y comput', 3),
(4840, 'Licenciatura en docencia del área agropecuari', 3),
(4841, 'Licenciatura en docencia del diseño', 3),
(4842, 'Licenciatura en economía del hogar', 3),
(4843, 'Licenciatura en educa. Con especialidad en es', 3),
(4844, 'Licenciatura en educa. Esp. Audiov. Y psicope', 3),
(4845, 'Licenciatura en educa. Esp. Filosofía y letra', 3),
(4846, 'Licenciatura en educa. Espe. Tecnología indus', 3),
(4847, 'Licenciatura en educa. Mayores ingles y franc', 3),
(4848, 'Licenciatura en educación ambiental', 3),
(4849, 'Licenciatura en educación básica primaria', 3),
(4850, 'Licenciatura en educación- biología', 3),
(4851, 'Licenciatura en educación ciencias sociales', 3),
(4852, 'Licenciatura en educación de adultos', 3),
(4853, 'Licenciatura en educación electrónica', 3),
(4854, 'Licenciatura en educación electrotécnica', 3),
(4855, 'Licenciatura en educación español y comunicac', 3),
(4856, 'Licenciatura en educación español y lenguas', 3),
(4857, 'Licenciatura en educación especial', 3),
(4858, 'Licenciatura en educación especial- tiflologí', 3),
(4859, 'Licenciatura en educación especial: retardo e', 3),
(4860, 'Licenciatura en educación especialidad en mat', 3),
(4861, 'Licenciatura en educación física', 3),
(4862, 'Licenciatura en educación física y deportes', 3),
(4863, 'Licenciatura en educación física y recreación', 3),
(4864, 'Licenciatura en educación física ysalud', 3),
(4865, 'Licenciatura en educación francés', 3),
(4866, 'Licenciatura en educación- historia y filosof', 3),
(4867, 'Licenciatura en educación idiomas', 3),
(4868, 'Licenciatura en educación industrial', 3),
(4869, 'Licenciatura en educación infantil', 3),
(4870, 'Licenciatura en educación ingles', 3),
(4871, 'Licenciatura en educación mecánica industrial', 3),
(4872, 'Licenciatura en educación musical', 3),
(4873, 'Licenciatura en educación pedagogía musical', 3),
(4874, 'Licenciatura en educación preescolar', 3),
(4875, 'Licenciatura en educación preescolar y básica', 3),
(4876, 'Licenciatura en educación primaria', 3),
(4877, 'Licenciatura en educación psicología y pedago', 3),
(4878, 'Licenciatura en educación religiosa y moral', 3),
(4879, 'Licenciatura en educación rural', 3),
(4880, 'Licenciatura en educación teología', 3),
(4881, 'Licenciatura en educación y ciencias religios', 3),
(4882, 'Licenciatura en electricidad y electrónica', 3),
(4883, 'Licenciatura en electromecánica', 3),
(4884, 'Licenciatura en electrotecnia', 3),
(4885, 'Licenciatura en enseñanza de lenguas extranje', 3),
(4886, 'Licenciatura en español y literatura', 3),
(4887, 'Licenciatura en estudios bíblicos', 3),
(4888, 'Licenciatura en etnoeducacion y desarrollo co', 3),
(4889, 'Licenciatura en filología', 3),
(4890, 'Licenciatura en filología e idiomas ingles-fr', 3),
(4891, 'Licenciatura en filosofía', 3),
(4892, 'Licenciatura en filosofía con énfasis en teor', 3),
(4893, 'Licenciatura en filosofía e historia', 3),
(4894, 'Licenciatura en filosofía e idiomas', 3),
(4895, 'Licenciatura en filosofía y ciencias religios', 3),
(4896, 'Licenciatura en filosofía y humanidades', 3),
(4897, 'Licenciatura en filosofía y letras', 3),
(4898, 'Licenciatura en filosofía y teología', 3),
(4899, 'Licenciatura en física', 3),
(4900, 'Licenciatura en física y matemáticas', 3),
(4901, 'Licenciatura en formación estética', 3),
(4902, 'Licenciatura en geografía e historia', 3),
(4903, 'Licenciatura en historia', 3),
(4904, 'Licenciatura en historia de colombia', 3),
(4905, 'Licenciatura en historia y filosofía', 3),
(4906, 'Licenciatura en historia y filosofía', 3),
(4907, 'Licenciatura en idiomas', 3),
(4908, 'Licenciatura en idiomas español-ingles', 3),
(4909, 'Licenciatura en idiomas modernos español-fran', 3),
(4910, 'Licenciatura en idiomas modernos español-ingl', 3),
(4911, 'Licenciatura en informática', 3),
(4912, 'Licenciatura en informática educativa', 3),
(4913, 'Licenciatura en ingles', 3),
(4914, 'Licenciatura en ingles y humanidades', 3),
(4915, 'Licenciatura en lenguas modernar español y fr', 3),
(4916, 'Licenciatura en lenguas modernas', 3),
(4917, 'Licenciatura en lenguas modernas español e in', 3),
(4918, 'Licenciatura en lenguas modernas español fran', 3),
(4919, 'Licenciatura en lenguas modernas español ingl', 3),
(4920, 'Licenciatura en lenguas modernas ingles-franc', 3),
(4921, 'Licenciatura en lingüística y educación indíg', 3),
(4922, 'Licenciatura en lingüística y literatura', 3),
(4923, 'Licenciatura en literatura', 3),
(4924, 'Licenciatura en literatura y lengua espa? Ola', 3),
(4925, 'Licenciatura en matemáticas', 3),
(4926, 'Licenciatura en matemáticas y computación', 3),
(4927, 'Licenciatura en matemáticas y estadística', 3),
(4928, 'Licenciatura en matemáticas y física', 3),
(4929, 'Licenciatura en mecánica industrial', 3),
(4930, 'Licenciatura en música', 3),
(4931, 'Licenciatura en nutrición y dietética', 3),
(4932, 'Licenciatura en orientación y consejería', 3),
(4933, 'Licenciatura en pedagogía', 3),
(4934, 'Licenciatura en pedagogía infantil y familiar', 3),
(4935, 'Licenciatura en pedagogía para la salud', 3),
(4936, 'Licenciatura en pedagogía reeducativa', 3),
(4937, 'Licenciatura en pedagogía social y comunitari', 3),
(4938, 'Licenciatura en pedagogía y psicología', 3),
(4939, 'Licenciatura en preescolar', 3),
(4940, 'Licenciatura en producción agropecuaria', 3),
(4941, 'Licenciatura en promoción de  la comunidad', 3),
(4942, 'Licenciatura en psicología', 3),
(4943, 'Licenciatura en psicología educativa', 3),
(4944, 'Licenciatura en psicología y administración e', 3),
(4945, 'Licenciatura en psicología y filosofía', 3),
(4946, 'Licenciatura en psicopedagogía', 3),
(4947, 'Licenciatura en psicopedagogía y filosofía', 3),
(4948, 'Licenciatura en química', 3),
(4949, 'Licenciatura en química y biología', 3),
(4950, 'Licenciatura en sociales', 3),
(4951, 'Licenciatura en supervisión educativa', 3),
(4952, 'Licenciatura en tecnología educativa', 3),
(4953, 'Licenciatura en tecnología industrial', 3),
(4954, 'Licenciatura en teología', 3),
(4955, 'Lingüística y literatura', 3),
(4956, 'Literatura', 3),
(4957, 'Maestría en composición musical', 3),
(4958, 'Maestro en piano', 3),
(4959, 'Manejo agroforestal', 3),
(4960, 'Manejo agrologico y de post-cosecha', 3),
(4961, 'Matemáticas', 3),
(4962, 'Matemáticas y física', 3),
(4963, 'Medicina general', 3),
(4964, 'Medicina veterinaria', 3),
(4965, 'Medicina y cirugía', 3),
(4966, 'Medicina y neurocirugía', 3),
(4967, 'Medicina y radiología', 3),
(4968, 'Mercadeo', 3),
(4969, 'Mercadeo con énfasis en negocios internaciona', 3),
(4970, 'Mercadeo nacional e internacional', 3),
(4971, 'Mercadeo publicidad y ventas', 3),
(4972, 'Mercadeo y publicidad', 3),
(4973, 'Mercadología', 3),
(4974, 'Mercadotecnia', 3),
(4975, 'Mercadotecnia agroindustrial', 3),
(4976, 'Metalistería', 3),
(4977, 'Microbiología', 3),
(4978, 'Microbiología agrícola y veterinaria', 3),
(4979, 'Microbiología con énfasis en alimentos', 3),
(4980, 'Microbiología industrial', 3),
(4981, 'Música', 3),
(4982, 'Música canto', 3),
(4983, 'Música instrumental', 3),
(4984, 'Música instrumento', 3),
(4985, 'Negocios internacionales', 3),
(4986, 'Neurología infantil', 3),
(4987, 'Normalista superior', 3),
(4988, 'Nutricionista dietista', 3),
(4989, 'Oceanografía', 3),
(4990, 'Odontología', 3),
(4991, 'Optometría', 3),
(4992, 'Patología clínica', 3),
(4993, 'Pintura', 3),
(4994, 'Planeación para el desarrollo social', 3),
(4995, 'Profesional en  lenguas modernas', 3),
(4996, 'Profesional en ciencia de la información y la', 3),
(4997, 'Psicología', 3),
(4998, 'Psicología organizacional', 3),
(4999, 'Psicólogo', 3),
(5000, 'Psicopedagogía y administración educativa', 3),
(5001, 'Psiquiatría', 3),
(5002, 'Publicidad', 3),
(5003, 'Publicidad y mercadeo', 3),
(5004, 'Química', 3),
(5005, 'Química de alimentos', 3),
(5006, 'Química farmacéutica', 3),
(5007, 'Química y farmacia', 3),
(5008, 'Químico', 3),
(5009, 'Recreación', 3),
(5010, 'Relaciones económicas internacionales', 3),
(5011, 'Sacerdote', 3),
(5012, 'Sociología', 3),
(5013, 'Teatro', 3),
(5014, 'Teología', 3),
(5015, 'Terapia física', 3),
(5016, 'Terapia ocupacional', 3),
(5017, 'Terapia respiratoria', 3),
(5018, 'Terapias psicosociales', 3),
(5019, 'Textiles', 3),
(5020, 'Trabajo social', 3),
(5021, 'Traducción e interpretación ruso - español', 3),
(5022, 'Traducción simultanea', 3),
(5023, 'Básica primaria', 4),
(5024, 'Bachiller académico', 5),
(5025, 'Bachiller técnico', 6),
(5026, 'Ingeniería de software', 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedores`
--

CREATE TABLE `proveedores` (
  `nitProveedor` int(11) NOT NULL,
  `nombreProveedor` varchar(45) NOT NULL,
  `direccionProveedor` varchar(45) NOT NULL,
  `telefonoFijoProveedor` varchar(10) DEFAULT NULL,
  `telefonoMovilProveedor` varchar(10) DEFAULT NULL,
  `correoProveedor` varchar(45) DEFAULT NULL,
  `latitud` varchar(45) DEFAULT NULL,
  `longitud` varchar(45) DEFAULT NULL,
  `descripcionProveedor` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `referenciabancaria`
--

CREATE TABLE `referenciabancaria` (
  `idreferenciaBancaria` int(11) NOT NULL,
  `numeroCuenta` varchar(45) DEFAULT NULL,
  `sucursal` varchar(45) DEFAULT NULL,
  `bancos_idbanco` int(11) NOT NULL,
  `clientes_idCliente` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `referenciabancaria`
--

INSERT INTO `referenciabancaria` (`idreferenciaBancaria`, `numeroCuenta`, `sucursal`, `bancos_idbanco`, `clientes_idCliente`) VALUES
(1, '123443212', 'Unicentro', 237, 3),
(2, '44563554', 'Parque Sucre', 231, 1),
(3, '99876556', 'Fundadores', 238, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `referenciapersonalfamiliar`
--

CREATE TABLE `referenciapersonalfamiliar` (
  `idreferenciaPersonalFamiliar` int(11) NOT NULL,
  `nombresReferencia` varchar(45) DEFAULT NULL,
  `apellidosReferencia` varchar(45) DEFAULT NULL,
  `telefonoReferencia` varchar(10) DEFAULT NULL,
  `clientes_idCliente` int(11) NOT NULL,
  `tiporeferencia_idtipoReferencia` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `referenciapersonalfamiliar`
--

INSERT INTO `referenciapersonalfamiliar` (`idreferenciaPersonalFamiliar`, `nombresReferencia`, `apellidosReferencia`, `telefonoReferencia`, `clientes_idCliente`, `tiporeferencia_idtipoReferencia`) VALUES
(2, 'Angela Maria', 'Murcia', '3122344455', 1, 11),
(3, 'Nestor', 'García', '3211123232', 3, 12);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `regiones`
--

CREATE TABLE `regiones` (
  `idRegion` int(11) NOT NULL,
  `nombreRegion` varchar(30) DEFAULT NULL,
  `idPais` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `regiones`
--

INSERT INTO `regiones` (`idRegion`, `nombreRegion`, `idPais`) VALUES
(0, 'Sin especificar', 0),
(1, 'Región Caribe', NULL),
(2, 'Región Centro Oriente', NULL),
(3, 'Región Centro Sur', NULL),
(4, 'Región Eje Cafetero - Antioqui', NULL),
(5, 'Región Llano', NULL),
(6, 'Región Pacífico', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rol`
--

CREATE TABLE `rol` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `descripcion` varchar(2000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `rol`
--

INSERT INTO `rol` (`id`, `nombre`, `descripcion`) VALUES
(1, 'administrador', 'Super administrador del sistema, tiene todos los permisos'),
(85, 'root', 'Tiene todos los permisos, excepto configuracion de roles, usuarios y permisos de usuario');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipoactividadeconomicaarrendatario`
--

CREATE TABLE `tipoactividadeconomicaarrendatario` (
  `idtipoLaborArrendatario` int(11) NOT NULL,
  `nombreTipoLaboraArrendatario` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tipoactividadeconomicaarrendatario`
--

INSERT INTO `tipoactividadeconomicaarrendatario` (`idtipoLaborArrendatario`, `nombreTipoLaboraArrendatario`) VALUES
(36, 'Asalariado'),
(37, 'Estudiante'),
(38, 'Socio'),
(39, 'Pensionado'),
(40, 'Jubilado'),
(41, 'Rentista'),
(42, 'Otro');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipocontratoempleado`
--

CREATE TABLE `tipocontratoempleado` (
  `idtipoContratoEmpleado` int(11) NOT NULL,
  `nombreContratoEmpleado` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tipocontratoempleado`
--

INSERT INTO `tipocontratoempleado` (`idtipoContratoEmpleado`, `nombreContratoEmpleado`) VALUES
(13, 'Termino indefinido'),
(14, 'Termino fijo'),
(15, 'Por obra o labor'),
(16, 'Pro prestación de servicios'),
(17, 'De aprendizaje'),
(18, 'Ocasional o temporal');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipocuenta`
--

CREATE TABLE `tipocuenta` (
  `idtipoCuenta` int(11) NOT NULL,
  `nombreTipoCuenta` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tipocuenta`
--

INSERT INTO `tipocuenta` (`idtipoCuenta`, `nombreTipoCuenta`) VALUES
(5, 'Ahorros'),
(6, 'Corriente');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipoidentificacion`
--

CREATE TABLE `tipoidentificacion` (
  `idtipoIdentificacion` int(11) NOT NULL,
  `nombreTipoIdentificacion` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tipoidentificacion`
--

INSERT INTO `tipoidentificacion` (`idtipoIdentificacion`, `nombreTipoIdentificacion`) VALUES
(0, 'Sin especificar'),
(16, 'Cedula de ciudadania'),
(17, 'Cedula Nit'),
(18, 'Cedula de extranjería');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipopersonacliente`
--

CREATE TABLE `tipopersonacliente` (
  `idtipoPersonCliente` int(11) NOT NULL,
  `nombreTipoPersonaCliente` varchar(45) NOT NULL COMMENT 'Tipo persona Juridica o natural'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tipopersonacliente`
--

INSERT INTO `tipopersonacliente` (`idtipoPersonCliente`, `nombreTipoPersonaCliente`) VALUES
(0, 'Sin especificar'),
(11, 'Natural'),
(12, 'Jurídica');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipopqrs`
--

CREATE TABLE `tipopqrs` (
  `idtipopqrs` int(11) NOT NULL,
  `nombretipopqrs` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tipopqrs`
--

INSERT INTO `tipopqrs` (`idtipopqrs`, `nombretipopqrs`) VALUES
(1, 'Petición'),
(2, 'Queja'),
(5, 'Reclamo'),
(6, 'Sugerencia');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tiporeferencia`
--

CREATE TABLE `tiporeferencia` (
  `idtipoReferencia` int(11) NOT NULL,
  `nombreTipoReferencia` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tiporeferencia`
--

INSERT INTO `tiporeferencia` (`idtipoReferencia`, `nombreTipoReferencia`) VALUES
(11, 'Personal'),
(12, 'Familiar');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tiposangre`
--

CREATE TABLE `tiposangre` (
  `idtipoSangre` int(11) NOT NULL,
  `tipoSangre` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tiposangre`
--

INSERT INTO `tiposangre` (`idtipoSangre`, `tipoSangre`) VALUES
(17, 'A+'),
(18, 'A-'),
(19, 'B+'),
(20, 'B-'),
(21, 'O-'),
(22, 'O+'),
(23, 'AB+'),
(24, 'AB-');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tiposclientes`
--

CREATE TABLE `tiposclientes` (
  `idtipoCliente` int(11) NOT NULL,
  `nombreTipoCliente` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tiposclientes`
--

INSERT INTO `tiposclientes` (`idtipoCliente`, `nombreTipoCliente`) VALUES
(21, 'Comprador'),
(22, 'Vendedor'),
(23, 'Arrendador'),
(24, 'Arrendatario');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tiposcocinas`
--

CREATE TABLE `tiposcocinas` (
  `idtipoCocina` int(11) NOT NULL,
  `nombreTipoCocina` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tiposcocinas`
--

INSERT INTO `tiposcocinas` (`idtipoCocina`, `nombreTipoCocina`) VALUES
(16, 'Gas'),
(17, 'Eléctrica'),
(18, 'Mixta');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tiposcortinas`
--

CREATE TABLE `tiposcortinas` (
  `idtipoCortina` int(11) NOT NULL,
  `nombreTipoCortina` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tiposcortinas`
--

INSERT INTO `tiposcortinas` (`idtipoCortina`, `nombreTipoCortina`) VALUES
(11, 'Cortinas'),
(12, 'Persianas');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tiposdestacados`
--

CREATE TABLE `tiposdestacados` (
  `idtipoDestacado` int(11) NOT NULL,
  `nombreDestacado` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tiposdestacados`
--

INSERT INTO `tiposdestacados` (`idtipoDestacado`, `nombreDestacado`) VALUES
(16, 'Alto'),
(17, 'Medio'),
(18, 'Bajo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tiposempleados`
--

CREATE TABLE `tiposempleados` (
  `idtipoEmpleado` int(11) NOT NULL,
  `nombreTipoEmpleado` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tiposempleados`
--

INSERT INTO `tiposempleados` (`idtipoEmpleado`, `nombreTipoEmpleado`) VALUES
(37, 'Gerente'),
(38, 'Secretaria'),
(39, 'Abogado'),
(40, 'Contador'),
(41, 'Auxiliar de arrendamientos'),
(42, 'Asesor comercial'),
(43, 'Mensajero');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tiposempresas`
--

CREATE TABLE `tiposempresas` (
  `idtipoEmpresa` int(11) NOT NULL,
  `nombreTipoEmpresa` varchar(45) NOT NULL COMMENT 'privada, mixta, publica, sector solidario'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tiposempresas`
--

INSERT INTO `tiposempresas` (`idtipoEmpresa`, `nombreTipoEmpresa`) VALUES
(21, 'Privada'),
(22, 'Pública'),
(23, 'Mixta'),
(24, 'Sector Solidario');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tiposeventos`
--

CREATE TABLE `tiposeventos` (
  `idtipoEvento` int(11) NOT NULL,
  `nombreTipoEvento` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tiposeventos`
--

INSERT INTO `tiposeventos` (`idtipoEvento`, `nombreTipoEvento`) VALUES
(31, 'Visita inmueble'),
(32, 'Reunión interna'),
(33, 'Reunión externa'),
(34, 'Firma contrato'),
(35, 'Firma promesa compra venta'),
(36, 'Firma escrituras');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tiposinmuebles`
--

CREATE TABLE `tiposinmuebles` (
  `idtipoInmueble` int(11) NOT NULL,
  `nombreTipoInmueble` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tiposinmuebles`
--

INSERT INTO `tiposinmuebles` (`idtipoInmueble`, `nombreTipoInmueble`) VALUES
(31, 'Casa'),
(32, 'Apartamento'),
(33, 'Local'),
(34, 'Bodega'),
(35, 'Oficina'),
(36, 'Otro');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tiposofertas`
--

CREATE TABLE `tiposofertas` (
  `idtipoOferta` int(11) NOT NULL,
  `nombreTipoOferta` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tiposofertas`
--

INSERT INTO `tiposofertas` (`idtipoOferta`, `nombreTipoOferta`) VALUES
(15, 'Arriendo'),
(16, 'Venta'),
(17, 'vacacional');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipospisos`
--

CREATE TABLE `tipospisos` (
  `idtipoPiso` int(11) NOT NULL,
  `nombreTipoPiso` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tipospisos`
--

INSERT INTO `tipospisos` (`idtipoPiso`, `nombreTipoPiso`) VALUES
(71, 'Madera'),
(72, 'Porcelanato'),
(73, 'Hormigon'),
(74, 'Mosaicos'),
(75, 'Piedra'),
(76, 'Alfombra'),
(77, 'Laminado'),
(78, 'Bambú'),
(79, 'Madera'),
(80, 'Linóleo'),
(81, 'Cerámica'),
(82, 'Vinilo'),
(83, 'Caucho'),
(84, 'Concreto');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipossociedad`
--

CREATE TABLE `tipossociedad` (
  `idtipoSociedad` int(11) NOT NULL,
  `nombreTipoSociedad` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tipossociedad`
--

INSERT INTO `tipossociedad` (`idtipoSociedad`, `nombreTipoSociedad`) VALUES
(36, 'Anonima'),
(37, 'Limitada'),
(38, 'Mixta'),
(39, 'Extranjera'),
(40, 'Publica'),
(41, 'Cooperativa'),
(42, 'Unipersonal');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tiposvigilancias`
--

CREATE TABLE `tiposvigilancias` (
  `idtipoVigilancia` int(11) NOT NULL,
  `nombreTipoVigilancia` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tiposvigilancias`
--

INSERT INTO `tiposvigilancias` (`idtipoVigilancia`, `nombreTipoVigilancia`) VALUES
(21, 'Vigilancia 24/7'),
(22, 'Diruna'),
(23, 'Nocturna'),
(24, 'Sin vigilancia');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tiposvistas`
--

CREATE TABLE `tiposvistas` (
  `idtipoVista` int(11) NOT NULL,
  `nombreTipoVista` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tiposvistas`
--

INSERT INTO `tiposvistas` (`idtipoVista`, `nombreTipoVista`) VALUES
(11, 'Interior'),
(12, 'Exterior');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id` int(11) NOT NULL,
  `primer_nombre` varchar(50) DEFAULT NULL,
  `segundo_nombre` varchar(50) DEFAULT NULL,
  `primer_apellido` varchar(50) DEFAULT NULL,
  `segundo_apellido` varchar(50) DEFAULT NULL,
  `usuario` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `rol` int(11) DEFAULT NULL,
  `descripcion` varchar(2000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id`, `primer_nombre`, `segundo_nombre`, `primer_apellido`, `segundo_apellido`, `usuario`, `password`, `rol`, `descripcion`) VALUES
(1, 'Johnny', 'Alexander', 'Salazar', 'Cardona', 'johnny9052', 'df5be1862ca6bf8589cf799004248e87', 1, ''),
(2, 'David', 'Alberto', 'Angarita', 'Garcia', 'David', 'e10adc3949ba59abbe56e057f20f883e', 1, 'Es un gran programador jajajajajaaj');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `videoinmueble`
--

CREATE TABLE `videoinmueble` (
  `idVideoInmueble` int(11) NOT NULL,
  `rutaVideo` varchar(200) DEFAULT NULL,
  `idInmueble` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `videoinmueble`
--

INSERT INTO `videoinmueble` (`idVideoInmueble`, `rutaVideo`, `idInmueble`) VALUES
(49, '', 5),
(46, '', 7),
(48, 'https://www.youtube.com/watch?v=6RHVcUECeJI', 4),
(43, 'https://www.youtube.com/watch?v=hslg-poUklo', 6),
(41, '', 8);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `videos`
--

CREATE TABLE `videos` (
  `idvideo` int(11) NOT NULL,
  `rutaVideo` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `zonas`
--

CREATE TABLE `zonas` (
  `idzona` int(11) NOT NULL,
  `nombreZona` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `zonas`
--

INSERT INTO `zonas` (`idzona`, `nombreZona`) VALUES
(46, 'Norte'),
(47, 'Centro'),
(48, 'Sur'),
(49, 'Oriente'),
(50, 'Occidente'),
(51, 'NorOriente'),
(52, 'NorOccidente'),
(53, 'SurOriente'),
(54, 'SurOccidente');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `areaempresa`
--
ALTER TABLE `areaempresa`
  ADD PRIMARY KEY (`idareaEmpresa`);

--
-- Indices de la tabla `arl`
--
ALTER TABLE `arl`
  ADD PRIMARY KEY (`idarl`);

--
-- Indices de la tabla `arrendatariodependiente`
--
ALTER TABLE `arrendatariodependiente`
  ADD PRIMARY KEY (`idarrendatarioDependiente`),
  ADD KEY `fk_arrendatarioDependiente_Cargos1_idx` (`Cargos_idCargo`),
  ADD KEY `fk_arrendatariodependiente_clientes1_idx` (`clientes_idCliente`),
  ADD KEY `fk_arrendatariodependiente_tipoactividadeconomicaarrendatar_idx` (`idtipoLaborArrendatario`);

--
-- Indices de la tabla `arrendatarioindependiente`
--
ALTER TABLE `arrendatarioindependiente`
  ADD PRIMARY KEY (`idarrendatarioIndependiente`),
  ADD KEY `fk_arrendatarioindependiente_clientes1_idx` (`clientes_idCliente`),
  ADD KEY `fk_arrendatarioindependiente_tipoactividadeconomicaarrendat_idx` (`tipoactividadeconomicaarrendatario_idtipoLaborArrendatario`);

--
-- Indices de la tabla `audit_propertie_search`
--
ALTER TABLE `audit_propertie_search`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `bancos`
--
ALTER TABLE `bancos`
  ADD PRIMARY KEY (`idbanco`);

--
-- Indices de la tabla `barrios`
--
ALTER TABLE `barrios`
  ADD PRIMARY KEY (`idbarrio`),
  ADD KEY `idCiudad` (`idCiudad`);

--
-- Indices de la tabla `cajacompensacion`
--
ALTER TABLE `cajacompensacion`
  ADD PRIMARY KEY (`idcajaCompensacion`);

--
-- Indices de la tabla `calificaciones`
--
ALTER TABLE `calificaciones`
  ADD PRIMARY KEY (`idcalificacion`);

--
-- Indices de la tabla `cargos`
--
ALTER TABLE `cargos`
  ADD PRIMARY KEY (`idCargo`);

--
-- Indices de la tabla `ciudades`
--
ALTER TABLE `ciudades`
  ADD PRIMARY KEY (`idciudad`),
  ADD KEY `fk_ciudades_Departamentos1_idx` (`Departamentos_idDepartamento`);

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`idCliente`),
  ADD KEY `fk_clientes_ciudades1_idx` (`ciudadResidencia_idciudad`),
  ADD KEY `fk_clientes_tipoIdentificacion1_idx` (`tipoIdentificacion_idtipoIdentificacion`),
  ADD KEY `fk_clientes_ciudades2_idx` (`ciudadExpedicion_idciudad`),
  ADD KEY `fk_clientes_profesiones1_idx` (`profesiones_idprofesion`),
  ADD KEY `fk_clientes_tipoPersonaCliente1_idx` (`tipoPersonaCliente_idtipoPersonCliente`),
  ADD KEY `idEstadoCivil` (`idEstadoCivil`),
  ADD KEY `idGenero` (`idGenero`);

--
-- Indices de la tabla `contratoempleado`
--
ALTER TABLE `contratoempleado`
  ADD PRIMARY KEY (`idcontratoEmpleado`),
  ADD KEY `fk_contratoEmpleado_areaEmpresa1_idx` (`areaEmpresa_idareaEmpresa`),
  ADD KEY `fk_contratoEmpleado_cargos1_idx` (`cargos_idCargo`),
  ADD KEY `fk_contratoEmpleado_empleados1_idx` (`empleados_idempleado`),
  ADD KEY `fk_contratoempleado_tipocontratoempleado1_idx` (`tipocontratoempleado_idtipoContratoEmpleado`);

--
-- Indices de la tabla `contratos`
--
ALTER TABLE `contratos`
  ADD PRIMARY KEY (`idcontrato`),
  ADD KEY `fk_contratos_inmuebles1_idx` (`inmuebles_idinmueble`),
  ADD KEY `fk_idcliente` (`idcliente`);

--
-- Indices de la tabla `conyugues`
--
ALTER TABLE `conyugues`
  ADD PRIMARY KEY (`idConyugue`),
  ADD KEY `fk_conyugues_clientes1_idx` (`clientes_idCliente`);

--
-- Indices de la tabla `cuentaempleado`
--
ALTER TABLE `cuentaempleado`
  ADD PRIMARY KEY (`idcuentaEmpleado`),
  ADD KEY `fk_cuentaEmpleado_tipoCuenta1_idx` (`tipoCuenta_idtipoCuenta`),
  ADD KEY `fk_cuentaEmpleado_bancos1_idx` (`bancos_idbanco`),
  ADD KEY `fk_cuentaEmpleado_empleados1_idx` (`empleados_idempleado`);

--
-- Indices de la tabla `departamentos`
--
ALTER TABLE `departamentos`
  ADD PRIMARY KEY (`idDepartamento`),
  ADD KEY `fk_Departamentos_paises1_idx` (`paises_idpais`),
  ADD KEY `idRegion` (`idRegion`);

--
-- Indices de la tabla `detalleclientestipoclientes`
--
ALTER TABLE `detalleclientestipoclientes`
  ADD PRIMARY KEY (`iddetalleClientesTipoClientes`),
  ADD KEY `fk_detalleClientesTipoClientes_tiposClientes1_idx` (`tiposClientes_idtipoCliente`),
  ADD KEY `fk_detalleClientesTipoClientes_clientes1_idx` (`clientes_cedulaCliente`);

--
-- Indices de la tabla `detallecontratosdeudores`
--
ALTER TABLE `detallecontratosdeudores`
  ADD PRIMARY KEY (`iddetalleContratoDeudore`),
  ADD KEY `fk_detalleContratosDeudores_deudorSolidario1_idx` (`numeroIdentificacionDeudor`),
  ADD KEY `fk_detalleContratosDeudores_contratos1_idx` (`contratos_idcontrato`);

--
-- Indices de la tabla `detallecontratosobjetos`
--
ALTER TABLE `detallecontratosobjetos`
  ADD PRIMARY KEY (`iddetalleContratoObjeto`),
  ADD KEY `fk_detalleContratosObjetos_objetosContratos1_idx` (`idobjetoContrato`),
  ADD KEY `fk_detalleContratosObjetos_contratos1_idx` (`contratos_idcontrato`);

--
-- Indices de la tabla `detalleeventosempleados`
--
ALTER TABLE `detalleeventosempleados`
  ADD PRIMARY KEY (`iddetalleEventoEmpleado`),
  ADD KEY `fk_detalleEventosEmpleados_empleados1_idx` (`empleados_idempleado`),
  ADD KEY `fk_detalleeventosempleados_eventosclientes1_idx` (`eventosclientes_ideventoCliente`);

--
-- Indices de la tabla `detallevideoinmueble`
--
ALTER TABLE `detallevideoinmueble`
  ADD PRIMARY KEY (`iddetalleVideoInmueble`),
  ADD KEY `fk_detalleVideoInmueble_videos1_idx` (`videos_idvideo`),
  ADD KEY `fk_detalleVideoInmueble_inmuebles1_idx` (`inmuebles_idinmueble`);

--
-- Indices de la tabla `deudorsolidario`
--
ALTER TABLE `deudorsolidario`
  ADD PRIMARY KEY (`idDeudor`),
  ADD KEY `fk_deudorSolidario_tipoIdentificacion1_idx` (`tipoIdentificacion_idtipoIdentificacion`),
  ADD KEY `fk_deudorSolidario_ciudades1_idx` (`ciudadResidencia_idciudad`),
  ADD KEY `fk_deudorSolidario_ciudades2_idx` (`ciudadExpedicion_idciudad`);

--
-- Indices de la tabla `empleados`
--
ALTER TABLE `empleados`
  ADD PRIMARY KEY (`idempleado`),
  ADD KEY `fk_empleados_tiposEmpleados1_idx` (`idtipoEmpleado`),
  ADD KEY `idEsCivil` (`idEsCivil`),
  ADD KEY `idGeneroEmpleado` (`idGeneroEmpleado`),
  ADD KEY `idCiudadEmpleado` (`idCiudadEmpleado`),
  ADD KEY `idProfesionEmpleado` (`idProfesionEmpleado`),
  ADD KEY `fk_empleados_ciudades1_idx` (`lugarExpedicion_idciudad`),
  ADD KEY `fk_empleados_ciudades2_idx` (`lugarNacimiento_idciudad`),
  ADD KEY `fk_empleados_tipoSangre1_idx` (`tipoSangre_idtipoSangre`),
  ADD KEY `fk_empleados_fondoPensiones1_idx` (`fondoPensiones_idfondoPensiones`),
  ADD KEY `fk_empleados_eps1_idx` (`eps_ideps`),
  ADD KEY `fk_empleados_fondoCesantias1_idx` (`fondoCesantias_idfondoCesantias`),
  ADD KEY `fk_empleados_arl1_idx` (`arl_idarl`),
  ADD KEY `fk_empleados_cajaCompensacion1_idx` (`cajaCompensacion_idcajaCompensacion`);

--
-- Indices de la tabla `eps`
--
ALTER TABLE `eps`
  ADD PRIMARY KEY (`ideps`);

--
-- Indices de la tabla `estadocivil`
--
ALTER TABLE `estadocivil`
  ADD PRIMARY KEY (`idEstadoCivil`);

--
-- Indices de la tabla `estados`
--
ALTER TABLE `estados`
  ADD PRIMARY KEY (`idestado`);

--
-- Indices de la tabla `estratos`
--
ALTER TABLE `estratos`
  ADD PRIMARY KEY (`idestrato`);

--
-- Indices de la tabla `estructurascocinas`
--
ALTER TABLE `estructurascocinas`
  ADD PRIMARY KEY (`idestructuraCocina`);

--
-- Indices de la tabla `eventosclientes`
--
ALTER TABLE `eventosclientes`
  ADD PRIMARY KEY (`ideventoCliente`),
  ADD KEY `fk_eventosClientes_clientes1_idx` (`clientes_cedulaCliente`),
  ADD KEY `fk_eventosclientes_tiposeventos1_idx` (`tiposeventos_idtipoEvento`);

--
-- Indices de la tabla `experienciaempleado`
--
ALTER TABLE `experienciaempleado`
  ADD PRIMARY KEY (`idexperienciaEmpleado`),
  ADD KEY `fk_experienciaEmpleado_cargos1_idx` (`cargos_idCargo`),
  ADD KEY `fk_experienciaEmpleado_empleados1_idx` (`empleados_idempleado`);

--
-- Indices de la tabla `fondocesantias`
--
ALTER TABLE `fondocesantias`
  ADD PRIMARY KEY (`idfondoCesantias`);

--
-- Indices de la tabla `fondopensiones`
--
ALTER TABLE `fondopensiones`
  ADD PRIMARY KEY (`idfondoPensiones`);

--
-- Indices de la tabla `formacionempleado`
--
ALTER TABLE `formacionempleado`
  ADD PRIMARY KEY (`idformacionEmpleado`),
  ADD KEY `fk_formacionEmpleado_empleados1_idx` (`empleados_idempleado`),
  ADD KEY `fk_formacionempleado_profesiones1_idx` (`profesiones_idprofesion`),
  ADD KEY `fk_formacionempleado_periodicidad1_idx` (`periodicidad_idperiodicidad`);

--
-- Indices de la tabla `generos`
--
ALTER TABLE `generos`
  ADD PRIMARY KEY (`idGenero`);

--
-- Indices de la tabla `imageninmueble`
--
ALTER TABLE `imageninmueble`
  ADD PRIMARY KEY (`idImagenInmueble`),
  ADD KEY `idInmueble` (`idInmueble`);

--
-- Indices de la tabla `inmuebles`
--
ALTER TABLE `inmuebles`
  ADD PRIMARY KEY (`idinmueble`),
  ADD UNIQUE KEY `matriculaInmobiliaria_UNIQUE` (`matriculaInmobiliaria`),
  ADD KEY `fk_inmuebles_ciudades_idx` (`ciudades_idciudad`),
  ADD KEY `fk_inmuebles_estratos1_idx` (`estratos_idestrato`),
  ADD KEY `fk_inmuebles_tiposInmuebles1_idx` (`tiposInmuebles_idtipoInmueble`),
  ADD KEY `fk_inmuebles_tiposOfertas1_idx` (`tiposOfertas_idtipoOferta`),
  ADD KEY `fk_inmuebles_tiposCortinas1_idx` (`tiposCortinas_idtipoCortina`),
  ADD KEY `fk_inmuebles_tiposVigilancias1_idx` (`tiposVigilancias_idtipoVigilancia`),
  ADD KEY `fk_inmuebles_zonas1_idx` (`zonas_idzona`),
  ADD KEY `fk_inmuebles_tiposVistas1_idx` (`tiposVistas_idtipoVista`),
  ADD KEY `fk_inmuebles_barrios1_idx` (`barrios_idbarrio`),
  ADD KEY `fk_inmuebles_estado1_idx` (`estado_idestado`),
  ADD KEY `fk_inmuebles_tiposCocinas1_idx` (`tiposCocinas_idtipoCocina`),
  ADD KEY `fk_inmuebles_estructurasCocinas1_idx` (`estructurasCocinas_idestructuraCocina`),
  ADD KEY `fk_inmuebles_tiposPisos1_idx` (`tiposPisos_idtipoPiso`),
  ADD KEY `fk_inmuebles_clientes1_idx` (`clientes_cedulaCliente`),
  ADD KEY `fk_inmuebles_tiposDestacados1_idx` (`tiposDestacados_idtipoDestacado`);

--
-- Indices de la tabla `log_msg`
--
ALTER TABLE `log_msg`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `menu_rol`
--
ALTER TABLE `menu_rol`
  ADD KEY `menu_usuario_idmenu_fkey` (`idmenu`),
  ADD KEY `menu_usuario_idrol_fkey` (`idrol`);

--
-- Indices de la tabla `nivelprofesion`
--
ALTER TABLE `nivelprofesion`
  ADD PRIMARY KEY (`idnivelProfesion`);

--
-- Indices de la tabla `objetoscontratos`
--
ALTER TABLE `objetoscontratos`
  ADD PRIMARY KEY (`idobjetoContrato`);

--
-- Indices de la tabla `paises`
--
ALTER TABLE `paises`
  ADD PRIMARY KEY (`idpais`);

--
-- Indices de la tabla `periodicidad`
--
ALTER TABLE `periodicidad`
  ADD PRIMARY KEY (`idperiodicidad`);

--
-- Indices de la tabla `personajuridica`
--
ALTER TABLE `personajuridica`
  ADD PRIMARY KEY (`idpersonaJuridica`),
  ADD KEY `fk_personaJuridica_tiposEmpresas1_idx` (`idtipoEmpresa`),
  ADD KEY `fk_personaJuridica_tiposSociedad1_idx` (`idtipoSociedad`),
  ADD KEY `fk_personaJuridica_clientes1_idx` (`numeroIdentificacionCliente`);

--
-- Indices de la tabla `pqrs`
--
ALTER TABLE `pqrs`
  ADD PRIMARY KEY (`idPQRS`),
  ADD KEY `fk_idtipopqrs` (`idtipopqrs`),
  ADD KEY `fk_idusuario` (`idusuario`);

--
-- Indices de la tabla `profesiones`
--
ALTER TABLE `profesiones`
  ADD PRIMARY KEY (`idprofesion`),
  ADD KEY `fk_profesiones_nivelProfesion1_idx` (`nivelProfesion_idnivelProfesion`);

--
-- Indices de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  ADD PRIMARY KEY (`nitProveedor`);

--
-- Indices de la tabla `referenciabancaria`
--
ALTER TABLE `referenciabancaria`
  ADD PRIMARY KEY (`idreferenciaBancaria`),
  ADD KEY `fk_referenciaBancaria_bancos1_idx` (`bancos_idbanco`),
  ADD KEY `fk_referenciabancaria_clientes1_idx` (`clientes_idCliente`);

--
-- Indices de la tabla `referenciapersonalfamiliar`
--
ALTER TABLE `referenciapersonalfamiliar`
  ADD PRIMARY KEY (`idreferenciaPersonalFamiliar`),
  ADD KEY `fk_referenciapersonalfamiliar_clientes1_idx` (`clientes_idCliente`),
  ADD KEY `fk_referenciapersonalfamiliar_tiporeferencia1_idx` (`tiporeferencia_idtipoReferencia`);

--
-- Indices de la tabla `regiones`
--
ALTER TABLE `regiones`
  ADD PRIMARY KEY (`idRegion`),
  ADD KEY `idPais` (`idPais`);

--
-- Indices de la tabla `rol`
--
ALTER TABLE `rol`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tipoactividadeconomicaarrendatario`
--
ALTER TABLE `tipoactividadeconomicaarrendatario`
  ADD PRIMARY KEY (`idtipoLaborArrendatario`);

--
-- Indices de la tabla `tipocontratoempleado`
--
ALTER TABLE `tipocontratoempleado`
  ADD PRIMARY KEY (`idtipoContratoEmpleado`);

--
-- Indices de la tabla `tipocuenta`
--
ALTER TABLE `tipocuenta`
  ADD PRIMARY KEY (`idtipoCuenta`);

--
-- Indices de la tabla `tipoidentificacion`
--
ALTER TABLE `tipoidentificacion`
  ADD PRIMARY KEY (`idtipoIdentificacion`);

--
-- Indices de la tabla `tipopersonacliente`
--
ALTER TABLE `tipopersonacliente`
  ADD PRIMARY KEY (`idtipoPersonCliente`);

--
-- Indices de la tabla `tipopqrs`
--
ALTER TABLE `tipopqrs`
  ADD PRIMARY KEY (`idtipopqrs`);

--
-- Indices de la tabla `tiporeferencia`
--
ALTER TABLE `tiporeferencia`
  ADD PRIMARY KEY (`idtipoReferencia`);

--
-- Indices de la tabla `tiposangre`
--
ALTER TABLE `tiposangre`
  ADD PRIMARY KEY (`idtipoSangre`);

--
-- Indices de la tabla `tiposclientes`
--
ALTER TABLE `tiposclientes`
  ADD PRIMARY KEY (`idtipoCliente`);

--
-- Indices de la tabla `tiposcocinas`
--
ALTER TABLE `tiposcocinas`
  ADD PRIMARY KEY (`idtipoCocina`);

--
-- Indices de la tabla `tiposcortinas`
--
ALTER TABLE `tiposcortinas`
  ADD PRIMARY KEY (`idtipoCortina`);

--
-- Indices de la tabla `tiposdestacados`
--
ALTER TABLE `tiposdestacados`
  ADD PRIMARY KEY (`idtipoDestacado`);

--
-- Indices de la tabla `tiposempleados`
--
ALTER TABLE `tiposempleados`
  ADD PRIMARY KEY (`idtipoEmpleado`);

--
-- Indices de la tabla `tiposempresas`
--
ALTER TABLE `tiposempresas`
  ADD PRIMARY KEY (`idtipoEmpresa`);

--
-- Indices de la tabla `tiposeventos`
--
ALTER TABLE `tiposeventos`
  ADD PRIMARY KEY (`idtipoEvento`);

--
-- Indices de la tabla `tiposinmuebles`
--
ALTER TABLE `tiposinmuebles`
  ADD PRIMARY KEY (`idtipoInmueble`);

--
-- Indices de la tabla `tiposofertas`
--
ALTER TABLE `tiposofertas`
  ADD PRIMARY KEY (`idtipoOferta`);

--
-- Indices de la tabla `tipospisos`
--
ALTER TABLE `tipospisos`
  ADD PRIMARY KEY (`idtipoPiso`);

--
-- Indices de la tabla `tipossociedad`
--
ALTER TABLE `tipossociedad`
  ADD PRIMARY KEY (`idtipoSociedad`);

--
-- Indices de la tabla `tiposvigilancias`
--
ALTER TABLE `tiposvigilancias`
  ADD PRIMARY KEY (`idtipoVigilancia`);

--
-- Indices de la tabla `tiposvistas`
--
ALTER TABLE `tiposvistas`
  ADD PRIMARY KEY (`idtipoVista`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id`),
  ADD KEY `usuario_rol_fkey` (`rol`);

--
-- Indices de la tabla `videoinmueble`
--
ALTER TABLE `videoinmueble`
  ADD PRIMARY KEY (`idVideoInmueble`),
  ADD KEY `idInmueble` (`idInmueble`);

--
-- Indices de la tabla `videos`
--
ALTER TABLE `videos`
  ADD PRIMARY KEY (`idvideo`);

--
-- Indices de la tabla `zonas`
--
ALTER TABLE `zonas`
  ADD PRIMARY KEY (`idzona`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `areaempresa`
--
ALTER TABLE `areaempresa`
  MODIFY `idareaEmpresa` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `arl`
--
ALTER TABLE `arl`
  MODIFY `idarl` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT de la tabla `arrendatariodependiente`
--
ALTER TABLE `arrendatariodependiente`
  MODIFY `idarrendatarioDependiente` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `arrendatarioindependiente`
--
ALTER TABLE `arrendatarioindependiente`
  MODIFY `idarrendatarioIndependiente` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `audit_propertie_search`
--
ALTER TABLE `audit_propertie_search`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=189;

--
-- AUTO_INCREMENT de la tabla `bancos`
--
ALTER TABLE `bancos`
  MODIFY `idbanco` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=271;

--
-- AUTO_INCREMENT de la tabla `barrios`
--
ALTER TABLE `barrios`
  MODIFY `idbarrio` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1663;

--
-- AUTO_INCREMENT de la tabla `cajacompensacion`
--
ALTER TABLE `cajacompensacion`
  MODIFY `idcajaCompensacion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=130;

--
-- AUTO_INCREMENT de la tabla `calificaciones`
--
ALTER TABLE `calificaciones`
  MODIFY `idcalificacion` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `cargos`
--
ALTER TABLE `cargos`
  MODIFY `idCargo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1559;

--
-- AUTO_INCREMENT de la tabla `ciudades`
--
ALTER TABLE `ciudades`
  MODIFY `idciudad` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1124;

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `idCliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `contratoempleado`
--
ALTER TABLE `contratoempleado`
  MODIFY `idcontratoEmpleado` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT de la tabla `contratos`
--
ALTER TABLE `contratos`
  MODIFY `idcontrato` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `conyugues`
--
ALTER TABLE `conyugues`
  MODIFY `idConyugue` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `cuentaempleado`
--
ALTER TABLE `cuentaempleado`
  MODIFY `idcuentaEmpleado` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `departamentos`
--
ALTER TABLE `departamentos`
  MODIFY `idDepartamento` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT de la tabla `detalleclientestipoclientes`
--
ALTER TABLE `detalleclientestipoclientes`
  MODIFY `iddetalleClientesTipoClientes` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT de la tabla `detallecontratosdeudores`
--
ALTER TABLE `detallecontratosdeudores`
  MODIFY `iddetalleContratoDeudore` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `detallecontratosobjetos`
--
ALTER TABLE `detallecontratosobjetos`
  MODIFY `iddetalleContratoObjeto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `detalleeventosempleados`
--
ALTER TABLE `detalleeventosempleados`
  MODIFY `iddetalleEventoEmpleado` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `detallevideoinmueble`
--
ALTER TABLE `detallevideoinmueble`
  MODIFY `iddetalleVideoInmueble` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `deudorsolidario`
--
ALTER TABLE `deudorsolidario`
  MODIFY `idDeudor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `empleados`
--
ALTER TABLE `empleados`
  MODIFY `idempleado` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `eps`
--
ALTER TABLE `eps`
  MODIFY `ideps` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=157;

--
-- AUTO_INCREMENT de la tabla `estadocivil`
--
ALTER TABLE `estadocivil`
  MODIFY `idEstadoCivil` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT de la tabla `estados`
--
ALTER TABLE `estados`
  MODIFY `idestado` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT de la tabla `estratos`
--
ALTER TABLE `estratos`
  MODIFY `idestrato` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT de la tabla `estructurascocinas`
--
ALTER TABLE `estructurascocinas`
  MODIFY `idestructuraCocina` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `eventosclientes`
--
ALTER TABLE `eventosclientes`
  MODIFY `ideventoCliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `experienciaempleado`
--
ALTER TABLE `experienciaempleado`
  MODIFY `idexperienciaEmpleado` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `fondocesantias`
--
ALTER TABLE `fondocesantias`
  MODIFY `idfondoCesantias` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT de la tabla `fondopensiones`
--
ALTER TABLE `fondopensiones`
  MODIFY `idfondoPensiones` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT de la tabla `formacionempleado`
--
ALTER TABLE `formacionempleado`
  MODIFY `idformacionEmpleado` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `generos`
--
ALTER TABLE `generos`
  MODIFY `idGenero` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `imageninmueble`
--
ALTER TABLE `imageninmueble`
  MODIFY `idImagenInmueble` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=357;

--
-- AUTO_INCREMENT de la tabla `inmuebles`
--
ALTER TABLE `inmuebles`
  MODIFY `idinmueble` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `log_msg`
--
ALTER TABLE `log_msg`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=143;

--
-- AUTO_INCREMENT de la tabla `menu`
--
ALTER TABLE `menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT de la tabla `nivelprofesion`
--
ALTER TABLE `nivelprofesion`
  MODIFY `idnivelProfesion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `objetoscontratos`
--
ALTER TABLE `objetoscontratos`
  MODIFY `idobjetoContrato` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `paises`
--
ALTER TABLE `paises`
  MODIFY `idpais` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=242;

--
-- AUTO_INCREMENT de la tabla `periodicidad`
--
ALTER TABLE `periodicidad`
  MODIFY `idperiodicidad` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `personajuridica`
--
ALTER TABLE `personajuridica`
  MODIFY `idpersonaJuridica` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pqrs`
--
ALTER TABLE `pqrs`
  MODIFY `idPQRS` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `profesiones`
--
ALTER TABLE `profesiones`
  MODIFY `idprofesion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5027;

--
-- AUTO_INCREMENT de la tabla `referenciabancaria`
--
ALTER TABLE `referenciabancaria`
  MODIFY `idreferenciaBancaria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `referenciapersonalfamiliar`
--
ALTER TABLE `referenciapersonalfamiliar`
  MODIFY `idreferenciaPersonalFamiliar` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `regiones`
--
ALTER TABLE `regiones`
  MODIFY `idRegion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `rol`
--
ALTER TABLE `rol`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=86;

--
-- AUTO_INCREMENT de la tabla `tipoactividadeconomicaarrendatario`
--
ALTER TABLE `tipoactividadeconomicaarrendatario`
  MODIFY `idtipoLaborArrendatario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT de la tabla `tipocontratoempleado`
--
ALTER TABLE `tipocontratoempleado`
  MODIFY `idtipoContratoEmpleado` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT de la tabla `tipocuenta`
--
ALTER TABLE `tipocuenta`
  MODIFY `idtipoCuenta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `tipoidentificacion`
--
ALTER TABLE `tipoidentificacion`
  MODIFY `idtipoIdentificacion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT de la tabla `tipopersonacliente`
--
ALTER TABLE `tipopersonacliente`
  MODIFY `idtipoPersonCliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `tipopqrs`
--
ALTER TABLE `tipopqrs`
  MODIFY `idtipopqrs` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `tiporeferencia`
--
ALTER TABLE `tiporeferencia`
  MODIFY `idtipoReferencia` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `tiposangre`
--
ALTER TABLE `tiposangre`
  MODIFY `idtipoSangre` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT de la tabla `tiposclientes`
--
ALTER TABLE `tiposclientes`
  MODIFY `idtipoCliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT de la tabla `tiposcocinas`
--
ALTER TABLE `tiposcocinas`
  MODIFY `idtipoCocina` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT de la tabla `tiposcortinas`
--
ALTER TABLE `tiposcortinas`
  MODIFY `idtipoCortina` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `tiposdestacados`
--
ALTER TABLE `tiposdestacados`
  MODIFY `idtipoDestacado` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT de la tabla `tiposempleados`
--
ALTER TABLE `tiposempleados`
  MODIFY `idtipoEmpleado` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT de la tabla `tiposempresas`
--
ALTER TABLE `tiposempresas`
  MODIFY `idtipoEmpresa` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT de la tabla `tiposeventos`
--
ALTER TABLE `tiposeventos`
  MODIFY `idtipoEvento` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT de la tabla `tiposinmuebles`
--
ALTER TABLE `tiposinmuebles`
  MODIFY `idtipoInmueble` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT de la tabla `tiposofertas`
--
ALTER TABLE `tiposofertas`
  MODIFY `idtipoOferta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT de la tabla `tipospisos`
--
ALTER TABLE `tipospisos`
  MODIFY `idtipoPiso` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=85;

--
-- AUTO_INCREMENT de la tabla `tipossociedad`
--
ALTER TABLE `tipossociedad`
  MODIFY `idtipoSociedad` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT de la tabla `tiposvigilancias`
--
ALTER TABLE `tiposvigilancias`
  MODIFY `idtipoVigilancia` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT de la tabla `tiposvistas`
--
ALTER TABLE `tiposvistas`
  MODIFY `idtipoVista` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `videoinmueble`
--
ALTER TABLE `videoinmueble`
  MODIFY `idVideoInmueble` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT de la tabla `videos`
--
ALTER TABLE `videos`
  MODIFY `idvideo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `zonas`
--
ALTER TABLE `zonas`
  MODIFY `idzona` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `arrendatariodependiente`
--
ALTER TABLE `arrendatariodependiente`
  ADD CONSTRAINT `fk_arrendatarioDependiente_Cargos1` FOREIGN KEY (`Cargos_idCargo`) REFERENCES `cargos` (`idCargo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_arrendatariodependiente_clientes1` FOREIGN KEY (`clientes_idCliente`) REFERENCES `clientes` (`idCliente`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_arrendatariodependiente_tipoactividadeconomicaarrendatario1` FOREIGN KEY (`idtipoLaborArrendatario`) REFERENCES `tipoactividadeconomicaarrendatario` (`idtipoLaborArrendatario`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `arrendatarioindependiente`
--
ALTER TABLE `arrendatarioindependiente`
  ADD CONSTRAINT `fk_arrendatarioindependiente_clientes1` FOREIGN KEY (`clientes_idCliente`) REFERENCES `clientes` (`idCliente`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_arrendatarioindependiente_tipoactividadeconomicaarrendatar1` FOREIGN KEY (`tipoactividadeconomicaarrendatario_idtipoLaborArrendatario`) REFERENCES `tipoactividadeconomicaarrendatario` (`idtipoLaborArrendatario`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `barrios`
--
ALTER TABLE `barrios`
  ADD CONSTRAINT `idCiudad` FOREIGN KEY (`idCiudad`) REFERENCES `ciudades` (`idciudad`);

--
-- Filtros para la tabla `ciudades`
--
ALTER TABLE `ciudades`
  ADD CONSTRAINT `fk_ciudades_Departamentos1` FOREIGN KEY (`Departamentos_idDepartamento`) REFERENCES `departamentos` (`idDepartamento`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD CONSTRAINT `fk_clientes_ciudades1` FOREIGN KEY (`ciudadResidencia_idciudad`) REFERENCES `ciudades` (`idciudad`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_clientes_ciudades2` FOREIGN KEY (`ciudadExpedicion_idciudad`) REFERENCES `ciudades` (`idciudad`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_clientes_profesiones1` FOREIGN KEY (`profesiones_idprofesion`) REFERENCES `profesiones` (`idprofesion`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_clientes_tipoIdentificacion1` FOREIGN KEY (`tipoIdentificacion_idtipoIdentificacion`) REFERENCES `tipoidentificacion` (`idtipoIdentificacion`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_clientes_tipoPersonaCliente1` FOREIGN KEY (`tipoPersonaCliente_idtipoPersonCliente`) REFERENCES `tipopersonacliente` (`idtipoPersonCliente`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `idEstadoCivil` FOREIGN KEY (`idEstadoCivil`) REFERENCES `estadocivil` (`idEstadoCivil`),
  ADD CONSTRAINT `idGenero` FOREIGN KEY (`idGenero`) REFERENCES `generos` (`idGenero`);

--
-- Filtros para la tabla `contratoempleado`
--
ALTER TABLE `contratoempleado`
  ADD CONSTRAINT `fk_contratoEmpleado_areaEmpresa1` FOREIGN KEY (`areaEmpresa_idareaEmpresa`) REFERENCES `areaempresa` (`idareaEmpresa`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_contratoEmpleado_cargos1` FOREIGN KEY (`cargos_idCargo`) REFERENCES `cargos` (`idCargo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_contratoEmpleado_empleados1` FOREIGN KEY (`empleados_idempleado`) REFERENCES `empleados` (`idempleado`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_contratoempleado_tipocontratoempleado1` FOREIGN KEY (`tipocontratoempleado_idtipoContratoEmpleado`) REFERENCES `tipocontratoempleado` (`idtipoContratoEmpleado`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `contratos`
--
ALTER TABLE `contratos`
  ADD CONSTRAINT `fk_contratos_inmuebles1` FOREIGN KEY (`inmuebles_idinmueble`) REFERENCES `inmuebles` (`idinmueble`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_idcliente` FOREIGN KEY (`idcliente`) REFERENCES `clientes` (`idCliente`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `conyugues`
--
ALTER TABLE `conyugues`
  ADD CONSTRAINT `fk_conyugues_clientes1` FOREIGN KEY (`clientes_idCliente`) REFERENCES `clientes` (`idCliente`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `cuentaempleado`
--
ALTER TABLE `cuentaempleado`
  ADD CONSTRAINT `fk_cuentaEmpleado_bancos1` FOREIGN KEY (`bancos_idbanco`) REFERENCES `bancos` (`idbanco`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_cuentaEmpleado_empleados1` FOREIGN KEY (`empleados_idempleado`) REFERENCES `empleados` (`idempleado`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_cuentaEmpleado_tipoCuenta1` FOREIGN KEY (`tipoCuenta_idtipoCuenta`) REFERENCES `tipocuenta` (`idtipoCuenta`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `departamentos`
--
ALTER TABLE `departamentos`
  ADD CONSTRAINT `fk_Departamentos_paises1` FOREIGN KEY (`paises_idpais`) REFERENCES `paises` (`idpais`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `idRegion` FOREIGN KEY (`idRegion`) REFERENCES `regiones` (`idRegion`);

--
-- Filtros para la tabla `detalleclientestipoclientes`
--
ALTER TABLE `detalleclientestipoclientes`
  ADD CONSTRAINT `fk_detalleClientesTipoClientes_clientes1` FOREIGN KEY (`clientes_cedulaCliente`) REFERENCES `clientes` (`idCliente`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_detalleClientesTipoClientes_tiposClientes1` FOREIGN KEY (`tiposClientes_idtipoCliente`) REFERENCES `tiposclientes` (`idtipoCliente`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `detallecontratosdeudores`
--
ALTER TABLE `detallecontratosdeudores`
  ADD CONSTRAINT `fk_detalleContratosDeudores_contratos1` FOREIGN KEY (`contratos_idcontrato`) REFERENCES `contratos` (`idcontrato`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_detalleContratosDeudores_deudorSolidario1` FOREIGN KEY (`numeroIdentificacionDeudor`) REFERENCES `deudorsolidario` (`idDeudor`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `detallecontratosobjetos`
--
ALTER TABLE `detallecontratosobjetos`
  ADD CONSTRAINT `fk_detalleContratosObjetos_contratos1` FOREIGN KEY (`contratos_idcontrato`) REFERENCES `contratos` (`idcontrato`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_detalleContratosObjetos_objetosContratos1` FOREIGN KEY (`idobjetoContrato`) REFERENCES `objetoscontratos` (`idobjetoContrato`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `detalleeventosempleados`
--
ALTER TABLE `detalleeventosempleados`
  ADD CONSTRAINT `fk_detalleEventosEmpleados_empleados1` FOREIGN KEY (`empleados_idempleado`) REFERENCES `empleados` (`idempleado`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_detalleeventosempleados_eventosclientes1` FOREIGN KEY (`eventosclientes_ideventoCliente`) REFERENCES `eventosclientes` (`ideventoCliente`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `detallevideoinmueble`
--
ALTER TABLE `detallevideoinmueble`
  ADD CONSTRAINT `fk_detalleVideoInmueble_inmuebles1` FOREIGN KEY (`inmuebles_idinmueble`) REFERENCES `inmuebles` (`idinmueble`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_detalleVideoInmueble_videos1` FOREIGN KEY (`videos_idvideo`) REFERENCES `videos` (`idvideo`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `deudorsolidario`
--
ALTER TABLE `deudorsolidario`
  ADD CONSTRAINT `fk_deudorSolidario_ciudades1` FOREIGN KEY (`ciudadResidencia_idciudad`) REFERENCES `ciudades` (`idciudad`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_deudorSolidario_ciudades2` FOREIGN KEY (`ciudadExpedicion_idciudad`) REFERENCES `ciudades` (`idciudad`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_deudorSolidario_tipoIdentificacion1` FOREIGN KEY (`tipoIdentificacion_idtipoIdentificacion`) REFERENCES `tipoidentificacion` (`idtipoIdentificacion`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `empleados`
--
ALTER TABLE `empleados`
  ADD CONSTRAINT `fk_empleados_arl1` FOREIGN KEY (`arl_idarl`) REFERENCES `arl` (`idarl`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_empleados_cajaCompensacion1` FOREIGN KEY (`cajaCompensacion_idcajaCompensacion`) REFERENCES `cajacompensacion` (`idcajaCompensacion`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_empleados_ciudades1` FOREIGN KEY (`lugarExpedicion_idciudad`) REFERENCES `ciudades` (`idciudad`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_empleados_ciudades2` FOREIGN KEY (`lugarNacimiento_idciudad`) REFERENCES `ciudades` (`idciudad`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_empleados_eps1` FOREIGN KEY (`eps_ideps`) REFERENCES `eps` (`ideps`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_empleados_fondoCesantias1` FOREIGN KEY (`fondoCesantias_idfondoCesantias`) REFERENCES `fondocesantias` (`idfondoCesantias`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_empleados_fondoPensiones1` FOREIGN KEY (`fondoPensiones_idfondoPensiones`) REFERENCES `fondopensiones` (`idfondoPensiones`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_empleados_tipoSangre1` FOREIGN KEY (`tipoSangre_idtipoSangre`) REFERENCES `tiposangre` (`idtipoSangre`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_empleados_tiposEmpleados1` FOREIGN KEY (`idtipoEmpleado`) REFERENCES `tiposempleados` (`idtipoEmpleado`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `idCiudadEmpleado` FOREIGN KEY (`idCiudadEmpleado`) REFERENCES `ciudades` (`idciudad`),
  ADD CONSTRAINT `idEsCivil` FOREIGN KEY (`idEsCivil`) REFERENCES `estadocivil` (`idEstadoCivil`),
  ADD CONSTRAINT `idGeneroEmpleado` FOREIGN KEY (`idGeneroEmpleado`) REFERENCES `generos` (`idGenero`),
  ADD CONSTRAINT `idProfesionEmpleado` FOREIGN KEY (`idProfesionEmpleado`) REFERENCES `profesiones` (`idprofesion`);

--
-- Filtros para la tabla `eventosclientes`
--
ALTER TABLE `eventosclientes`
  ADD CONSTRAINT `fk_eventosClientes_clientes1` FOREIGN KEY (`clientes_cedulaCliente`) REFERENCES `clientes` (`idCliente`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_eventosclientes_tiposeventos1` FOREIGN KEY (`tiposeventos_idtipoEvento`) REFERENCES `tiposeventos` (`idtipoEvento`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `experienciaempleado`
--
ALTER TABLE `experienciaempleado`
  ADD CONSTRAINT `fk_experienciaEmpleado_cargos1` FOREIGN KEY (`cargos_idCargo`) REFERENCES `cargos` (`idCargo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_experienciaEmpleado_empleados1` FOREIGN KEY (`empleados_idempleado`) REFERENCES `empleados` (`idempleado`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `formacionempleado`
--
ALTER TABLE `formacionempleado`
  ADD CONSTRAINT `fk_formacionEmpleado_empleados1` FOREIGN KEY (`empleados_idempleado`) REFERENCES `empleados` (`idempleado`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_formacionempleado_periodicidad1` FOREIGN KEY (`periodicidad_idperiodicidad`) REFERENCES `periodicidad` (`idperiodicidad`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_formacionempleado_profesiones1` FOREIGN KEY (`profesiones_idprofesion`) REFERENCES `profesiones` (`idprofesion`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `inmuebles`
--
ALTER TABLE `inmuebles`
  ADD CONSTRAINT `fk_inmuebles_barrios1` FOREIGN KEY (`barrios_idbarrio`) REFERENCES `barrios` (`idbarrio`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_inmuebles_ciudades` FOREIGN KEY (`ciudades_idciudad`) REFERENCES `ciudades` (`idciudad`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_inmuebles_clientes1` FOREIGN KEY (`clientes_cedulaCliente`) REFERENCES `clientes` (`idCliente`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_inmuebles_estado1` FOREIGN KEY (`estado_idestado`) REFERENCES `estados` (`idestado`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_inmuebles_estratos1` FOREIGN KEY (`estratos_idestrato`) REFERENCES `estratos` (`idestrato`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_inmuebles_estructurasCocinas1` FOREIGN KEY (`estructurasCocinas_idestructuraCocina`) REFERENCES `estructurascocinas` (`idestructuraCocina`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_inmuebles_tiposCocinas1` FOREIGN KEY (`tiposCocinas_idtipoCocina`) REFERENCES `tiposcocinas` (`idtipoCocina`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_inmuebles_tiposCortinas1` FOREIGN KEY (`tiposCortinas_idtipoCortina`) REFERENCES `tiposcortinas` (`idtipoCortina`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_inmuebles_tiposDestacados1` FOREIGN KEY (`tiposDestacados_idtipoDestacado`) REFERENCES `tiposdestacados` (`idtipoDestacado`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_inmuebles_tiposInmuebles1` FOREIGN KEY (`tiposInmuebles_idtipoInmueble`) REFERENCES `tiposinmuebles` (`idtipoInmueble`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_inmuebles_tiposOfertas1` FOREIGN KEY (`tiposOfertas_idtipoOferta`) REFERENCES `tiposofertas` (`idtipoOferta`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_inmuebles_tiposPisos1` FOREIGN KEY (`tiposPisos_idtipoPiso`) REFERENCES `tipospisos` (`idtipoPiso`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_inmuebles_tiposVigilancias1` FOREIGN KEY (`tiposVigilancias_idtipoVigilancia`) REFERENCES `tiposvigilancias` (`idtipoVigilancia`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_inmuebles_tiposVistas1` FOREIGN KEY (`tiposVistas_idtipoVista`) REFERENCES `tiposvistas` (`idtipoVista`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_inmuebles_zonas1` FOREIGN KEY (`zonas_idzona`) REFERENCES `zonas` (`idzona`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `menu_rol`
--
ALTER TABLE `menu_rol`
  ADD CONSTRAINT `menu_rol_ibfk_1` FOREIGN KEY (`idrol`) REFERENCES `rol` (`id`),
  ADD CONSTRAINT `menu_rol_ibfk_2` FOREIGN KEY (`idmenu`) REFERENCES `menu` (`id`);

--
-- Filtros para la tabla `personajuridica`
--
ALTER TABLE `personajuridica`
  ADD CONSTRAINT `fk_personaJuridica_clientes1` FOREIGN KEY (`numeroIdentificacionCliente`) REFERENCES `clientes` (`idCliente`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_personaJuridica_tiposEmpresas1` FOREIGN KEY (`idtipoEmpresa`) REFERENCES `tiposempresas` (`idtipoEmpresa`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_personaJuridica_tiposSociedad1` FOREIGN KEY (`idtipoSociedad`) REFERENCES `tipossociedad` (`idtipoSociedad`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `pqrs`
--
ALTER TABLE `pqrs`
  ADD CONSTRAINT `fk_idtipopqrs` FOREIGN KEY (`idtipopqrs`) REFERENCES `tipopqrs` (`idtipopqrs`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_idusuario` FOREIGN KEY (`idusuario`) REFERENCES `clientes` (`idCliente`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `profesiones`
--
ALTER TABLE `profesiones`
  ADD CONSTRAINT `fk_profesiones_nivelProfesion1` FOREIGN KEY (`nivelProfesion_idnivelProfesion`) REFERENCES `nivelprofesion` (`idnivelProfesion`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `referenciabancaria`
--
ALTER TABLE `referenciabancaria`
  ADD CONSTRAINT `fk_referenciaBancaria_bancos1` FOREIGN KEY (`bancos_idbanco`) REFERENCES `bancos` (`idbanco`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_referenciabancaria_clientes1` FOREIGN KEY (`clientes_idCliente`) REFERENCES `clientes` (`idCliente`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `referenciapersonalfamiliar`
--
ALTER TABLE `referenciapersonalfamiliar`
  ADD CONSTRAINT `fk_referenciapersonalfamiliar_clientes1` FOREIGN KEY (`clientes_idCliente`) REFERENCES `clientes` (`idCliente`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_referenciapersonalfamiliar_tiporeferencia1` FOREIGN KEY (`tiporeferencia_idtipoReferencia`) REFERENCES `tiporeferencia` (`idtipoReferencia`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `regiones`
--
ALTER TABLE `regiones`
  ADD CONSTRAINT `regiones_ibfk_1` FOREIGN KEY (`idPais`) REFERENCES `paises` (`idpais`);

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `usuario_ibfk_1` FOREIGN KEY (`rol`) REFERENCES `rol` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
