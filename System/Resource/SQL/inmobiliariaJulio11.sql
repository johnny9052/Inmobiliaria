-- phpMyAdmin SQL Dump
-- version 4.7.9
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 11-07-2018 a las 15:02:52
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
   select id,numeroIdentificacion as numero_identificacion, primerNombreCliente as primer_nombre, 
          segundoNombreCliente as segundo_nombre, primerApellidoCliente as primer_apellido, 
          segundoApellidoCliente as segundo_apellido,  
          tipoPersonaCliente_idtipoPersonCliente as tipo_cliente
   from clientes
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

DROP PROCEDURE IF EXISTS `login`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `login` (IN `usu` VARCHAR(50), IN `pass` VARCHAR(50))  BEGIN
   select u.usuario,u.primer_nombre,u.primer_apellido,u.rol,u.id,r.nombre as rol_nombre
   from usuario as u
   inner join rol as r on u.rol = r.id
   where password=pass and usuario=usu;		
END$$

DROP PROCEDURE IF EXISTS `searchclient`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `searchclient` (`vid` INT)  BEGIN
 	
	SELECT id,numeroIdentificacion, primerNombreCliente, segundoNombreCliente, primerApellidoCliente, segundoApellidoCliente, direccionCliente,
                 telefonoFijoCliente, telefonoMovilCliente, correoCliente, generoCliente, fechaNacimiento, ciudadResidencia_idciudad, 
	         tipoIdentificacion_idtipoIdentificacion, ciudadExpedicion_idciudad, profesiones_idprofesion, tipoPersonaCliente_idtipoPersonCliente
	FROM clientes
	where id = vid;	
	
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
    DELETE FROM clientes WHERE id = vid;
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
CREATE DEFINER=`root`@`localhost` FUNCTION `saveclient` (`vid` INT, `vfirstname` VARCHAR(50), `vsecondname` VARCHAR(50), `vfirstlastname` VARCHAR(50), `vsecondlastname` VARCHAR(50), `vDocumentType` INT, `vDocumentNumber` VARCHAR(11), `vCityExpedition` INT, `vBirthdate` VARCHAR(50), `vClientType` INT, `vAddress` VARCHAR(45), `vHomePhone` VARCHAR(10), `vMobilePhone` VARCHAR(10), `vEmail` VARCHAR(45), `vGender` INT, `vCityResidence` INT, `vProfession` INT, `vMaritalStatus` INT, `vPersonType` INT) RETURNS INT(1) READS SQL DATA
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


            Insert into detalleClientesTipoClientes(tiposClientes_idtipoCliente, 
                                                          clientes_cedulaCliente) 
            values(vClientType,@vidClient);

				
			set res = 1;
			
												 				 
		END IF;

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
CREATE DEFINER=`root`@`localhost` FUNCTION `updateclient` (`vId` INT, `vfirstname` VARCHAR(50), `vsecondname` VARCHAR(50), `vfirstlastname` VARCHAR(50), `vsecondlastname` VARCHAR(50), `vDocumentType` INT, `vDocumentNumber` VARCHAR(11), `vCityExpedition` INT, `vBirthdate` VARCHAR(50), `vClientType` INT, `vAddress` VARCHAR(45), `vHomePhone` VARCHAR(10), `vMobilePhone` VARCHAR(10), `vEmail` VARCHAR(45), `vGender` INT, `vCityResidence` INT, `vProfession` INT) RETURNS INT(1) READS SQL DATA
    DETERMINISTIC
    COMMENT 'Funcion que modifica un cliente'
BEGIN 
    DECLARE res INT DEFAULT 0;
    
