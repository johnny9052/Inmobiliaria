-- phpMyAdmin SQL Dump
-- version 4.7.9
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 29-07-2018 a las 16:06:54
-- Versión del servidor: 5.7.21
-- Versión de PHP: 5.6.35

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `inmobiliaria`
--

DELIMITER $$
--
-- Procedimientos
--
DROP PROCEDURE IF EXISTS `listclient`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `listclient` (`iduser` INT)  BEGIN


   select cli.idCliente,cli.numeroIdentificacion as numero_identificacion, cli.primerNombreCliente as primer_nombre, 


          cli.segundoNombreCliente as segundo_nombre, cli.primerApellidoCliente as primer_apellido, 


          cli.segundoApellidoCliente as segundo_apellido,  


          tip.`nombreTipoPersonaCliente` as tipo_persona


   from clientes as cli inner join tipopersonacliente as tip 


   on cli.`tipoPersonaCliente_idtipoPersonCliente` = tip.`idtipoPersonCliente`


   order by primerApellidoCliente;


END$$

DROP PROCEDURE IF EXISTS `listdependent`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `listdependent` (`idCliente` INT)  BEGIN

  select cli.idCliente,cli.numeroIdentificacion as numero_identificacion, cli.primerNombreCliente as primer_nombre, 



          cli.segundoNombreCliente as segundo_nombre, cli.primerApellidoCliente as primer_apellido, 



          cli.segundoApellidoCliente as segundo_apellido,  



          tip.`nombreTipoPersonaCliente` as tipo_persona



   from clientes as cli inner join tipopersonacliente as tip 



   on cli.`tipoPersonaCliente_idtipoPersonCliente` = tip.`idtipoPersonCliente` 

   

   where tip.nombreTipoPersonaCliente ="Natural"



   order by primerApellidoCliente;

END$$

DROP PROCEDURE IF EXISTS `listemployee`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `listemployee` (IN `idemployee` INT)  BEGIN


   select empl.idEmpleado,empl.cedulaEmpleado as numero_identificacion, empl.primerNombreEmpleado as primer_nombre, 


          empl.segundoNombreEmpleado as segundo_nombre, empl.primerApellidoEmpleado as primer_apellido, 


          empl.segundoApellidoEmpleado as segundo_apellido,  


          tip.`nombreTipoEmpleado` as tipo_empleado


   from Empleados as empl inner join tiposEmpleados as tip 


   on empl.`idTipoEmpleado` = tip.`idTipoEmpleado`


   order by primerApellidoEmpleado;


END$$

DROP PROCEDURE IF EXISTS `listevent`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `listevent` (`ideventoCliente` INT)  BEGIN


   select eve.ideventoCliente,eve.fechaEvento as fecha_evento, eve.horaEvento as hora_evento, 


          eve.lugarEvento as lugar_evento,  


          CONCAT(cli.primerNombreCliente, ' ', 


		cli.segundoNombreCliente, ' ', cli.primerApellidoCliente,  ' ', 


		cli.segundoApellidoCliente) as nombreCliente 


   from eventosclientes as eve inner join clientes as cli 


   on eve.clientes_cedulaCliente = cli.idCliente;


END$$

DROP PROCEDURE IF EXISTS `listindependent`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `listindependent` (`idCliente` INT)  BEGIN

  select cli.idCliente,cli.numeroIdentificacion as numero_identificacion, cli.primerNombreCliente as primer_nombre, 



          cli.segundoNombreCliente as segundo_nombre, cli.primerApellidoCliente as primer_apellido, 



          cli.segundoApellidoCliente as segundo_apellido,  



          tip.`nombreTipoPersonaCliente` as tipo_persona



   from clientes as cli inner join tipopersonacliente as tip 



   on cli.`tipoPersonaCliente_idtipoPersonCliente` = tip.`idtipoPersonCliente` 

   

   where tip.nombreTipoPersonaCliente ="Natural"



   order by primerApellidoCliente;

END$$

DROP PROCEDURE IF EXISTS `listnoticia`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `listnoticia` (IN `iduser` INT)  BEGIN


   select id,titulo as titulo_noticia,descripcion ,fecha,foto as ruta_foto,video as ruta_video


   from noticia


   order by fecha desc;


END$$

DROP PROCEDURE IF EXISTS `listprofession`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `listprofession` (`iduser` INT)  BEGIN


   select p.idprofesion,p.nombreProfesion as nombre_profesion, np.nombreNivelProfesion as nivel_profesional


   from profesiones as p inner join  nivelprofesion as np on 


   p.nivelProfesion_idnivelProfesion = np.idnivelProfesion


   order by p.nombreProfesion;


END$$

DROP PROCEDURE IF EXISTS `listpropertie`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `listpropertie` (`iduser` INT)  BEGIN

   select inm.idinmueble as id, inm.`matriculaInmobiliaria` as matricula, tip_inm.`nombreTipoInmueble` as tipo,

               tip_ofer.`nombreTipoOferta` as oferta, inm.precio as precio, ciud.`nombreCiudad` as ciudad, 

               zon.`nombreZona` as zona, inm.`fechaRecepcion` as fecha

   from inmuebles as inm 

        inner join tiposinmuebles as tip_inm on inm.`tiposInmuebles_idtipoInmueble` = tip_inm.`idtipoInmueble` 

        inner join tiposofertas as tip_ofer on inm.`tiposOfertas_idtipoOferta` = tip_ofer.`idtipoOferta` 

        inner join ciudades as ciud on inm.ciudades_idciudad = ciud.idciudad 

        inner join zonas as zon on inm.zonas_idzona = zon.idzona



   order by inm.`fechaRecepcion`;

END$$

DROP PROCEDURE IF EXISTS `listrol`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `listrol` (`iduser` INT)  BEGIN


   select id,nombre as nombre_rol,descripcion 


   from rol


   order by nombre;


END$$

DROP PROCEDURE IF EXISTS `listuser`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `listuser` (`iduser` INT)  BEGIN


   


	SELECT us.id, us.primer_nombre as primer_nombre, us.primer_apellido as primer_apellido, us.usuario as nickname, r.nombre as rol, 


	       us.descripcion as descripcion


	FROM usuario as us


	INNER JOIN rol as r on r.id = us.rol


	ORDER BY us.primer_nombre;





END$$

DROP PROCEDURE IF EXISTS `loadactivityeconomic`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `loadactivityeconomic` (IN `idfilter` INT)  BEGIN

 

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

DROP PROCEDURE IF EXISTS `loadallmenu`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `loadallmenu` ()  BEGIN


   


	select m.id,m.nombre,m.codigo,m.padre as codpadre,m2.nombre as nombrepadre,m.prioridad


	from menu as m


	left JOIN menu as m2 on m.padre = m2.id	


	order by m.prioridad;





END$$

DROP PROCEDURE IF EXISTS `loadapage`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `loadapage` (IN `vpage` VARCHAR(2000), IN `vrol` INT)  BEGIN


   


	select m.codigo


	from menu as m 	


	inner join menu_rol as mr on mr.idmenu = m.id


	where mr.idrol = vrol AND m.codigo = vpage;	





END$$

DROP PROCEDURE IF EXISTS `loadcity`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `loadcity` (IN `idfilter` INT)  BEGIN


 


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

DROP PROCEDURE IF EXISTS `loadclient`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `loadclient` (IN `idfilter` INT)  BEGIN


 


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

DROP PROCEDURE IF EXISTS `loadclientType`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `loadclientType` (IN `idfilter` INT)  BEGIN


 


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

DROP PROCEDURE IF EXISTS `loadclienttypeselected`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `loadclienttypeselected` (IN `idfilter` INT)  BEGIN


 


	IF idfilter > -1 THEN


	


		select tiposClientes_idtipoCliente as id


		from detalleclientestipoclientes       


		where clientes_cedulaCliente = idfilter;


		


        ELSE	


	


		select tiposClientes_idtipoCliente as id


		from detalleclientestipoclientes;


	


        END IF;


END$$

DROP PROCEDURE IF EXISTS `loadcurtaintype`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `loadcurtaintype` (IN `idfilter` INT)  BEGIN

 

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

DROP PROCEDURE IF EXISTS `loaddepartment`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `loaddepartment` (IN `idfilter` INT)  BEGIN


 


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

DROP PROCEDURE IF EXISTS `loademployee`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `loademployee` (IN `idfilter` INT)  BEGIN


 


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

DROP PROCEDURE IF EXISTS `loademployeeselected`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `loademployeeselected` (IN `idfilter` INT)  BEGIN



 



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

DROP PROCEDURE IF EXISTS `loademployeesselected`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `loademployeesselected` (IN `idfilter` INT)  BEGIN 


	IF idfilter > -1 THEN


	


		select eventosclientes_ideventoCliente as id


		from detalleclientestipoclientes       


		where empleados_idempleado = idfilter;


		


        ELSE	


	


		select eventosclientes_ideventoCliente as id


		from detalleeventosempleados;


	


        END IF;


END$$

DROP PROCEDURE IF EXISTS `loadfloortype`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `loadfloortype` (IN `idfilter` INT)  BEGIN

 

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

DROP PROCEDURE IF EXISTS `loadgender`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `loadgender` (IN `idfilter` INT)  BEGIN


 


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

DROP PROCEDURE IF EXISTS `loadkitchenstructure`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `loadkitchenstructure` (IN `idfilter` INT)  BEGIN

 

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

DROP PROCEDURE IF EXISTS `loadkitchentype`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `loadkitchentype` (IN `idfilter` INT)  BEGIN

 

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

DROP PROCEDURE IF EXISTS `loadmaritalstatus`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `loadmaritalstatus` (IN `idfilter` INT)  BEGIN


 


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

DROP PROCEDURE IF EXISTS `loadmenu`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `loadmenu` (IN `rol` INT)  BEGIN


   


	select m.id,m.nombre,m.codigo,m.padre as codpadre,m2.nombre as nombrepadre,mr.idrol,m.prioridad, m.icono as icono


	from menu as m


	left JOIN menu as m2 on m.padre = m2.id


	LEFT join menu_rol as mr on mr.idmenu = m.id


	where (mr.idrol = rol OR (m.padre = -1 AND (mr.idrol = rol OR mr.idrol IS NULL)))


	order by m.prioridad;


END$$

DROP PROCEDURE IF EXISTS `loadneighborhood`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `loadneighborhood` (IN `idfilter` INT)  BEGIN

 

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

DROP PROCEDURE IF EXISTS `loadoffertype`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `loadoffertype` (IN `idfilter` INT)  BEGIN

 

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

DROP PROCEDURE IF EXISTS `loadoutstandingtype`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `loadoutstandingtype` (IN `idfilter` INT)  BEGIN

 

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

DROP PROCEDURE IF EXISTS `loadpersontype`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `loadpersontype` (IN `idfilter` INT)  BEGIN


 


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

DROP PROCEDURE IF EXISTS `loadposition`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `loadposition` (IN `idfilter` INT)  BEGIN

 

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

DROP PROCEDURE IF EXISTS `loadprofession`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `loadprofession` (IN `idfilter` INT)  BEGIN


 


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

DROP PROCEDURE IF EXISTS `loadprofessionnivel`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `loadprofessionnivel` (IN `idfilter` INT)  BEGIN


 


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

DROP PROCEDURE IF EXISTS `loadpropertietype`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `loadpropertietype` (IN `idfilter` INT)  BEGIN

 

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

DROP PROCEDURE IF EXISTS `loadrol`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `loadrol` (IN `idfilter` INT)  BEGIN


 


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

DROP PROCEDURE IF EXISTS `loadStatus`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `loadStatus` (IN `idfilter` INT)  BEGIN

 

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

DROP PROCEDURE IF EXISTS `loadstratum`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `loadstratum` (IN `idfilter` INT)  BEGIN

 

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

DROP PROCEDURE IF EXISTS `loadtipoidentificacion`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `loadtipoidentificacion` (IN `idfilter` INT)  BEGIN


 


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

DROP PROCEDURE IF EXISTS `loadtypeemployee`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `loadtypeemployee` (IN `idfilter` INT)  BEGIN


 


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

DROP PROCEDURE IF EXISTS `loadtypeevent`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `loadtypeevent` (IN `idfilter` INT)  BEGIN


 


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

DROP PROCEDURE IF EXISTS `loadviewtype`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `loadviewtype` (IN `idfilter` INT)  BEGIN

 

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

DROP PROCEDURE IF EXISTS `loadvigilancetype`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `loadvigilancetype` (IN `idfilter` INT)  BEGIN

 

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

DROP PROCEDURE IF EXISTS `loadzone`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `loadzone` (IN `idfilter` INT)  BEGIN

 

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

DROP PROCEDURE IF EXISTS `login`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `login` (IN `usu` VARCHAR(50), IN `pass` VARCHAR(50))  BEGIN


   select u.usuario,u.primer_nombre,u.primer_apellido,u.rol,u.id,r.nombre as rol_nombre


   from usuario as u


   inner join rol as r on u.rol = r.id


   where password=pass and usuario=usu;		


END$$

DROP PROCEDURE IF EXISTS `log_msg`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `log_msg` (`msg` VARCHAR(255))  READS SQL DATA
    DETERMINISTIC
    COMMENT 'Funcion que permite hacer debug'
BEGIN 


    insert into log_msg (log) value (msg);


END$$

DROP PROCEDURE IF EXISTS `searchclient`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `searchclient` (`vid` INT)  BEGIN


 	


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


                  p.`nivelProfesion_idnivelProfesion` as nivel_profesional,


                  ciuExp.`Departamentos_idDepartamento` as departamento_expedicion,


                  ciuRes.`Departamentos_idDepartamento` as departamento_residencia


	FROM clientes as cli 


        inner join profesiones as p on cli.profesiones_idprofesion = p.idprofesion 


        inner join ciudades as ciuExp on cli.`ciudadExpedicion_idciudad` = ciuExp.`idciudad`


        inner join ciudades as ciuRes on cli.`ciudadResidencia_idciudad` = ciuRes.`idciudad`


	where idCliente = vid;	


	


END$$

DROP PROCEDURE IF EXISTS `searchdependent`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `searchdependent` (`vid` INT)  BEGIN



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

DROP PROCEDURE IF EXISTS `searchemployee`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `searchemployee` (`vid` INT)  BEGIN


 	


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


                  pro.nivelProfesion_idnivelProfesion as id_nivel


	FROM Empleados as empl inner join ciudades as ciu 


   on empl.`idCiudadEmpleado` = ciu.`idCiudad` inner join profesiones as pro on empl.`idProfesionEmpleado` = pro.`idProfesion`


	where idEmpleado = vid;	


	


END$$

DROP PROCEDURE IF EXISTS `searchevent`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `searchevent` (`vidEvent` INT)  BEGIN


 	


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

DROP PROCEDURE IF EXISTS `searcheventcomments`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `searcheventcomments` (`vidEvent` INT)  BEGIN


 	


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

DROP PROCEDURE IF EXISTS `searchindependent`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `searchindependent` (`vid` INT)  BEGIN



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

DROP PROCEDURE IF EXISTS `searchnoticia`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `searchnoticia` (`idnoticia` INT)  BEGIN


 


	


	select id,titulo,descripcion, fecha,foto,video


	from noticia


	where id = idnoticia;


	


END$$

DROP PROCEDURE IF EXISTS `searchprofession`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `searchprofession` (`vid` INT)  BEGIN


 	


	SELECT idProfesion as id,nombreProfesion as nombre, nivelProfesion_idnivelProfesion as nivelProfesion


	FROM profesiones


	where idProfesion = vid;	


	


END$$

DROP PROCEDURE IF EXISTS `searchrol`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `searchrol` (`idrol` INT)  BEGIN


 


	


	select id,nombre,descripcion


	from rol


	where id = idrol;


	


END$$

DROP PROCEDURE IF EXISTS `searchuser`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `searchuser` (`vid` INT)  BEGIN


 	


	SELECT id, primer_nombre, segundo_nombre, primer_apellido, segundo_apellido, 


	usuario, rol, descripcion


	FROM usuario


	where id = vid;	


	


END$$

--
-- Funciones
--
DROP FUNCTION IF EXISTS `deleteclient`$$
CREATE DEFINER=`root`@`localhost` FUNCTION `deleteclient` (`vid` INT) RETURNS INT(1) READS SQL DATA
    DETERMINISTIC
    COMMENT 'Funcion que elimina un cliente'
BEGIN 


    DECLARE res INT DEFAULT 0;





    DELETE FROM detalleclientestipoclientes where `clientes_cedulaCliente` = vid;


    DELETE FROM clientes WHERE idCliente = vid;


    SET res = 1;


	RETURN res;


END$$

DROP FUNCTION IF EXISTS `deletedependent`$$
CREATE DEFINER=`root`@`localhost` FUNCTION `deletedependent` (`vid` INT) RETURNS INT(1) READS SQL DATA
    DETERMINISTIC
    COMMENT 'Funcion que elimina un arrendatario dependiente'
BEGIN 

    DECLARE res INT DEFAULT 0;

    DELETE FROM arrendatariodependiente WHERE clientes_idCliente = vid;

    SET res = 1;

	RETURN res;

END$$

DROP FUNCTION IF EXISTS `deleteemployee`$$
CREATE DEFINER=`root`@`localhost` FUNCTION `deleteemployee` (`vid` INT) RETURNS INT(1) READS SQL DATA
    DETERMINISTIC
    COMMENT 'Funcion que elimina un Empleado'
BEGIN 


    DECLARE res INT DEFAULT 0;


    DELETE FROM Empleados WHERE idEmpleado = vid;


    SET res = 1;


	RETURN res;


END$$

DROP FUNCTION IF EXISTS `deleteevent`$$
CREATE DEFINER=`root`@`localhost` FUNCTION `deleteevent` (`vid` INT) RETURNS INT(1) READS SQL DATA
    DETERMINISTIC
    COMMENT 'Funcion que elimina un evento'
BEGIN 


    DECLARE res INT DEFAULT 0;





    DELETE FROM detalleeventosempleados where eventosclientes_ideventoCliente = vid;


    DELETE FROM eventosclientes WHERE idEventoCliente = vid;


    SET res = 1;


	RETURN res;


END$$

DROP FUNCTION IF EXISTS `deleteindependent`$$
CREATE DEFINER=`root`@`localhost` FUNCTION `deleteindependent` (`vid` INT) RETURNS INT(1) READS SQL DATA
    DETERMINISTIC
    COMMENT 'Funcion que elimina un arrendatario dependiente'
BEGIN 

    DECLARE res INT DEFAULT 0;

    DELETE FROM arrendatarioindependiente WHERE clientes_idCliente = vid;

    SET res = 1;

	RETURN res;

END$$

DROP FUNCTION IF EXISTS `deletenoticia`$$
CREATE DEFINER=`root`@`localhost` FUNCTION `deletenoticia` (`vid` INT) RETURNS INT(1) READS SQL DATA
    DETERMINISTIC
    COMMENT 'Funcion que elimina una noticia'
BEGIN 


    DECLARE res INT DEFAULT 0;


    DELETE FROM noticia WHERE id = vid;


SET res = 1;


	RETURN res;


END$$

DROP FUNCTION IF EXISTS `deleteprofession`$$
CREATE DEFINER=`root`@`localhost` FUNCTION `deleteprofession` (`vid` INT) RETURNS INT(1) READS SQL DATA
    DETERMINISTIC
    COMMENT 'Funcion que elimina una profesion'
BEGIN 


    DECLARE res INT DEFAULT 0;


    DELETE FROM profesiones WHERE idProfesion = vid;


SET res = 1;


	RETURN res;


END$$

DROP FUNCTION IF EXISTS `deleterol`$$
CREATE DEFINER=`root`@`localhost` FUNCTION `deleterol` (`cod` INT) RETURNS INT(1) READS SQL DATA
    DETERMINISTIC
    COMMENT 'Funcion que elimina un rol'
BEGIN


	DECLARE res INT default 0;	


    delete from rol where id = cod;


	SET res = 1;


	RETURN res;


END$$

DROP FUNCTION IF EXISTS `deleteuser`$$
CREATE DEFINER=`root`@`localhost` FUNCTION `deleteuser` (`vid` INT) RETURNS INT(1) READS SQL DATA
    DETERMINISTIC
    COMMENT 'Funcion que elimina un usuario'
BEGIN 


    DECLARE res INT DEFAULT 0;


    DELETE FROM usuario WHERE id = vid;


SET res = 1;


	RETURN res;


END$$

DROP FUNCTION IF EXISTS `saveclient`$$
CREATE DEFINER=`root`@`localhost` FUNCTION `saveclient` (`vid` INT, `vfirstname` VARCHAR(50), `vsecondname` VARCHAR(50), `vfirstlastname` VARCHAR(50), `vsecondlastname` VARCHAR(50), `vDocumentType` INT, `vDocumentNumber` VARCHAR(11), `vCityExpedition` INT, `vBirthdate` VARCHAR(50), `vClientType` INT, `vAddress` VARCHAR(45), `vHomePhone` VARCHAR(10), `vMobilePhone` VARCHAR(10), `vEmail` VARCHAR(45), `vGender` INT, `vCityResidence` INT, `vProfession` INT, `vMaritalStatus` INT, `vPersonType` INT, `vtypesclient` VARCHAR(2000)) RETURNS INT(1) READS SQL DATA
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


                                    idEstadoCivil)


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


                                    vPersonType,vMaritalStatus);





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