IF NOT EXISTS(select 1 from clientes where numeroIdentificacion =vDocumentNumber and id<>vId)
		THEN
			update clientes set primerNombreCliente = vfirstname, 
                                            segundoNombreCliente = vsecondname,
                                            primerApellidoCliente = vfirstlastname, 
                                            segundoApellidoCliente = vsecondlastname, 
                                            tipoIdentificacion_idtipoIdentificacion = vDocumentType, 
                                            numeroIdentificacion = vDocumentNumber,
                                            ciudadExpedicion_idciudad = vCityExpedition, 
                                            fechaNacimiento = vBirthdate, 
                                            tipoPersonaCliente_idtipoPersonCliente = vClientType,
                                            direccionCliente = vAddress,
                                            telefonoFijoCliente = vHomePhone, 
                                            telefonoMovilCliente = vMobilePhone, 
                                            correoCliente = vEmail, 
                                            generoCliente = vGender,                                             
                                            ciudadResidencia_idciudad = vCityResidence,                                                                                                                                     
                                            profesiones_idprofesion = vProfession                                           
                        where id = vId;		
			set res=1;
														
		END IF;

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
    	SET permiso = ELT(1, vpermission);
        /*Se elimina ese primer valor y se reemplaza en la cadena*/
    	SET vpermission = SUBSTRING(vpermission, LOCATE(',',vpermission) + 1);
        /*Se almacena en la tabla, siempre y cuando tenga un dato para almacenar*/
		IF permiso <> ',' THEN	
    		INSERT INTO menu_rol(idrol, idmenu) VALUES (vid, permiso);
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
  `iddetalleArrendatarioTipoArrendatario` int(11) NOT NULL,
  PRIMARY KEY (`idarrendatarioDependiente`),
  KEY `fk_arrendatarioDependiente_Cargos1_idx` (`Cargos_idCargo`),
  KEY `fk_arrendatarioDependiente_detalleArrendatarioTipoArrendata_idx` (`iddetalleArrendatarioTipoArrendatario`)
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
  `iddetalleArrendatarioTipoArrendatario` int(11) NOT NULL,
  PRIMARY KEY (`idarrendatarioIndependiente`),
  KEY `fk_arrendatarioIndependiente_detalleArrendatarioTipoArrenda_idx` (`iddetalleArrendatarioTipoArrendatario`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `arrendatariosnatural`
--

DROP TABLE IF EXISTS `arrendatariosnatural`;
CREATE TABLE IF NOT EXISTS `arrendatariosnatural` (
  `idarrendatario` int(11) NOT NULL AUTO_INCREMENT,
  `iddetalleClientesTipoClientes` int(11) NOT NULL,
  `iddetalleClientesTipoClientes1` int(11) NOT NULL,
  PRIMARY KEY (`idarrendatario`),
  KEY `fk_arrendatarios_detalleClientesTipoClientes1_idx` (`iddetalleClientesTipoClientes1`)
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
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `bancos`
--

INSERT INTO `bancos` (`idbanco`, `nombreBanco`, `direccionPrincipal`, `telefonoPrincipal`) VALUES
(1, 'Arco Grupo Bancoldex', NULL, NULL),
(2, 'Banca de Inversión Bancolombia', NULL, NULL),
(3, 'Bancamía S.A.', NULL, NULL),
(4, 'Banco  de  Occidente S.A.', NULL, NULL),
(5, 'Banco Agrario de Colombia', NULL, NULL),
(6, 'Banco AV Villas', NULL, NULL),
(7, 'Banco Caja Social', NULL, NULL),
(8, 'Banco Compartir', NULL, NULL),
(9, 'Banco Coomeva', NULL, NULL),
(10, 'Banco Cooperativo Coopcentral', NULL, NULL),
(11, 'Banco Corpobanca', NULL, NULL),
(12, 'Banco Davivienda', NULL, NULL),
(13, 'Banco de Bogotá', NULL, NULL),
(14, 'Banco Falabella', NULL, NULL),
(15, 'Banco Finandina', NULL, NULL),
(16, 'Banco GNB Sudameris', NULL, NULL),
(17, 'Banco Multibank', NULL, NULL),
(18, 'Banco Mundo Mujer', NULL, NULL),
(19, 'Banco Pichincha', NULL, NULL),
(20, 'Banco Popular S.A.', NULL, NULL),
(21, 'Banco ProCredit', NULL, NULL),
(22, 'Banco Santander', NULL, NULL),
(23, 'Banco W S.A.', NULL, NULL),
(24, 'Bancolombia S.A.', NULL, NULL),
(25, 'BBVA Colombia', NULL, NULL),
(26, 'BNP Paribas Colombia Corporación Financiera', NULL, NULL),
(27, 'Citibank-Colombia', NULL, NULL),
(28, 'Colpatria', NULL, NULL),
(29, 'Coltefinanciera', NULL, NULL),
(30, 'Compañía de Financiamiento TUYA', NULL, NULL),
(31, 'Corporación Financiera Colombiana', NULL, NULL),
(32, 'Credifamilia Compañía de Financiamiento', NULL, NULL),
(33, 'Credifinanciera', NULL, NULL),
(34, 'Financiera DANN ', NULL, NULL),
(35, 'Financiera Juriscoop', NULL, NULL),
(36, 'Financiera Pagos Internacionales', NULL, NULL),
(37, 'Giros & Finanzas Compañía de Financiamiento', NULL, NULL),
(38, 'GM Financial Colombia', NULL, NULL),
(39, 'ITAÚ BBA Colombia', NULL, NULL),
(40, 'JPMorgan Corporación Financiera', NULL, NULL),
(41, 'La Hipotecaria Compañía de Financiamiento', NULL, NULL),
(42, 'Leasing Corficolombiana', NULL, NULL),
(43, 'Opportunity International Colombia', NULL, NULL),
(44, 'RCI Colombia', NULL, NULL),
(45, 'Serfinansa', NULL, NULL);

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
) ENGINE=InnoDB AUTO_INCREMENT=276 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `barrios`
--

INSERT INTO `barrios` (`idbarrio`, `nombreBarrio`, `idCiudad`) VALUES
(1, 'Asentamiento  25 de enero', 886),
(2, 'Asentamiento  el milagro', 886),
(3, 'Asentamiento  el recuerdo', 886),
(4, 'Asentamiento  los fundadores', 886),
(5, 'Asentamiento las veraneras', 886),
(6, 'Asentamiento puerto rico', 886),
(7, 'Asentamiento salvador allende', 886),
(8, 'Asentamiento vieja libertad', 886),
(9, 'Barrio  25 de mayo', 886),
(10, 'Barrio  7 de agosto', 886),
(11, 'Barrio  buenos aires', 886),
(12, 'Barrio  el recreo', 886),
(13, 'Barrio  el silencio', 886),
(14, 'Barrio  galan', 886),
(15, 'Barrio  granada', 886),
(16, 'Barrio  la adiela', 886),
(17, 'Barrio  la campina', 886),
(18, 'Barrio  la castellana', 886),
(19, 'Barrio  la montana', 886),
(20, 'Barrio  las sesenta casas', 886),
(21, 'Barrio  los fundadores', 886),
(22, 'Barrio  niagara', 886),
(23, 'Barrio  providencia', 886),
(24, 'Barrio  uribe', 886),
(25, 'Barrio 14 de octubre', 886),
(26, 'Barrio 19 de enero', 886),
(27, 'Barrio 7 de agosto', 886),
(28, 'Barrio 8 de marzo', 886),
(29, 'Barrio alcazar', 886),
(30, 'Barrio alfonso lopez', 886),
(31, 'Barrio antonio narino', 886),
(32, 'Barrio arenales', 886),
(33, 'Barrio arrayanes', 886),
(34, 'Barrio belen', 886),
(35, 'Barrio belencito', 886),
(36, 'Barrio bello horizonte', 886),
(37, 'Barrio berlin', 886),
(38, 'Barrio bosques de gibraltar', 886),
(39, 'Barrio boyaca', 886),
(40, 'Barrio buenos aires bajo', 886),
(41, 'Barrio buenos aires plano', 886),
(42, 'Barrio calima', 886),
(43, 'Barrio cincuentenario', 886),
(44, 'Barrio colinas centro', 886),
(45, 'Barrio cooperativo', 886),
(46, 'Barrio corbones', 886),
(47, 'Barrio el bosque', 886),
(48, 'Barrio el emperador', 886),
(49, 'Barrio el nogal', 886),
(50, 'Barrio el paraiso', 886),
(51, 'Barrio el placer', 886),
(52, 'Barrio el porvenir', 886),
(53, 'Barrio el prado', 886),
(54, 'Barrio el recreo', 886),
(55, 'Barrio espana', 886),
(56, 'Barrio farallones', 886),
(57, 'Barrio gaitan', 886),
(58, 'Barrio gibraltar', 886),
(59, 'Barrio guayaquil', 886),
(60, 'Barrio jesus maria ocampo', 886),
(61, 'Barrio la anunciacion', 886),
(62, 'Barrio la arboleda', 886),
(63, 'Barrio la brasilia', 886),
(64, 'Barrio la cabana', 886),
(65, 'Barrio la clarita', 886),
(66, 'Barrio la esperanza', 886),
(67, 'Barrio la isabela', 886),
(68, 'Barrio la lorena', 886),
(69, 'Barrio la milagrosa', 886),
(70, 'Barrio la miranda', 886),
(71, 'Barrio la union', 886),
(72, 'Barrio las acacias', 886),
(73, 'Barrio las americas', 886),
(74, 'Barrio las margaritas', 886),
(75, 'Barrio las mercedes', 886),
(76, 'Barrio las palmas', 886),
(77, 'Barrio laureles', 886),
(78, 'Barrio los alamos', 886),
(79, 'Barrio los cambulos', 886),
(80, 'Barrio los libertadores', 886),
(81, 'Barrio los naranjos', 886),
(82, 'Barrio los profesionales', 886),
(83, 'Barrio los quindos', 886),
(84, 'Barrio loteros', 886),
(85, 'Barrio manuela beltran', 886),
(86, 'Barrio marco fidel suarez', 886),
(87, 'Barrio miraflores', 886),
(88, 'Barrio modelo', 886),
(89, 'Barrio monteprado', 886),
(90, 'Barrio montevideo', 886),
(91, 'Barrio nueva cecilia', 886),
(92, 'Barrio nueva libertad', 886),
(93, 'Barrio obrero', 886),
(94, 'Barrio patio bonito', 886),
(95, 'Barrio patio bonito bajo', 886),
(96, 'Barrio patricia', 886),
(97, 'Barrio piamonte', 886),
(98, 'Barrio pinares', 886),
(99, 'Barrio popular', 886),
(100, 'Barrio quindio', 886),
(101, 'Barrio rincon santo', 886),
(102, 'Barrio salazar', 886),
(103, 'Barrio san andres', 886),
(104, 'Barrio san fernando', 886),
(105, 'Barrio san jose', 886),
(106, 'Barrio san nicolas', 886),
(107, 'Barrio san vicente de paul', 886),
(108, 'Barrio santa helena', 886),
(109, 'Barrio santa maria', 886),
(110, 'Barrio santa rita', 886),
(111, 'Barrio santafe', 886),
(112, 'Barrio santander', 886),
(113, 'Barrio tigreros', 886),
(114, 'Barrio velez', 886),
(115, 'Barrio zuldemayda', 886),
(116, 'Sector  aborigenes', 886),
(117, 'Sector  av centenario', 886),
(118, 'Sector  bavaria', 886),
(119, 'Sector  centro', 886),
(120, 'Sector  coinca', 886),
(121, 'Sector  crq', 886),
(122, 'Sector  el coliseo', 886),
(123, 'Sector  el mirador', 886),
(124, 'Sector  estadio centenario', 886),
(125, 'Sector  jardines', 886),
(126, 'Sector  la aldea', 886),
(127, 'Sector  la florida', 886),
(128, 'Sector  la fogata', 886),
(129, 'Sector  la maria', 886),
(130, 'Sector  monterredondo', 886),
(131, 'Sector  norte avenida 19', 886),
(132, 'Sector  parque cafetero', 886),
(133, 'Sector  parque valencia', 886),
(134, 'Sector  proviteq', 886),
(135, 'Sector  quebrada la clarita-san jose', 886),
(136, 'Sector  regivit', 886),
(137, 'Sector  san juan', 886),
(138, 'Sector  san nicolas', 886),
(139, 'Sector  santa ana', 886),
(140, 'Sector  sinai', 886),
(141, 'Sector  tigreros', 886),
(142, 'Sector  tres esquinas', 886),
(143, 'Sector  yulima', 886),
(144, 'Urbanizacion  bosques de viena', 886),
(145, 'Urbanizacion  el limonar', 886),
(146, 'Urbanizacion  el silencio', 886),
(147, 'Urbanizacion  el tesorito', 886),
(148, 'Urbanizacion  la fachada', 886),
(149, 'Urbanizacion  la virginia', 886),
(150, 'Urbanizacion  los almendros', 886),
(151, 'Urbanizacion  nuevo recreo', 886),
(152, 'Urbanizacion  palmares del recreo', 886),
(153, 'Urbanizacion  primero de mayo', 886),
(154, 'Urbanizacion  sara', 886),
(155, 'Urbanizacion  venecia', 886),
(156, 'Urbanizacion  villa andrea', 886),
(157, 'Urbanizacion  villa celmira', 886),
(158, 'Urbanizacion  villa de las americas', 886),
(159, 'Urbanizacion  villa jardin', 886),
(160, 'Urbanizacion  villa maraveles', 886),
(161, 'Urbanizacion 13 de junio', 886),
(162, 'Urbanizacion aguazul', 886),
(163, 'Urbanizacion ahitamara', 886),
(164, 'Urbanizacion alameda del norte', 886),
(165, 'Urbanizacion alcazar del caf?', 886),
(166, 'Urbanizacion alejandria', 886),
(167, 'Urbanizacion altos de la pavona', 886),
(168, 'Urbanizacion arco iris', 886),
(169, 'Urbanizacion bambusa', 886),
(170, 'Urbanizacion baru', 886),
(171, 'Urbanizacion bosques de pinares', 886),
(172, 'Urbanizacion brasilia nueva', 886),
(173, 'Urbanizacion cabo de la vela', 886),
(174, 'Urbanizacion canas gordas', 886),
(175, 'Urbanizacion cano cristales', 886),
(176, 'Urbanizacion casablanca', 886),
(177, 'Urbanizacion castilla grande', 886),
(178, 'Urbanizacion centenario', 886),
(179, 'Urbanizacion chalets de monteblanco', 886),
(180, 'Urbanizacion ciudad dorada', 886),
(181, 'Urbanizacion ciudadela el poblado', 886),
(182, 'Urbanizacion ciudadela el sol', 886),
(183, 'Urbanizacion ciudadela la patria', 886),
(184, 'Urbanizacion ciudadela las colinas', 886),
(185, 'Urbanizacion ciudadela los andes', 886),
(186, 'Urbanizacion ciudadela nueva armenia', 886),
(187, 'Urbanizacion ciudadela nuevo horizonte', 886),
(188, 'Urbanizacion ciudadela puerto espejo', 886),
(189, 'Urbanizacion ciudadela simon bolivar', 886),
(190, 'Urbanizacion cristales', 886),
(191, 'Urbanizacion el carmelo', 886),
(192, 'Urbanizacion el cortijo', 886),
(193, 'Urbanizacion el jubileo', 886),
(194, 'Urbanizacion el palmar', 886),
(195, 'Urbanizacion el parque', 886),
(196, 'Urbanizacion el refugio', 886),
(197, 'Urbanizacion el remanso', 886),
(198, 'Urbanizacion el sinai', 886),
(199, 'Urbanizacion francisco jose de caldas', 886),
(200, 'Urbanizacion genesis', 886),
(201, 'Urbanizacion guaduales de la villa', 886),
(202, 'Urbanizacion guaduales del eden', 886),
(203, 'Urbanizacion la alhambra', 886),
(204, 'Urbanizacion la arcadia', 886),
(205, 'Urbanizacion la castilla', 886),
(206, 'Urbanizacion la cecilia', 886),
(207, 'Urbanizacion la cristalina', 886),
(208, 'Urbanizacion la divisa', 886),
(209, 'Urbanizacion la esmeralda', 886),
(210, 'Urbanizacion la gran bretana', 886),
(211, 'Urbanizacion la grecia', 886),
(212, 'Urbanizacion la irlanda', 886),
(213, 'Urbanizacion la linda', 886),
(214, 'Urbanizacion la mariela', 886),
(215, 'Urbanizacion la montana', 886),
(216, 'Urbanizacion la pavona', 886),
(217, 'Urbanizacion la rivera', 886),
(218, 'Urbanizacion las brisas', 886),
(219, 'Urbanizacion las serranias', 886),
(220, 'Urbanizacion lindaraja', 886),
(221, 'Urbanizacion loma verde', 886),
(222, 'Urbanizacion lomas de la union', 886),
(223, 'Urbanizacion los arcades', 886),
(224, 'Urbanizacion los artesanos', 886),
(225, 'Urbanizacion los girasoles', 886),
(226, 'Urbanizacion los kioscos', 886),
(227, 'Urbanizacion los sauces', 886),
(228, 'Urbanizacion luis carlos galan sarmiento', 886),
(229, 'Urbanizacion manantiales', 886),
(230, 'Urbanizacion marbella', 886),
(231, 'Urbanizacion maria cristina', 886),
(232, 'Urbanizacion mercedes del norte', 886),
(233, 'Urbanizacion monteblanco', 886),
(234, 'Urbanizacion montecarlo', 886),
(235, 'Urbanizacion murano', 886),
(236, 'Urbanizacion nuestra senora de la paz', 886),
(237, 'Urbanizacion nuevo amanecer', 886),
(238, 'Urbanizacion nuevo berlin', 886),
(239, 'Urbanizacion nuevo recreo', 886),
(240, 'Urbanizacion nuevo sol', 886),
(241, 'Urbanizacion palmares del recreo', 886),
(242, 'Urbanizacion portal de pinares', 886),
(243, 'Urbanizacion portal del eden', 886),
(244, 'Urbanizacion primero de mayo', 886),
(245, 'Urbanizacion provivienda universal', 886),
(246, 'Urbanizacion quintas de juliana', 886),
(247, 'Urbanizacion quintas de la marina', 886),
(248, 'Urbanizacion quintas de los andes', 886),
(249, 'Urbanizacion rojas pinilla_1', 886),
(250, 'Urbanizacion rojas pinilla_2', 886),
(251, 'Urbanizacion san diego', 886),
(252, 'Urbanizacion san francisco', 886),
(253, 'Urbanizacion santa sofia', 886),
(254, 'Urbanizacion terranova el alba', 886),
(255, 'Urbanizacion tres esquinas', 886),
(256, 'Urbanizacion veracruz', 886),
(257, 'Urbanizacion villa alejandra', 886),
(258, 'Urbanizacion villa angela', 886),
(259, 'Urbanizacion villa angela_cordillera', 886),
(260, 'Urbanizacion villa carolina', 886),
(261, 'Urbanizacion villa claudia', 886),
(262, 'Urbanizacion villa de la vida y el trabajo', 886),
(263, 'Urbanizacion villa del caf?', 886),
(264, 'Urbanizacion villa del carmen', 886),
(265, 'Urbanizacion villa del centenario', 886),
(266, 'Urbanizacion villa hermosa', 886),
(267, 'Urbanizacion villa inglesa', 886),
(268, 'Urbanizacion villa italia', 886),
(269, 'Urbanizacion villa juliana', 886),
(270, 'Urbanizacion villa laura', 886),
(271, 'Urbanizacion villa liliana', 886),
(272, 'Urbanizacion villa marcela', 886),
(273, 'Urbanizacion villa sofia', 886),
(274, 'Urbanizacion villa ximena', 886),
(275, 'Urbanizacion vista hermosa', 886);

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
) ENGINE=InnoDB AUTO_INCREMENT=231 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `cargos`
--

INSERT INTO `cargos` (`idCargo`, `nombreTipoCargo`) VALUES
(1, 'Ajustador de electricista'),
(2, 'Asistente médico'),
(3, 'Avicultor'),
(4, 'Ingeniero catastral'),
(5, 'Ingeniero textil'),
(6, 'Instalador de material aislante e isonorizaci'),
(7, 'Instalador y reparadores de  líneas eléctrica'),
(8, 'Peluquero'),
(9, 'Abogado'),
(10, 'Acarreador de agua'),
(11, 'Acompañante de personas'),
(12, 'Actor'),
(13, 'Administrador de equipos informáticos'),
(14, 'Administrador de redes'),
(15, 'Administrador de sistemas'),
(16, 'Agente de seguros'),
(17, 'Agente de viajes'),
(18, 'Agricultor '),
(19, 'Agrónomo '),
(20, 'Ajustador e instalador en electrónica'),
(21, 'Albañil'),
(22, 'Alfarero'),
(23, 'Analista de gestión y organización '),
(24, 'Analista de infraestructura'),
(25, 'Analista de sistemas'),
(26, 'Analista financiero'),
(27, 'Antropólogo'),
(28, 'Aparejador y espalmador de cables'),
(29, 'Apelambrador'),
(30, 'Arquitecto'),
(31, 'Artesano '),
(32, 'Artista'),
(33, 'Asesor financiero de inversiones'),
(34, 'Asistente odontológico '),
(35, 'Asistente terapeuta'),
(36, 'Astrólogo'),
(37, 'Astrónomo'),
(38, 'Atleta'),
(39, 'Auditor contable'),
(40, 'Auditor de calidad.'),
(41, 'Auditores financieros'),
(42, 'Auxiliar contable'),
(43, 'Auxiliar de maestro'),
(44, 'Auxiliar de nómina'),
(45, 'Auxiliar de seguros'),
(46, 'Auxiliar de servicios estadísticos'),
(47, 'Auxiliar financiero '),
(48, 'Auxiliar laico'),
(49, 'Avicultor'),
(50, 'Ayudante de cocina'),
(51, 'Ayudante de elaboración de alimentos y bebida'),
(52, 'Bailarines'),
(53, 'Bárman'),
(54, 'Barnizador y afin'),
(55, 'Barrendero y afin'),
(56, 'Biólogo'),
(57, 'Bisutero'),
(58, 'Bombero'),
(59, 'Botánico'),
(60, 'Buzo'),
(61, 'Cajero'),
(62, 'Camarógrafo'),
(63, 'Cantante'),
(64, 'Carnicero'),
(65, 'Carpintero'),
(66, 'Carpinteros'),
(67, 'Cartógrafo'),
(68, 'Catador'),
(69, 'Cazador'),
(70, 'Ceramista'),
(71, 'Cestero mimbreras'),
(72, 'Chapista calderero'),
(73, 'Chef de cocina'),
(74, 'Clasificador de desechos'),
(75, 'Cobrador'),
(76, 'Cocinero'),
(77, 'Codificador de datos'),
(78, 'Comercialnte al por menor'),
(79, 'Comerciante al por mayor'),
(80, 'Compositor'),
(81, 'Conductor'),
(82, 'Constructor'),
(83, 'Consultor de tecnología'),
(84, 'Contadores'),
(85, 'Controlador de tráfico aéreo'),
(86, 'Coreógrafo'),
(87, 'Cortador de tela cuero y afines'),
(88, 'Costurero'),
(89, 'Criador de ganado'),
(90, 'Cristalera'),
(91, 'Cuidador de animales domésticos'),
(92, 'Cuidador de niños'),
(93, 'Decorador'),
(94, 'Deportista'),
(95, 'Desarrollador de software'),
(96, 'Detective privado'),
(97, 'Dibujante técnico'),
(98, 'Director de cine teatro y afines'),
(99, 'Diseñador gráfico y multimedia'),
(100, 'Diseñador y administrador de bases de datos'),
(101, 'Diseñador y decorador de interiores'),
(102, 'Docente'),
(103, 'Docente Universitario'),
(104, 'Ebanista'),
(105, 'Electricista de obra'),
(106, 'Empacador manual'),
(107, 'Encuadernador'),
(108, 'Entrevistador'),
(109, 'Epidemiólogo'),
(110, 'Escolta'),
(111, 'Escritor'),
(112, 'Escultor'),
(113, 'Especialista en métodos pedagógicos'),
(114, 'Especialista en tratamientos de belleza y afi'),
(115, 'Estadístico'),
(116, 'Evaluador de bienes raíces'),
(117, 'Fabricante de instrumentos musicales'),
(118, 'Fabricante de lácteos'),
(119, 'Farmacéutico'),
(120, 'Filósofo'),
(121, 'Físico'),
(122, 'Fisioterapeuta'),
(123, 'Fonoaudiólogo'),
(124, 'Fontanero'),
(125, 'Fotografo'),
(126, 'Fumigador'),
(127, 'Geólogo'),
(128, 'Grabador de datos'),
(129, 'Guardafrenos'),
(130, 'Guia de museos'),
(131, 'Guía de turismo'),
(132, 'Herrero'),
(133, 'Impresor'),
(134, 'Ingeniero aeronáutico'),
(135, 'Ingeniero automotriz'),
(136, 'Ingeniero civiles.'),
(137, 'Ingeniero de energía nuclear'),
(138, 'Ingeniero de minas'),
(139, 'ingeniero de salvamento marítimo'),
(140, 'Ingeniero de seguridad.'),
(141, 'Ingeniero de telecomunicaciones'),
(142, 'Ingeniero de tráfico'),
(143, 'Ingeniero electricistas'),
(144, 'Ingeniero eléctrico'),
(145, 'Ingeniero industriales'),
(146, 'Ingeniero marino'),
(147, 'Ingeniero Mecánico'),
(148, 'Ingeniero medio ambiental'),
(149, 'Ingeniero químico'),
(150, 'Ingenieros electrónicos'),
(151, 'Inspector de seguridad'),
(152, 'Instructor'),
(153, 'Instructor de conducción'),
(154, 'Instructor de educación física'),
(155, 'Instructor de tecnologías de la información'),
(156, 'Joyero'),
(157, 'Labrante'),
(158, 'Lavador de autos'),
(159, 'Lavandero'),
(160, 'Limpiador de fachadas'),
(161, 'Limpiador de ventanas'),
(162, 'Locutor'),
(163, 'Maquinista de locomotoras'),
(164, 'Maquinista en navegación'),
(165, 'Mecánico'),
(166, 'Médico'),
(167, 'Medico alternativo'),
(168, 'Mensajeros'),
(169, 'Mesero'),
(170, 'Meteorólogo'),
(171, 'Modelo de modas'),
(172, 'Moldeador y machero'),
(173, 'Montador de estructuras metálicas'),
(174, 'Músico'),
(175, 'Nutricionista'),
(176, 'Odontólogo'),
(177, 'Oficial de la construcción'),
(178, 'Oficios varios'),
(179, 'Operador audiométrico'),
(180, 'Operador de instalaciones de refinación de pe'),
(181, 'Operador de máquinas'),
(182, 'Operador de montacargas'),
(183, 'Operador turístico'),
(184, 'Operario de limpieza'),
(185, 'Optómetra'),
(186, 'Orfebre'),
(187, 'Organizador de conferencias y eventos'),
(188, 'Panadero'),
(189, 'Parrillero'),
(190, 'Periodistas'),
(191, 'Personal de servicios de protección'),
(192, 'Personal de servicios funerarios'),
(193, 'Pescador'),
(194, 'Piloto'),
(195, 'Pintor'),
(196, 'Profesional de gestión y de talento humano'),
(197, 'Profesional de la protección medio ambiental'),
(198, 'Psicólogo'),
(199, 'Publicista'),
(200, 'Químico'),
(201, 'Radiólogo oral'),
(202, 'Recolector de basura'),
(203, 'Relacionista publico'),
(204, 'Reparador'),
(205, 'Revisor fiscal '),
(206, 'Revocador'),
(207, 'Sastre'),
(208, 'Silvicultor'),
(209, 'Socilogo'),
(210, 'Soldador'),
(211, 'Sombrerero'),
(212, 'Supervisor'),
(213, 'Surtidor'),
(214, 'Tapicero'),
(215, 'Tejedor'),
(216, 'Telefonista'),
(217, 'Terapeuta'),
(218, 'Topógrafo'),
(219, 'Trabajador de cuidados personales a domicilio'),
(220, 'Trabajador de cultivos'),
(221, 'Trabajador de jardinería y horticultura'),
(222, 'Trabajador de servicios de transporte'),
(223, 'Trabajador forestal'),
(224, 'Trabajador pecuario'),
(225, 'Trabajador Social'),
(226, 'Vendedor'),
(227, 'Veterinarios'),
(228, 'Zapatero'),
(229, 'Zoólogo '),
(230, 'Zootecnista');

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`idCliente`, `numeroIdentificacion`, `primerNombreCliente`, `segundoNombreCliente`, `primerApellidoCliente`, `segundoApellidoCliente`, `direccionCliente`, `telefonoFijoCliente`, `telefonoMovilCliente`, `correoCliente`, `fechaNacimiento`, `ciudadResidencia_idciudad`, `tipoIdentificacion_idtipoIdentificacion`, `ciudadExpedicion_idciudad`, `profesiones_idprofesion`, `tipoPersonaCliente_idtipoPersonCliente`, `idEstadoCivil`, `idGenero`) VALUES
(1, 2131321, 'sads', 'sdass', 'sasas', 'dsadas', 'dsadsaas', '32312', '213213', 'sdasd@jdjd.com', '2018-07-03', 226, 1, 1, 415, 1, 9, 4);

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
  `arrendatarios_idarrendatario` int(11) NOT NULL,
  PRIMARY KEY (`numeroIdentificacionConyugue`),
  KEY `fk_conyugues_arrendatarios1_idx` (`arrendatarios_idarrendatario`)
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
-- Estructura de tabla para la tabla `detallearrendatariotipoarrendatario`
--