DROP FUNCTION IF EXISTS `savedistrict`$$
CREATE DEFINER=`root`@`localhost` FUNCTION `savedistrict` (`vid` INT, `vname` VARCHAR(50), `vcity` INT) RETURNS INT(1) READS SQL DATA
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

DROP FUNCTION IF EXISTS `saveemployee`$$
CREATE DEFINER=`root`@`localhost` FUNCTION `saveemployee` (`vid` INT, `vfirstname` VARCHAR(50), `vsecondname` VARCHAR(50), `vfirstlastname` VARCHAR(50), `vsecondlastname` VARCHAR(50), `vDocumentNumber` VARCHAR(11), `vBirthdate` VARCHAR(50), `vTypeEmployee` INT, `vAddress` VARCHAR(45), `vHomePhone` VARCHAR(10), `vMobilePhone` VARCHAR(10), `vEmail` VARCHAR(45), `vGender` INT, `vCityResidence` INT, `vProfession` INT, `vMaritalStatus` INT) RETURNS INT(1) READS SQL DATA
    DETERMINISTIC
    COMMENT 'Funcion que almacena un Empleado'
BEGIN 


    DECLARE res INT DEFAULT 0;


    


IF NOT EXISTS(select 1 from Empleados where cedulaEmpleado=vDocumentNumber)


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


									idEsCivil)


                        VALUES (


                                    vDocumentNumber, 


                                    vfirstname, 


                                    vsecondname, 


                                    vfirstlastname , 


                                    vsecondlastname , 


                                    vAddress ,


									vMobilePhone,


									vHomePhone,


                                    vEmail,


                                    vGender , 


                                    vBirthdate,


                                    vCityResidence, 


                                    vProfession,


                                    vTypeEmployee,


									vMaritalStatus);


			set res = 1;


			


												 				 


		END IF;





	RETURN res;


	





END$$

DROP FUNCTION IF EXISTS `saveevent`$$
CREATE DEFINER=`root`@`localhost` FUNCTION `saveevent` (`vidEvent` INT, `vdateEvent` VARCHAR(50), `vtimeEvent` VARCHAR(50), `vplaceEvent` VARCHAR(100), `vlatitude` FLOAT, `vlength` FLOAT, `vclient` INT, `veventType` INT, `vobservations` VARCHAR(100), `vemployees` VARCHAR(2000)) RETURNS INT(1) READS SQL DATA
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

DROP FUNCTION IF EXISTS `savenoticia`$$
CREATE DEFINER=`root`@`localhost` FUNCTION `savenoticia` (`cod` INT, `titl` VARCHAR(200), `des` VARCHAR(10000), `fech` VARCHAR(20), `phot` VARCHAR(2000), `vid` VARCHAR(2000)) RETURNS INT(1) READS SQL DATA
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

DROP FUNCTION IF EXISTS `saveprofession`$$
CREATE DEFINER=`root`@`localhost` FUNCTION `saveprofession` (`vid` INT, `vname` VARCHAR(50), `vprofessionnivel` INT) RETURNS INT(1) READS SQL DATA
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

DROP FUNCTION IF EXISTS `savepropertie`$$
CREATE DEFINER=`root`@`localhost` FUNCTION `savepropertie` (`vid` INT, `vPrecio` FLOAT, `vAdministrationCost` FLOAT, `vRoom` INT, `vBath` INT, `vParking` INT, `vTotalArea` FLOAT, `vAreasWithoutBalconies` FLOAT, `vBuildYear` VARCHAR(4), `vNumeroPiso` VARCHAR(3), `vChimenea` TINYINT, `vEstudio` TINYINT, `vDeposito` TINYINT, `vZonaRopas` TINYINT, `vParqueaderoVisitante` TINYINT, `vAscensor` TINYINT, `vTerraza` TINYINT, `vTransportePublicoCercano` TINYINT, `vSalonComunal` TINYINT, `vSauna` TINYINT, `vTurco` TINYINT, `vJacuzzi` TINYINT, `vZonaInfantil` TINYINT, `vJardines` TINYINT, `vDuplex` TINYINT, `vPuertaSeguridad` TINYINT, `vGimnasio` TINYINT, `vPrecioNegociable` TINYINT, `vPiscina` TINYINT, `vZonaMascotas` TINYINT, `vParqueaderoCubierto` TINYINT, `vAmoblado` TINYINT, `vCity` INT, `vBarrio` INT, `vEstrato` INT, `vPropertieType` INT, `vOfferType` INT, `vCurtainType` INT, `vVigilanceType` INT, `vZone` INT, `vViewType` INT, `vStatus` INT, `vKitchenType` INT, `vKitchenStructure` INT, `vFloorType` INT, `vClient` INT, `vPublicationDate` VARCHAR(50), `vReceptionDate` VARCHAR(50), `vOutstandingType` INT, `vLinderos` VARCHAR(200), `vMatriculaInmobiliaria` VARCHAR(45), `vAvaluoCatastral` FLOAT, `vLatitude` VARCHAR(45), `vLongitude` VARCHAR(45), `vImages` VARCHAR(2000), `vVideos` VARCHAR(2000)) RETURNS INT(1) READS SQL DATA
    DETERMINISTIC
    COMMENT 'Funcion que almacena un inmueble'
BEGIN 
    DECLARE res INT DEFAULT 0;     
     
IF NOT EXISTS(select 1 from inmuebles where matriculaInmobiliaria=vMatriculaInmobiliaria)
		THEN
			insert into inmuebles(                                                                        
                                    precio,
                                    costoAdministracion,
                                    habitaciones,
                                    banos,
                                    parqueaderos,
                                    areaTotal ,
                                    areaSinBalcones ,
                                    anoDeConstruccion ,
                                    numeroPiso ,
                                    chimenea ,
                                    estudio ,
                                    deposito ,
                                    zonaRopas ,
                                    parqueaderoVisitante ,
                                    ascensor ,
                                    terraza ,
                                    transportePublicoCercano ,
                                    precioNegociable ,                                  
                                    piscina ,
                                    zonaMascotas ,
                                    parqueaderoCubierto ,
                                    amoblado,
                                    salonComunal ,
                                    sauna ,
                                    turco ,
                                    jacuzzi ,
                                    zonaInfantil ,
                                    jardines ,
                                    duplex ,
                                    puertaDeSeguridad ,
                                    gimnasio ,
                                    ciudades_idciudad ,
                                    estratos_idestrato ,
                                    barrios_idbarrio ,
                                    tiposInmuebles_idtipoInmueble ,
                                    tiposOfertas_idtipoOferta ,
                                    tiposCortinas_idtipoCortina ,
                                    tiposVigilancias_idtipoVigilancia ,
                                    zonas_idzona ,
                                    tiposVistas_idtipoVista ,                                    
                                    estado_idestado ,
                                    tiposCocinas_idtipoCocina ,
                                    estructurasCocinas_idestructuraCocina ,
                                    tiposPisos_idtipoPiso ,
                                    clientes_cedulaCliente ,
                                    fechaPublicación ,
                                    fechaRecepcion ,
                                    tiposDestacados_idtipoDestacado ,
                                    linderosInmueble ,
                                    matriculaInmobiliaria ,
                                    avaluoCatastral,
                                    latitud,
                                    longitud
                                   )
                        VALUES (
                               vPrecio , 
                               vAdministrationCost , 
                               vRoom , 
                               vBath , 
                               vParking , 
                               vTotalArea , 
                               vAreasWithoutBalconies , 
                               vBuildYear , 
                               vNumeroPiso , 
                               vChimenea , 
                               vEstudio , 
                               vDeposito ,
                               vZonaRopas  ,
                               vParqueaderoVisitante  ,
                               vAscensor  ,
                               vTerraza  ,
                               vTransportePublicoCercano ,
                               vPrecioNegociable  ,                                
                               vPiscina  ,
                               vZonaMascotas  ,
                               vParqueaderoCubierto  ,
                               vAmoblado  ,
                               vSalonComunal  ,
                               vSauna  ,
                               vTurco  ,
                               vJacuzzi  ,
                               vZonaInfantil  ,
                               vJardines  ,
                               vDuplex  ,
                               vPuertaSeguridad  ,
                               vGimnasio  ,                                                              
                               vCity  ,
                               vEstrato  ,
                               vBarrio  ,                           
                               vPropertieType  ,
                               vOfferType  ,
                               vCurtainType  ,
                               vVigilanceType  ,
                               vZone  ,
                               vViewType  ,
                               vStatus  ,
                               vKitchenType  ,
                               vKitchenStructure  ,
                               vFloorType  ,
                               vClient  ,
                               vPublicationDate  ,
                               vReceptionDate  ,
                               vOutstandingType ,
                               vLinderos ,
                               vMatriculaInmobiliaria ,
                               vAvaluoCatastral, 
                               vLatitude,
                               vLongitude);


    SET @vidPropertie = LAST_INSERT_ID();	

  
    WHILE (LOCATE(',', vImages) > 0) DO
      /*Se saca el primer campo separado por coma del varchar*/
      SET @V_DESIGNATION = SUBSTRING(vImages,1, LOCATE(',',vImages)-1); 
      /*call log_msg(CONCAT('PARTICIONADO********',@V_DESIGNATION));*/
      /*Se elimina ese primer valor y se reemplaza en la cadena*/
      SET vImages = SUBSTRING(vImages, LOCATE(',',vImages) + 1); 
      /*call log_msg(CONCAT('PRUEBA********',vImages));*/
      /*call log_msg(CONCAT('VAMOS A INSERTAR********',@V_DESIGNATION,'-------',@vidPropertie));*/
      
       /*Se almacena en la tabla, siempre y cuando tenga un dato para almacenar*/
       IF @V_DESIGNATION <> ',' THEN	
    		INSERT INTO imagenInmueble(rutaImagen, idInmueble) 
                VALUES (CONVERT(@V_DESIGNATION,CHAR(200)),@vidPropertie);
	END IF;
    END WHILE;



    WHILE (LOCATE(',', vVideos) > 0) DO
      /*Se saca el primer campo separado por coma del varchar*/
      SET @V_DESIGNATION = SUBSTRING(vVideos,1, LOCATE(',',vVideos)-1); 
      /*call log_msg(CONCAT('PARTICIONADO********',@V_DESIGNATION));*/
      /*Se elimina ese primer valor y se reemplaza en la cadena*/
      SET vVideos = SUBSTRING(vVideos, LOCATE(',',vVideos) + 1); 
      /*call log_msg(CONCAT('PRUEBA********',vVideos));*/
      /*call log_msg(CONCAT('VAMOS A INSERTAR********',@V_DESIGNATION,'-------',@vidPropertie));*/
      
       /*Se almacena en la tabla, siempre y cuando tenga un dato para almacenar*/
       IF @V_DESIGNATION <> ',' THEN	
    		INSERT INTO videoInmueble(rutaVideo, idInmueble) 
                VALUES (CONVERT(@V_DESIGNATION,CHAR(200)),@vidPropertie);
	END IF;
    END WHILE;
		          
				
    set res = 1;
			
												 				 
		END IF;

	RETURN res;
	

END$$

DROP FUNCTION IF EXISTS `saverol`$$
CREATE DEFINER=`root`@`localhost` FUNCTION `saverol` (`cod` INT, `nom` VARCHAR(50), `des` VARCHAR(2000)) RETURNS INT(1) READS SQL DATA
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

DROP FUNCTION IF EXISTS `saveupdatedependent`$$
CREATE DEFINER=`root`@`localhost` FUNCTION `saveupdatedependent` (`vid` INT, `vactivityEconomic` INT, `vcompany` VARCHAR(50), `vposition` INT, `vaddress` VARCHAR(200), `vsalary` FLOAT, `votherIncome` FLOAT, `vantiquity` INT, `vofficePhone` VARCHAR(10)) RETURNS INT(1) READS SQL DATA
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

DROP FUNCTION IF EXISTS `saveupdateindependent`$$
CREATE DEFINER=`root`@`localhost` FUNCTION `saveupdateindependent` (`vid` INT, `vactivityEconomic` INT, `vbusinessDescription` VARCHAR(100), `vmerchantRecord` VARCHAR(50), `vnumberEmployees` INT, `vincome` FLOAT, `vexpenses` FLOAT) RETURNS INT(1) READS SQL DATA
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

DROP FUNCTION IF EXISTS `saveuser`$$
CREATE DEFINER=`root`@`localhost` FUNCTION `saveuser` (`id` INT, `vfirstname` VARCHAR(50), `vsecondname` VARCHAR(50), `vfirstlastname` VARCHAR(50), `vsecondlastname` VARCHAR(50), `vuser` VARCHAR(50), `vpass` VARCHAR(50), `vrol` INT, `vdescription` VARCHAR(50)) RETURNS INT(1) READS SQL DATA
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

DROP FUNCTION IF EXISTS `updateclient`$$
CREATE DEFINER=`root`@`localhost` FUNCTION `updateclient` (`vid` INT, `vfirstname` VARCHAR(50), `vsecondname` VARCHAR(50), `vfirstlastname` VARCHAR(50), `vsecondlastname` VARCHAR(50), `vDocumentType` INT, `vDocumentNumber` VARCHAR(11), `vCityExpedition` INT, `vBirthdate` VARCHAR(50), `vClientType` INT, `vAddress` VARCHAR(45), `vHomePhone` VARCHAR(10), `vMobilePhone` VARCHAR(10), `vEmail` VARCHAR(45), `vGender` INT, `vCityResidence` INT, `vProfession` INT, `vMaritalStatus` INT, `vPersonType` INT, `vtypesclient` VARCHAR(2000)) RETURNS INT(1) READS SQL DATA
    DETERMINISTIC
    COMMENT 'Funcion que modifica un cliente'
BEGIN 


    DECLARE res INT DEFAULT 0;


    


IF NOT EXISTS(select 1 from clientes where numeroIdentificacion =vDocumentNumber and idCliente<>vId)


		THEN


			update clientes set numeroIdentificacion = vDocumentNumber,


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


                                            idGenero = vGender                                                                                                             


                        where 	idCliente = vId;		


			set res=1;








                        delete from detalleclientestipoclientes 


                        where `clientes_cedulaCliente` = vId;


 





   WHILE (LOCATE(',', vtypesclient) > 0) DO


      /*Se saca el primer campo separado por coma del varchar*/


      SET @V_DESIGNATION = SUBSTRING(vtypesclient,1, LOCATE(',',vtypesclient)-1); 


      /*call log_msg(CONCAT('PARTICIONADO********',@V_DESIGNATION));*/


      /*Se elimina ese primer valor y se reemplaza en la cadena*/


      SET vtypesclient = SUBSTRING(vtypesclient, LOCATE(',',vtypesclient) + 1); 


      /*call log_msg(CONCAT('PRUEBA********',vtypesclient));*/


      /*call log_msg(CONCAT('VAMOS A INSERTAR********',@V_DESIGNATION,'-------',@vidClient));*/


      


       /*Se almacena en la tabla, siempre y cuando tenga un dato para almacenar*/


       IF @V_DESIGNATION <> '' THEN	


    		INSERT INTO detalleclientestipoclientes(tiposClientes_idtipoCliente, clientes_cedulaCliente) 


            VALUES (CONVERT(@V_DESIGNATION,SIGNED),vid);


		END IF;


    END WHILE;





                        


														


		END IF;





	RETURN res;


	


	





END$$

DROP FUNCTION IF EXISTS `updatecommentevents`$$
CREATE DEFINER=`root`@`localhost` FUNCTION `updatecommentevents` (`vid` INT, `vcomments` VARCHAR(16383)) RETURNS INT(1) READS SQL DATA
    DETERMINISTIC
    COMMENT 'Funcion que modifica los comentarios de un evento'
BEGIN 


    DECLARE res INT DEFAULT 0;


    


			update eventosclientes set DescripcionEvento = vcomments                                                                                                             


                        where 	ideventoCliente = vId;		


			set res=1;


                        


												


	RETURN res;


	





END$$

DROP FUNCTION IF EXISTS `updateemployee`$$
CREATE DEFINER=`root`@`localhost` FUNCTION `updateemployee` (`vid` INT, `vfirstname` VARCHAR(50), `vsecondname` VARCHAR(50), `vfirstlastname` VARCHAR(50), `vsecondlastname` VARCHAR(50), `vDocumentNumber` VARCHAR(11), `vBirthdate` VARCHAR(50), `vTypeEmployee` INT, `vAddress` VARCHAR(45), `vHomePhone` VARCHAR(10), `vMobilePhone` VARCHAR(10), `vEmail` VARCHAR(45), `vGender` INT, `vCityResidence` INT, `vProfession` INT, `vMaritalStatus` INT) RETURNS INT(1) READS SQL DATA
    DETERMINISTIC
    COMMENT 'Funcion que modifica un Empleado'
BEGIN 


    DECLARE res INT DEFAULT 0;


    


IF NOT EXISTS(select 1 from Empleados where cedulaEmpleado =vDocumentNumber and idEmpleado<>vId)


		THEN


			update Empleados set cedulaEmpleado = vDocumentNumber,


                                            primerNombreEmpleado = vfirstname, 


                                            segundoNombreEmpleado = vsecondname,


                                            primerApellidoEmpleado = vfirstlastname, 


                                            segundoApellidoEmpleado = vsecondlastname, 


                                            direccionEmpleado = vAddress,


                                            telefonoFijoEmpleado = vHomePhone, 


                                            telefonoMovilEmpleado = vMobilePhone, 


                                            correoEmpleado = vEmail, 


                                            fechaNacimientoEmpleado = vBirthdate, 


                                            idCiudadEmpleado = vCityResidence,                                                                                                                                     


                                            idProfesionEmpleado = vProfession,


                                            idtipoEmpleado = vTypeEmployee,


                                            idEsCivil = vMaritalStatus,                                          


                                            idGeneroEmpleado = vGender                                                                                                             


                        where 	idEmpleado = vId;		


			set res=1;


                        


														


		END IF;





	RETURN res;


	





END$$

DROP FUNCTION IF EXISTS `updateevent`$$
CREATE DEFINER=`root`@`localhost` FUNCTION `updateevent` (`vid` INT, `vdateEvent` VARCHAR(50), `vtimeEvent` VARCHAR(50), `vplaceEvent` VARCHAR(100), `vlatitude` FLOAT, `vlength` FLOAT, `vclient` INT, `veventType` INT, `vobservations` VARCHAR(100), `vemployees` VARCHAR(2000)) RETURNS INT(1) READS SQL DATA
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

DROP FUNCTION IF EXISTS `updatenoticia`$$
CREATE DEFINER=`root`@`localhost` FUNCTION `updatenoticia` (`cod` INT, `titl` VARCHAR(200), `des` VARCHAR(10000), `fech` VARCHAR(20), `phot` VARCHAR(2000), `vid` VARCHAR(2000)) RETURNS INT(1) READS SQL DATA
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

DROP FUNCTION IF EXISTS `updatepermission`$$
CREATE DEFINER=`root`@`localhost` FUNCTION `updatepermission` (`vid` INTEGER, `vpermission` VARCHAR(2000)) RETURNS INT(1) READS SQL DATA
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

DROP FUNCTION IF EXISTS `updateprofession`$$
CREATE DEFINER=`root`@`localhost` FUNCTION `updateprofession` (`vId` INT, `vName` VARCHAR(50), `vProfessionNivel` INT) RETURNS INT(1) READS SQL DATA
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

DROP FUNCTION IF EXISTS `updaterol`$$
CREATE DEFINER=`root`@`localhost` FUNCTION `updaterol` (`cod` INT, `nom` VARCHAR(50), `des` VARCHAR(2000)) RETURNS INT(1) READS SQL DATA
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

DROP FUNCTION IF EXISTS `updateuser`$$
CREATE DEFINER=`root`@`localhost` FUNCTION `updateuser` (`vid` INT, `vfirstname` VARCHAR(50), `vsecondname` VARCHAR(50), `vfirstlastname` VARCHAR(50), `vsecondlastname` VARCHAR(50), `vuser` VARCHAR(50), `vpass` VARCHAR(50), `vrol` INT, `vdescription` VARCHAR(50)) RETURNS INT(1) READS SQL DATA
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