DROP TABLE IF EXISTS `detallearrendatariotipoarrendatario`;
CREATE TABLE IF NOT EXISTS `detallearrendatariotipoarrendatario` (
  `iddetalleArrendatarioTipoArrendatario` int(11) NOT NULL,
  `idtipoLaborArrendatario` int(11) NOT NULL,
  `idarrendatario` int(11) NOT NULL,
  PRIMARY KEY (`iddetalleArrendatarioTipoArrendatario`),
  KEY `fk_detalleArrendatarioTipoArrendatario_tipoLaborArrendatari_idx` (`idtipoLaborArrendatario`),
  KEY `fk_detalleArrendatarioTipoArrendatario_arrendatarios1_idx` (`idarrendatario`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `detalleclientestipoclientes`
--

INSERT INTO `detalleclientestipoclientes` (`iddetalleClientesTipoClientes`, `tiposClientes_idtipoCliente`, `clientes_cedulaCliente`) VALUES
(1, 1, 1);

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
  PRIMARY KEY (`iddetalleEventoEmpleado`),
  KEY `fk_detalleEventosEmpleados_empleados1_idx` (`empleados_idempleado`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
  PRIMARY KEY (`idempleado`),
  KEY `fk_empleados_tiposEmpleados1_idx` (`idtipoEmpleado`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estadocivil`
--

DROP TABLE IF EXISTS `estadocivil`;
CREATE TABLE IF NOT EXISTS `estadocivil` (
  `idEstadoCivil` int(11) NOT NULL AUTO_INCREMENT,
  `nombreEstadoCivil` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`idEstadoCivil`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `estadocivil`
--

INSERT INTO `estadocivil` (`idEstadoCivil`, `nombreEstadoCivil`) VALUES
(8, 'Soltero'),
(9, 'Casado'),
(10, 'Viudo'),
(11, 'Separado'),
(12, 'Divorciado'),
(13, 'Unión marital de hec'),
(14, 'Comprometido');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estados`
--

DROP TABLE IF EXISTS `estados`;
CREATE TABLE IF NOT EXISTS `estados` (
  `idestado` int(11) NOT NULL AUTO_INCREMENT,
  `nombreEstado` varchar(45) NOT NULL,
  PRIMARY KEY (`idestado`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `estados`
--

INSERT INTO `estados` (`idestado`, `nombreEstado`) VALUES
(1, 'Registrado'),
(2, 'Publicado'),
(3, 'Arrendado'),
(4, 'Vendido');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estratos`
--

DROP TABLE IF EXISTS `estratos`;
CREATE TABLE IF NOT EXISTS `estratos` (
  `idestrato` int(11) NOT NULL AUTO_INCREMENT,
  `nombreEstrato` varchar(1) NOT NULL,
  PRIMARY KEY (`idestrato`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `estratos`
--

INSERT INTO `estratos` (`idestrato`, `nombreEstrato`) VALUES
(1, '1'),
(2, '2'),
(3, '3'),
(4, '4'),
(5, '5'),
(6, '6');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estructurascocinas`
--

DROP TABLE IF EXISTS `estructurascocinas`;
CREATE TABLE IF NOT EXISTS `estructurascocinas` (
  `idestructuraCocina` int(11) NOT NULL AUTO_INCREMENT,
  `nombreEstructuraCocina` varchar(45) NOT NULL,
  PRIMARY KEY (`idestructuraCocina`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `estructurascocinas`
--

INSERT INTO `estructurascocinas` (`idestructuraCocina`, `nombreEstructuraCocina`) VALUES
(1, 'Abierta'),
(2, 'Cerrada');

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
  `iddetalleEventoEmpleado` int(11) NOT NULL,
  `clientes_cedulaCliente` int(11) NOT NULL,
  `tiposEventos_idtipoEvento` int(11) NOT NULL,
  PRIMARY KEY (`ideventoCliente`),
  KEY `fk_eventosClientes_detalleEventosEmpleados1_idx` (`iddetalleEventoEmpleado`),
  KEY `fk_eventosClientes_clientes1_idx` (`clientes_cedulaCliente`),
  KEY `fk_eventosClientes_tiposEventos1_idx` (`tiposEventos_idtipoEvento`)
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `generos`
--

INSERT INTO `generos` (`idGenero`, `nombreGenero`) VALUES
(3, 'Masculino'),
(4, 'Femenino');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `imagenes`
--

DROP TABLE IF EXISTS `imagenes`;
CREATE TABLE IF NOT EXISTS `imagenes` (
  `idimagen` int(11) NOT NULL AUTO_INCREMENT,
  `rutaImagen` varchar(45) NOT NULL,
  PRIMARY KEY (`idimagen`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
  `chimenea` varchar(45) DEFAULT NULL,
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
  `imagenes_idimagen` int(11) NOT NULL,
  `zonas_idzona` int(11) NOT NULL,
  `tiposVistas_idtipoVista` int(11) NOT NULL,
  `barrios_idbarrio` int(11) NOT NULL,
  `estado_idestado` int(11) NOT NULL,
  `tiposCocinas_idtipoCocina` int(11) NOT NULL,
  `estructurasCocinas_idestructuraCocina` int(11) NOT NULL,
  `videos_idvideo` int(11) NOT NULL,
  `tiposPisos_idtipoPiso` int(11) NOT NULL,
  `clientes_cedulaCliente` int(11) NOT NULL,
  `fechaPublicación` date DEFAULT NULL,
  `fechaRecepcion` date DEFAULT NULL,
  `tiposDestacados_idtipoDestacado` int(11) NOT NULL,
  `linderosInmueble` varchar(200) DEFAULT NULL,
  `matriculaInmobiliaria` varchar(45) DEFAULT NULL,
  `avaluoCatastral` float DEFAULT NULL,
  PRIMARY KEY (`idinmueble`),
  UNIQUE KEY `matriculaInmobiliaria_UNIQUE` (`matriculaInmobiliaria`),
  KEY `fk_inmuebles_ciudades_idx` (`ciudades_idciudad`),
  KEY `fk_inmuebles_estratos1_idx` (`estratos_idestrato`),
  KEY `fk_inmuebles_tiposInmuebles1_idx` (`tiposInmuebles_idtipoInmueble`),
  KEY `fk_inmuebles_tiposOfertas1_idx` (`tiposOfertas_idtipoOferta`),
  KEY `fk_inmuebles_tiposCortinas1_idx` (`tiposCortinas_idtipoCortina`),
  KEY `fk_inmuebles_tiposVigilancias1_idx` (`tiposVigilancias_idtipoVigilancia`),
  KEY `fk_inmuebles_imagenes1_idx` (`imagenes_idimagen`),
  KEY `fk_inmuebles_zonas1_idx` (`zonas_idzona`),
  KEY `fk_inmuebles_tiposVistas1_idx` (`tiposVistas_idtipoVista`),
  KEY `fk_inmuebles_barrios1_idx` (`barrios_idbarrio`),
  KEY `fk_inmuebles_estado1_idx` (`estado_idestado`),
  KEY `fk_inmuebles_tiposCocinas1_idx` (`tiposCocinas_idtipoCocina`),
  KEY `fk_inmuebles_estructurasCocinas1_idx` (`estructurasCocinas_idestructuraCocina`),
  KEY `fk_inmuebles_videos1_idx` (`videos_idvideo`),
  KEY `fk_inmuebles_tiposPisos1_idx` (`tiposPisos_idtipoPiso`),
  KEY `fk_inmuebles_clientes1_idx` (`clientes_cedulaCliente`),
  KEY `fk_inmuebles_tiposDestacados1_idx` (`tiposDestacados_idtipoDestacado`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;

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
(16, 'Profesiones', 'Parameterized/Profession', 1, NULL, 5, '');

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
(85, 6),
(1, 3),
(1, 4),
(1, 6),
(1, 7),
(1, 16),
(1, 9),
(1, 12),
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `nivelprofesion`
--

INSERT INTO `nivelprofesion` (`idnivelProfesion`, `nombreNivelProfesion`) VALUES
(1, 'Ténico'),
(2, 'Tecnológico'),
(3, 'Profesional');

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
) ENGINE=InnoDB AUTO_INCREMENT=842 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `profesiones`
--

INSERT INTO `profesiones` (`idprofesion`, `nombreProfesion`, `nivelProfesion_idnivelProfesion`) VALUES
(1, 'Administración agropecuaria', 1),
(2, 'Administración bancaria y financiera', 1),
(3, 'Administración de comercio exterior', 1),
(4, 'Administración de construcciones', 1),
(5, 'Administración de costos y auditoria', 1),
(6, 'Administración de empresas', 1),
(7, 'Administración de empresas agropecuarias', 1),
(8, 'Administración de la construcción', 1),
(9, 'Administración de obras civiles', 1),
(10, 'Administración de servicio de salud', 1),
(11, 'Administración empresarial e informática', 1),
(12, 'Administración hospitalaria', 1),
(13, 'Administración hotelera', 1),
(14, 'Administración industrial', 1),
(15, 'Administración informática', 1),
(16, 'Administración inmobiliaria', 1),
(17, 'Administración municipal', 1),
(18, 'Administración turística', 1),
(19, 'Administración turística y hotelera', 1),
(20, 'Administración y auditoria de sistemas', 1),
(21, 'Administración y avalúos de finca raíz', 1),
(22, 'Administración y finanzas', 1),
(23, 'Administración y mercadotecnia', 1),
(24, 'Administrativo en contabilidad y finanzas', 1),
(25, 'Administrativo en relaciones industriales', 1),
(26, 'Admón. Bancaria de instituciones financier', 1),
(27, 'Admón. De empresas con énfasis en agroindu', 1),
(28, 'Admón. De empresas de economía solidaria', 1),
(29, 'Admón. De planteles de educa. Básica primar', 1),
(30, 'Agropecuaria', 1),
(31, 'Análisis químico industrial', 1),
(32, 'Análisis y diseño de sistemas de computación', 1),
(33, 'Análisis y programación de computadores', 1),
(34, 'Arquitectura de interiores', 1),
(35, 'Arte grafico y publicitario', 1),
(36, 'Arte publicitario', 1),
(37, 'Arte y decoración', 1),
(38, 'Auxiliar de arquitectura e ingeniería', 1),
(39, 'Balística', 1),
(40, 'Catequesis', 1),
(41, 'Ciencias contables', 1),
(42, 'Ciencias de la computación', 1),
(43, 'Citohistologia', 1),
(44, 'Cocina internacional', 1),
(45, 'Comercio exterior', 1),
(46, 'Comercio internacional', 1),
(47, 'Comercio internacional y legislación aduan', 1),
(48, 'Comercio y negocios internacionales', 1),
(49, 'Computación', 1),
(50, 'Computación y sistemas', 1),
(51, 'Confección, acabados y supervisión', 1),
(52, 'Construcción y administración de obras civile', 1),
(53, 'Construcciones', 1),
(54, 'Contabilidad', 1),
(55, 'Contabilidad comercial', 1),
(56, 'Contabilidad sistematizada', 1),
(57, 'Contabilidad y costos', 1),
(58, 'Contabilidad y finanzas', 1),
(59, 'Contaduría', 1),
(60, 'Contaduría técnica', 1),
(61, 'Costos y contabilidad', 1),
(62, 'Dactiloscopia', 1),
(63, 'Decoración de espacios arquitectónicos', 1),
(64, 'Decoración y diseño de interiores', 1),
(65, 'Delineante y auxiliar de ingeniería mecani', 1),
(66, 'Delineantes de arquitectura  e ingeniería', 1),
(67, 'Delineantes de arquitectura y decoración', 1),
(68, 'Deporte y recreación', 1),
(69, 'Dibujo arquitectónico', 1),
(70, 'Dibujo arquitectónico y de ingeniería', 1),
(71, 'Dibujo arquitectónico y decoración', 1),
(72, 'Dibujo de ingeniería mecánica y arquitectu', 1),
(73, 'Dibujo publicitario', 1),
(74, 'Diseño asistido por computador', 1),
(75, 'Diseño de alta costura', 1),
(76, 'Diseño de ambientes', 1),
(77, 'Diseño de artes graficas', 1),
(78, 'Diseño de interiores', 1),
(79, 'Diseño de maquinas', 1),
(80, 'Diseño de modas', 1),
(81, 'Diseño e industria de la moda', 1),
(82, 'Diseño grafico', 1),
(83, 'Diseño industrial', 1),
(84, 'Diseño mecánico', 1),
(85, 'Diseño publicitario', 1),
(86, 'Diseño textil', 1),
(87, 'Diseño textil y de modas', 1),
(88, 'Diseño y confección de la moda', 1),
(89, 'Diseño y decoración de ambientes', 1),
(90, 'Diseño y decoración de espacios arquitectónic', 1),
(91, 'Diseño y producción de televisión', 1),
(92, 'Documento logia', 1),
(93, 'Educación artística', 1),
(94, 'Educación básica primaria bilingüe', 1),
(95, 'Educación especial', 1),
(96, 'Educación física', 1),
(97, 'Educación física y recreación', 1),
(98, 'Educación preescolar', 1),
(99, 'Electromecánica', 1),
(100, 'Electromedicina', 1),
(101, 'Electrónica', 1),
(102, 'Electrónica industrial', 1),
(103, 'Electrónica y telecomunicaciones', 1),
(104, 'Explosivos', 1),
(105, 'Finanzas y sistemas contables', 1),
(106, 'Fotografía', 1),
(107, 'Fotografía judicial', 1),
(108, 'Fotografía y camarografita', 1),
(109, 'Gestión de pequeñas y medianas empresas', 1),
(110, 'Gestión de servicios gerontológicos', 1),
(111, 'Gestión empresarial', 1),
(112, 'Hotelería', 1),
(113, 'Identificación de automotores', 1),
(114, 'Informática contable y financiera', 1),
(115, 'Informática gerencial', 1),
(116, 'Informática secretarial', 1),
(117, 'Ingeniería agropecuaria', 1),
(118, 'Ingeniería automotriz', 1),
(119, 'Ingeniería comercial', 1),
(120, 'Ingeniería de alimentos', 1),
(121, 'Ingeniería de sistemas', 1),
(122, 'Ingeniería industrial', 1),
(123, 'Ingeniería térmica', 1),
(124, 'Ingeniería textil', 1),
(125, 'Instrumentación quirúrgica', 1),
(126, 'Inteligencia', 1),
(127, 'Laboratorio dental', 1),
(128, 'Laboratorio medico', 1),
(129, 'Logística de producción y distribución', 1),
(130, 'Mantenimiento de computadores', 1),
(131, 'Mantenimiento electrónico', 1),
(132, 'Marketing internacional', 1),
(133, 'Mecánica automotriz', 1),
(134, 'Mercadeo e informática', 1),
(135, 'Mercadeo y comercialización', 1),
(136, 'Mercadeo y ventas', 1),
(137, 'Mercadeo, publicidad y ventas', 1),
(138, 'Mercado y finanzas', 1),
(139, 'Mercadotecnia', 1),
(140, 'Microempresas y cooperativas', 1),
(141, 'Minería', 1),
(142, 'Nuevas tecnologías informáticas', 1),
(143, 'Optometría', 1),
(144, 'Periodismo', 1),
(145, 'Periodismo deportivo', 1),
(146, 'Planimetría', 1),
(147, 'Policía judicial', 1),
(148, 'Procesos industriales', 1),
(149, 'Procesos mecánicos con énfasis producción agr', 1),
(150, 'Producción agropecuaria', 1),
(151, 'Producción de semillas', 1),
(152, 'Producción de televisión', 1),
(153, 'Producción y desarrollo industrial', 1),
(154, 'Programación de computadores', 1),
(155, 'Promoción social', 1),
(156, 'Publicidad', 1),
(157, 'Publicidad y diseño', 1),
(158, 'Publicidad y diseño publicitario', 1),
(159, 'Radiología medica', 1),
(160, 'Realización de video', 1),
(161, 'Recreación dirigida', 1),
(162, 'Recursos energéticos', 1),
(163, 'Relaciones industriales', 1),
(164, 'Relaciones públicas y comunicación', 1),
(165, 'Rendimiento deportivo', 1),
(166, 'Salud ocupacional y seguridad industrial', 1),
(167, 'Salud y rendimiento humano', 1),
(168, 'Secretariado', 1),
(169, 'Secretariado bilingüe', 1),
(170, 'Secretariado bilingüe y de sistemas', 1),
(171, 'Secretariado comercial', 1),
(172, 'Secretariado contable de sistemas', 1),
(173, 'Secretariado ejecutivo', 1),
(174, 'Secretariado ejecutivo bilingüe', 1),
(175, 'Secretariado ejecutivo de sistemas', 1),
(176, 'Secretariado ejecutivo y de sistemas bilingüe', 1),
(177, 'Secretariado gerencial', 1),
(178, 'Seguridad e higiene industrial', 1),
(179, 'Seguridad e higiene ocupacional', 1),
(180, 'Servicios a bordo', 1),
(181, 'Sistemas', 1),
(182, 'Sistemas contables y financieros', 1),
(183, 'Sistemas y análisis de la computación', 1),
(184, 'Sistemas y computación', 1),
(185, 'Sistematización', 1),
(186, 'Técnicas agropecuarias', 1),
(187, 'Técnicas forestales', 1),
(188, 'Técnico de laboratorio', 1),
(189, 'Técnico hotelero', 1),
(190, 'Tecnología de plásticos', 1),
(191, 'Telecomunicaciones', 1),
(192, 'Topografía', 1),
(193, 'Turismo', 1),
(194, 'Agrícola', 2),
(195, 'Agroindustrial', 2),
(196, 'Agropecuaria', 2),
(197, 'Bilingüe en administración de empresas', 2),
(198, 'Bilingüe en comercio exterior', 2),
(199, 'De alimentos', 2),
(200, 'Deportiva', 2),
(201, 'Eléctrica', 2),
(202, 'Electrónica', 2),
(203, 'Empresarial', 2),
(204, 'Empresarial y de negocios', 2),
(205, 'Acuicultura', 2),
(206, 'Administración aeronáutica', 2),
(207, 'Administración agropecuaria', 2),
(208, 'Administración bancaria', 2),
(209, 'Administración comercial', 2),
(210, 'Administración comercial y financiera', 2),
(211, 'Administración de empresas', 2),
(212, 'Administración de empresas turísticas', 2),
(213, 'Administración de la producción', 2),
(214, 'Administración de la producción industrial', 2),
(215, 'Administración de negocios', 2),
(216, 'Administración de obras civiles', 2),
(217, 'Administración de oficinas', 2),
(218, 'Administración de oficinas bilingües', 2),
(219, 'Administración de personal', 2),
(220, 'Administración de redes de computadores', 2),
(221, 'Administración de redes de datos', 2),
(222, 'Administración de riesgos y seguros', 2),
(223, 'Administración de seguros', 2),
(224, 'Administración de servicios de salud', 2),
(225, 'Administración de sistemas', 2),
(226, 'Administración de sistemas de información', 2),
(227, 'Administración de ventas', 2),
(228, 'Administración del transporte', 2),
(229, 'Administración del turismo social', 2),
(230, 'Administración deportivas', 2),
(231, 'Administración documental', 2),
(232, 'Administración financiera', 2),
(233, 'Administración hospitalaria', 2),
(234, 'Administración hotelera', 2),
(235, 'Administración industrial', 2),
(236, 'Administración informática', 2),
(237, 'Administración judicial', 2),
(238, 'Administración municipal', 2),
(239, 'Administración naviera y portuaria', 2),
(240, 'Administración tributaria', 2),
(241, 'Administración turística', 2),
(242, 'Administración y finanzas', 2),
(243, 'Admón. De aerolíneas y agencias de viaje', 2),
(244, 'Admón. De empresas de economía solidaria', 2),
(245, 'Admón. De negocios internacionales', 2),
(246, 'Alimentos', 2),
(247, 'Análisis y diseño de sistemas', 2),
(248, 'Análisis y programación de computadores', 2),
(249, 'Arte y decoración arquitectónica', 2),
(250, 'Auditoria y control interno', 2),
(251, 'Auditoria y costos', 2),
(252, 'Automatización industrial', 2),
(253, 'Banca e instituciones financieras', 2),
(254, 'Café y diversificación', 2),
(255, 'Cerámica', 2),
(256, 'Cine y fotografía', 2),
(257, 'Citohistologia', 2),
(258, 'Comercio exterior', 2),
(259, 'Comercio internacional', 2),
(260, 'Computación', 2),
(261, 'Computación grafica', 2),
(262, 'Comunicación publicitaria', 2),
(263, 'Comunicaciones aeronáuticas', 2),
(264, 'Conmutación', 2),
(265, 'Construcción', 2),
(266, 'Construcción de obras civiles', 2),
(267, 'Contabilidad', 2),
(268, 'Contabilidad sistematizada', 2),
(269, 'Contaduría', 2),
(270, 'Contaduría publica', 2),
(271, 'Control de calidad', 2),
(272, 'Criminalística', 2),
(273, 'Desarrollo del software', 2),
(274, 'Dibujo arquitectónico de ingeniería', 2),
(275, 'Dibujo industrial', 2),
(276, 'Dirección de ventas', 2),
(277, 'Dirección y producción de televisión', 2),
(278, 'Diseño de interiores', 2),
(279, 'Diseño de modas', 2),
(280, 'Diseño grafico', 2),
(281, 'Diseño industrial', 2),
(282, 'Diseño textil', 2),
(283, 'Diseño y decoración de espacios arqu', 2),
(284, 'Docencia rural', 2),
(285, 'Educación básica primaria', 2),
(286, 'Educación especial', 2),
(287, 'Educación física', 2),
(288, 'Educación para el desarrollo de la c', 2),
(289, 'Educación preescolar', 2),
(290, 'Electricidad', 2),
(291, 'Electricidad industrial', 2),
(292, 'Electrificación y telefonía rural', 2),
(293, 'Electromecánica', 2),
(294, 'Electrónica aeronáutica', 2),
(295, 'Electrónica y automatización industr', 2),
(296, 'Electrónica y comunicaciones', 2),
(297, 'Electrónica y telecomunicaciones', 2),
(298, 'Electroquímica', 2),
(299, 'Empresas turísticas y hoteleras', 2),
(300, 'Estadística e informática', 2),
(301, 'Estudios policiales', 2),
(302, 'Finanzas y comercio internacional', 2),
(303, 'Finanzas y sistemas contables', 2),
(304, 'Fisioterapia', 2),
(305, 'Gerontología', 2),
(306, 'Gestión agropecuaria', 2),
(307, 'Gestión bancaria y financiera', 2),
(308, 'Gestión comercial y de negocios', 2),
(309, 'Gestión de empresas asoc. Y organiz.', 2),
(310, 'Gestión de obras civiles y construci', 2),
(311, 'Gestión de servicios públicos sanita', 2),
(312, 'Gestión de transportes', 2),
(313, 'Gestión empresarial', 2),
(314, 'Gestión empresarial y de negocios', 2),
(315, 'Gestión industrial', 2),
(316, 'Gestión informática', 2),
(317, 'Gestión y administración de empresas', 2),
(318, 'Higiene y seguridad industrial', 2),
(319, 'Informática', 2),
(320, 'Instrumentación industrial', 2),
(321, 'Instrumentación quirúrgica', 2),
(322, 'Instrumentación y controles industria', 2),
(323, 'Investigación judicial', 2),
(324, 'Laboratorio de prótesis dental', 2),
(325, 'Laboratorio de rehabilitación dental', 2),
(326, 'Laboratorio dental', 2),
(327, 'Lácteos', 2),
(328, 'Logística de producción distribución', 2),
(329, 'Maderas', 2),
(330, 'Mantenimiento aeronáutico', 2),
(331, 'Mecánica automotriz', 2),
(332, 'Medicina veterinaria y zootecnia', 2),
(333, 'Mercadeo agropecuario', 2),
(334, 'Mercadeo y comercialización', 2),
(335, 'Mercadeo y finanzas', 2),
(336, 'Mercadeo y negocios internacionales', 2),
(337, 'Mercadeo y publicidad', 2),
(338, 'Mercadeo y ventas', 2),
(339, 'Mercadotecnia', 2),
(340, 'Mercadotecnia y publicidad', 2),
(341, 'Mercadotecnia y ventas', 2),
(342, 'Minas', 2),
(343, 'Minería', 2),
(344, 'Negocios internacionales', 2),
(345, 'Obras civiles', 2),
(346, 'Periodismo', 2),
(347, 'Plásticos', 2),
(348, 'Producción agraria', 2),
(349, 'Producción agrícola', 2),
(350, 'Producción agropecuaria', 2),
(351, 'Producción animal', 2),
(352, 'Producción industrial', 2),
(353, 'Promoción social', 2),
(354, 'Publicidad', 2),
(355, 'Publicidad y comercialización', 2),
(356, 'Publicidad y comunicación', 2),
(357, 'Publicidad y mercadeo', 2),
(358, 'Química de productos vegetales', 2),
(359, 'Química industrial', 2),
(360, 'Radiología e imágenes', 2),
(361, 'Recreación dirigida', 2),
(362, 'Recursos hídricos', 2),
(363, 'Recursos naturales renovables', 2),
(364, 'Redes y comunicaciones de datos', 2),
(365, 'Regencia de farmacia', 2),
(366, 'Relaciones industriales', 2),
(367, 'Salud comunitaria', 2),
(368, 'Salud ocupacional', 2),
(369, 'Saneamiento ambiental', 2),
(370, 'Secretariado bilingüe', 2),
(371, 'Secretariado bilingüe y computación', 2),
(372, 'Secretariado comercial bilingüe', 2),
(373, 'Secretariado ejecutivo', 2),
(374, 'Secretariado ejecutivo bilingüe', 2),
(375, 'Secretariado ejecutivo bilingüe espa', 2),
(376, 'Secretariado ejecutivo con énfasis e', 2),
(377, 'Seguridad aeronáutica', 2),
(378, 'Seguridad e higiene ocupacional', 2),
(379, 'Sistemas', 2),
(380, 'Sistemas contables', 2),
(381, 'Sistemas de información', 2),
(382, 'Sistemas de información en salud', 2),
(383, 'Sistemas industriales', 2),
(384, 'Sistemas y computación', 2),
(385, 'Sistematización de datos', 2),
(386, 'Supervisión de industria y comercio', 2),
(387, 'Terapia del lenguaje', 2),
(388, 'Terapia recreativa', 2),
(389, 'Terapia respiratoria', 2),
(390, 'Textiles y moda', 2),
(391, 'Topografía', 2),
(392, 'Traducción turística', 2),
(393, 'Tributación', 2),
(394, 'Turismo recreativo', 2),
(395, 'Turismo y relaciones industriales', 2),
(396, 'Zootecnia', 2),
(397, 'Forestal', 2),
(398, 'Industrial', 2),
(399, 'Mecánica', 2),
(400, 'Naval en electromecánica', 2),
(401, 'Naval en electrónica', 2),
(402, 'Naviera', 2),
(403, 'Pecuaria', 2),
(404, 'Química', 2),
(405, 'Textil', 2),
(406, 'Abogado', 3),
(407, 'Administración', 3),
(408, 'Administración aeronáutica', 3),
(409, 'Administración agroindustrial', 3),
(410, 'Administración agropecuaria', 3),
(411, 'Administración de comercio exterior', 3),
(412, 'Administración de desarrollo agroindustrial', 3),
(413, 'Administración de empresas', 3),
(414, 'Administración de empresas agrarias', 3),
(415, 'Administración de empresas agroindustriales', 3),
(416, 'Administración de empresas agropecuarias', 3),
(417, 'Administración de empresas cooperativas', 3),
(418, 'Administración de empresas turísticas', 3),
(419, 'Administración de empresas turísticas y hotel', 3),
(420, 'Administración de instituciones de servicio', 3),
(421, 'Administración de mercadeo agropecuario', 3),
(422, 'Administración de negocios', 3),
(423, 'Administración de negocios con énfasis en fin', 3),
(424, 'Administración de obras civiles', 3),
(425, 'Administración de recursos costeros y marinos', 3),
(426, 'Administración de sistemas de información', 3),
(427, 'Administración del desarrollo social', 3),
(428, 'Administración del medio ambiente', 3),
(429, 'Administración empresarial y publica', 3),
(430, 'Administración en recursos humanos', 3),
(431, 'Administración financiera', 3),
(432, 'Administración financiera y de sistemas', 3),
(433, 'Administración hotelera', 3),
(434, 'Administración hotelera y de turismo', 3),
(435, 'Administración industrial', 3),
(436, 'Administración informática', 3),
(437, 'Administración marítima', 3),
(438, 'Administración para el desarrollo regional', 3),
(439, 'Administración policial', 3),
(440, 'Administración regional y urbana', 3),
(441, 'Administración turística y hotelera', 3),
(442, 'Administración y finanzas', 3),
(443, 'Admon. Empresas nefas. Desarrollo de la capac', 3),
(444, 'Agrología', 3),
(445, 'Agronomía', 3),
(446, 'Anatomopatologo', 3),
(447, 'Antropología', 3),
(448, 'Arquitectura', 3),
(449, 'Arquitectura de interiores', 3),
(450, 'Arquitectura y urbanismo', 3),
(451, 'Artes escénicas', 3),
(452, 'Artes musicales', 3),
(453, 'Artes plásticas', 3),
(454, 'Artes representativas', 3),
(455, 'Bachiller académico', 3),
(456, 'Bacteriología', 3),
(457, 'Bacteriología y laboratorio clínico', 3),
(458, 'Bellas artes', 3),
(459, 'Bibliotecología', 3),
(460, 'Bibliotecología y archivística', 3),
(461, 'Biología con énfasis en biotecnología', 3),
(462, 'Biología con énfasis en recursos naturales', 3),
(463, 'Biología marina', 3),
(464, 'Biología y química', 3),
(465, 'Biólogo', 3),
(466, 'Castellano - literatura', 3),
(467, 'Ciencia política', 3),
(468, 'Ciencias de enfermería y biología', 3),
(469, 'Ciencias de la comercialización', 3),
(470, 'Ciencias de la información y la documentación', 3),
(471, 'Ciencias del deporte', 3),
(472, 'Ciencias políticas', 3),
(473, 'Ciencias políticas y administrativas', 3),
(474, 'Cine y televisión', 3),
(475, 'Comercio exterior', 3),
(476, 'Comercio internacional', 3),
(477, 'Comunicación social', 3),
(478, 'Comunicación social énfasis en producción y a', 3),
(479, 'Comunicación social formación básica en perio', 3),
(480, 'Comunicación social institucional', 3),
(481, 'Comunicación social- periodismo', 3),
(482, 'Conservación y restauración de bienes muebles', 3),
(483, 'Construcción', 3),
(484, 'Contaduría publica', 3),
(485, 'Contaduría pública- énfasis en sistemas y eco', 3),
(486, 'Criminalística', 3),
(487, 'Cultura física y deporte', 3),
(488, 'Deporte y recreación', 3),
(489, 'Derecho', 3),
(490, 'Derecho ciencias políticas y sociales', 3),
(491, 'Derecho y ciencias administrativas', 3),
(492, 'Derecho y ciencias políticas', 3),
(493, 'Derecho y ciencias sociales', 3),
(494, 'Desarrollo familiar', 3),
(495, 'Dibujo arquitectónico', 3),
(496, 'Dirección musical', 3),
(497, 'Dirección y producción de radio y televisión', 3),
(498, 'Diseño de modas y textiles', 3),
(499, 'Diseño grafico', 3),
(500, 'Diseño industrial', 3),
(501, 'Diseño visual', 3),
(502, 'Ecología', 3),
(503, 'Economía', 3),
(504, 'Economía agraria', 3),
(505, 'Economía agrícola', 3),
(506, 'Economía de empresas', 3),
(507, 'Economía general', 3),
(508, 'Economía industrial', 3),
(509, 'Economía y desarrollo', 3),
(510, 'Educación musical', 3),
(511, 'Ejecución instrumental', 3),
(512, 'Enfermería', 3),
(513, 'Enfermería comunitaria', 3),
(514, 'Estadística', 3),
(515, 'Estadística administrativa', 3),
(516, 'Estadística e informática', 3),
(517, 'Estudios diplomáticos en internacionales', 3),
(518, 'Estudios en ciencia política', 3),
(519, 'Estudios musicales', 3),
(520, 'Estudios superiores en instrumento o canto', 3),
(521, 'Farmacia', 3),
(522, 'Filología e idiomas - alemán', 3),
(523, 'Filología e idiomas - español', 3),
(524, 'Filología e idiomas - francés', 3),
(525, 'Filología e idiomas - humanidades', 3),
(526, 'Filología e idiomas - ingles', 3),
(527, 'Filología espa? Ola', 3),
(528, 'Filosofía', 3),
(529, 'Filosofía y humanidades', 3),
(530, 'Filosofía y letras', 3),
(531, 'Finanzas y comercio exterior', 3),
(532, 'Finanzas y comercio internacional', 3),
(533, 'Finanzas y negocios internacionales', 3),
(534, 'Finanzas y relaciones internacionales', 3),
(535, 'Física', 3),
(536, 'Fisioterapia', 3),
(537, 'Fonoaudiología', 3),
(538, 'Geografía', 3),
(539, 'Geología', 3),
(540, 'Gerontología', 3),
(541, 'Gestión empresarial', 3),
(542, 'Guitarrista', 3),
(543, 'Historia', 3),
(544, 'Idiomas', 3),
(545, 'Industrias pecuarias', 3),
(546, 'Ingeniería administrativa', 3),
(547, 'Ingeniería agrícola', 3),
(548, 'Ingeniería agroindustrial', 3),
(549, 'Ingeniería agronómica', 3),
(550, 'Ingeniería ambiental', 3),
(551, 'Ingeniería ambiental y sanitaria', 3),
(552, 'Ingeniería biomédica', 3),
(553, 'Ingeniería catastral y geodesia', 3),
(554, 'Ingeniería civil', 3),
(555, 'Ingeniería de alimentos', 3),
(556, 'Ingeniería de diseño y automatización electró', 3),
(557, 'Ingeniería de materiales', 3),
(558, 'Ingeniería de mercados', 3),
(559, 'Ingeniería de minas', 3),
(560, 'Ingeniería de minas y metalurgia', 3),
(561, 'Ingeniería de petróleos', 3),
(562, 'Ingeniería de procesos', 3),
(563, 'Ingeniería de producción', 3),
(564, 'Ingeniería de producción agroindustrial', 3),
(565, 'Ingeniería de recursos naturales y medio ambi', 3),
(566, 'Ingeniería de sistemas', 3),
(567, 'Ingeniería de sistemas con énfasis en admón. ', 3),
(568, 'Ingeniería de sistemas con énfasis en softwar', 3),
(569, 'Ingeniería de sistemas con énfasis en tele co', 3),
(570, 'Ingeniería de sistemas de información', 3),
(571, 'Ingeniería de sistemas y computación', 3),
(572, 'Ingeniería de sistemas: énfasis en administra', 3),
(573, 'Ingeniería de transporte y vías', 3),
(574, 'Ingeniería del desarrollo ambiental', 3),
(575, 'Ingeniería del medio ambiente', 3),
(576, 'Ingeniería eléctrica', 3),
(577, 'Ingeniería electricista', 3),
(578, 'Ingeniería electromecánica', 3),
(579, 'Ingeniería electrónica', 3),
(580, 'Ingeniería electrónica y de computadores', 3),
(581, 'Ingeniería electrónica y telecomunicaciones', 3),
(582, 'Ingeniería en automatización industrial', 3),
(583, 'Ingeniería en instrumentación y control', 3),
(584, 'Ingeniería energética', 3),
(585, 'Ingeniería financiera', 3),
(586, 'Ingeniería forestal', 3),
(587, 'Ingeniería geográfica', 3),
(588, 'Ingeniería geológica', 3),
(589, 'Ingeniería industrial', 3),
(590, 'Ingeniería industrial de alimentos', 3),
(591, 'Ingeniería mecánica', 3),
(592, 'Ingeniería metalúrgica', 3),
(593, 'Ingeniería naval - especialidad construccione', 3),
(594, 'Ingeniería naval - especialidad electrónica', 3),
(595, 'Ingeniería naval - especialidad mecánica', 3),
(596, 'Ingeniería pesquera', 3),
(597, 'Ingeniería química', 3),
(598, 'Ingeniería sanitaria', 3),
(599, 'Ingeniería telemática', 3),
(600, 'Ingeniería textil', 3),
(601, 'Instrumentación quirúrgica', 3),
(602, 'Lenguas clásicas', 3),
(603, 'Lic.  Educ. Especial- problemas del aprendiz.', 3),
(604, 'Lic. Educ. Especial: problemas desarrollo y a', 3),
(605, 'Lic. En ciencias religiosas énfasis catequesi', 3),
(606, 'Lic. En ciencias sociales: gestión del desarr', 3),
(607, 'Lic. En educación básica primaria:enf. En cie', 3),
(608, 'Licenciatura educación preescolar y promoción', 3),
(609, 'Licenciatura educación primaria y promoción d', 3),
(610, 'Licenciatura en administración educativa', 3),
(611, 'Licenciatura en administración y supervisión ', 3),
(612, 'Licenciatura en agropecuarias', 3),
(613, 'Licenciatura en arte dramático', 3),
(614, 'Licenciatura en arte escénico', 3),
(615, 'Licenciatura en artes graficas', 3),
(616, 'Licenciatura en artes plásticas', 3),
(617, 'Licenciatura en artes visuales', 3),
(618, 'Licenciatura en bacteriología y ciencias natu', 3),
(619, 'Licenciatura en básica primaria con énfasis e', 3),
(620, 'Licenciatura en bellas artes', 3),
(621, 'Licenciatura en biología', 3),
(622, 'Licenciatura en biología y educación ambienta', 3),
(623, 'Licenciatura en biología y química', 3),
(624, 'Licenciatura en catequesis', 3),
(625, 'Licenciatura en ciencias agropecuarias', 3),
(626, 'Licenciatura en ciencias de la educación', 3),
(627, 'Licenciatura en ciencias de la educación filo', 3),
(628, 'Licenciatura en ciencias de la educación filo', 3),
(629, 'Licenciatura en ciencias de la educación físi', 3),
(630, 'Licenciatura en ciencias de la educación mate', 3),
(631, 'Licenciatura en ciencias de la educación quím', 3),
(632, 'Licenciatura en ciencias físicas', 3),
(633, 'Licenciatura en ciencias naturales', 3),
(634, 'Licenciatura en ciencias pedagógicas', 3),
(635, 'Licenciatura en ciencias políticas y administ', 3),
(636, 'Licenciatura en ciencias religiosa y éticas', 3),
(637, 'Licenciatura en ciencias religiosas', 3),
(638, 'Licenciatura en ciencias sociales', 3),
(639, 'Licenciatura en ciencias sociales e historia', 3),
(640, 'Licenciatura en ciencias sociales y construcc', 3),
(641, 'Licenciatura en ciencias sociales y económica', 3),
(642, 'Licenciatura en ciencias sociales y geografía', 3),
(643, 'Licenciatura en comercio', 3),
(644, 'Licenciatura en comercio y contaduría', 3),
(645, 'Licenciatura en danzas y teatro', 3),
(646, 'Licenciatura en decoración arquitectónico', 3),
(647, 'Licenciatura en dibujo de la construcción', 3),
(648, 'Licenciatura en dibujo mecánico', 3),
(649, 'Licenciatura en didáctica y dificultades del ', 3),
(650, 'Licenciatura en docencia comercial', 3),
(651, 'Licenciatura en docencia de computadores', 3),
(652, 'Licenciatura en docencia de procesos industri', 3),
(653, 'Licenciatura en docencia de sistemas y comput', 3),
(654, 'Licenciatura en docencia del área agropecuari', 3),
(655, 'Licenciatura en docencia del diseño', 3),
(656, 'Licenciatura en economía del hogar', 3),
(657, 'Licenciatura en educa. Con especialidad en es', 3),
(658, 'Licenciatura en educa. Esp. Audiov. Y psicope', 3),
(659, 'Licenciatura en educa. Esp. Filosofía y letra', 3),
(660, 'Licenciatura en educa. Espe. Tecnología indus', 3),
(661, 'Licenciatura en educa. Mayores ingles y franc', 3),
(662, 'Licenciatura en educación ambiental', 3),
(663, 'Licenciatura en educación básica primaria', 3),
(664, 'Licenciatura en educación- biología', 3),
(665, 'Licenciatura en educación ciencias sociales', 3),
(666, 'Licenciatura en educación de adultos', 3),
(667, 'Licenciatura en educación electrónica', 3),
(668, 'Licenciatura en educación electrotécnica', 3),
(669, 'Licenciatura en educación español y comunicac', 3),
(670, 'Licenciatura en educación español y lenguas', 3),
(671, 'Licenciatura en educación especial', 3),
(672, 'Licenciatura en educación especial- tiflologí', 3),
(673, 'Licenciatura en educación especial: retardo e', 3),
(674, 'Licenciatura en educación especialidad en mat', 3),
(675, 'Licenciatura en educación física', 3),
(676, 'Licenciatura en educación física y deportes', 3),
(677, 'Licenciatura en educación física y recreación', 3),
(678, 'Licenciatura en educación física ysalud', 3),
(679, 'Licenciatura en educación francés', 3),
(680, 'Licenciatura en educación- historia y filosof', 3),
(681, 'Licenciatura en educación idiomas', 3),
(682, 'Licenciatura en educación industrial', 3),
(683, 'Licenciatura en educación infantil', 3),
(684, 'Licenciatura en educación ingles', 3),
(685, 'Licenciatura en educación mecánica industrial', 3),
(686, 'Licenciatura en educación musical', 3),
(687, 'Licenciatura en educación pedagogía musical', 3),
(688, 'Licenciatura en educación preescolar', 3),
(689, 'Licenciatura en educación preescolar y básica', 3),
(690, 'Licenciatura en educación primaria', 3),
(691, 'Licenciatura en educación psicología y pedago', 3),
(692, 'Licenciatura en educación religiosa y moral', 3),
(693, 'Licenciatura en educación rural', 3),
(694, 'Licenciatura en educación teología', 3),
(695, 'Licenciatura en educación y ciencias religios', 3),
(696, 'Licenciatura en electricidad y electrónica', 3),
(697, 'Licenciatura en electromecánica', 3),
(698, 'Licenciatura en electrotecnia', 3),
(699, 'Licenciatura en enseñanza de lenguas extranje', 3),
(700, 'Licenciatura en español y literatura', 3),
(701, 'Licenciatura en estudios bíblicos', 3),
(702, 'Licenciatura en etnoeducacion y desarrollo co', 3),
(703, 'Licenciatura en filología', 3),
(704, 'Licenciatura en filología e idiomas ingles-fr', 3),
(705, 'Licenciatura en filosofía', 3),
(706, 'Licenciatura en filosofía con énfasis en teor', 3),
(707, 'Licenciatura en filosofía e historia', 3),
(708, 'Licenciatura en filosofía e idiomas', 3),
(709, 'Licenciatura en filosofía y ciencias religios', 3),
(710, 'Licenciatura en filosofía y humanidades', 3),
(711, 'Licenciatura en filosofía y letras', 3),
(712, 'Licenciatura en filosofía y teología', 3),
(713, 'Licenciatura en física', 3),
(714, 'Licenciatura en física y matemáticas', 3),
(715, 'Licenciatura en formación estética', 3),
(716, 'Licenciatura en geografía e historia', 3),
(717, 'Licenciatura en historia', 3),
(718, 'Licenciatura en historia de colombia', 3),
(719, 'Licenciatura en historia y filosofía', 3),
(720, 'Licenciatura en historia y filosofía', 3),
(721, 'Licenciatura en idiomas', 3),
(722, 'Licenciatura en idiomas español-ingles', 3),
(723, 'Licenciatura en idiomas modernos español-fran', 3),
(724, 'Licenciatura en idiomas modernos español-ingl', 3),
(725, 'Licenciatura en informática', 3),
(726, 'Licenciatura en informática educativa', 3),
(727, 'Licenciatura en ingles', 3),
(728, 'Licenciatura en ingles y humanidades', 3),
(729, 'Licenciatura en lenguas modernar español y fr', 3),
(730, 'Licenciatura en lenguas modernas', 3),
(731, 'Licenciatura en lenguas modernas español e in', 3),
(732, 'Licenciatura en lenguas modernas español fran', 3),
(733, 'Licenciatura en lenguas modernas español ingl', 3),
(734, 'Licenciatura en lenguas modernas ingles-franc', 3),
(735, 'Licenciatura en lingüística y educación indíg', 3),
(736, 'Licenciatura en lingüística y literatura', 3),
(737, 'Licenciatura en literatura', 3),
(738, 'Licenciatura en literatura y lengua espa? Ola', 3),
(739, 'Licenciatura en matemáticas', 3),
(740, 'Licenciatura en matemáticas y computación', 3),
(741, 'Licenciatura en matemáticas y estadística', 3),
(742, 'Licenciatura en matemáticas y física', 3),
(743, 'Licenciatura en mecánica industrial', 3),
(744, 'Licenciatura en música', 3),
(745, 'Licenciatura en nutrición y dietética', 3),
(746, 'Licenciatura en orientación y consejería', 3),
(747, 'Licenciatura en pedagogía', 3),
(748, 'Licenciatura en pedagogía infantil y familiar', 3),
(749, 'Licenciatura en pedagogía para la salud', 3),
(750, 'Licenciatura en pedagogía reeducativa', 3),
(751, 'Licenciatura en pedagogía social y comunitari', 3),
(752, 'Licenciatura en pedagogía y psicología', 3),
(753, 'Licenciatura en preescolar', 3),
(754, 'Licenciatura en producción agropecuaria', 3),
(755, 'Licenciatura en promoción de  la comunidad', 3),
(756, 'Licenciatura en psicología', 3),
(757, 'Licenciatura en psicología educativa', 3),
(758, 'Licenciatura en psicología y administración e', 3),
(759, 'Licenciatura en psicología y filosofía', 3),
(760, 'Licenciatura en psicopedagogía', 3),
(761, 'Licenciatura en psicopedagogía y filosofía', 3),
(762, 'Licenciatura en química', 3),
(763, 'Licenciatura en química y biología', 3),
(764, 'Licenciatura en sociales', 3),
(765, 'Licenciatura en supervisión educativa', 3),
(766, 'Licenciatura en tecnología educativa', 3),
(767, 'Licenciatura en tecnología industrial', 3),
(768, 'Licenciatura en teología', 3),
(769, 'Lingüística y literatura', 3),
(770, 'Literatura', 3),
(771, 'Maestría en composición musical', 3),
(772, 'Maestro en piano', 3),
(773, 'Manejo agroforestal', 3),
(774, 'Manejo agrologico y de post-cosecha', 3),
(775, 'Matemáticas', 3),
(776, 'Matemáticas y física', 3),
(777, 'Medicina general', 3),
(778, 'Medicina veterinaria', 3),
(779, 'Medicina y cirugía', 3),
(780, 'Medicina y neurocirugía', 3),
(781, 'Medicina y radiología', 3),
(782, 'Mercadeo', 3),
(783, 'Mercadeo con énfasis en negocios internaciona', 3),
(784, 'Mercadeo nacional e internacional', 3),
(785, 'Mercadeo publicidad y ventas', 3),
(786, 'Mercadeo y publicidad', 3),
(787, 'Mercadología', 3),
(788, 'Mercadotecnia', 3),
(789, 'Mercadotecnia agroindustrial', 3),
(790, 'Metalistería', 3),
(791, 'Microbiología', 3),
(792, 'Microbiología agrícola y veterinaria', 3),
(793, 'Microbiología con énfasis en alimentos', 3),
(794, 'Microbiología industrial', 3),
(795, 'Música', 3),
(796, 'Música canto', 3),
(797, 'Música instrumental', 3),
(798, 'Música instrumento', 3),
(799, 'Negocios internacionales', 3),
(800, 'Neurología infantil', 3),
(801, 'Normalista superior', 3),
(802, 'Nutricionista dietista', 3),
(803, 'Oceanografía', 3),
(804, 'Odontología', 3),
(805, 'Optometría', 3),
(806, 'Patología clínica', 3),
(807, 'Pintura', 3),
(808, 'Planeación para el desarrollo social', 3),
(809, 'Profesional en  lenguas modernas', 3),
(810, 'Profesional en ciencia de la información y la', 3),
(811, 'Psicología', 3),
(812, 'Psicología organizacional', 3),
(813, 'Psicólogo', 3),
(814, 'Psicopedagogía y administración educativa', 3),
(815, 'Psiquiatría', 3),
(816, 'Publicidad', 3),
(817, 'Publicidad y mercadeo', 3),
(818, 'Química', 3),
(819, 'Química de alimentos', 3),
(820, 'Química farmacéutica', 3),
(821, 'Química y farmacia', 3),
(822, 'Químico', 3),
(823, 'Recreación', 3),
(824, 'Relaciones económicas internacionales', 3),
(825, 'Sacerdote', 3),
(826, 'Sociología', 3),
(827, 'Teatro', 3),
(828, 'Teología', 3),
(829, 'Terapia física', 3),
(830, 'Terapia ocupacional', 3),
(831, 'Terapia respiratoria', 3),
(832, 'Terapias psicosociales', 3),
(833, 'Textiles', 3),
(834, 'Trabajo social', 3),
(835, 'Traducción e interpretación ruso - español', 3),
(836, 'Traducción simultanea', 3);

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
  `personaJuridica_idpersonaJuridica` int(11) NOT NULL,
  `bancos_idbanco` int(11) NOT NULL,
  `arrendatariosNatural_idarrendatario` int(11) NOT NULL,
  PRIMARY KEY (`idreferenciaBancaria`),
  KEY `fk_referenciaBancaria_personaJuridica1_idx` (`personaJuridica_idpersonaJuridica`),
  KEY `fk_referenciaBancaria_bancos1_idx` (`bancos_idbanco`),
  KEY `fk_referenciaBancaria_arrendatariosNatural1_idx` (`arrendatariosNatural_idarrendatario`)
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
  `tipoReferencia_idtipoReferencia` int(11) NOT NULL,
  `personaJuridica_idpersonaJuridica` int(11) NOT NULL,
  `arrendatariosNatural_idarrendatario` int(11) NOT NULL,
  PRIMARY KEY (`idreferenciaPersonalFamiliar`),
  KEY `fk_referenciaPersonalFamiliar_tipoReferencia1_idx` (`tipoReferencia_idtipoReferencia`),
  KEY `fk_referenciaPersonalFamiliar_personaJuridica1_idx` (`personaJuridica_idpersonaJuridica`),
  KEY `fk_referenciaPersonalFamiliar_arrendatariosNatural1_idx` (`arrendatariosNatural_idarrendatario`)
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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tipoactividadeconomicaarrendatario`
--

INSERT INTO `tipoactividadeconomicaarrendatario` (`idtipoLaborArrendatario`, `nombreTipoLaboraArrendatario`) VALUES
(1, 'Asalariado'),
(2, 'Estudiante'),
(3, 'Socio'),
(4, 'Pensionado'),
(5, 'Jubilado'),
(6, 'Rentista'),
(7, 'Otro');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipoidentificacion`
--

DROP TABLE IF EXISTS `tipoidentificacion`;
CREATE TABLE IF NOT EXISTS `tipoidentificacion` (
  `idtipoIdentificacion` int(11) NOT NULL AUTO_INCREMENT,
  `nombreTipoIdentificacion` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idtipoIdentificacion`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tipoidentificacion`
--

INSERT INTO `tipoidentificacion` (`idtipoIdentificacion`, `nombreTipoIdentificacion`) VALUES
(1, 'Cedula de ciudadania'),
(2, 'Cedula Nit'),
(3, 'Cedula de extranjería');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipopersonacliente`
--

DROP TABLE IF EXISTS `tipopersonacliente`;
CREATE TABLE IF NOT EXISTS `tipopersonacliente` (
  `idtipoPersonCliente` int(11) NOT NULL AUTO_INCREMENT,
  `nombreTipoPersonaCliente` varchar(45) NOT NULL COMMENT 'Tipo persona Juridica o natural',
  PRIMARY KEY (`idtipoPersonCliente`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tipopersonacliente`
--

INSERT INTO `tipopersonacliente` (`idtipoPersonCliente`, `nombreTipoPersonaCliente`) VALUES
(1, 'Natural'),
(2, 'Jurídica');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tiporeferencia`
--

DROP TABLE IF EXISTS `tiporeferencia`;
CREATE TABLE IF NOT EXISTS `tiporeferencia` (
  `idtipoReferencia` int(11) NOT NULL AUTO_INCREMENT,
  `nombreTipoReferencia` varchar(45) NOT NULL,
  PRIMARY KEY (`idtipoReferencia`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tiporeferencia`
--

INSERT INTO `tiporeferencia` (`idtipoReferencia`, `nombreTipoReferencia`) VALUES
(1, 'Personal'),
(2, 'Familiar');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tiposclientes`
--

DROP TABLE IF EXISTS `tiposclientes`;
CREATE TABLE IF NOT EXISTS `tiposclientes` (
  `idtipoCliente` int(11) NOT NULL AUTO_INCREMENT,
  `nombreTipoCliente` varchar(45) NOT NULL,
  PRIMARY KEY (`idtipoCliente`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tiposclientes`
--

INSERT INTO `tiposclientes` (`idtipoCliente`, `nombreTipoCliente`) VALUES
(1, 'Comprador'),
(2, 'Vendedor'),
(3, 'Arrendador'),
(4, 'Arrendatario');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tiposcocinas`
--

DROP TABLE IF EXISTS `tiposcocinas`;
CREATE TABLE IF NOT EXISTS `tiposcocinas` (
  `idtipoCocina` int(11) NOT NULL AUTO_INCREMENT,
  `nombreTipoCocina` varchar(45) NOT NULL,
  PRIMARY KEY (`idtipoCocina`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tiposcocinas`
--

INSERT INTO `tiposcocinas` (`idtipoCocina`, `nombreTipoCocina`) VALUES
(1, 'Gas'),
(2, 'Eléctrica'),
(3, 'Mixta');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tiposcortinas`
--

DROP TABLE IF EXISTS `tiposcortinas`;
CREATE TABLE IF NOT EXISTS `tiposcortinas` (
  `idtipoCortina` int(11) NOT NULL AUTO_INCREMENT,
  `nombreTipoCortina` varchar(45) NOT NULL,
  PRIMARY KEY (`idtipoCortina`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tiposcortinas`
--

INSERT INTO `tiposcortinas` (`idtipoCortina`, `nombreTipoCortina`) VALUES
(1, 'Cortinas'),
(2, 'Persianas');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tiposdestacados`
--

DROP TABLE IF EXISTS `tiposdestacados`;
CREATE TABLE IF NOT EXISTS `tiposdestacados` (
  `idtipoDestacado` int(11) NOT NULL AUTO_INCREMENT,
  `nombreDestacado` varchar(45) NOT NULL,
  PRIMARY KEY (`idtipoDestacado`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tiposdestacados`
--

INSERT INTO `tiposdestacados` (`idtipoDestacado`, `nombreDestacado`) VALUES
(1, 'Alto'),
(2, 'Medio'),
(3, 'Bajo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tiposempleados`
--

DROP TABLE IF EXISTS `tiposempleados`;
CREATE TABLE IF NOT EXISTS `tiposempleados` (
  `idtipoEmpleado` int(11) NOT NULL AUTO_INCREMENT,
  `nombreTipoEmpleado` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idtipoEmpleado`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tiposempleados`
--

INSERT INTO `tiposempleados` (`idtipoEmpleado`, `nombreTipoEmpleado`) VALUES
(1, 'Gerente'),
(2, 'Secretaria'),
(3, 'Abogado'),
(4, 'Contador'),
(5, 'Auxiliar de arrendamientos'),
(6, 'Asesor comercial'),
(7, 'Mensajero'),
(8, 'Gerente');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tiposempresas`
--

DROP TABLE IF EXISTS `tiposempresas`;
CREATE TABLE IF NOT EXISTS `tiposempresas` (
  `idtipoEmpresa` int(11) NOT NULL AUTO_INCREMENT,
  `nombreTipoEmpresa` varchar(45) NOT NULL COMMENT 'privada, mixta, publica, sector solidario',
  PRIMARY KEY (`idtipoEmpresa`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tiposempresas`
--

INSERT INTO `tiposempresas` (`idtipoEmpresa`, `nombreTipoEmpresa`) VALUES
(1, 'Privada'),
(2, 'Pública'),
(3, 'Mixta'),
(4, 'Sector Solidario');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tiposeventos`
--

DROP TABLE IF EXISTS `tiposeventos`;
CREATE TABLE IF NOT EXISTS `tiposeventos` (
  `idtipoEvento` int(11) NOT NULL AUTO_INCREMENT,
  `nombreTipoEvento` varchar(45) NOT NULL,
  PRIMARY KEY (`idtipoEvento`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tiposeventos`
--

INSERT INTO `tiposeventos` (`idtipoEvento`, `nombreTipoEvento`) VALUES
(1, 'Visita inmueble'),
(2, 'Reunión interna'),
(3, 'Reunión externa'),
(4, 'Firma contrato'),
(5, 'Firma promesa compra venta'),
(6, 'Firma escrituras');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tiposinmuebles`
--

DROP TABLE IF EXISTS `tiposinmuebles`;
CREATE TABLE IF NOT EXISTS `tiposinmuebles` (
  `idtipoInmueble` int(11) NOT NULL AUTO_INCREMENT,
  `nombreTipoInmueble` varchar(45) NOT NULL,
  PRIMARY KEY (`idtipoInmueble`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tiposinmuebles`
--

INSERT INTO `tiposinmuebles` (`idtipoInmueble`, `nombreTipoInmueble`) VALUES
(1, 'Casa'),
(2, 'Apartamento'),
(3, 'Local'),
(4, 'Bodega'),
(5, 'Oficina'),
(6, 'Otro');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tiposofertas`
--

DROP TABLE IF EXISTS `tiposofertas`;
CREATE TABLE IF NOT EXISTS `tiposofertas` (
  `idtipoOferta` int(11) NOT NULL AUTO_INCREMENT,
  `nombreTipoOferta` varchar(45) NOT NULL,
  PRIMARY KEY (`idtipoOferta`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tiposofertas`
--

INSERT INTO `tiposofertas` (`idtipoOferta`, `nombreTipoOferta`) VALUES
(1, 'Arriendo'),
(2, 'Venta');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipospisos`
--

DROP TABLE IF EXISTS `tipospisos`;
CREATE TABLE IF NOT EXISTS `tipospisos` (
  `idtipoPiso` int(11) NOT NULL AUTO_INCREMENT,
  `nombreTipoPiso` varchar(45) NOT NULL,
  PRIMARY KEY (`idtipoPiso`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tipospisos`
--

INSERT INTO `tipospisos` (`idtipoPiso`, `nombreTipoPiso`) VALUES
(1, 'Madera'),
(2, 'Porcelanato'),
(3, 'Hormigon'),
(4, 'Mosaicos'),
(5, 'Piedra'),
(6, 'Alfombra'),
(7, 'Laminado'),
(8, 'Bambú'),
(9, 'Madera'),
(10, 'Linóleo'),
(11, 'Cerámica'),
(12, 'Vinilo'),
(13, 'Caucho'),
(14, 'Concreto');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipossociedad`
--

DROP TABLE IF EXISTS `tipossociedad`;
CREATE TABLE IF NOT EXISTS `tipossociedad` (
  `idtipoSociedad` int(11) NOT NULL AUTO_INCREMENT,
  `nombreTipoSociedad` varchar(45) NOT NULL,
  PRIMARY KEY (`idtipoSociedad`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tipossociedad`
--

INSERT INTO `tipossociedad` (`idtipoSociedad`, `nombreTipoSociedad`) VALUES
(1, 'Anonima'),
(2, 'Limitada'),
(3, 'Mixta'),
(4, 'Extranjera'),
(5, 'Publica'),
(6, 'Cooperativa'),
(7, 'Unipersonal');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tiposvigilancias`
--

DROP TABLE IF EXISTS `tiposvigilancias`;
CREATE TABLE IF NOT EXISTS `tiposvigilancias` (
  `idtipoVigilancia` int(11) NOT NULL AUTO_INCREMENT,
  `nombreTipoVigilancia` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idtipoVigilancia`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tiposvigilancias`
--

INSERT INTO `tiposvigilancias` (`idtipoVigilancia`, `nombreTipoVigilancia`) VALUES
(1, 'Vigilancia 24/7'),
(2, 'Diruna'),
(3, 'Nocturna'),
(4, 'Sin vigilancia');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tiposvistas`
--

DROP TABLE IF EXISTS `tiposvistas`;
CREATE TABLE IF NOT EXISTS `tiposvistas` (
  `idtipoVista` int(11) NOT NULL AUTO_INCREMENT,
  `nombreTipoVista` varchar(45) NOT NULL,
  PRIMARY KEY (`idtipoVista`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tiposvistas`
--

INSERT INTO `tiposvistas` (`idtipoVista`, `nombreTipoVista`) VALUES
(1, 'Interior'),
(2, 'Exterior');

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
-- Estructura de tabla para la tabla `videos`
--

DROP TABLE IF EXISTS `videos`;
CREATE TABLE IF NOT EXISTS `videos` (
  `idvideo` int(11) NOT NULL AUTO_INCREMENT,
  `rutaVideo` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`idvideo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `zonas`
--

DROP TABLE IF EXISTS `zonas`;
CREATE TABLE IF NOT EXISTS `zonas` (
  `idzona` int(11) NOT NULL AUTO_INCREMENT,
  `nombreZona` varchar(45) NOT NULL,
  PRIMARY KEY (`idzona`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `zonas`
--

INSERT INTO `zonas` (`idzona`, `nombreZona`) VALUES
(1, 'Norte'),
(2, 'Centro'),
(3, 'Sur'),
(4, 'Oriente'),
(5, 'Occidente'),
(6, 'NorOriente'),
(7, 'NorOccidente'),
(8, 'SurOriente'),
(9, 'SurOccidente');

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `arrendatariodependiente`
--
ALTER TABLE `arrendatariodependiente`
  ADD CONSTRAINT `fk_arrendatarioDependiente_Cargos1` FOREIGN KEY (`Cargos_idCargo`) REFERENCES `cargos` (`idCargo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_arrendatarioDependiente_detalleArrendatarioTipoArrendatario1` FOREIGN KEY (`iddetalleArrendatarioTipoArrendatario`) REFERENCES `detallearrendatariotipoarrendatario` (`iddetalleArrendatarioTipoArrendatario`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `arrendatarioindependiente`
--
ALTER TABLE `arrendatarioindependiente`
  ADD CONSTRAINT `fk_arrendatarioIndependiente_detalleArrendatarioTipoArrendata1` FOREIGN KEY (`iddetalleArrendatarioTipoArrendatario`) REFERENCES `detallearrendatariotipoarrendatario` (`iddetalleArrendatarioTipoArrendatario`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `arrendatariosnatural`
--
ALTER TABLE `arrendatariosnatural`
  ADD CONSTRAINT `fk_arrendatarios_detalleClientesTipoClientes1` FOREIGN KEY (`iddetalleClientesTipoClientes1`) REFERENCES `detalleclientestipoclientes` (`iddetalleClientesTipoClientes`) ON DELETE NO ACTION ON UPDATE NO ACTION;

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
-- Filtros para la tabla `contratos`
--
ALTER TABLE `contratos`
  ADD CONSTRAINT `fk_contratos_inmuebles1` FOREIGN KEY (`inmuebles_idinmueble`) REFERENCES `inmuebles` (`idinmueble`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `conyugues`
--
ALTER TABLE `conyugues`
  ADD CONSTRAINT `fk_conyugues_arrendatarios1` FOREIGN KEY (`arrendatarios_idarrendatario`) REFERENCES `arrendatariosnatural` (`idarrendatario`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `departamentos`
--
ALTER TABLE `departamentos`
  ADD CONSTRAINT `fk_Departamentos_paises1` FOREIGN KEY (`paises_idpais`) REFERENCES `paises` (`idpais`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `idRegion` FOREIGN KEY (`idRegion`) REFERENCES `regiones` (`idRegion`);

--
-- Filtros para la tabla `detallearrendatariotipoarrendatario`
--
ALTER TABLE `detallearrendatariotipoarrendatario`
  ADD CONSTRAINT `fk_detalleArrendatarioTipoArrendatario_arrendatarios1` FOREIGN KEY (`idarrendatario`) REFERENCES `arrendatariosnatural` (`idarrendatario`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_detalleArrendatarioTipoArrendatario_tipoLaborArrendatario1` FOREIGN KEY (`idtipoLaborArrendatario`) REFERENCES `tipoactividadeconomicaarrendatario` (`idtipoLaborArrendatario`) ON DELETE NO ACTION ON UPDATE NO ACTION;

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
  ADD CONSTRAINT `fk_detalleEventosEmpleados_empleados1` FOREIGN KEY (`empleados_idempleado`) REFERENCES `empleados` (`idempleado`) ON DELETE NO ACTION ON UPDATE NO ACTION;

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
  ADD CONSTRAINT `fk_empleados_tiposEmpleados1` FOREIGN KEY (`idtipoEmpleado`) REFERENCES `tiposempleados` (`idtipoEmpleado`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `eventosclientes`
--
ALTER TABLE `eventosclientes`
  ADD CONSTRAINT `fk_eventosClientes_clientes1` FOREIGN KEY (`clientes_cedulaCliente`) REFERENCES `clientes` (`idCliente`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_eventosClientes_detalleEventosEmpleados1` FOREIGN KEY (`iddetalleEventoEmpleado`) REFERENCES `detalleeventosempleados` (`iddetalleEventoEmpleado`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_eventosClientes_tiposEventos1` FOREIGN KEY (`tiposEventos_idtipoEvento`) REFERENCES `tiposeventos` (`idtipoEvento`) ON DELETE NO ACTION ON UPDATE NO ACTION;

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
  ADD CONSTRAINT `fk_inmuebles_imagenes1` FOREIGN KEY (`imagenes_idimagen`) REFERENCES `imagenes` (`idimagen`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_inmuebles_tiposCocinas1` FOREIGN KEY (`tiposCocinas_idtipoCocina`) REFERENCES `tiposcocinas` (`idtipoCocina`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_inmuebles_tiposCortinas1` FOREIGN KEY (`tiposCortinas_idtipoCortina`) REFERENCES `tiposcortinas` (`idtipoCortina`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_inmuebles_tiposDestacados1` FOREIGN KEY (`tiposDestacados_idtipoDestacado`) REFERENCES `tiposdestacados` (`idtipoDestacado`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_inmuebles_tiposInmuebles1` FOREIGN KEY (`tiposInmuebles_idtipoInmueble`) REFERENCES `tiposinmuebles` (`idtipoInmueble`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_inmuebles_tiposOfertas1` FOREIGN KEY (`tiposOfertas_idtipoOferta`) REFERENCES `tiposofertas` (`idtipoOferta`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_inmuebles_tiposPisos1` FOREIGN KEY (`tiposPisos_idtipoPiso`) REFERENCES `tipospisos` (`idtipoPiso`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_inmuebles_tiposVigilancias1` FOREIGN KEY (`tiposVigilancias_idtipoVigilancia`) REFERENCES `tiposvigilancias` (`idtipoVigilancia`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_inmuebles_tiposVistas1` FOREIGN KEY (`tiposVistas_idtipoVista`) REFERENCES `tiposvistas` (`idtipoVista`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_inmuebles_videos1` FOREIGN KEY (`videos_idvideo`) REFERENCES `videos` (`idvideo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
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
  ADD CONSTRAINT `fk_referenciaBancaria_arrendatariosNatural1` FOREIGN KEY (`arrendatariosNatural_idarrendatario`) REFERENCES `arrendatariosnatural` (`idarrendatario`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_referenciaBancaria_bancos1` FOREIGN KEY (`bancos_idbanco`) REFERENCES `bancos` (`idbanco`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_referenciaBancaria_personaJuridica1` FOREIGN KEY (`personaJuridica_idpersonaJuridica`) REFERENCES `personajuridica` (`idpersonaJuridica`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `referenciapersonalfamiliar`
--
ALTER TABLE `referenciapersonalfamiliar`
  ADD CONSTRAINT `fk_referenciaPersonalFamiliar_arrendatariosNatural1` FOREIGN KEY (`arrendatariosNatural_idarrendatario`) REFERENCES `arrendatariosnatural` (`idarrendatario`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_referenciaPersonalFamiliar_personaJuridica1` FOREIGN KEY (`personaJuridica_idpersonaJuridica`) REFERENCES `personajuridica` (`idpersonaJuridica`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_referenciaPersonalFamiliar_tipoReferencia1` FOREIGN KEY (`tipoReferencia_idtipoReferencia`) REFERENCES `tiporeferencia` (`idtipoReferencia`) ON DELETE NO ACTION ON UPDATE NO ACTION;

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