DROP TABLE IF EXISTS `areaempresa`;
CREATE TABLE IF NOT EXISTS `areaempresa` (
  `idareaEmpresa` int(11) NOT NULL AUTO_INCREMENT,
  `nombreArea` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idareaEmpresa`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `arl`
--

DROP TABLE IF EXISTS `arl`;
CREATE TABLE IF NOT EXISTS `arl` (
  `idarl` int(11) NOT NULL AUTO_INCREMENT,
  `nombreArl` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idarl`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `arl`
--

INSERT INTO `arl` (`idarl`, `nombreArl`) VALUES
(1, 'Seguros de Vida Colpatria S.A.'),
(2, 'Compañía de Seguros Bolívar S.A.'),
(3, 'Seguros de Vida Aurora'),
(4, 'ARP Alfa'),
(5, 'Liberty Seguros de Vida S.A.'),
(6, 'Positiva Compañía de Seguros'),
(7, 'Colmena Riesgos Profesionales'),
(8, 'Sura'),
(9, 'La Equidad Seguros de Vida'),
(10, 'Mapfre Colombia Vida Seguros S.A');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `arrendatariodependiente`
--

DROP TABLE IF EXISTS `arrendatariodependiente`;
CREATE TABLE IF NOT EXISTS `arrendatariodependiente` (
  `idarrendatarioDependiente` int(11) NOT NULL AUTO_INCREMENT,
  `Cargos_idCargo` int(11) NOT NULL,
  `nombreEmpresa` varchar(45) DEFAULT NULL,
  `sueldoBasico` float DEFAULT NULL,
  `otrosIngresos` float DEFAULT NULL,
  `direccionOficina` varchar(100) DEFAULT NULL,
  `telefonoOficina` varchar(10) DEFAULT NULL,
  `antiguedadEnEmpresa` int(11) DEFAULT NULL,
  `clientes_idCliente` int(11) NOT NULL,
  `idtipoLaborArrendatario` int(11) NOT NULL,
  PRIMARY KEY (`idarrendatarioDependiente`),
  KEY `fk_arrendatarioDependiente_Cargos1_idx` (`Cargos_idCargo`),
  KEY `fk_arrendatariodependiente_clientes1_idx` (`clientes_idCliente`),
  KEY `fk_arrendatariodependiente_tipoactividadeconomicaarrendatar_idx` (`idtipoLaborArrendatario`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `arrendatarioindependiente`
--

DROP TABLE IF EXISTS `arrendatarioindependiente`;
CREATE TABLE IF NOT EXISTS `arrendatarioindependiente` (
  `idarrendatarioIndependiente` int(11) NOT NULL AUTO_INCREMENT,
  `descripcionNegocio` varchar(45) NOT NULL,
  `registroMercantil` varchar(45) DEFAULT NULL,
  `ingresos` float DEFAULT NULL,
  `egresos` float DEFAULT NULL,
  `numeroEmpleados` int(11) DEFAULT NULL,
  `clientes_idCliente` int(11) NOT NULL,
  `tipoactividadeconomicaarrendatario_idtipoLaborArrendatario` int(11) NOT NULL,
  PRIMARY KEY (`idarrendatarioIndependiente`),
  KEY `fk_arrendatarioindependiente_clientes1_idx` (`clientes_idCliente`),
  KEY `fk_arrendatarioindependiente_tipoactividadeconomicaarrendat_idx` (`tipoactividadeconomicaarrendatario_idtipoLaborArrendatario`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `bancos`
--

DROP TABLE IF EXISTS `bancos`;
CREATE TABLE IF NOT EXISTS `bancos` (
  `idbanco` int(11) NOT NULL AUTO_INCREMENT,
  `nombreBanco` varchar(45) DEFAULT NULL,
  `direccionPrincipal` varchar(45) DEFAULT NULL,
  `telefonoPrincipal` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`idbanco`)
) ENGINE=InnoDB AUTO_INCREMENT=181 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `bancos`
--

INSERT INTO `bancos` (`idbanco`, `nombreBanco`, `direccionPrincipal`, `telefonoPrincipal`) VALUES
(136, 'Arco Grupo Bancoldex', NULL, NULL),
(137, 'Banca de Inversión Bancolombia', NULL, NULL),
(138, 'Bancamía S.A.', NULL, NULL),
(139, 'Banco  de  Occidente S.A.', NULL, NULL),
(140, 'Banco Agrario de Colombia', NULL, NULL),
(141, 'Banco AV Villas', NULL, NULL),
(142, 'Banco Caja Social', NULL, NULL),
(143, 'Banco Compartir', NULL, NULL),
(144, 'Banco Coomeva', NULL, NULL),
(145, 'Banco Cooperativo Coopcentral', NULL, NULL),
(146, 'Banco Corpobanca', NULL, NULL),
(147, 'Banco Davivienda', NULL, NULL),
(148, 'Banco de Bogotá', NULL, NULL),
(149, 'Banco Falabella', NULL, NULL),
(150, 'Banco Finandina', NULL, NULL),
(151, 'Banco GNB Sudameris', NULL, NULL),
(152, 'Banco Multibank', NULL, NULL),
(153, 'Banco Mundo Mujer', NULL, NULL),
(154, 'Banco Pichincha', NULL, NULL),
(155, 'Banco Popular S.A.', NULL, NULL),
(156, 'Banco ProCredit', NULL, NULL),
(157, 'Banco Santander', NULL, NULL),
(158, 'Banco W S.A.', NULL, NULL),
(159, 'Bancolombia S.A.', NULL, NULL),
(160, 'BBVA Colombia', NULL, NULL),
(161, 'BNP Paribas Colombia Corporación Financiera', NULL, NULL),
(162, 'Citibank-Colombia', NULL, NULL),
(163, 'Colpatria', NULL, NULL),
(164, 'Coltefinanciera', NULL, NULL),
(165, 'Compañía de Financiamiento TUYA', NULL, NULL),
(166, 'Corporación Financiera Colombiana', NULL, NULL),
(167, 'Credifamilia Compañía de Financiamiento', NULL, NULL),
(168, 'Credifinanciera', NULL, NULL),
(169, 'Financiera DANN ', NULL, NULL),
(170, 'Financiera Juriscoop', NULL, NULL),
(171, 'Financiera Pagos Internacionales', NULL, NULL),
(172, 'Giros & Finanzas Compañía de Financiamiento', NULL, NULL),
(173, 'GM Financial Colombia', NULL, NULL),
(174, 'ITAÚ BBA Colombia', NULL, NULL),
(175, 'JPMorgan Corporación Financiera', NULL, NULL),
(176, 'La Hipotecaria Compañía de Financiamiento', NULL, NULL),
(177, 'Leasing Corficolombiana', NULL, NULL),
(178, 'Opportunity International Colombia', NULL, NULL),
(179, 'RCI Colombia', NULL, NULL),
(180, 'Serfinansa', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `barrios`
--

DROP TABLE IF EXISTS `barrios`;
CREATE TABLE IF NOT EXISTS `barrios` (
  `idbarrio` int(11) NOT NULL AUTO_INCREMENT,
  `nombreBarrio` varchar(45) NOT NULL,
  `idCiudad` int(11) DEFAULT NULL,
  PRIMARY KEY (`idbarrio`),
  KEY `idCiudad` (`idCiudad`)
) ENGINE=InnoDB AUTO_INCREMENT=1112 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `barrios`
--

INSERT INTO `barrios` (`idbarrio`, `nombreBarrio`, `idCiudad`) VALUES
(836, 'Asentamiento  25 de enero', 886),
(837, 'Asentamiento  el milagro', 886),
(838, 'Asentamiento  el recuerdo', 886),
(839, 'Asentamiento  los fundadores', 886),
(840, 'Asentamiento las veraneras', 886),
(841, 'Asentamiento puerto rico', 886),
(842, 'Asentamiento salvador allende', 886),
(843, 'Asentamiento vieja libertad', 886),
(844, 'Barrio  25 de mayo', 886),
(845, 'Barrio  7 de agosto', 886),
(846, 'Barrio  buenos aires', 886),
(847, 'Barrio  el recreo', 886),
(848, 'Barrio  el silencio', 886),
(849, 'Barrio  galan', 886),
(850, 'Barrio  granada', 886),
(851, 'Barrio  la adiela', 886),
(852, 'Barrio  la campina', 886),
(853, 'Barrio  la castellana', 886),
(854, 'Barrio  la montana', 886),
(855, 'Barrio  las sesenta casas', 886),
(856, 'Barrio  los fundadores', 886),
(857, 'Barrio  niagara', 886),
(858, 'Barrio  providencia', 886),
(859, 'Barrio  uribe', 886),
(860, 'Barrio 14 de octubre', 886),
(861, 'Barrio 19 de enero', 886),
(862, 'Barrio 7 de agosto', 886),
(863, 'Barrio 8 de marzo', 886),
(864, 'Barrio alcazar', 886),
(865, 'Barrio alfonso lopez', 886),
(866, 'Barrio antonio narino', 886),
(867, 'Barrio arenales', 886),
(868, 'Barrio arrayanes', 886),
(869, 'Barrio belen', 886),
(870, 'Barrio belencito', 886),
(871, 'Barrio bello horizonte', 886),
(872, 'Barrio berlin', 886),
(873, 'Barrio bosques de gibraltar', 886),
(874, 'Barrio boyaca', 886),
(875, 'Barrio buenos aires bajo', 886),
(876, 'Barrio buenos aires plano', 886),
(877, 'Barrio calima', 886),
(878, 'Barrio cincuentenario', 886),
(879, 'Barrio colinas centro', 886),
(880, 'Barrio cooperativo', 886),
(881, 'Barrio corbones', 886),
(882, 'Barrio el bosque', 886),
(883, 'Barrio el emperador', 886),
(884, 'Barrio el nogal', 886),
(885, 'Barrio el paraiso', 886),
(886, 'Barrio el placer', 886),
(887, 'Barrio el porvenir', 886),
(888, 'Barrio el prado', 886),
(889, 'Barrio el recreo', 886),
(890, 'Barrio espana', 886),
(891, 'Barrio farallones', 886),
(892, 'Barrio gaitan', 886),
(893, 'Barrio gibraltar', 886),
(894, 'Barrio guayaquil', 886),
(895, 'Barrio jesus maria ocampo', 886),
(896, 'Barrio la anunciacion', 886),
(897, 'Barrio la arboleda', 886),
(898, 'Barrio la brasilia', 886),
(899, 'Barrio la cabana', 886),
(900, 'Barrio la clarita', 886),
(901, 'Barrio la esperanza', 886),
(902, 'Barrio la isabela', 886),
(903, 'Barrio la lorena', 886),
(904, 'Barrio la milagrosa', 886),
(905, 'Barrio la miranda', 886),
(906, 'Barrio la union', 886),
(907, 'Barrio las acacias', 886),
(908, 'Barrio las americas', 886),
(909, 'Barrio las margaritas', 886),
(910, 'Barrio las mercedes', 886),
(911, 'Barrio las palmas', 886),
(912, 'Barrio laureles', 886),
(913, 'Barrio los alamos', 886),
(914, 'Barrio los cambulos', 886),
(915, 'Barrio los libertadores', 886),
(916, 'Barrio los naranjos', 886),
(917, 'Barrio los profesionales', 886),
(918, 'Barrio los quindos', 886),
(919, 'Barrio loteros', 886),
(920, 'Barrio manuela beltran', 886),
(921, 'Barrio marco fidel suarez', 886),
(922, 'Barrio miraflores', 886),
(923, 'Barrio modelo', 886),
(924, 'Barrio monteprado', 886),
(925, 'Barrio montevideo', 886),
(926, 'Barrio nueva cecilia', 886),
(927, 'Barrio nueva libertad', 886),
(928, 'Barrio obrero', 886),
(929, 'Barrio patio bonito', 886),
(930, 'Barrio patio bonito bajo', 886),
(931, 'Barrio patricia', 886),
(932, 'Barrio piamonte', 886),
(933, 'Barrio pinares', 886),
(934, 'Barrio popular', 886),
(935, 'Barrio quindio', 886),
(936, 'Barrio rincon santo', 886),
(937, 'Barrio salazar', 886),
(938, 'Barrio san andres', 886),
(939, 'Barrio san fernando', 886),
(940, 'Barrio san jose', 886),
(941, 'Barrio san nicolas', 886),
(942, 'Barrio san vicente de paul', 886),
(943, 'Barrio santa helena', 886),
(944, 'Barrio santa maria', 886),
(945, 'Barrio santa rita', 886),
(946, 'Barrio santafe', 886),
(947, 'Barrio santander', 886),
(948, 'Barrio tigreros', 886),
(949, 'Barrio velez', 886),
(950, 'Barrio zuldemayda', 886),
(951, 'Sector  aborigenes', 886),
(952, 'Sector  av centenario', 886),
(953, 'Sector  bavaria', 886),
(954, 'Sector  centro', 886),
(955, 'Sector  coinca', 886),
(956, 'Sector  crq', 886),
(957, 'Sector  el coliseo', 886),
(958, 'Sector  el mirador', 886),
(959, 'Sector  estadio centenario', 886),
(960, 'Sector  jardines', 886),
(961, 'Sector  la aldea', 886),
(962, 'Sector  la florida', 886),
(963, 'Sector  la fogata', 886),
(964, 'Sector  la maria', 886),
(965, 'Sector  monterredondo', 886),
(966, 'Sector  norte avenida 19', 886),
(967, 'Sector  parque cafetero', 886),
(968, 'Sector  parque valencia', 886),
(969, 'Sector  proviteq', 886),
(970, 'Sector  quebrada la clarita-san jose', 886),
(971, 'Sector  regivit', 886),
(972, 'Sector  san juan', 886),
(973, 'Sector  san nicolas', 886),
(974, 'Sector  santa ana', 886),
(975, 'Sector  sinai', 886),
(976, 'Sector  tigreros', 886),
(977, 'Sector  tres esquinas', 886),
(978, 'Sector  yulima', 886),
(979, 'Urbanizacion  bosques de viena', 886),
(980, 'Urbanizacion  el limonar', 886),
(981, 'Urbanizacion  el silencio', 886),
(982, 'Urbanizacion  el tesorito', 886),
(983, 'Urbanizacion  la fachada', 886),
(984, 'Urbanizacion  la virginia', 886),
(985, 'Urbanizacion  los almendros', 886),
(986, 'Urbanizacion  nuevo recreo', 886),
(987, 'Urbanizacion  palmares del recreo', 886),
(988, 'Urbanizacion  primero de mayo', 886),
(989, 'Urbanizacion  sara', 886),
(990, 'Urbanizacion  venecia', 886),
(991, 'Urbanizacion  villa andrea', 886),
(992, 'Urbanizacion  villa celmira', 886),
(993, 'Urbanizacion  villa de las americas', 886),
(994, 'Urbanizacion  villa jardin', 886),
(995, 'Urbanizacion  villa maraveles', 886),
(996, 'Urbanizacion 13 de junio', 886),
(997, 'Urbanizacion aguazul', 886),
(998, 'Urbanizacion ahitamara', 886),
(999, 'Urbanizacion alameda del norte', 886),
(1000, 'Urbanizacion alcazar del caf?', 886),
(1001, 'Urbanizacion alejandria', 886),
(1002, 'Urbanizacion altos de la pavona', 886),
(1003, 'Urbanizacion arco iris', 886),
(1004, 'Urbanizacion bambusa', 886),
(1005, 'Urbanizacion baru', 886),
(1006, 'Urbanizacion bosques de pinares', 886),
(1007, 'Urbanizacion brasilia nueva', 886),
(1008, 'Urbanizacion cabo de la vela', 886),
(1009, 'Urbanizacion canas gordas', 886),
(1010, 'Urbanizacion cano cristales', 886),
(1011, 'Urbanizacion casablanca', 886),
(1012, 'Urbanizacion castilla grande', 886),
(1013, 'Urbanizacion centenario', 886),
(1014, 'Urbanizacion chalets de monteblanco', 886),
(1015, 'Urbanizacion ciudad dorada', 886),
(1016, 'Urbanizacion ciudadela el poblado', 886),
(1017, 'Urbanizacion ciudadela el sol', 886),
(1018, 'Urbanizacion ciudadela la patria', 886),
(1019, 'Urbanizacion ciudadela las colinas', 886),
(1020, 'Urbanizacion ciudadela los andes', 886),
(1021, 'Urbanizacion ciudadela nueva armenia', 886),
(1022, 'Urbanizacion ciudadela nuevo horizonte', 886),
(1023, 'Urbanizacion ciudadela puerto espejo', 886),
(1024, 'Urbanizacion ciudadela simon bolivar', 886),
(1025, 'Urbanizacion cristales', 886),
(1026, 'Urbanizacion el carmelo', 886),
(1027, 'Urbanizacion el cortijo', 886),
(1028, 'Urbanizacion el jubileo', 886),
(1029, 'Urbanizacion el palmar', 886),
(1030, 'Urbanizacion el parque', 886),
(1031, 'Urbanizacion el refugio', 886),
(1032, 'Urbanizacion el remanso', 886),
(1033, 'Urbanizacion el sinai', 886),
(1034, 'Urbanizacion francisco jose de caldas', 886),
(1035, 'Urbanizacion genesis', 886),
(1036, 'Urbanizacion guaduales de la villa', 886),
(1037, 'Urbanizacion guaduales del eden', 886),
(1038, 'Urbanizacion la alhambra', 886),
(1039, 'Urbanizacion la arcadia', 886),
(1040, 'Urbanizacion la castilla', 886),
(1041, 'Urbanizacion la cecilia', 886),
(1042, 'Urbanizacion la cristalina', 886),
(1043, 'Urbanizacion la divisa', 886),
(1044, 'Urbanizacion la esmeralda', 886),
(1045, 'Urbanizacion la gran bretana', 886),
(1046, 'Urbanizacion la grecia', 886),
(1047, 'Urbanizacion la irlanda', 886),
(1048, 'Urbanizacion la linda', 886),
(1049, 'Urbanizacion la mariela', 886),
(1050, 'Urbanizacion la montana', 886),
(1051, 'Urbanizacion la pavona', 886),
(1052, 'Urbanizacion la rivera', 886),
(1053, 'Urbanizacion las brisas', 886),
(1054, 'Urbanizacion las serranias', 886),
(1055, 'Urbanizacion lindaraja', 886),
(1056, 'Urbanizacion loma verde', 886),
(1057, 'Urbanizacion lomas de la union', 886),
(1058, 'Urbanizacion los arcades', 886),
(1059, 'Urbanizacion los artesanos', 886),
(1060, 'Urbanizacion los girasoles', 886),
(1061, 'Urbanizacion los kioscos', 886),
(1062, 'Urbanizacion los sauces', 886),
(1063, 'Urbanizacion luis carlos galan sarmiento', 886),
(1064, 'Urbanizacion manantiales', 886),
(1065, 'Urbanizacion marbella', 886),
(1066, 'Urbanizacion maria cristina', 886),
(1067, 'Urbanizacion mercedes del norte', 886),
(1068, 'Urbanizacion monteblanco', 886),
(1069, 'Urbanizacion montecarlo', 886),
(1070, 'Urbanizacion murano', 886),
(1071, 'Urbanizacion nuestra senora de la paz', 886),
(1072, 'Urbanizacion nuevo amanecer', 886),
(1073, 'Urbanizacion nuevo berlin', 886),
(1074, 'Urbanizacion nuevo recreo', 886),
(1075, 'Urbanizacion nuevo sol', 886),
(1076, 'Urbanizacion palmares del recreo', 886),
(1077, 'Urbanizacion portal de pinares', 886),
(1078, 'Urbanizacion portal del eden', 886),
(1079, 'Urbanizacion primero de mayo', 886),
(1080, 'Urbanizacion provivienda universal', 886),
(1081, 'Urbanizacion quintas de juliana', 886),
(1082, 'Urbanizacion quintas de la marina', 886),
(1083, 'Urbanizacion quintas de los andes', 886),
(1084, 'Urbanizacion rojas pinilla_1', 886),
(1085, 'Urbanizacion rojas pinilla_2', 886),
(1086, 'Urbanizacion san diego', 886),
(1087, 'Urbanizacion san francisco', 886),
(1088, 'Urbanizacion santa sofia', 886),
(1089, 'Urbanizacion terranova el alba', 886),
(1090, 'Urbanizacion tres esquinas', 886),
(1091, 'Urbanizacion veracruz', 886),
(1092, 'Urbanizacion villa alejandra', 886),
(1093, 'Urbanizacion villa angela', 886),
(1094, 'Urbanizacion villa angela_cordillera', 886),
(1095, 'Urbanizacion villa carolina', 886),
(1096, 'Urbanizacion villa claudia', 886),
(1097, 'Urbanizacion villa de la vida y el trabajo', 886),
(1098, 'Urbanizacion villa del caf?', 886),
(1099, 'Urbanizacion villa del carmen', 886),
(1100, 'Urbanizacion villa del centenario', 886),
(1101, 'Urbanizacion villa hermosa', 886),
(1102, 'Urbanizacion villa inglesa', 886),
(1103, 'Urbanizacion villa italia', 886),
(1104, 'Urbanizacion villa juliana', 886),
(1105, 'Urbanizacion villa laura', 886),
(1106, 'Urbanizacion villa liliana', 886),
(1107, 'Urbanizacion villa marcela', 886),
(1108, 'Urbanizacion villa sofia', 886),
(1109, 'Urbanizacion villa ximena', 886),
(1110, 'Urbanizacion vista hermosa', 886),
(1111, 'Conjunto residencial Galatea', 901);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cajacompensacion`
--

DROP TABLE IF EXISTS `cajacompensacion`;
CREATE TABLE IF NOT EXISTS `cajacompensacion` (
  `idcajaCompensacion` int(11) NOT NULL AUTO_INCREMENT,
  `nombreCajaCompensacion` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idcajaCompensacion`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `cajacompensacion`
--

INSERT INTO `cajacompensacion` (`idcajaCompensacion`, `nombreCajaCompensacion`) VALUES
(1, 'Camacol'),
(2, 'Comfenalco Antioquia CCF'),
(3, 'Caja de Compensación Familiar de Antioquia'),
(4, 'Caja de Compensación Familiar Cajacopi Atlánt'),
(5, 'Combarranquilla'),
(6, 'Comfamiliar Atlántico'),
(7, 'Comfenalco Cartagena'),
(8, 'Caja de Compensación Familiar de Cartagena'),
(9, 'Comfaboy'),
(10, 'CCF de Caldas'),
(11, 'Comfaca'),
(12, 'Comfacauca'),
(13, 'Caja de Compensación Familiar Cesar'),
(14, 'Comfacor'),
(15, 'Cafam'),
(16, 'Colsubsidio'),
(17, 'Caja de Compensación Familiar Compensar'),
(18, 'Comfacundi'),
(19, 'CCF del Chocó'),
(20, 'Caja de Compensación Familiar de La Guajira'),
(21, 'Comfamiliar del Huila'),
(22, 'CCF del Magdalena'),
(23, 'Cofrem Meta'),
(24, 'CCF de Nariño'),
(25, 'Caja de Compensación Familiar del Oriente'),
(26, 'Caja de Comp. Familiar Comfanorte '),
(27, 'Caja de Comp. Familiar de Barrancabermeja Caf'),
(28, 'Cajasan '),
(29, 'Comfenalco Santander'),
(30, 'Caja de Compensación Familiar del Sucre'),
(31, 'Comfenalco Quindío'),
(32, 'Comfamiliar Risaralda'),
(33, 'CCF del Sur del Tolima Cafasur '),
(34, 'Comfatolima '),
(35, 'Comfenalco –Tolima'),
(36, 'Comfenalco Valle'),
(37, 'Comfandi '),
(38, 'Caja de Compensación Familiar del Putumayo'),
(39, 'Cajasai '),
(40, 'Caja de Comp Familiar del Amazonas Cafamaz'),
(41, 'Comfiar Caja de Compensacion Familiar de Arau'),
(42, 'Comcaja'),
(43, 'Comfacasanare');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `calificaciones`
--

DROP TABLE IF EXISTS `calificaciones`;
CREATE TABLE IF NOT EXISTS `calificaciones` (
  `idcalificacion` int(11) NOT NULL AUTO_INCREMENT,
  `valorCalificacion` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idcalificacion`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cargos`
--

DROP TABLE IF EXISTS `cargos`;
CREATE TABLE IF NOT EXISTS `cargos` (
  `idCargo` int(11) NOT NULL AUTO_INCREMENT,
  `nombreTipoCargo` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idCargo`)
) ENGINE=InnoDB AUTO_INCREMENT=921 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `cargos`
--

INSERT INTO `cargos` (`idCargo`, `nombreTipoCargo`) VALUES
(691, 'Ajustador de electricista'),
(692, 'Asistente médico'),
(693, 'Avicultor'),
(694, 'Ingeniero catastral'),
(695, 'Ingeniero textil'),
(696, 'Instalador de material aislante e isonorizaci'),
(697, 'Instalador y reparadores de  líneas eléctrica'),
(698, 'Peluquero'),
(699, 'Abogado'),
(700, 'Acarreador de agua'),
(701, 'Acompañante de personas'),
(702, 'Actor'),
(703, 'Administrador de equipos informáticos'),
(704, 'Administrador de redes'),
(705, 'Administrador de sistemas'),
(706, 'Agente de seguros'),
(707, 'Agente de viajes'),
(708, 'Agricultor '),
(709, 'Agrónomo '),
(710, 'Ajustador e instalador en electrónica'),
(711, 'Albañil'),
(712, 'Alfarero'),
(713, 'Analista de gestión y organización '),
(714, 'Analista de infraestructura'),
(715, 'Analista de sistemas'),
(716, 'Analista financiero'),
(717, 'Antropólogo'),
(718, 'Aparejador y espalmador de cables'),
(719, 'Apelambrador'),
(720, 'Arquitecto'),
(721, 'Artesano '),
(722, 'Artista'),
(723, 'Asesor financiero de inversiones'),
(724, 'Asistente odontológico '),
(725, 'Asistente terapeuta'),
(726, 'Astrólogo'),
(727, 'Astrónomo'),
(728, 'Atleta'),
(729, 'Auditor contable'),
(730, 'Auditor de calidad.'),
(731, 'Auditores financieros'),
(732, 'Auxiliar contable'),
(733, 'Auxiliar de maestro'),
(734, 'Auxiliar de nómina'),
(735, 'Auxiliar de seguros'),
(736, 'Auxiliar de servicios estadísticos'),
(737, 'Auxiliar financiero '),
(738, 'Auxiliar laico'),
(739, 'Avicultor'),
(740, 'Ayudante de cocina'),
(741, 'Ayudante de elaboración de alimentos y bebida'),
(742, 'Bailarines'),
(743, 'Bárman'),
(744, 'Barnizador y afin'),
(745, 'Barrendero y afin'),
(746, 'Biólogo'),
(747, 'Bisutero'),
(748, 'Bombero'),
(749, 'Botánico'),
(750, 'Buzo'),
(751, 'Cajero'),
(752, 'Camarógrafo'),
(753, 'Cantante'),
(754, 'Carnicero'),
(755, 'Carpintero'),
(756, 'Carpinteros'),
(757, 'Cartógrafo'),
(758, 'Catador'),
(759, 'Cazador'),
(760, 'Ceramista'),
(761, 'Cestero mimbreras'),
(762, 'Chapista calderero'),
(763, 'Chef de cocina'),
(764, 'Clasificador de desechos'),
(765, 'Cobrador'),
(766, 'Cocinero'),
(767, 'Codificador de datos'),
(768, 'Comercialnte al por menor'),
(769, 'Comerciante al por mayor'),
(770, 'Compositor'),
(771, 'Conductor'),
(772, 'Constructor'),
(773, 'Consultor de tecnología'),
(774, 'Contadores'),
(775, 'Controlador de tráfico aéreo'),
(776, 'Coreógrafo'),
(777, 'Cortador de tela cuero y afines'),
(778, 'Costurero'),
(779, 'Criador de ganado'),
(780, 'Cristalera'),
(781, 'Cuidador de animales domésticos'),
(782, 'Cuidador de niños'),
(783, 'Decorador'),
(784, 'Deportista'),
(785, 'Desarrollador de software'),
(786, 'Detective privado'),
(787, 'Dibujante técnico'),
(788, 'Director de cine teatro y afines'),
(789, 'Diseñador gráfico y multimedia'),
(790, 'Diseñador y administrador de bases de datos'),
(791, 'Diseñador y decorador de interiores'),
(792, 'Docente'),
(793, 'Docente Universitario'),
(794, 'Ebanista'),
(795, 'Electricista de obra'),
(796, 'Empacador manual'),
(797, 'Encuadernador'),
(798, 'Entrevistador'),
(799, 'Epidemiólogo'),
(800, 'Escolta'),
(801, 'Escritor'),
(802, 'Escultor'),
(803, 'Especialista en métodos pedagógicos'),
(804, 'Especialista en tratamientos de belleza y afi'),
(805, 'Estadístico'),
(806, 'Evaluador de bienes raíces'),
(807, 'Fabricante de instrumentos musicales'),
(808, 'Fabricante de lácteos'),
(809, 'Farmacéutico'),
(810, 'Filósofo'),
(811, 'Físico'),
(812, 'Fisioterapeuta'),
(813, 'Fonoaudiólogo'),
(814, 'Fontanero'),
(815, 'Fotografo'),
(816, 'Fumigador'),
(817, 'Geólogo'),
(818, 'Grabador de datos'),
(819, 'Guardafrenos'),
(820, 'Guia de museos'),
(821, 'Guía de turismo'),
(822, 'Herrero'),
(823, 'Impresor'),
(824, 'Ingeniero aeronáutico'),
(825, 'Ingeniero automotriz'),
(826, 'Ingeniero civiles.'),
(827, 'Ingeniero de energía nuclear'),
(828, 'Ingeniero de minas'),
(829, 'ingeniero de salvamento marítimo'),
(830, 'Ingeniero de seguridad.'),
(831, 'Ingeniero de telecomunicaciones'),
(832, 'Ingeniero de tráfico'),
(833, 'Ingeniero electricistas'),
(834, 'Ingeniero eléctrico'),
(835, 'Ingeniero industriales'),
(836, 'Ingeniero marino'),
(837, 'Ingeniero Mecánico'),
(838, 'Ingeniero medio ambiental'),
(839, 'Ingeniero químico'),
(840, 'Ingenieros electrónicos'),
(841, 'Inspector de seguridad'),
(842, 'Instructor'),
(843, 'Instructor de conducción'),
(844, 'Instructor de educación física'),
(845, 'Instructor de tecnologías de la información'),
(846, 'Joyero'),
(847, 'Labrante'),
(848, 'Lavador de autos'),
(849, 'Lavandero'),
(850, 'Limpiador de fachadas'),
(851, 'Limpiador de ventanas'),
(852, 'Locutor'),
(853, 'Maquinista de locomotoras'),
(854, 'Maquinista en navegación'),
(855, 'Mecánico'),
(856, 'Médico'),
(857, 'Medico alternativo'),
(858, 'Mensajeros'),
(859, 'Mesero'),
(860, 'Meteorólogo'),
(861, 'Modelo de modas'),
(862, 'Moldeador y machero'),
(863, 'Montador de estructuras metálicas'),
(864, 'Músico'),
(865, 'Nutricionista'),
(866, 'Odontólogo'),
(867, 'Oficial de la construcción'),
(868, 'Oficios varios'),
(869, 'Operador audiométrico'),
(870, 'Operador de instalaciones de refinación de pe'),
(871, 'Operador de máquinas'),
(872, 'Operador de montacargas'),
(873, 'Operador turístico'),
(874, 'Operario de limpieza'),
(875, 'Optómetra'),
(876, 'Orfebre'),
(877, 'Organizador de conferencias y eventos'),
(878, 'Panadero'),
(879, 'Parrillero'),
(880, 'Periodistas'),
(881, 'Personal de servicios de protección'),
(882, 'Personal de servicios funerarios'),
(883, 'Pescador'),
(884, 'Piloto'),
(885, 'Pintor'),
(886, 'Profesional de gestión y de talento humano'),
(887, 'Profesional de la protección medio ambiental'),
(888, 'Psicólogo'),
(889, 'Publicista'),
(890, 'Químico'),
(891, 'Radiólogo oral'),
(892, 'Recolector de basura'),
(893, 'Relacionista publico'),
(894, 'Reparador'),
(895, 'Revisor fiscal '),
(896, 'Revocador'),
(897, 'Sastre'),
(898, 'Silvicultor'),
(899, 'Socilogo'),
(900, 'Soldador'),
(901, 'Sombrerero'),
(902, 'Supervisor'),
(903, 'Surtidor'),
(904, 'Tapicero'),
(905, 'Tejedor'),
(906, 'Telefonista'),
(907, 'Terapeuta'),
(908, 'Topógrafo'),
(909, 'Trabajador de cuidados personales a domicilio'),
(910, 'Trabajador de cultivos'),
(911, 'Trabajador de jardinería y horticultura'),
(912, 'Trabajador de servicios de transporte'),
(913, 'Trabajador forestal'),
(914, 'Trabajador pecuario'),
(915, 'Trabajador Social'),
(916, 'Vendedor'),
(917, 'Veterinarios'),
(918, 'Zapatero'),
(919, 'Zoólogo '),
(920, 'Zootecnista');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ciudades`
--

DROP TABLE IF EXISTS `ciudades`;
CREATE TABLE IF NOT EXISTS `ciudades` (
  `idciudad` int(11) NOT NULL AUTO_INCREMENT,
  `nombreCiudad` varchar(45) NOT NULL,
  `Departamentos_idDepartamento` int(11) NOT NULL,
  PRIMARY KEY (`idciudad`),
  KEY `fk_ciudades_Departamentos1_idx` (`Departamentos_idDepartamento`)
) ENGINE=InnoDB AUTO_INCREMENT=1124 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `ciudades`
--

INSERT INTO `ciudades` (`idciudad`, `nombreCiudad`, `Departamentos_idDepartamento`) VALUES
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

DROP TABLE IF EXISTS `clientes`;
CREATE TABLE IF NOT EXISTS `clientes` (
  `idCliente` int(11) NOT NULL AUTO_INCREMENT,
  `numeroIdentificacion` int(11) DEFAULT NULL,
  `primerNombreCliente` varchar(45) NOT NULL,
  `segundoNombreCliente` varchar(45) DEFAULT NULL,
  `primerApellidoCliente` varchar(45) NOT NULL,
  `segundoApellidoCliente` varchar(45) DEFAULT NULL,
  `direccionCliente` varchar(45) DEFAULT NULL,
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
  PRIMARY KEY (`idCliente`),
  KEY `fk_clientes_ciudades1_idx` (`ciudadResidencia_idciudad`),
  KEY `fk_clientes_tipoIdentificacion1_idx` (`tipoIdentificacion_idtipoIdentificacion`),
  KEY `fk_clientes_ciudades2_idx` (`ciudadExpedicion_idciudad`),
  KEY `fk_clientes_profesiones1_idx` (`profesiones_idprofesion`),
  KEY `fk_clientes_tipoPersonaCliente1_idx` (`tipoPersonaCliente_idtipoPersonCliente`),
  KEY `idEstadoCivil` (`idEstadoCivil`),
  KEY `idGenero` (`idGenero`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`idCliente`, `numeroIdentificacion`, `primerNombreCliente`, `segundoNombreCliente`, `primerApellidoCliente`, `segundoApellidoCliente`, `direccionCliente`, `telefonoFijoCliente`, `telefonoMovilCliente`, `correoCliente`, `fechaNacimiento`, `ciudadResidencia_idciudad`, `tipoIdentificacion_idtipoIdentificacion`, `ciudadExpedicion_idciudad`, `profesiones_idprofesion`, `tipoPersonaCliente_idtipoPersonCliente`, `idEstadoCivil`, `idGenero`) VALUES
(14, 1109293995, 'Angela ', 'Milena ', 'Murcia', 'Sepulveda', 'adad', '6565', '656565', 'dkds@ksjdk.com', '2018-08-05', 1, 10, 1, 2923, 7, 30, 10);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `contratoempleado`
--

DROP TABLE IF EXISTS `contratoempleado`;
CREATE TABLE IF NOT EXISTS `contratoempleado` (
  `idcontratoEmpleado` int(11) NOT NULL AUTO_INCREMENT,
  `fechaInicio` date DEFAULT NULL,
  `fechaTerminacion` date DEFAULT NULL,
  `salario` float DEFAULT NULL,
  `areaEmpresa_idareaEmpresa` int(11) NOT NULL,
  `cargos_idCargo` int(11) NOT NULL,
  `empleados_idempleado` int(11) NOT NULL,
  PRIMARY KEY (`idcontratoEmpleado`),
  KEY `fk_contratoEmpleado_areaEmpresa1_idx` (`areaEmpresa_idareaEmpresa`),
  KEY `fk_contratoEmpleado_cargos1_idx` (`cargos_idCargo`),
  KEY `fk_contratoEmpleado_empleados1_idx` (`empleados_idempleado`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `contratos`
--

DROP TABLE IF EXISTS `contratos`;
CREATE TABLE IF NOT EXISTS `contratos` (
  `idcontrato` int(11) NOT NULL AUTO_INCREMENT,
  `fechaContrato` date DEFAULT NULL,
  `fechaInicioContrato` date DEFAULT NULL,
  `fechaFinContrato` date DEFAULT NULL,
  `valorContrato` float DEFAULT NULL,
  `plazoContrato` int(11) DEFAULT NULL,
  `formaDePago` varchar(45) DEFAULT NULL,
  `inmuebles_idinmueble` int(11) NOT NULL,
  `rutaContrato` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`idcontrato`),
  KEY `fk_contratos_inmuebles1_idx` (`inmuebles_idinmueble`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `conyugues`
--

DROP TABLE IF EXISTS `conyugues`;
CREATE TABLE IF NOT EXISTS `conyugues` (
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
  `clientes_idCliente` int(11) NOT NULL,
  PRIMARY KEY (`numeroIdentificacionConyugue`),
  KEY `fk_conyugues_clientes1_idx` (`clientes_idCliente`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cuentaempleado`
--

DROP TABLE IF EXISTS `cuentaempleado`;
CREATE TABLE IF NOT EXISTS `cuentaempleado` (
  `idcuentaEmpleado` int(11) NOT NULL AUTO_INCREMENT,
  `numeroCuenta` varchar(45) NOT NULL,
  `tipoCuenta_idtipoCuenta` int(11) NOT NULL,
  `bancos_idbanco` int(11) NOT NULL,
  `empleados_idempleado` int(11) NOT NULL,
  PRIMARY KEY (`idcuentaEmpleado`),
  KEY `fk_cuentaEmpleado_tipoCuenta1_idx` (`tipoCuenta_idtipoCuenta`),
  KEY `fk_cuentaEmpleado_bancos1_idx` (`bancos_idbanco`),
  KEY `fk_cuentaEmpleado_empleados1_idx` (`empleados_idempleado`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `departamentos`
--

DROP TABLE IF EXISTS `departamentos`;
CREATE TABLE IF NOT EXISTS `departamentos` (
  `idDepartamento` int(11) NOT NULL AUTO_INCREMENT,
  `nombreDepartamento` varchar(45) NOT NULL,
  `paises_idpais` int(11) NOT NULL,
  `idRegion` int(11) DEFAULT NULL,
  PRIMARY KEY (`idDepartamento`),
  KEY `fk_Departamentos_paises1_idx` (`paises_idpais`),
  KEY `idRegion` (`idRegion`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `departamentos`
--

INSERT INTO `departamentos` (`idDepartamento`, `nombreDepartamento`, `paises_idpais`, `idRegion`) VALUES
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

DROP TABLE IF EXISTS `detalleclientestipoclientes`;
CREATE TABLE IF NOT EXISTS `detalleclientestipoclientes` (
  `iddetalleClientesTipoClientes` int(11) NOT NULL AUTO_INCREMENT,
  `tiposClientes_idtipoCliente` int(11) NOT NULL,
  `clientes_cedulaCliente` int(11) NOT NULL,
  PRIMARY KEY (`iddetalleClientesTipoClientes`),
  KEY `fk_detalleClientesTipoClientes_tiposClientes1_idx` (`tiposClientes_idtipoCliente`),
  KEY `fk_detalleClientesTipoClientes_clientes1_idx` (`clientes_cedulaCliente`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `detalleclientestipoclientes`
--

INSERT INTO `detalleclientestipoclientes` (`iddetalleClientesTipoClientes`, `tiposClientes_idtipoCliente`, `clientes_cedulaCliente`) VALUES
(24, 15, 14),
(25, 16, 14),
(26, 13, 14),
(27, 14, 14);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detallecontratosdeudores`
--

DROP TABLE IF EXISTS `detallecontratosdeudores`;
CREATE TABLE IF NOT EXISTS `detallecontratosdeudores` (
  `iddetalleContratoDeudore` int(11) NOT NULL AUTO_INCREMENT,
  `numeroIdentificacionDeudor` int(11) NOT NULL,
  `contratos_idcontrato` int(11) NOT NULL,
  PRIMARY KEY (`iddetalleContratoDeudore`),
  KEY `fk_detalleContratosDeudores_deudorSolidario1_idx` (`numeroIdentificacionDeudor`),
  KEY `fk_detalleContratosDeudores_contratos1_idx` (`contratos_idcontrato`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detallecontratosobjetos`
--

DROP TABLE IF EXISTS `detallecontratosobjetos`;
CREATE TABLE IF NOT EXISTS `detallecontratosobjetos` (
  `iddetalleContratoObjeto` int(11) NOT NULL AUTO_INCREMENT,
  `idobjetoContrato` int(11) NOT NULL,
  `contratos_idcontrato` int(11) NOT NULL,
  PRIMARY KEY (`iddetalleContratoObjeto`),
  KEY `fk_detalleContratosObjetos_objetosContratos1_idx` (`idobjetoContrato`),
  KEY `fk_detalleContratosObjetos_contratos1_idx` (`contratos_idcontrato`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalleeventosempleados`
--

DROP TABLE IF EXISTS `detalleeventosempleados`;
CREATE TABLE IF NOT EXISTS `detalleeventosempleados` (
  `iddetalleEventoEmpleado` int(11) NOT NULL AUTO_INCREMENT,
  `empleados_idempleado` int(11) NOT NULL,
  `eventosclientes_ideventoCliente` int(11) NOT NULL,
  PRIMARY KEY (`iddetalleEventoEmpleado`),
  KEY `fk_detalleEventosEmpleados_empleados1_idx` (`empleados_idempleado`),
  KEY `fk_detalleeventosempleados_eventosclientes1_idx` (`eventosclientes_ideventoCliente`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `deudorsolidario`
--

DROP TABLE IF EXISTS `deudorsolidario`;
CREATE TABLE IF NOT EXISTS `deudorsolidario` (
  `numeroIdentificacionDeudor` int(11) NOT NULL AUTO_INCREMENT,
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
  `estadoCivilDeudor` char(1) DEFAULT NULL,
  `tipoIdentificacion_idtipoIdentificacion` int(11) NOT NULL,
  `ciudadResidencia_idciudad` int(11) NOT NULL,
  `ciudadExpedicion_idciudad` int(11) NOT NULL,
  `fechaExpedicionIdentificacion` date DEFAULT NULL,
  PRIMARY KEY (`numeroIdentificacionDeudor`),
  KEY `fk_deudorSolidario_tipoIdentificacion1_idx` (`tipoIdentificacion_idtipoIdentificacion`),
  KEY `fk_deudorSolidario_ciudades1_idx` (`ciudadResidencia_idciudad`),
  KEY `fk_deudorSolidario_ciudades2_idx` (`ciudadExpedicion_idciudad`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleados`
--

DROP TABLE IF EXISTS `empleados`;
CREATE TABLE IF NOT EXISTS `empleados` (
  `idempleado` int(11) NOT NULL AUTO_INCREMENT,
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
  `cajaCompensacion_idcajaCompensacion` int(11) NOT NULL,
  PRIMARY KEY (`idempleado`),
  KEY `fk_empleados_tiposEmpleados1_idx` (`idtipoEmpleado`),
  KEY `idEsCivil` (`idEsCivil`),
  KEY `idGeneroEmpleado` (`idGeneroEmpleado`),
  KEY `idCiudadEmpleado` (`idCiudadEmpleado`),
  KEY `idProfesionEmpleado` (`idProfesionEmpleado`),
  KEY `fk_empleados_ciudades1_idx` (`lugarExpedicion_idciudad`),
  KEY `fk_empleados_ciudades2_idx` (`lugarNacimiento_idciudad`),
  KEY `fk_empleados_tipoSangre1_idx` (`tipoSangre_idtipoSangre`),
  KEY `fk_empleados_fondoPensiones1_idx` (`fondoPensiones_idfondoPensiones`),
  KEY `fk_empleados_eps1_idx` (`eps_ideps`),
  KEY `fk_empleados_fondoCesantias1_idx` (`fondoCesantias_idfondoCesantias`),
  KEY `fk_empleados_arl1_idx` (`arl_idarl`),
  KEY `fk_empleados_cajaCompensacion1_idx` (`cajaCompensacion_idcajaCompensacion`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `eps`
--

DROP TABLE IF EXISTS `eps`;
CREATE TABLE IF NOT EXISTS `eps` (
  `ideps` int(11) NOT NULL AUTO_INCREMENT,
  `nombreEps` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ideps`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `eps`
--

INSERT INTO `eps` (`ideps`, `nombreEps`) VALUES
(1, 'Empresas Públicas de Medellín Departamento Mé'),
(2, 'Fondo de Pasivo Social de Ferrocarriles'),
(3, 'Aliansalud EPS'),
(4, 'Salud Total S.A.'),
(5, 'Cafesalud EPS'),
(6, 'Sanitas'),
(7, 'Compensar Entidad Promotora de Salud'),
(8, 'Sura'),
(9, 'Comfenalco Valle EPS'),
(10, 'Coomeva EPS'),
(11, 'Famisanar'),
(12, 'Servicio Occidental de Salud S.O.S. S.A.'),
(13, 'Cruz Blanca S.A'),
(14, 'Saludvida S.A EPS'),
(15, 'Nueva EPS'),
(16, 'Fondo de Solidaridad y Garantía Fosyga'),
(17, 'Universidad del Atlántico'),
(18, 'Universidad Industrial de Santander'),
(19, 'Universidad del Valle'),
(20, 'Universidad Nacional de Colombia'),
(21, 'Universidad del Cauca'),
(22, 'Universidad de Antioquia'),
(23, 'Universidad de Córdoba'),
(24, 'Universidad Pedagógica y Tecnológica de Colom'),
(25, 'Cafesalud'),
(26, 'Convida'),
(27, 'Capresoca EPS'),
(28, 'Capital Salud EPSS S.A.S.'),
(29, 'Dusakawi'),
(30, 'Manexka'),
(31, 'Asociación Indígena del Cauca - A.I.C.'),
(32, 'Anas Wayuu EPSI'),
(33, 'Mallamas EPSI'),
(34, 'Pijaosalud EPSI'),
(35, 'Emdisalud ESS'),
(36, 'ESS'),
(37, 'Emssanar E.S.S.'),
(38, 'Coosalud E.S.S.'),
(39, 'Comparta'),
(40, 'Asmet Salud'),
(41, 'AMBUQ'),
(42, 'Ecoopsos'),
(43, 'Savia Salud EPS'),
(44, 'Comfaboy'),
(45, 'Comfacor '),
(46, 'Comfachoco'),
(47, 'Caja de Compensación Familiar de La Guajira'),
(48, 'Comfamiliar Huila EPS'),
(49, 'Comfamiliar de Nariño EPS'),
(50, 'Comfasucre EPS-CCF'),
(51, 'Comfacundi - CCF'),
(52, 'Cajacopi Atlántico  - CCF');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estadocivil`
--

DROP TABLE IF EXISTS `estadocivil`;
CREATE TABLE IF NOT EXISTS `estadocivil` (
  `idEstadoCivil` int(11) NOT NULL AUTO_INCREMENT,
  `nombreEstadoCivil` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`idEstadoCivil`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `estadocivil`
--

INSERT INTO `estadocivil` (`idEstadoCivil`, `nombreEstadoCivil`) VALUES
(29, 'Soltero'),
(30, 'Casado'),
(31, 'Viudo'),
(32, 'Separado'),
(33, 'Divorciado'),
(34, 'Unión marital de hec'),
(35, 'Comprometido');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estados`
--

DROP TABLE IF EXISTS `estados`;
CREATE TABLE IF NOT EXISTS `estados` (
  `idestado` int(11) NOT NULL AUTO_INCREMENT,
  `nombreEstado` varchar(45) NOT NULL,
  PRIMARY KEY (`idestado`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `estados`
--

INSERT INTO `estados` (`idestado`, `nombreEstado`) VALUES
(13, 'Registrado'),
(14, 'Publicado'),
(15, 'Arrendado'),
(16, 'Vendido');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estratos`
--

DROP TABLE IF EXISTS `estratos`;
CREATE TABLE IF NOT EXISTS `estratos` (
  `idestrato` int(11) NOT NULL AUTO_INCREMENT,
  `nombreEstrato` varchar(1) NOT NULL,
  PRIMARY KEY (`idestrato`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `estratos`
--

INSERT INTO `estratos` (`idestrato`, `nombreEstrato`) VALUES
(19, '1'),
(20, '2'),
(21, '3'),
(22, '4'),
(23, '5'),
(24, '6');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estructurascocinas`
--

DROP TABLE IF EXISTS `estructurascocinas`;
CREATE TABLE IF NOT EXISTS `estructurascocinas` (
  `idestructuraCocina` int(11) NOT NULL AUTO_INCREMENT,
  `nombreEstructuraCocina` varchar(45) NOT NULL,
  PRIMARY KEY (`idestructuraCocina`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `estructurascocinas`
--

INSERT INTO `estructurascocinas` (`idestructuraCocina`, `nombreEstructuraCocina`) VALUES
(7, 'Abierta'),
(8, 'Cerrada');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `eventosclientes`
--

DROP TABLE IF EXISTS `eventosclientes`;
CREATE TABLE IF NOT EXISTS `eventosclientes` (
  `ideventoCliente` int(11) NOT NULL AUTO_INCREMENT,
  `fechaEvento` date DEFAULT NULL,
  `horaEvento` time DEFAULT NULL,
  `lugarEvento` varchar(100) DEFAULT NULL,
  `latitud` varchar(45) DEFAULT NULL,
  `longitud` varchar(45) DEFAULT NULL,
  `observacionesEvento` varchar(200) DEFAULT NULL,
  `clientes_cedulaCliente` int(11) NOT NULL,
  `DescripcionEvento` varchar(16383) DEFAULT NULL,
  `tiposeventos_idtipoEvento` int(11) NOT NULL,
  PRIMARY KEY (`ideventoCliente`),
  KEY `fk_eventosClientes_clientes1_idx` (`clientes_cedulaCliente`),
  KEY `fk_eventosclientes_tiposeventos1_idx` (`tiposeventos_idtipoEvento`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `experienciaempleado`
--

DROP TABLE IF EXISTS `experienciaempleado`;
CREATE TABLE IF NOT EXISTS `experienciaempleado` (
  `idexperienciaEmpleado` int(11) NOT NULL AUTO_INCREMENT,
  `empresa` varchar(45) DEFAULT NULL,
  `fechaIngreso` date DEFAULT NULL,
  `fechaSalida` date DEFAULT NULL,
  `certificadoLaboral` varchar(200) DEFAULT NULL,
  `cargos_idCargo` int(11) NOT NULL,
  `empleados_idempleado` int(11) NOT NULL,
  PRIMARY KEY (`idexperienciaEmpleado`),
  KEY `fk_experienciaEmpleado_cargos1_idx` (`cargos_idCargo`),
  KEY `fk_experienciaEmpleado_empleados1_idx` (`empleados_idempleado`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fondocesantias`
--

DROP TABLE IF EXISTS `fondocesantias`;
CREATE TABLE IF NOT EXISTS `fondocesantias` (
  `idfondoCesantias` int(11) NOT NULL AUTO_INCREMENT,
  `nombreFondoCesantias` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idfondoCesantias`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `fondocesantias`
--

INSERT INTO `fondocesantias` (`idfondoCesantias`, `nombreFondoCesantias`) VALUES
(1, 'Protección'),
(2, 'Porvenir'),
(3, 'Old Mutual Fondo de Pensiones Obligatorias'),
(4, 'Old Mutual Fondo Alternativo de Pensiones'),
(5, 'Colfondos'),
(6, 'Caja de Auxilios y de Prestaciones de ACDAC'),
(7, 'Fondo de Previsión Social del Congreso'),
(8, 'Pensiones de Antioquia'),
(9, 'Administradora Colombiana de Pensiones Colpen');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fondopensiones`
--

DROP TABLE IF EXISTS `fondopensiones`;
CREATE TABLE IF NOT EXISTS `fondopensiones` (
  `idfondoPensiones` int(11) NOT NULL AUTO_INCREMENT,
  `nombreFondoPensiones` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`idfondoPensiones`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `fondopensiones`
--

INSERT INTO `fondopensiones` (`idfondoPensiones`, `nombreFondoPensiones`) VALUES
(1, 'Protección'),
(2, 'Porvenir'),
(3, 'Old Mutual Fondo de Pensiones Obligatorias'),
(4, 'Old Mutual Fondo Alternativo de Pensiones'),
(5, 'Colfondos'),
(6, 'Caja de Auxilios y de Prestaciones de ACDAC'),
(7, 'Fondo de Previsión Social del Congreso'),
(8, 'Pensiones de Antioquia'),
(9, 'Administradora Colombiana de Pensiones Colpensiones');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `formacionempleado`
--

DROP TABLE IF EXISTS `formacionempleado`;
CREATE TABLE IF NOT EXISTS `formacionempleado` (
  `idformacionEmpleado` int(11) NOT NULL AUTO_INCREMENT,
  `institucionEducacion` varchar(100) DEFAULT NULL,
  `nivelAlcanzado` int(11) DEFAULT NULL,
  `diplomaOActa` varchar(200) DEFAULT NULL,
  `idnivelProfesion` int(11) NOT NULL,
  `empleados_idempleado` int(11) NOT NULL,
  PRIMARY KEY (`idformacionEmpleado`),
  KEY `fk_formacionEmpleado_nivelprofesion1_idx` (`idnivelProfesion`),
  KEY `fk_formacionEmpleado_empleados1_idx` (`empleados_idempleado`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `generos`
--

DROP TABLE IF EXISTS `generos`;
CREATE TABLE IF NOT EXISTS `generos` (
  `idGenero` int(11) NOT NULL AUTO_INCREMENT,
  `nombreGenero` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`idGenero`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `generos`
--

INSERT INTO `generos` (`idGenero`, `nombreGenero`) VALUES
(9, 'Masculino'),
(10, 'Femenino');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `imageninmueble`
--

DROP TABLE IF EXISTS `imageninmueble`;
CREATE TABLE IF NOT EXISTS `imageninmueble` (
  `idImagenInmueble` int(11) NOT NULL AUTO_INCREMENT,
  `rutaImagen` varchar(200) DEFAULT NULL,
  `idInmueble` int(11) DEFAULT NULL,
  PRIMARY KEY (`idImagenInmueble`),
  KEY `idInmueble` (`idInmueble`)
) ENGINE=MyISAM AUTO_INCREMENT=26 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `imageninmueble`
--

INSERT INTO `imageninmueble` (`idImagenInmueble`, `rutaImagen`, `idInmueble`) VALUES
(18, 'System/Resource/Images/Propierties/232123_..-..-resource-images-properties-232123_beachflagpng20180729160306.jpg20180729160306.jpg', 18),
(19, 'System/Resource/Images/Propierties/232123_..-..-resource-images-properties-232123_capturapng20180729160306.jpg20180729160306.jpg', 18),
(20, 'System/Resource/Images/Propierties/232123_..-..-resource-images-properties-232123_marcapng20180729160306.jpg20180729160306.jpg', 18),
(21, 'System/Resource/Images/Propierties/232123_..-..-resource-images-properties-232123_plejohnnyalexandersalazarpng20180729160306.jpg20180729160306.jpg', 18),
(22, 'System/Resource/Images/Propierties/232123_..-..-resource-images-properties-232123_beachflagpng20180729160455.jpg20180729160455.jpg', 19),
(23, 'System/Resource/Images/Propierties/232123_..-..-resource-images-properties-232123_capturapng20180729160455.jpg20180729160455.jpg', 19),
(24, 'System/Resource/Images/Propierties/232123_..-..-resource-images-properties-232123_marcapng20180729160455.jpg20180729160455.jpg', 19),
(25, 'System/Resource/Images/Propierties/232123_..-..-resource-images-properties-232123_plejohnnyalexandersalazarpng20180729160455.jpg20180729160455.jpg', 19);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inmuebles`
--

DROP TABLE IF EXISTS `inmuebles`;
CREATE TABLE IF NOT EXISTS `inmuebles` (
  `idinmueble` int(11) NOT NULL AUTO_INCREMENT,
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
  `fechaPublicación` date DEFAULT NULL,
  `fechaRecepcion` date DEFAULT NULL,
  `tiposDestacados_idtipoDestacado` int(11) NOT NULL,
  `linderosInmueble` varchar(200) DEFAULT NULL,
  `matriculaInmobiliaria` varchar(45) DEFAULT NULL,
  `avaluoCatastral` float DEFAULT NULL,
  `piscina` tinyint(1) DEFAULT NULL,
  `zonaMascotas` tinyint(1) DEFAULT NULL,
  `parqueaderoCubierto` tinyint(1) DEFAULT NULL,
  `amoblado` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`idinmueble`),
  UNIQUE KEY `matriculaInmobiliaria_UNIQUE` (`matriculaInmobiliaria`),
  KEY `fk_inmuebles_ciudades_idx` (`ciudades_idciudad`),
  KEY `fk_inmuebles_estratos1_idx` (`estratos_idestrato`),
  KEY `fk_inmuebles_tiposInmuebles1_idx` (`tiposInmuebles_idtipoInmueble`),
  KEY `fk_inmuebles_tiposOfertas1_idx` (`tiposOfertas_idtipoOferta`),
  KEY `fk_inmuebles_tiposCortinas1_idx` (`tiposCortinas_idtipoCortina`),
  KEY `fk_inmuebles_tiposVigilancias1_idx` (`tiposVigilancias_idtipoVigilancia`),
  KEY `fk_inmuebles_zonas1_idx` (`zonas_idzona`),
  KEY `fk_inmuebles_tiposVistas1_idx` (`tiposVistas_idtipoVista`),
  KEY `fk_inmuebles_barrios1_idx` (`barrios_idbarrio`),
  KEY `fk_inmuebles_estado1_idx` (`estado_idestado`),
  KEY `fk_inmuebles_tiposCocinas1_idx` (`tiposCocinas_idtipoCocina`),
  KEY `fk_inmuebles_estructurasCocinas1_idx` (`estructurasCocinas_idestructuraCocina`),
  KEY `fk_inmuebles_tiposPisos1_idx` (`tiposPisos_idtipoPiso`),
  KEY `fk_inmuebles_clientes1_idx` (`clientes_cedulaCliente`),
  KEY `fk_inmuebles_tiposDestacados1_idx` (`tiposDestacados_idtipoDestacado`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `inmuebles`
--

INSERT INTO `inmuebles` (`idinmueble`, `precio`, `costoAdministracion`, `habitaciones`, `banos`, `parqueaderos`, `areaTotal`, `areaSinBalcones`, `anoDeConstruccion`, `numeroPiso`, `chimenea`, `estudio`, `deposito`, `zonaRopas`, `parqueaderoVisitante`, `ascensor`, `terraza`, `transportePublicoCercano`, `precioNegociable`, `latitud`, `longitud`, `salonComunal`, `sauna`, `turco`, `jacuzzi`, `zonaInfantil`, `jardines`, `duplex`, `puertaDeSeguridad`, `gimnasio`, `ciudades_idciudad`, `estratos_idestrato`, `tiposInmuebles_idtipoInmueble`, `tiposOfertas_idtipoOferta`, `tiposCortinas_idtipoCortina`, `tiposVigilancias_idtipoVigilancia`, `zonas_idzona`, `tiposVistas_idtipoVista`, `barrios_idbarrio`, `estado_idestado`, `tiposCocinas_idtipoCocina`, `estructurasCocinas_idestructuraCocina`, `tiposPisos_idtipoPiso`, `clientes_cedulaCliente`, `fechaPublicación`, `fechaRecepcion`, `tiposDestacados_idtipoDestacado`, `linderosInmueble`, `matriculaInmobiliaria`, `avaluoCatastral`, `piscina`, `zonaMascotas`, `parqueaderoCubierto`, `amoblado`) VALUES
(19, 1, 1, 1, 1, 111, 1, 1, '11', '11', 1, 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 901, 19, 20, 9, 7, 14, 29, 8, 1111, 13, 11, 7, 48, 14, '2018-08-05', '2018-07-29', 10, 'ssdas', '232123', 343243, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `log_msg`
--

DROP TABLE IF EXISTS `log_msg`;
CREATE TABLE IF NOT EXISTS `log_msg` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `log` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=60 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `log_msg`
--

INSERT INTO `log_msg` (`id`, `log`) VALUES
(47, 'LO QUE DA EL PRIMER WHILE********3'),
(48, 'PARTICIONADO********15'),
(49, 'PRUEBA********16,13,14,'),
(50, 'VAMOS A INSERTAR********15-------14'),
(51, 'PARTICIONADO********16'),
(52, 'PRUEBA********13,14,'),
(53, 'VAMOS A INSERTAR********16-------14'),
(54, 'PARTICIONADO********13'),
(55, 'PRUEBA********14,'),
(56, 'VAMOS A INSERTAR********13-------14'),
(57, 'PARTICIONADO********14'),
(58, 'PRUEBA********'),
(59, 'VAMOS A INSERTAR********14-------14');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `menu`
--

DROP TABLE IF EXISTS `menu`;
CREATE TABLE IF NOT EXISTS `menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(30) DEFAULT NULL,
  `codigo` varchar(2000) DEFAULT NULL,
  `padre` int(11) DEFAULT NULL,
  `descripcion` varchar(2000) DEFAULT NULL,
  `prioridad` int(11) DEFAULT NULL,
  `icono` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `menu`
--

INSERT INTO `menu` (`id`, `nombre`, `codigo`, `padre`, `descripcion`, `prioridad`, `icono`) VALUES
(1, 'Parametrizacion', NULL, -1, NULL, 4, 'fa-gear'),
(2, 'Configuracion', NULL, -1, NULL, 3, 'fa-group'),
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
(13, 'PQRS', NULL, 11, NULL, 1, ''),
(14, 'Portales', NULL, -1, NULL, 7, 'fa-globe'),
(15, 'Inmobiliarios', 'PropertiePortal/PropertiePortal', 14, NULL, 1, ''),
(16, 'Profesiones', 'Parameterized/Profession', 1, NULL, 5, ''),
(17, 'Empleados', '', -1, NULL, 6, 'fa-group'),
(18, 'Empleados', 'Employee/Employee', 17, NULL, 5, ''),
(19, 'Eventos', 'Client/event', 8, NULL, 6, ''),
(20, 'Dependiente', 'Client/DependentPerson', 8, NULL, 6, ''),
(21, 'Independiente', 'Client/IndependentPerson', 8, NULL, 6, '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `menu_rol`
--

DROP TABLE IF EXISTS `menu_rol`;
CREATE TABLE IF NOT EXISTS `menu_rol` (
  `idrol` int(11) DEFAULT NULL,
  `idmenu` int(11) DEFAULT NULL,
  KEY `menu_usuario_idmenu_fkey` (`idmenu`),
  KEY `menu_usuario_idrol_fkey` (`idrol`)
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
(1, 19),
(1, 12),
(1, 18),
(1, 13),
(1, 15);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `nivelprofesion`
--

DROP TABLE IF EXISTS `nivelprofesion`;
CREATE TABLE IF NOT EXISTS `nivelprofesion` (
  `idnivelProfesion` int(11) NOT NULL AUTO_INCREMENT,
  `nombreNivelProfesion` varchar(45) NOT NULL,
  PRIMARY KEY (`idnivelProfesion`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `nivelprofesion`
--

INSERT INTO `nivelprofesion` (`idnivelProfesion`, `nombreNivelProfesion`) VALUES
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

DROP TABLE IF EXISTS `objetoscontratos`;
CREATE TABLE IF NOT EXISTS `objetoscontratos` (
  `idobjetoContrato` int(11) NOT NULL AUTO_INCREMENT,
  `nombreObjetoContrato` varchar(45) NOT NULL,
  PRIMARY KEY (`idobjetoContrato`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `paises`
--

DROP TABLE IF EXISTS `paises`;
CREATE TABLE IF NOT EXISTS `paises` (
  `idpais` int(11) NOT NULL AUTO_INCREMENT,
  `nombrePais` varchar(45) NOT NULL,
  PRIMARY KEY (`idpais`)
) ENGINE=InnoDB AUTO_INCREMENT=242 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `paises`
--

INSERT INTO `paises` (`idpais`, `nombrePais`) VALUES
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
-- Estructura de tabla para la tabla `personajuridica`
--

DROP TABLE IF EXISTS `personajuridica`;
CREATE TABLE IF NOT EXISTS `personajuridica` (
  `idpersonaJuridica` int(11) NOT NULL AUTO_INCREMENT,
  `direccionEmpresa` varchar(100) DEFAULT NULL,
  `telefonoEmpresa` varchar(10) DEFAULT NULL,
  `idtipoEmpresa` int(11) NOT NULL,
  `idtipoSociedad` int(11) NOT NULL,
  `numeroIdentificacionCliente` int(11) NOT NULL,
  `tiempoConstitucion` int(11) DEFAULT NULL,
  `patrimonio` float DEFAULT NULL,
  `afectacionFamiliar` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`idpersonaJuridica`),
  KEY `fk_personaJuridica_tiposEmpresas1_idx` (`idtipoEmpresa`),
  KEY `fk_personaJuridica_tiposSociedad1_idx` (`idtipoSociedad`),
  KEY `fk_personaJuridica_clientes1_idx` (`numeroIdentificacionCliente`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pqrs`
--

DROP TABLE IF EXISTS `pqrs`;
CREATE TABLE IF NOT EXISTS `pqrs` (
  `idPQRS` int(11) NOT NULL AUTO_INCREMENT,
  `fechaPQRS` date NOT NULL,
  `horaPQRS` time NOT NULL,
  `descripcionPQRS` varchar(200) NOT NULL,
  `respuestaDada` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`idPQRS`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `profesiones`
--

DROP TABLE IF EXISTS `profesiones`;
CREATE TABLE IF NOT EXISTS `profesiones` (
  `idprofesion` int(11) NOT NULL AUTO_INCREMENT,
  `nombreProfesion` varchar(45) NOT NULL,
  `nivelProfesion_idnivelProfesion` int(11) NOT NULL,
  PRIMARY KEY (`idprofesion`),
  KEY `fk_profesiones_nivelProfesion1_idx` (`nivelProfesion_idnivelProfesion`)
) ENGINE=InnoDB AUTO_INCREMENT=3345 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `profesiones`
--

INSERT INTO `profesiones` (`idprofesion`, `nombreProfesion`, `nivelProfesion_idnivelProfesion`) VALUES
(2509, 'Administración agropecuaria', 1),
(2510, 'Administración bancaria y financiera', 1),
(2511, 'Administración de comercio exterior', 1),
(2512, 'Administración de construcciones', 1),
(2513, 'Administración de costos y auditoria', 1),
(2514, 'Administración de empresas', 1),
(2515, 'Administración de empresas agropecuarias', 1),
(2516, 'Administración de la construcción', 1),
(2517, 'Administración de obras civiles', 1),
(2518, 'Administración de servicio de salud', 1),
(2519, 'Administración empresarial e informática', 1),
(2520, 'Administración hospitalaria', 1),
(2521, 'Administración hotelera', 1),
(2522, 'Administración industrial', 1),
(2523, 'Administración informática', 1),
(2524, 'Administración inmobiliaria', 1),
(2525, 'Administración municipal', 1),
(2526, 'Administración turística', 1),
(2527, 'Administración turística y hotelera', 1),
(2528, 'Administración y auditoria de sistemas', 1),
(2529, 'Administración y avalúos de finca raíz', 1),
(2530, 'Administración y finanzas', 1),
(2531, 'Administración y mercadotecnia', 1),
(2532, 'Administrativo en contabilidad y finanzas', 1),
(2533, 'Administrativo en relaciones industriales', 1),
(2534, 'Admón. Bancaria de instituciones financier', 1),
(2535, 'Admón. De empresas con énfasis en agroindu', 1),
(2536, 'Admón. De empresas de economía solidaria', 1),
(2537, 'Admón. De planteles de educa. Básica primar', 1),
(2538, 'Agropecuaria', 1),
(2539, 'Análisis químico industrial', 1),
(2540, 'Análisis y diseño de sistemas de computación', 1),
(2541, 'Análisis y programación de computadores', 1),
(2542, 'Arquitectura de interiores', 1),
(2543, 'Arte grafico y publicitario', 1),
(2544, 'Arte publicitario', 1),
(2545, 'Arte y decoración', 1),
(2546, 'Auxiliar de arquitectura e ingeniería', 1),
(2547, 'Balística', 1),
(2548, 'Catequesis', 1),
(2549, 'Ciencias contables', 1),
(2550, 'Ciencias de la computación', 1),
(2551, 'Citohistologia', 1),
(2552, 'Cocina internacional', 1),
(2553, 'Comercio exterior', 1),
(2554, 'Comercio internacional', 1),
(2555, 'Comercio internacional y legislación aduan', 1),
(2556, 'Comercio y negocios internacionales', 1),
(2557, 'Computación', 1),
(2558, 'Computación y sistemas', 1),
(2559, 'Confección, acabados y supervisión', 1),
(2560, 'Construcción y administración de obras civile', 1),
(2561, 'Construcciones', 1),
(2562, 'Contabilidad', 1),
(2563, 'Contabilidad comercial', 1),
(2564, 'Contabilidad sistematizada', 1),
(2565, 'Contabilidad y costos', 1),
(2566, 'Contabilidad y finanzas', 1),
(2567, 'Contaduría', 1),
(2568, 'Contaduría técnica', 1),
(2569, 'Costos y contabilidad', 1),
(2570, 'Dactiloscopia', 1),
(2571, 'Decoración de espacios arquitectónicos', 1),
(2572, 'Decoración y diseño de interiores', 1),
(2573, 'Delineante y auxiliar de ingeniería mecani', 1),
(2574, 'Delineantes de arquitectura  e ingeniería', 1),
(2575, 'Delineantes de arquitectura y decoración', 1),
(2576, 'Deporte y recreación', 1),
(2577, 'Dibujo arquitectónico', 1),
(2578, 'Dibujo arquitectónico y de ingeniería', 1),
(2579, 'Dibujo arquitectónico y decoración', 1),
(2580, 'Dibujo de ingeniería mecánica y arquitectu', 1),
(2581, 'Dibujo publicitario', 1),
(2582, 'Diseño asistido por computador', 1),
(2583, 'Diseño de alta costura', 1),
(2584, 'Diseño de ambientes', 1),
(2585, 'Diseño de artes graficas', 1),
(2586, 'Diseño de interiores', 1),
(2587, 'Diseño de maquinas', 1),
(2588, 'Diseño de modas', 1),
(2589, 'Diseño e industria de la moda', 1),
(2590, 'Diseño grafico', 1),
(2591, 'Diseño industrial', 1),
(2592, 'Diseño mecánico', 1),
(2593, 'Diseño publicitario', 1),
(2594, 'Diseño textil', 1),
(2595, 'Diseño textil y de modas', 1),
(2596, 'Diseño y confección de la moda', 1),
(2597, 'Diseño y decoración de ambientes', 1),
(2598, 'Diseño y decoración de espacios arquitectónic', 1),
(2599, 'Diseño y producción de televisión', 1),
(2600, 'Documento logia', 1),
(2601, 'Educación artística', 1),
(2602, 'Educación básica primaria bilingüe', 1),
(2603, 'Educación especial', 1),
(2604, 'Educación física', 1),
(2605, 'Educación física y recreación', 1),
(2606, 'Educación preescolar', 1),
(2607, 'Electromecánica', 1),
(2608, 'Electromedicina', 1),
(2609, 'Electrónica', 1),
(2610, 'Electrónica industrial', 1),
(2611, 'Electrónica y telecomunicaciones', 1),
(2612, 'Explosivos', 1),
(2613, 'Finanzas y sistemas contables', 1),
(2614, 'Fotografía', 1),
(2615, 'Fotografía judicial', 1),
(2616, 'Fotografía y camarografita', 1),
(2617, 'Gestión de pequeñas y medianas empresas', 1),
(2618, 'Gestión de servicios gerontológicos', 1),
(2619, 'Gestión empresarial', 1),
(2620, 'Hotelería', 1),
(2621, 'Identificación de automotores', 1),
(2622, 'Informática contable y financiera', 1),
(2623, 'Informática gerencial', 1),
(2624, 'Informática secretarial', 1),
(2625, 'Ingeniería agropecuaria', 1),
(2626, 'Ingeniería automotriz', 1),
(2627, 'Ingeniería comercial', 1),
(2628, 'Ingeniería de alimentos', 1),
(2629, 'Ingeniería de sistemas', 1),
(2630, 'Ingeniería industrial', 1),
(2631, 'Ingeniería térmica', 1),
(2632, 'Ingeniería textil', 1),
(2633, 'Instrumentación quirúrgica', 1),
(2634, 'Inteligencia', 1),
(2635, 'Laboratorio dental', 1),
(2636, 'Laboratorio medico', 1),
(2637, 'Logística de producción y distribución', 1),
(2638, 'Mantenimiento de computadores', 1),
(2639, 'Mantenimiento electrónico', 1),
(2640, 'Marketing internacional', 1),
(2641, 'Mecánica automotriz', 1),
(2642, 'Mercadeo e informática', 1),
(2643, 'Mercadeo y comercialización', 1),
(2644, 'Mercadeo y ventas', 1),
(2645, 'Mercadeo, publicidad y ventas', 1),
(2646, 'Mercado y finanzas', 1),
(2647, 'Mercadotecnia', 1),
(2648, 'Microempresas y cooperativas', 1),
(2649, 'Minería', 1),
(2650, 'Nuevas tecnologías informáticas', 1),
(2651, 'Optometría', 1),
(2652, 'Periodismo', 1),
(2653, 'Periodismo deportivo', 1),
(2654, 'Planimetría', 1),
(2655, 'Policía judicial', 1),
(2656, 'Procesos industriales', 1),
(2657, 'Procesos mecánicos con énfasis producción agr', 1),
(2658, 'Producción agropecuaria', 1),
(2659, 'Producción de semillas', 1),
(2660, 'Producción de televisión', 1),
(2661, 'Producción y desarrollo industrial', 1),
(2662, 'Programación de computadores', 1),
(2663, 'Promoción social', 1),
(2664, 'Publicidad', 1),
(2665, 'Publicidad y diseño', 1),
(2666, 'Publicidad y diseño publicitario', 1),
(2667, 'Radiología medica', 1),
(2668, 'Realización de video', 1),
(2669, 'Recreación dirigida', 1),
(2670, 'Recursos energéticos', 1),
(2671, 'Relaciones industriales', 1),
(2672, 'Relaciones públicas y comunicación', 1),
(2673, 'Rendimiento deportivo', 1),
(2674, 'Salud ocupacional y seguridad industrial', 1),
(2675, 'Salud y rendimiento humano', 1),
(2676, 'Secretariado', 1),
(2677, 'Secretariado bilingüe', 1),
(2678, 'Secretariado bilingüe y de sistemas', 1),
(2679, 'Secretariado comercial', 1),
(2680, 'Secretariado contable de sistemas', 1),
(2681, 'Secretariado ejecutivo', 1),
(2682, 'Secretariado ejecutivo bilingüe', 1),
(2683, 'Secretariado ejecutivo de sistemas', 1),
(2684, 'Secretariado ejecutivo y de sistemas bilingüe', 1),
(2685, 'Secretariado gerencial', 1),
(2686, 'Seguridad e higiene industrial', 1),
(2687, 'Seguridad e higiene ocupacional', 1),
(2688, 'Servicios a bordo', 1),
(2689, 'Sistemas', 1),
(2690, 'Sistemas contables y financieros', 1),
(2691, 'Sistemas y análisis de la computación', 1),
(2692, 'Sistemas y computación', 1),
(2693, 'Sistematización', 1),
(2694, 'Técnicas agropecuarias', 1),
(2695, 'Técnicas forestales', 1),
(2696, 'Técnico de laboratorio', 1),
(2697, 'Técnico hotelero', 1),
(2698, 'Tecnología de plásticos', 1),
(2699, 'Telecomunicaciones', 1),
(2700, 'Topografía', 1),
(2701, 'Turismo', 1),
(2702, 'Agrícola', 2),
(2703, 'Agroindustrial', 2),
(2704, 'Agropecuaria', 2),
(2705, 'Bilingüe en administración de empresas', 2),
(2706, 'Bilingüe en comercio exterior', 2),
(2707, 'De alimentos', 2),
(2708, 'Deportiva', 2),
(2709, 'Eléctrica', 2),
(2710, 'Electrónica', 2),
(2711, 'Empresarial', 2),
(2712, 'Empresarial y de negocios', 2),
(2713, 'Acuicultura', 2),
(2714, 'Administración aeronáutica', 2),
(2715, 'Administración agropecuaria', 2),
(2716, 'Administración bancaria', 2),
(2717, 'Administración comercial', 2),
(2718, 'Administración comercial y financiera', 2),
(2719, 'Administración de empresas', 2),
(2720, 'Administración de empresas turísticas', 2),
(2721, 'Administración de la producción', 2),
(2722, 'Administración de la producción industrial', 2),
(2723, 'Administración de negocios', 2),
(2724, 'Administración de obras civiles', 2),
(2725, 'Administración de oficinas', 2),
(2726, 'Administración de oficinas bilingües', 2),
(2727, 'Administración de personal', 2),
(2728, 'Administración de redes de computadores', 2),
(2729, 'Administración de redes de datos', 2),
(2730, 'Administración de riesgos y seguros', 2),
(2731, 'Administración de seguros', 2),
(2732, 'Administración de servicios de salud', 2),
(2733, 'Administración de sistemas', 2),
(2734, 'Administración de sistemas de información', 2),
(2735, 'Administración de ventas', 2),
(2736, 'Administración del transporte', 2),
(2737, 'Administración del turismo social', 2),
(2738, 'Administración deportivas', 2),
(2739, 'Administración documental', 2),
(2740, 'Administración financiera', 2),
(2741, 'Administración hospitalaria', 2),
(2742, 'Administración hotelera', 2),
(2743, 'Administración industrial', 2),
(2744, 'Administración informática', 2),
(2745, 'Administración judicial', 2),
(2746, 'Administración municipal', 2),
(2747, 'Administración naviera y portuaria', 2),
(2748, 'Administración tributaria', 2),
(2749, 'Administración turística', 2),
(2750, 'Administración y finanzas', 2),
(2751, 'Admón. De aerolíneas y agencias de viaje', 2),
(2752, 'Admón. De empresas de economía solidaria', 2),
(2753, 'Admón. De negocios internacionales', 2),
(2754, 'Alimentos', 2),
(2755, 'Análisis y diseño de sistemas', 2),
(2756, 'Análisis y programación de computadores', 2),
(2757, 'Arte y decoración arquitectónica', 2),
(2758, 'Auditoria y control interno', 2),
(2759, 'Auditoria y costos', 2),
(2760, 'Automatización industrial', 2),
(2761, 'Banca e instituciones financieras', 2),
(2762, 'Café y diversificación', 2),
(2763, 'Cerámica', 2),
(2764, 'Cine y fotografía', 2),
(2765, 'Citohistologia', 2),
(2766, 'Comercio exterior', 2),
(2767, 'Comercio internacional', 2),
(2768, 'Computación', 2),
(2769, 'Computación grafica', 2),
(2770, 'Comunicación publicitaria', 2),
(2771, 'Comunicaciones aeronáuticas', 2),
(2772, 'Conmutación', 2),
(2773, 'Construcción', 2),
(2774, 'Construcción de obras civiles', 2),
(2775, 'Contabilidad', 2),
(2776, 'Contabilidad sistematizada', 2),
(2777, 'Contaduría', 2),
(2778, 'Contaduría publica', 2),
(2779, 'Control de calidad', 2),
(2780, 'Criminalística', 2),
(2781, 'Desarrollo del software', 2),
(2782, 'Dibujo arquitectónico de ingeniería', 2),
(2783, 'Dibujo industrial', 2),
(2784, 'Dirección de ventas', 2),
(2785, 'Dirección y producción de televisión', 2),
(2786, 'Diseño de interiores', 2),
(2787, 'Diseño de modas', 2),
(2788, 'Diseño grafico', 2),
(2789, 'Diseño industrial', 2),
(2790, 'Diseño textil', 2),
(2791, 'Diseño y decoración de espacios arqu', 2),
(2792, 'Docencia rural', 2),
(2793, 'Educación básica primaria', 2),
(2794, 'Educación especial', 2),
(2795, 'Educación física', 2),
(2796, 'Educación para el desarrollo de la c', 2),
(2797, 'Educación preescolar', 2),
(2798, 'Electricidad', 2),
(2799, 'Electricidad industrial', 2),
(2800, 'Electrificación y telefonía rural', 2),
(2801, 'Electromecánica', 2),
(2802, 'Electrónica aeronáutica', 2),
(2803, 'Electrónica y automatización industr', 2),
(2804, 'Electrónica y comunicaciones', 2),
(2805, 'Electrónica y telecomunicaciones', 2),
(2806, 'Electroquímica', 2),
(2807, 'Empresas turísticas y hoteleras', 2),
(2808, 'Estadística e informática', 2),
(2809, 'Estudios policiales', 2),
(2810, 'Finanzas y comercio internacional', 2),
(2811, 'Finanzas y sistemas contables', 2),
(2812, 'Fisioterapia', 2),
(2813, 'Gerontología', 2),
(2814, 'Gestión agropecuaria', 2),
(2815, 'Gestión bancaria y financiera', 2),
(2816, 'Gestión comercial y de negocios', 2),
(2817, 'Gestión de empresas asoc. Y organiz.', 2),
(2818, 'Gestión de obras civiles y construci', 2),
(2819, 'Gestión de servicios públicos sanita', 2),
(2820, 'Gestión de transportes', 2),
(2821, 'Gestión empresarial', 2),
(2822, 'Gestión empresarial y de negocios', 2),
(2823, 'Gestión industrial', 2),
(2824, 'Gestión informática', 2),
(2825, 'Gestión y administración de empresas', 2),
(2826, 'Higiene y seguridad industrial', 2),
(2827, 'Informática', 2),
(2828, 'Instrumentación industrial', 2),
(2829, 'Instrumentación quirúrgica', 2),
(2830, 'Instrumentación y controles industria', 2),
(2831, 'Investigación judicial', 2),
(2832, 'Laboratorio de prótesis dental', 2),
(2833, 'Laboratorio de rehabilitación dental', 2),
(2834, 'Laboratorio dental', 2),
(2835, 'Lácteos', 2),
(2836, 'Logística de producción distribución', 2),
(2837, 'Maderas', 2),
(2838, 'Mantenimiento aeronáutico', 2),
(2839, 'Mecánica automotriz', 2),
(2840, 'Medicina veterinaria y zootecnia', 2),
(2841, 'Mercadeo agropecuario', 2),
(2842, 'Mercadeo y comercialización', 2),
(2843, 'Mercadeo y finanzas', 2),
(2844, 'Mercadeo y negocios internacionales', 2),
(2845, 'Mercadeo y publicidad', 2),
(2846, 'Mercadeo y ventas', 2),
(2847, 'Mercadotecnia', 2),
(2848, 'Mercadotecnia y publicidad', 2),
(2849, 'Mercadotecnia y ventas', 2),
(2850, 'Minas', 2),
(2851, 'Minería', 2),
(2852, 'Negocios internacionales', 2),
(2853, 'Obras civiles', 2),
(2854, 'Periodismo', 2),
(2855, 'Plásticos', 2),
(2856, 'Producción agraria', 2),
(2857, 'Producción agrícola', 2),
(2858, 'Producción agropecuaria', 2),
(2859, 'Producción animal', 2),
(2860, 'Producción industrial', 2),
(2861, 'Promoción social', 2),
(2862, 'Publicidad', 2),
(2863, 'Publicidad y comercialización', 2),
(2864, 'Publicidad y comunicación', 2),
(2865, 'Publicidad y mercadeo', 2),
(2866, 'Química de productos vegetales', 2),
(2867, 'Química industrial', 2),
(2868, 'Radiología e imágenes', 2),
(2869, 'Recreación dirigida', 2),
(2870, 'Recursos hídricos', 2),
(2871, 'Recursos naturales renovables', 2),
(2872, 'Redes y comunicaciones de datos', 2),
(2873, 'Regencia de farmacia', 2),
(2874, 'Relaciones industriales', 2),
(2875, 'Salud comunitaria', 2),
(2876, 'Salud ocupacional', 2),
(2877, 'Saneamiento ambiental', 2),
(2878, 'Secretariado bilingüe', 2),
(2879, 'Secretariado bilingüe y computación', 2),
(2880, 'Secretariado comercial bilingüe', 2),
(2881, 'Secretariado ejecutivo', 2),
(2882, 'Secretariado ejecutivo bilingüe', 2),
(2883, 'Secretariado ejecutivo bilingüe espa', 2),
(2884, 'Secretariado ejecutivo con énfasis e', 2),
(2885, 'Seguridad aeronáutica', 2),
(2886, 'Seguridad e higiene ocupacional', 2),
(2887, 'Sistemas', 2),
(2888, 'Sistemas contables', 2),
(2889, 'Sistemas de información', 2),
(2890, 'Sistemas de información en salud', 2),
(2891, 'Sistemas industriales', 2),
(2892, 'Sistemas y computación', 2),
(2893, 'Sistematización de datos', 2),
(2894, 'Supervisión de industria y comercio', 2),
(2895, 'Terapia del lenguaje', 2),
(2896, 'Terapia recreativa', 2),
(2897, 'Terapia respiratoria', 2),
(2898, 'Textiles y moda', 2),
(2899, 'Topografía', 2),
(2900, 'Traducción turística', 2),
(2901, 'Tributación', 2),
(2902, 'Turismo recreativo', 2),
(2903, 'Turismo y relaciones industriales', 2),
(2904, 'Zootecnia', 2),
(2905, 'Forestal', 2),
(2906, 'Industrial', 2),
(2907, 'Mecánica', 2),
(2908, 'Naval en electromecánica', 2),
(2909, 'Naval en electrónica', 2),
(2910, 'Naviera', 2),
(2911, 'Pecuaria', 2),
(2912, 'Química', 2),
(2913, 'Textil', 2),
(2914, 'Abogado', 3),
(2915, 'Administración', 3),
(2916, 'Administración aeronáutica', 3),
(2917, 'Administración agroindustrial', 3),
(2918, 'Administración agropecuaria', 3),
(2919, 'Administración de comercio exterior', 3),
(2920, 'Administración de desarrollo agroindustrial', 3),
(2921, 'Administración de empresas', 3),
(2922, 'Administración de empresas agrarias', 3),
(2923, 'Administración de empresas agroindustriales', 3),
(2924, 'Administración de empresas agropecuarias', 3),
(2925, 'Administración de empresas cooperativas', 3),
(2926, 'Administración de empresas turísticas', 3),
(2927, 'Administración de empresas turísticas y hotel', 3),
(2928, 'Administración de instituciones de servicio', 3),
(2929, 'Administración de mercadeo agropecuario', 3),
(2930, 'Administración de negocios', 3),
(2931, 'Administración de negocios con énfasis en fin', 3),
(2932, 'Administración de obras civiles', 3),
(2933, 'Administración de recursos costeros y marinos', 3),
(2934, 'Administración de sistemas de información', 3),
(2935, 'Administración del desarrollo social', 3),
(2936, 'Administración del medio ambiente', 3),
(2937, 'Administración empresarial y publica', 3),
(2938, 'Administración en recursos humanos', 3),
(2939, 'Administración financiera', 3),
(2940, 'Administración financiera y de sistemas', 3),
(2941, 'Administración hotelera', 3),
(2942, 'Administración hotelera y de turismo', 3),
(2943, 'Administración industrial', 3),
(2944, 'Administración informática', 3),
(2945, 'Administración marítima', 3),
(2946, 'Administración para el desarrollo regional', 3),
(2947, 'Administración policial', 3),
(2948, 'Administración regional y urbana', 3),
(2949, 'Administración turística y hotelera', 3),
(2950, 'Administración y finanzas', 3),
(2951, 'Admon. Empresas nefas. Desarrollo de la capac', 3),
(2952, 'Agrología', 3),
(2953, 'Agronomía', 3),
(2954, 'Anatomopatologo', 3),
(2955, 'Antropología', 3),
(2956, 'Arquitectura', 3),
(2957, 'Arquitectura de interiores', 3),
(2958, 'Arquitectura y urbanismo', 3),
(2959, 'Artes escénicas', 3),
(2960, 'Artes musicales', 3),
(2961, 'Artes plásticas', 3),
(2962, 'Artes representativas', 3),
(2963, 'Bachiller académico', 3),
(2964, 'Bacteriología', 3),
(2965, 'Bacteriología y laboratorio clínico', 3),
(2966, 'Bellas artes', 3),
(2967, 'Bibliotecología', 3),
(2968, 'Bibliotecología y archivística', 3),
(2969, 'Biología con énfasis en biotecnología', 3),
(2970, 'Biología con énfasis en recursos naturales', 3),
(2971, 'Biología marina', 3),
(2972, 'Biología y química', 3),
(2973, 'Biólogo', 3),
(2974, 'Castellano - literatura', 3),
(2975, 'Ciencia política', 3),
(2976, 'Ciencias de enfermería y biología', 3),
(2977, 'Ciencias de la comercialización', 3),
(2978, 'Ciencias de la información y la documentación', 3),
(2979, 'Ciencias del deporte', 3),
(2980, 'Ciencias políticas', 3),
(2981, 'Ciencias políticas y administrativas', 3),
(2982, 'Cine y televisión', 3),
(2983, 'Comercio exterior', 3),
(2984, 'Comercio internacional', 3),
(2985, 'Comunicación social', 3),
(2986, 'Comunicación social énfasis en producción y a', 3),
(2987, 'Comunicación social formación básica en perio', 3),
(2988, 'Comunicación social institucional', 3),
(2989, 'Comunicación social- periodismo', 3),
(2990, 'Conservación y restauración de bienes muebles', 3),
(2991, 'Construcción', 3),
(2992, 'Contaduría publica', 3),
(2993, 'Contaduría pública- énfasis en sistemas y eco', 3),
(2994, 'Criminalística', 3),
(2995, 'Cultura física y deporte', 3),
(2996, 'Deporte y recreación', 3),
(2997, 'Derecho', 3),
(2998, 'Derecho ciencias políticas y sociales', 3),
(2999, 'Derecho y ciencias administrativas', 3),
(3000, 'Derecho y ciencias políticas', 3),
(3001, 'Derecho y ciencias sociales', 3),
(3002, 'Desarrollo familiar', 3),
(3003, 'Dibujo arquitectónico', 3),
(3004, 'Dirección musical', 3),
(3005, 'Dirección y producción de radio y televisión', 3),
(3006, 'Diseño de modas y textiles', 3),
(3007, 'Diseño grafico', 3),
(3008, 'Diseño industrial', 3),
(3009, 'Diseño visual', 3),
(3010, 'Ecología', 3),
(3011, 'Economía', 3),
(3012, 'Economía agraria', 3),
(3013, 'Economía agrícola', 3),
(3014, 'Economía de empresas', 3),
(3015, 'Economía general', 3),
(3016, 'Economía industrial', 3),
(3017, 'Economía y desarrollo', 3),
(3018, 'Educación musical', 3),
(3019, 'Ejecución instrumental', 3),
(3020, 'Enfermería', 3),
(3021, 'Enfermería comunitaria', 3),
(3022, 'Estadística', 3),
(3023, 'Estadística administrativa', 3),
(3024, 'Estadística e informática', 3),
(3025, 'Estudios diplomáticos en internacionales', 3),
(3026, 'Estudios en ciencia política', 3),
(3027, 'Estudios musicales', 3),
(3028, 'Estudios superiores en instrumento o canto', 3),
(3029, 'Farmacia', 3),
(3030, 'Filología e idiomas - alemán', 3),
(3031, 'Filología e idiomas - español', 3),
(3032, 'Filología e idiomas - francés', 3),
(3033, 'Filología e idiomas - humanidades', 3),
(3034, 'Filología e idiomas - ingles', 3),
(3035, 'Filología espa? Ola', 3),
(3036, 'Filosofía', 3),
(3037, 'Filosofía y humanidades', 3),
(3038, 'Filosofía y letras', 3),
(3039, 'Finanzas y comercio exterior', 3),
(3040, 'Finanzas y comercio internacional', 3),
(3041, 'Finanzas y negocios internacionales', 3),
(3042, 'Finanzas y relaciones internacionales', 3),
(3043, 'Física', 3),
(3044, 'Fisioterapia', 3),
(3045, 'Fonoaudiología', 3),
(3046, 'Geografía', 3),
(3047, 'Geología', 3),
(3048, 'Gerontología', 3),
(3049, 'Gestión empresarial', 3),
(3050, 'Guitarrista', 3),
(3051, 'Historia', 3),
(3052, 'Idiomas', 3),
(3053, 'Industrias pecuarias', 3),
(3054, 'Ingeniería administrativa', 3),
(3055, 'Ingeniería agrícola', 3),
(3056, 'Ingeniería agroindustrial', 3),
(3057, 'Ingeniería agronómica', 3),
(3058, 'Ingeniería ambiental', 3),
(3059, 'Ingeniería ambiental y sanitaria', 3),
(3060, 'Ingeniería biomédica', 3),
(3061, 'Ingeniería catastral y geodesia', 3),
(3062, 'Ingeniería civil', 3),
(3063, 'Ingeniería de alimentos', 3),
(3064, 'Ingeniería de diseño y automatización electró', 3),
(3065, 'Ingeniería de materiales', 3),
(3066, 'Ingeniería de mercados', 3),
(3067, 'Ingeniería de minas', 3),
(3068, 'Ingeniería de minas y metalurgia', 3),
(3069, 'Ingeniería de petróleos', 3),
(3070, 'Ingeniería de procesos', 3),
(3071, 'Ingeniería de producción', 3),
(3072, 'Ingeniería de producción agroindustrial', 3),
(3073, 'Ingeniería de recursos naturales y medio ambi', 3),
(3074, 'Ingeniería de sistemas', 3),
(3075, 'Ingeniería de sistemas con énfasis en admón. ', 3),
(3076, 'Ingeniería de sistemas con énfasis en softwar', 3),
(3077, 'Ingeniería de sistemas con énfasis en tele co', 3),
(3078, 'Ingeniería de sistemas de información', 3),
(3079, 'Ingeniería de sistemas y computación', 3),
(3080, 'Ingeniería de sistemas: énfasis en administra', 3),
(3081, 'Ingeniería de transporte y vías', 3),
(3082, 'Ingeniería del desarrollo ambiental', 3),
(3083, 'Ingeniería del medio ambiente', 3),
(3084, 'Ingeniería eléctrica', 3),
(3085, 'Ingeniería electricista', 3),
(3086, 'Ingeniería electromecánica', 3),
(3087, 'Ingeniería electrónica', 3),
(3088, 'Ingeniería electrónica y de computadores', 3),
(3089, 'Ingeniería electrónica y telecomunicaciones', 3),
(3090, 'Ingeniería en automatización industrial', 3),
(3091, 'Ingeniería en instrumentación y control', 3),
(3092, 'Ingeniería energética', 3),
(3093, 'Ingeniería financiera', 3),
(3094, 'Ingeniería forestal', 3),
(3095, 'Ingeniería geográfica', 3),
(3096, 'Ingeniería geológica', 3),
(3097, 'Ingeniería industrial', 3),
(3098, 'Ingeniería industrial de alimentos', 3),
(3099, 'Ingeniería mecánica', 3),
(3100, 'Ingeniería metalúrgica', 3),
(3101, 'Ingeniería naval - especialidad construccione', 3),
(3102, 'Ingeniería naval - especialidad electrónica', 3),
(3103, 'Ingeniería naval - especialidad mecánica', 3),
(3104, 'Ingeniería pesquera', 3),
(3105, 'Ingeniería química', 3),
(3106, 'Ingeniería sanitaria', 3),
(3107, 'Ingeniería telemática', 3),
(3108, 'Ingeniería textil', 3),
(3109, 'Instrumentación quirúrgica', 3),
(3110, 'Lenguas clásicas', 3),
(3111, 'Lic.  Educ. Especial- problemas del aprendiz.', 3),
(3112, 'Lic. Educ. Especial: problemas desarrollo y a', 3),
(3113, 'Lic. En ciencias religiosas énfasis catequesi', 3),
(3114, 'Lic. En ciencias sociales: gestión del desarr', 3),
(3115, 'Lic. En educación básica primaria:enf. En cie', 3),
(3116, 'Licenciatura educación preescolar y promoción', 3),
(3117, 'Licenciatura educación primaria y promoción d', 3),
(3118, 'Licenciatura en administración educativa', 3),
(3119, 'Licenciatura en administración y supervisión ', 3),
(3120, 'Licenciatura en agropecuarias', 3),
(3121, 'Licenciatura en arte dramático', 3),
(3122, 'Licenciatura en arte escénico', 3),
(3123, 'Licenciatura en artes graficas', 3),
(3124, 'Licenciatura en artes plásticas', 3),
(3125, 'Licenciatura en artes visuales', 3),
(3126, 'Licenciatura en bacteriología y ciencias natu', 3),
(3127, 'Licenciatura en básica primaria con énfasis e', 3),
(3128, 'Licenciatura en bellas artes', 3),
(3129, 'Licenciatura en biología', 3),
(3130, 'Licenciatura en biología y educación ambienta', 3),
(3131, 'Licenciatura en biología y química', 3),
(3132, 'Licenciatura en catequesis', 3),
(3133, 'Licenciatura en ciencias agropecuarias', 3),
(3134, 'Licenciatura en ciencias de la educación', 3),
(3135, 'Licenciatura en ciencias de la educación filo', 3),
(3136, 'Licenciatura en ciencias de la educación filo', 3),
(3137, 'Licenciatura en ciencias de la educación físi', 3),
(3138, 'Licenciatura en ciencias de la educación mate', 3),
(3139, 'Licenciatura en ciencias de la educación quím', 3),
(3140, 'Licenciatura en ciencias físicas', 3),
(3141, 'Licenciatura en ciencias naturales', 3),
(3142, 'Licenciatura en ciencias pedagógicas', 3),
(3143, 'Licenciatura en ciencias políticas y administ', 3),
(3144, 'Licenciatura en ciencias religiosa y éticas', 3),
(3145, 'Licenciatura en ciencias religiosas', 3),
(3146, 'Licenciatura en ciencias sociales', 3),
(3147, 'Licenciatura en ciencias sociales e historia', 3),
(3148, 'Licenciatura en ciencias sociales y construcc', 3),
(3149, 'Licenciatura en ciencias sociales y económica', 3),
(3150, 'Licenciatura en ciencias sociales y geografía', 3),
(3151, 'Licenciatura en comercio', 3),
(3152, 'Licenciatura en comercio y contaduría', 3),
(3153, 'Licenciatura en danzas y teatro', 3),
(3154, 'Licenciatura en decoración arquitectónico', 3),
(3155, 'Licenciatura en dibujo de la construcción', 3),
(3156, 'Licenciatura en dibujo mecánico', 3),
(3157, 'Licenciatura en didáctica y dificultades del ', 3),
(3158, 'Licenciatura en docencia comercial', 3),
(3159, 'Licenciatura en docencia de computadores', 3),
(3160, 'Licenciatura en docencia de procesos industri', 3),
(3161, 'Licenciatura en docencia de sistemas y comput', 3),
(3162, 'Licenciatura en docencia del área agropecuari', 3),
(3163, 'Licenciatura en docencia del diseño', 3),
(3164, 'Licenciatura en economía del hogar', 3),
(3165, 'Licenciatura en educa. Con especialidad en es', 3),
(3166, 'Licenciatura en educa. Esp. Audiov. Y psicope', 3),
(3167, 'Licenciatura en educa. Esp. Filosofía y letra', 3),
(3168, 'Licenciatura en educa. Espe. Tecnología indus', 3),
(3169, 'Licenciatura en educa. Mayores ingles y franc', 3),
(3170, 'Licenciatura en educación ambiental', 3),
(3171, 'Licenciatura en educación básica primaria', 3),
(3172, 'Licenciatura en educación- biología', 3),
(3173, 'Licenciatura en educación ciencias sociales', 3),
(3174, 'Licenciatura en educación de adultos', 3),
(3175, 'Licenciatura en educación electrónica', 3),
(3176, 'Licenciatura en educación electrotécnica', 3),
(3177, 'Licenciatura en educación español y comunicac', 3),
(3178, 'Licenciatura en educación español y lenguas', 3),
(3179, 'Licenciatura en educación especial', 3),
(3180, 'Licenciatura en educación especial- tiflologí', 3),
(3181, 'Licenciatura en educación especial: retardo e', 3),
(3182, 'Licenciatura en educación especialidad en mat', 3),
(3183, 'Licenciatura en educación física', 3),
(3184, 'Licenciatura en educación física y deportes', 3),
(3185, 'Licenciatura en educación física y recreación', 3),
(3186, 'Licenciatura en educación física ysalud', 3),
(3187, 'Licenciatura en educación francés', 3),
(3188, 'Licenciatura en educación- historia y filosof', 3),
(3189, 'Licenciatura en educación idiomas', 3),
(3190, 'Licenciatura en educación industrial', 3),
(3191, 'Licenciatura en educación infantil', 3),
(3192, 'Licenciatura en educación ingles', 3),
(3193, 'Licenciatura en educación mecánica industrial', 3),
(3194, 'Licenciatura en educación musical', 3),
(3195, 'Licenciatura en educación pedagogía musical', 3),
(3196, 'Licenciatura en educación preescolar', 3),
(3197, 'Licenciatura en educación preescolar y básica', 3),
(3198, 'Licenciatura en educación primaria', 3),
(3199, 'Licenciatura en educación psicología y pedago', 3),
(3200, 'Licenciatura en educación religiosa y moral', 3),
(3201, 'Licenciatura en educación rural', 3),
(3202, 'Licenciatura en educación teología', 3),
(3203, 'Licenciatura en educación y ciencias religios', 3),
(3204, 'Licenciatura en electricidad y electrónica', 3),
(3205, 'Licenciatura en electromecánica', 3),
(3206, 'Licenciatura en electrotecnia', 3),
(3207, 'Licenciatura en enseñanza de lenguas extranje', 3),
(3208, 'Licenciatura en español y literatura', 3),
(3209, 'Licenciatura en estudios bíblicos', 3),
(3210, 'Licenciatura en etnoeducacion y desarrollo co', 3),
(3211, 'Licenciatura en filología', 3),
(3212, 'Licenciatura en filología e idiomas ingles-fr', 3),
(3213, 'Licenciatura en filosofía', 3),
(3214, 'Licenciatura en filosofía con énfasis en teor', 3),
(3215, 'Licenciatura en filosofía e historia', 3),
(3216, 'Licenciatura en filosofía e idiomas', 3),
(3217, 'Licenciatura en filosofía y ciencias religios', 3),
(3218, 'Licenciatura en filosofía y humanidades', 3),
(3219, 'Licenciatura en filosofía y letras', 3),
(3220, 'Licenciatura en filosofía y teología', 3),
(3221, 'Licenciatura en física', 3),
(3222, 'Licenciatura en física y matemáticas', 3),
(3223, 'Licenciatura en formación estética', 3),
(3224, 'Licenciatura en geografía e historia', 3),
(3225, 'Licenciatura en historia', 3),
(3226, 'Licenciatura en historia de colombia', 3),
(3227, 'Licenciatura en historia y filosofía', 3),
(3228, 'Licenciatura en historia y filosofía', 3),
(3229, 'Licenciatura en idiomas', 3),
(3230, 'Licenciatura en idiomas español-ingles', 3),
(3231, 'Licenciatura en idiomas modernos español-fran', 3),
(3232, 'Licenciatura en idiomas modernos español-ingl', 3),
(3233, 'Licenciatura en informática', 3),
(3234, 'Licenciatura en informática educativa', 3),
(3235, 'Licenciatura en ingles', 3),
(3236, 'Licenciatura en ingles y humanidades', 3),
(3237, 'Licenciatura en lenguas modernar español y fr', 3),
(3238, 'Licenciatura en lenguas modernas', 3),
(3239, 'Licenciatura en lenguas modernas español e in', 3),
(3240, 'Licenciatura en lenguas modernas español fran', 3),
(3241, 'Licenciatura en lenguas modernas español ingl', 3),
(3242, 'Licenciatura en lenguas modernas ingles-franc', 3),
(3243, 'Licenciatura en lingüística y educación indíg', 3),
(3244, 'Licenciatura en lingüística y literatura', 3),
(3245, 'Licenciatura en literatura', 3),
(3246, 'Licenciatura en literatura y lengua espa? Ola', 3),
(3247, 'Licenciatura en matemáticas', 3),
(3248, 'Licenciatura en matemáticas y computación', 3),
(3249, 'Licenciatura en matemáticas y estadística', 3),
(3250, 'Licenciatura en matemáticas y física', 3),
(3251, 'Licenciatura en mecánica industrial', 3),
(3252, 'Licenciatura en música', 3),
(3253, 'Licenciatura en nutrición y dietética', 3),
(3254, 'Licenciatura en orientación y consejería', 3),
(3255, 'Licenciatura en pedagogía', 3),
(3256, 'Licenciatura en pedagogía infantil y familiar', 3),
(3257, 'Licenciatura en pedagogía para la salud', 3),
(3258, 'Licenciatura en pedagogía reeducativa', 3),
(3259, 'Licenciatura en pedagogía social y comunitari', 3),
(3260, 'Licenciatura en pedagogía y psicología', 3),
(3261, 'Licenciatura en preescolar', 3),
(3262, 'Licenciatura en producción agropecuaria', 3),
(3263, 'Licenciatura en promoción de  la comunidad', 3),
(3264, 'Licenciatura en psicología', 3),
(3265, 'Licenciatura en psicología educativa', 3),
(3266, 'Licenciatura en psicología y administración e', 3),
(3267, 'Licenciatura en psicología y filosofía', 3),
(3268, 'Licenciatura en psicopedagogía', 3),
(3269, 'Licenciatura en psicopedagogía y filosofía', 3),
(3270, 'Licenciatura en química', 3),
(3271, 'Licenciatura en química y biología', 3),
(3272, 'Licenciatura en sociales', 3),
(3273, 'Licenciatura en supervisión educativa', 3),
(3274, 'Licenciatura en tecnología educativa', 3),
(3275, 'Licenciatura en tecnología industrial', 3),
(3276, 'Licenciatura en teología', 3),
(3277, 'Lingüística y literatura', 3),
(3278, 'Literatura', 3),
(3279, 'Maestría en composición musical', 3),
(3280, 'Maestro en piano', 3),
(3281, 'Manejo agroforestal', 3),
(3282, 'Manejo agrologico y de post-cosecha', 3),
(3283, 'Matemáticas', 3),
(3284, 'Matemáticas y física', 3),
(3285, 'Medicina general', 3),
(3286, 'Medicina veterinaria', 3),
(3287, 'Medicina y cirugía', 3),
(3288, 'Medicina y neurocirugía', 3),
(3289, 'Medicina y radiología', 3),
(3290, 'Mercadeo', 3),
(3291, 'Mercadeo con énfasis en negocios internaciona', 3),
(3292, 'Mercadeo nacional e internacional', 3),
(3293, 'Mercadeo publicidad y ventas', 3),
(3294, 'Mercadeo y publicidad', 3),
(3295, 'Mercadología', 3),
(3296, 'Mercadotecnia', 3),
(3297, 'Mercadotecnia agroindustrial', 3),
(3298, 'Metalistería', 3),
(3299, 'Microbiología', 3),
(3300, 'Microbiología agrícola y veterinaria', 3),
(3301, 'Microbiología con énfasis en alimentos', 3),
(3302, 'Microbiología industrial', 3),
(3303, 'Música', 3),
(3304, 'Música canto', 3),
(3305, 'Música instrumental', 3),
(3306, 'Música instrumento', 3),
(3307, 'Negocios internacionales', 3),
(3308, 'Neurología infantil', 3),
(3309, 'Normalista superior', 3),
(3310, 'Nutricionista dietista', 3),
(3311, 'Oceanografía', 3),
(3312, 'Odontología', 3),
(3313, 'Optometría', 3),
(3314, 'Patología clínica', 3),
(3315, 'Pintura', 3),
(3316, 'Planeación para el desarrollo social', 3),
(3317, 'Profesional en  lenguas modernas', 3),
(3318, 'Profesional en ciencia de la información y la', 3),
(3319, 'Psicología', 3),
(3320, 'Psicología organizacional', 3),
(3321, 'Psicólogo', 3),
(3322, 'Psicopedagogía y administración educativa', 3),
(3323, 'Psiquiatría', 3),
(3324, 'Publicidad', 3),
(3325, 'Publicidad y mercadeo', 3),
(3326, 'Química', 3),
(3327, 'Química de alimentos', 3),
(3328, 'Química farmacéutica', 3),
(3329, 'Química y farmacia', 3),
(3330, 'Químico', 3),
(3331, 'Recreación', 3),
(3332, 'Relaciones económicas internacionales', 3),
(3333, 'Sacerdote', 3),
(3334, 'Sociología', 3),
(3335, 'Teatro', 3),
(3336, 'Teología', 3),
(3337, 'Terapia física', 3),
(3338, 'Terapia ocupacional', 3),
(3339, 'Terapia respiratoria', 3),
(3340, 'Terapias psicosociales', 3),
(3341, 'Textiles', 3),
(3342, 'Trabajo social', 3),
(3343, 'Traducción e interpretación ruso - español', 3),
(3344, 'Traducción simultanea', 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedores`
--

DROP TABLE IF EXISTS `proveedores`;
CREATE TABLE IF NOT EXISTS `proveedores` (
  `nitProveedor` int(11) NOT NULL,
  `nombreProveedor` varchar(45) NOT NULL,
  `direccionProveedor` varchar(45) NOT NULL,
  `telefonoFijoProveedor` varchar(10) DEFAULT NULL,
  `telefonoMovilProveedor` varchar(10) DEFAULT NULL,
  `correoProveedor` varchar(45) DEFAULT NULL,
  `latitud` varchar(45) DEFAULT NULL,
  `longitud` varchar(45) DEFAULT NULL,
  `descripcionProveedor` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`nitProveedor`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `referenciabancaria`
--

DROP TABLE IF EXISTS `referenciabancaria`;
CREATE TABLE IF NOT EXISTS `referenciabancaria` (
  `idreferenciaBancaria` int(11) NOT NULL AUTO_INCREMENT,
  `numeroCuenta` varchar(45) DEFAULT NULL,
  `sucursal` varchar(45) DEFAULT NULL,
  `bancos_idbanco` int(11) NOT NULL,
  `clientes_idCliente` int(11) NOT NULL,
  PRIMARY KEY (`idreferenciaBancaria`),
  KEY `fk_referenciaBancaria_bancos1_idx` (`bancos_idbanco`),
  KEY `fk_referenciabancaria_clientes1_idx` (`clientes_idCliente`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `referenciapersonalfamiliar`
--

DROP TABLE IF EXISTS `referenciapersonalfamiliar`;
CREATE TABLE IF NOT EXISTS `referenciapersonalfamiliar` (
  `idreferenciaPersonalFamiliar` int(11) NOT NULL AUTO_INCREMENT,
  `nombresReferencia` varchar(45) DEFAULT NULL,
  `apellidosReferencia` varchar(45) DEFAULT NULL,
  `telefonoReferencia` varchar(10) DEFAULT NULL,
  `clientes_idCliente` int(11) NOT NULL,
  `tiporeferencia_idtipoReferencia` int(11) NOT NULL,
  PRIMARY KEY (`idreferenciaPersonalFamiliar`),
  KEY `fk_referenciapersonalfamiliar_clientes1_idx` (`clientes_idCliente`),
  KEY `fk_referenciapersonalfamiliar_tiporeferencia1_idx` (`tiporeferencia_idtipoReferencia`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `regiones`
--

DROP TABLE IF EXISTS `regiones`;
CREATE TABLE IF NOT EXISTS `regiones` (
  `idRegion` int(11) NOT NULL AUTO_INCREMENT,
  `nombreRegion` varchar(30) DEFAULT NULL,
  `idPais` int(11) DEFAULT NULL,
  PRIMARY KEY (`idRegion`),
  KEY `idPais` (`idPais`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `regiones`
--

INSERT INTO `regiones` (`idRegion`, `nombreRegion`, `idPais`) VALUES
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

DROP TABLE IF EXISTS `rol`;
CREATE TABLE IF NOT EXISTS `rol` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) DEFAULT NULL,
  `descripcion` varchar(2000) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=86 DEFAULT CHARSET=latin1;

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

DROP TABLE IF EXISTS `tipoactividadeconomicaarrendatario`;
CREATE TABLE IF NOT EXISTS `tipoactividadeconomicaarrendatario` (
  `idtipoLaborArrendatario` int(11) NOT NULL AUTO_INCREMENT,
  `nombreTipoLaboraArrendatario` varchar(45) NOT NULL,
  PRIMARY KEY (`idtipoLaborArrendatario`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tipoactividadeconomicaarrendatario`
--

INSERT INTO `tipoactividadeconomicaarrendatario` (`idtipoLaborArrendatario`, `nombreTipoLaboraArrendatario`) VALUES
(22, 'Asalariado'),
(23, 'Estudiante'),
(24, 'Socio'),
(25, 'Pensionado'),
(26, 'Jubilado'),
(27, 'Rentista'),
(28, 'Otro');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipocontratoempleado`
--

DROP TABLE IF EXISTS `tipocontratoempleado`;
CREATE TABLE IF NOT EXISTS `tipocontratoempleado` (
  `idtipoContratoEmpleado` int(11) NOT NULL AUTO_INCREMENT,
  `nombreContratoEmpleado` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idtipoContratoEmpleado`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tipocontratoempleado`
--

INSERT INTO `tipocontratoempleado` (`idtipoContratoEmpleado`, `nombreContratoEmpleado`) VALUES
(1, 'Termino indefinido'),
(2, 'Termino fijo'),
(3, 'Por obra o labor'),
(4, 'Pro prestación de servicios'),
(5, 'De aprendizaje'),
(6, 'Ocasional o temporal');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipocuenta`
--

DROP TABLE IF EXISTS `tipocuenta`;
CREATE TABLE IF NOT EXISTS `tipocuenta` (
  `idtipoCuenta` int(11) NOT NULL AUTO_INCREMENT,
  `nombreTipoCuenta` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idtipoCuenta`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tipocuenta`
--

INSERT INTO `tipocuenta` (`idtipoCuenta`, `nombreTipoCuenta`) VALUES
(1, 'Ahorros'),
(2, 'Corriente');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipoidentificacion`
--

DROP TABLE IF EXISTS `tipoidentificacion`;
CREATE TABLE IF NOT EXISTS `tipoidentificacion` (
  `idtipoIdentificacion` int(11) NOT NULL AUTO_INCREMENT,
  `nombreTipoIdentificacion` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idtipoIdentificacion`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tipoidentificacion`
--

INSERT INTO `tipoidentificacion` (`idtipoIdentificacion`, `nombreTipoIdentificacion`) VALUES
(10, 'Cedula de ciudadania'),
(11, 'Cedula Nit'),
(12, 'Cedula de extranjería');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipopersonacliente`
--

DROP TABLE IF EXISTS `tipopersonacliente`;
CREATE TABLE IF NOT EXISTS `tipopersonacliente` (
  `idtipoPersonCliente` int(11) NOT NULL AUTO_INCREMENT,
  `nombreTipoPersonaCliente` varchar(45) NOT NULL COMMENT 'Tipo persona Juridica o natural',
  PRIMARY KEY (`idtipoPersonCliente`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tipopersonacliente`
--

INSERT INTO `tipopersonacliente` (`idtipoPersonCliente`, `nombreTipoPersonaCliente`) VALUES
(7, 'Natural'),
(8, 'Jurídica');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tiporeferencia`
--

DROP TABLE IF EXISTS `tiporeferencia`;
CREATE TABLE IF NOT EXISTS `tiporeferencia` (
  `idtipoReferencia` int(11) NOT NULL AUTO_INCREMENT,
  `nombreTipoReferencia` varchar(45) NOT NULL,
  PRIMARY KEY (`idtipoReferencia`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tiporeferencia`
--

INSERT INTO `tiporeferencia` (`idtipoReferencia`, `nombreTipoReferencia`) VALUES
(7, 'Personal'),
(8, 'Familiar');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tiposangre`
--

DROP TABLE IF EXISTS `tiposangre`;
CREATE TABLE IF NOT EXISTS `tiposangre` (
  `idtipoSangre` int(11) NOT NULL AUTO_INCREMENT,
  `tipoSangre` varchar(45) NOT NULL,
  PRIMARY KEY (`idtipoSangre`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tiposclientes`
--

DROP TABLE IF EXISTS `tiposclientes`;
CREATE TABLE IF NOT EXISTS `tiposclientes` (
  `idtipoCliente` int(11) NOT NULL AUTO_INCREMENT,
  `nombreTipoCliente` varchar(45) NOT NULL,
  PRIMARY KEY (`idtipoCliente`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tiposclientes`
--

INSERT INTO `tiposclientes` (`idtipoCliente`, `nombreTipoCliente`) VALUES
(13, 'Comprador'),
(14, 'Vendedor'),
(15, 'Arrendador'),
(16, 'Arrendatario');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tiposcocinas`
--

DROP TABLE IF EXISTS `tiposcocinas`;
CREATE TABLE IF NOT EXISTS `tiposcocinas` (
  `idtipoCocina` int(11) NOT NULL AUTO_INCREMENT,
  `nombreTipoCocina` varchar(45) NOT NULL,
  PRIMARY KEY (`idtipoCocina`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tiposcocinas`
--

INSERT INTO `tiposcocinas` (`idtipoCocina`, `nombreTipoCocina`) VALUES
(10, 'Gas'),
(11, 'Eléctrica'),
(12, 'Mixta');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tiposcortinas`
--

DROP TABLE IF EXISTS `tiposcortinas`;
CREATE TABLE IF NOT EXISTS `tiposcortinas` (
  `idtipoCortina` int(11) NOT NULL AUTO_INCREMENT,
  `nombreTipoCortina` varchar(45) NOT NULL,
  PRIMARY KEY (`idtipoCortina`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tiposcortinas`
--

INSERT INTO `tiposcortinas` (`idtipoCortina`, `nombreTipoCortina`) VALUES
(7, 'Cortinas'),
(8, 'Persianas');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tiposdestacados`
--

DROP TABLE IF EXISTS `tiposdestacados`;
CREATE TABLE IF NOT EXISTS `tiposdestacados` (
  `idtipoDestacado` int(11) NOT NULL AUTO_INCREMENT,
  `nombreDestacado` varchar(45) NOT NULL,
  PRIMARY KEY (`idtipoDestacado`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tiposdestacados`
--

INSERT INTO `tiposdestacados` (`idtipoDestacado`, `nombreDestacado`) VALUES
(10, 'Alto'),
(11, 'Medio'),
(12, 'Bajo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tiposempleados`
--

DROP TABLE IF EXISTS `tiposempleados`;
CREATE TABLE IF NOT EXISTS `tiposempleados` (
  `idtipoEmpleado` int(11) NOT NULL AUTO_INCREMENT,
  `nombreTipoEmpleado` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idtipoEmpleado`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tiposempleados`
--

INSERT INTO `tiposempleados` (`idtipoEmpleado`, `nombreTipoEmpleado`) VALUES
(23, 'Gerente'),
(24, 'Secretaria'),
(25, 'Abogado'),
(26, 'Contador'),
(27, 'Auxiliar de arrendamientos'),
(28, 'Asesor comercial'),
(29, 'Mensajero');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tiposempresas`
--

DROP TABLE IF EXISTS `tiposempresas`;
CREATE TABLE IF NOT EXISTS `tiposempresas` (
  `idtipoEmpresa` int(11) NOT NULL AUTO_INCREMENT,
  `nombreTipoEmpresa` varchar(45) NOT NULL COMMENT 'privada, mixta, publica, sector solidario',
  PRIMARY KEY (`idtipoEmpresa`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tiposempresas`
--

INSERT INTO `tiposempresas` (`idtipoEmpresa`, `nombreTipoEmpresa`) VALUES
(13, 'Privada'),
(14, 'Pública'),
(15, 'Mixta'),
(16, 'Sector Solidario');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tiposeventos`
--

DROP TABLE IF EXISTS `tiposeventos`;
CREATE TABLE IF NOT EXISTS `tiposeventos` (
  `idtipoEvento` int(11) NOT NULL AUTO_INCREMENT,
  `nombreTipoEvento` varchar(45) NOT NULL,
  PRIMARY KEY (`idtipoEvento`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tiposeventos`
--

INSERT INTO `tiposeventos` (`idtipoEvento`, `nombreTipoEvento`) VALUES
(19, 'Visita inmueble'),
(20, 'Reunión interna'),
(21, 'Reunión externa'),
(22, 'Firma contrato'),
(23, 'Firma promesa compra venta'),
(24, 'Firma escrituras');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tiposinmuebles`
--

DROP TABLE IF EXISTS `tiposinmuebles`;
CREATE TABLE IF NOT EXISTS `tiposinmuebles` (
  `idtipoInmueble` int(11) NOT NULL AUTO_INCREMENT,
  `nombreTipoInmueble` varchar(45) NOT NULL,
  PRIMARY KEY (`idtipoInmueble`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tiposinmuebles`
--

INSERT INTO `tiposinmuebles` (`idtipoInmueble`, `nombreTipoInmueble`) VALUES
(19, 'Casa'),
(20, 'Apartamento'),
(21, 'Local'),
(22, 'Bodega'),
(23, 'Oficina'),
(24, 'Otro');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tiposofertas`
--

DROP TABLE IF EXISTS `tiposofertas`;
CREATE TABLE IF NOT EXISTS `tiposofertas` (
  `idtipoOferta` int(11) NOT NULL AUTO_INCREMENT,
  `nombreTipoOferta` varchar(45) NOT NULL,
  PRIMARY KEY (`idtipoOferta`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tiposofertas`
--

INSERT INTO `tiposofertas` (`idtipoOferta`, `nombreTipoOferta`) VALUES
(9, 'Arriendo'),
(10, 'Venta'),
(11, 'vacacional');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipospisos`
--

DROP TABLE IF EXISTS `tipospisos`;
CREATE TABLE IF NOT EXISTS `tipospisos` (
  `idtipoPiso` int(11) NOT NULL AUTO_INCREMENT,
  `nombreTipoPiso` varchar(45) NOT NULL,
  PRIMARY KEY (`idtipoPiso`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tipospisos`
--

INSERT INTO `tipospisos` (`idtipoPiso`, `nombreTipoPiso`) VALUES
(43, 'Madera'),
(44, 'Porcelanato'),
(45, 'Hormigon'),
(46, 'Mosaicos'),
(47, 'Piedra'),
(48, 'Alfombra'),
(49, 'Laminado'),
(50, 'Bambú'),
(51, 'Madera'),
(52, 'Linóleo'),
(53, 'Cerámica'),
(54, 'Vinilo'),
(55, 'Caucho'),
(56, 'Concreto');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipossociedad`
--

DROP TABLE IF EXISTS `tipossociedad`;
CREATE TABLE IF NOT EXISTS `tipossociedad` (
  `idtipoSociedad` int(11) NOT NULL AUTO_INCREMENT,
  `nombreTipoSociedad` varchar(45) NOT NULL,
  PRIMARY KEY (`idtipoSociedad`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tipossociedad`
--

INSERT INTO `tipossociedad` (`idtipoSociedad`, `nombreTipoSociedad`) VALUES
(22, 'Anonima'),
(23, 'Limitada'),
(24, 'Mixta'),
(25, 'Extranjera'),
(26, 'Publica'),
(27, 'Cooperativa'),
(28, 'Unipersonal');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tiposvigilancias`
--

DROP TABLE IF EXISTS `tiposvigilancias`;
CREATE TABLE IF NOT EXISTS `tiposvigilancias` (
  `idtipoVigilancia` int(11) NOT NULL AUTO_INCREMENT,
  `nombreTipoVigilancia` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idtipoVigilancia`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tiposvigilancias`
--

INSERT INTO `tiposvigilancias` (`idtipoVigilancia`, `nombreTipoVigilancia`) VALUES
(13, 'Vigilancia 24/7'),
(14, 'Diruna'),
(15, 'Nocturna'),
(16, 'Sin vigilancia');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tiposvistas`
--

DROP TABLE IF EXISTS `tiposvistas`;
CREATE TABLE IF NOT EXISTS `tiposvistas` (
  `idtipoVista` int(11) NOT NULL AUTO_INCREMENT,
  `nombreTipoVista` varchar(45) NOT NULL,
  PRIMARY KEY (`idtipoVista`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tiposvistas`
--

INSERT INTO `tiposvistas` (`idtipoVista`, `nombreTipoVista`) VALUES
(7, 'Interior'),
(8, 'Exterior');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

DROP TABLE IF EXISTS `usuario`;
CREATE TABLE IF NOT EXISTS `usuario` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `primer_nombre` varchar(50) DEFAULT NULL,
  `segundo_nombre` varchar(50) DEFAULT NULL,
  `primer_apellido` varchar(50) DEFAULT NULL,
  `segundo_apellido` varchar(50) DEFAULT NULL,
  `usuario` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `rol` int(11) DEFAULT NULL,
  `descripcion` varchar(2000) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `usuario_rol_fkey` (`rol`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

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

DROP TABLE IF EXISTS `videoinmueble`;
CREATE TABLE IF NOT EXISTS `videoinmueble` (
  `idVideoInmueble` int(11) NOT NULL AUTO_INCREMENT,
  `rutaVideo` varchar(200) DEFAULT NULL,
  `idInmueble` int(11) DEFAULT NULL,
  PRIMARY KEY (`idVideoInmueble`),
  KEY `idInmueble` (`idInmueble`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `videoinmueble`
--

INSERT INTO `videoinmueble` (`idVideoInmueble`, `rutaVideo`, `idInmueble`) VALUES
(1, 'sdadssd', 19),
(2, 'sdadasdsa', 19);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `zonas`
--

DROP TABLE IF EXISTS `zonas`;
CREATE TABLE IF NOT EXISTS `zonas` (
  `idzona` int(11) NOT NULL AUTO_INCREMENT,
  `nombreZona` varchar(45) NOT NULL,
  PRIMARY KEY (`idzona`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `zonas`
--

INSERT INTO `zonas` (`idzona`, `nombreZona`) VALUES
(28, 'Norte'),
(29, 'Centro'),
(30, 'Sur'),
(31, 'Oriente'),
(32, 'Occidente'),
(33, 'NorOriente'),
(34, 'NorOccidente'),
(35, 'SurOriente'),
(36, 'SurOccidente');

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
  ADD CONSTRAINT `fk_contratoEmpleado_empleados1` FOREIGN KEY (`empleados_idempleado`) REFERENCES `empleados` (`idempleado`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `contratos`
--
ALTER TABLE `contratos`
  ADD CONSTRAINT `fk_contratos_inmuebles1` FOREIGN KEY (`inmuebles_idinmueble`) REFERENCES `inmuebles` (`idinmueble`) ON DELETE NO ACTION ON UPDATE NO ACTION;

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
  ADD CONSTRAINT `fk_detalleContratosDeudores_deudorSolidario1` FOREIGN KEY (`numeroIdentificacionDeudor`) REFERENCES `deudorsolidario` (`numeroIdentificacionDeudor`) ON DELETE NO ACTION ON UPDATE NO ACTION;

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
  ADD CONSTRAINT `fk_formacionEmpleado_nivelprofesion1` FOREIGN KEY (`idnivelProfesion`) REFERENCES `nivelprofesion` (`idnivelProfesion`) ON DELETE NO ACTION ON UPDATE NO ACTION;

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
