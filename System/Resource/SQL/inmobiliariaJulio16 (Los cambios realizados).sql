-- phpMyAdmin SQL Dump
-- version 4.7.9
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 16-07-2018 a las 14:26:30
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

DROP PROCEDURE IF EXISTS `loadclient`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `loadclient` (IN `idfilter` INT)  BEGIN
 
	IF idfilter > -1 THEN
	
		select idEmpleado as id,CONCAT(primerNombreEmpleado, ' ', 
		segundoNombreEmpleado, ' ', primerApellidoEmpleado,  ' ', 
		segundoApellidoEmpleado) as nombre
		from Empleados                
		ORDER BY nombre;
		
        
	
		select idEmpleado as id,CONCAT(primerNombreEmpleado, ' ', 
		segundoNombreEmpleado, ' ', primerApellidoEmpleado , ' ', 
		segundoApellidoEmpleado) as nombre
		from Empleados                
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

DROP PROCEDURE IF EXISTS `login`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `login` (IN `usu` VARCHAR(50), IN `pass` VARCHAR(50))  BEGIN
   select u.usuario,u.primer_nombre,u.primer_apellido,u.rol,u.id,r.nombre as rol_nombre
   from usuario as u
   inner join rol as r on u.rol = r.id
   where password=pass and usuario=usu;		
END$$

DROP PROCEDURE IF EXISTS `log_msg`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `log_msg` (`msg` VARCHAR(255))  BEGIN
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

  
    WHILE (LOCATE(',', vtypesclient) > 0) DO
      /*Se saca el primer campo separado por coma del varchar*/
      SET @V_DESIGNATION = SUBSTRING(vtypesclient,1, LOCATE(',',vtypesclient)-1); 
      /*call log_msg(CONCAT('PARTICIONADO********',@V_DESIGNATION));*/
      /*Se elimina ese primer valor y se reemplaza en la cadena*/
      SET vtypesclient = SUBSTRING(vtypesclient, LOCATE(',',vtypesclient) + 1); 
      /*call log_msg(CONCAT('PRUEBA********',vtypesclient));*/
      /*call log_msg(CONCAT('VAMOS A INSERTAR********',@V_DESIGNATION,'-------',@vidClient));*/
      
       /*Se almacena en la tabla, siempre y cuando tenga un dato para almacenar*/
       IF @V_DESIGNATION <> ',' THEN	
    		INSERT INTO detalleclientestipoclientes(tiposClientes_idtipoCliente, clientes_cedulaCliente) 
            VALUES (CONVERT(@V_DESIGNATION,SIGNED),@vidClient);
		END IF;
    END WHILE;



            

				
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
       IF @V_DESIGNATION <> ',' THEN	
    		INSERT INTO detalleclientestipoclientes(tiposClientes_idtipoCliente, clientes_cedulaCliente) 
            VALUES (CONVERT(@V_DESIGNATION,SIGNED),vid);
		END IF;
    END WHILE;

                        
														
		END IF;

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
) ENGINE=InnoDB AUTO_INCREMENT=91 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `bancos`
--

INSERT INTO `bancos` (`idbanco`, `nombreBanco`, `direccionPrincipal`, `telefonoPrincipal`) VALUES
(46, 'Arco Grupo Bancoldex', NULL, NULL),
(47, 'Banca de Inversión Bancolombia', NULL, NULL),
(48, 'Bancamía S.A.', NULL, NULL),
(49, 'Banco  de  Occidente S.A.', NULL, NULL),
(50, 'Banco Agrario de Colombia', NULL, NULL),
(51, 'Banco AV Villas', NULL, NULL),
(52, 'Banco Caja Social', NULL, NULL),
(53, 'Banco Compartir', NULL, NULL),
(54, 'Banco Coomeva', NULL, NULL),
(55, 'Banco Cooperativo Coopcentral', NULL, NULL),
(56, 'Banco Corpobanca', NULL, NULL),
(57, 'Banco Davivienda', NULL, NULL),
(58, 'Banco de Bogotá', NULL, NULL),
(59, 'Banco Falabella', NULL, NULL),
(60, 'Banco Finandina', NULL, NULL),
(61, 'Banco GNB Sudameris', NULL, NULL),
(62, 'Banco Multibank', NULL, NULL),
(63, 'Banco Mundo Mujer', NULL, NULL),
(64, 'Banco Pichincha', NULL, NULL),
(65, 'Banco Popular S.A.', NULL, NULL),
(66, 'Banco ProCredit', NULL, NULL),
(67, 'Banco Santander', NULL, NULL),
(68, 'Banco W S.A.', NULL, NULL),
(69, 'Bancolombia S.A.', NULL, NULL),
(70, 'BBVA Colombia', NULL, NULL),
(71, 'BNP Paribas Colombia Corporación Financiera', NULL, NULL),
(72, 'Citibank-Colombia', NULL, NULL),
(73, 'Colpatria', NULL, NULL),
(74, 'Coltefinanciera', NULL, NULL),
(75, 'Compañía de Financiamiento TUYA', NULL, NULL),
(76, 'Corporación Financiera Colombiana', NULL, NULL),
(77, 'Credifamilia Compañía de Financiamiento', NULL, NULL),
(78, 'Credifinanciera', NULL, NULL),
(79, 'Financiera DANN ', NULL, NULL),
(80, 'Financiera Juriscoop', NULL, NULL),
(81, 'Financiera Pagos Internacionales', NULL, NULL),
(82, 'Giros & Finanzas Compañía de Financiamiento', NULL, NULL),
(83, 'GM Financial Colombia', NULL, NULL),
(84, 'ITAÚ BBA Colombia', NULL, NULL),
(85, 'JPMorgan Corporación Financiera', NULL, NULL),
(86, 'La Hipotecaria Compañía de Financiamiento', NULL, NULL),
(87, 'Leasing Corficolombiana', NULL, NULL),
(88, 'Opportunity International Colombia', NULL, NULL),
(89, 'RCI Colombia', NULL, NULL),
(90, 'Serfinansa', NULL, NULL);

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
) ENGINE=InnoDB AUTO_INCREMENT=551 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `barrios`
--

INSERT INTO `barrios` (`idbarrio`, `nombreBarrio`, `idCiudad`) VALUES
(276, 'Asentamiento  25 de enero', 886),
(277, 'Asentamiento  el milagro', 886),
(278, 'Asentamiento  el recuerdo', 886),
(279, 'Asentamiento  los fundadores', 886),
(280, 'Asentamiento las veraneras', 886),
(281, 'Asentamiento puerto rico', 886),
(282, 'Asentamiento salvador allende', 886),
(283, 'Asentamiento vieja libertad', 886),
(284, 'Barrio  25 de mayo', 886),
(285, 'Barrio  7 de agosto', 886),
(286, 'Barrio  buenos aires', 886),
(287, 'Barrio  el recreo', 886),
(288, 'Barrio  el silencio', 886),
(289, 'Barrio  galan', 886),
(290, 'Barrio  granada', 886),
(291, 'Barrio  la adiela', 886),
(292, 'Barrio  la campina', 886),
(293, 'Barrio  la castellana', 886),
(294, 'Barrio  la montana', 886),
(295, 'Barrio  las sesenta casas', 886),
(296, 'Barrio  los fundadores', 886),
(297, 'Barrio  niagara', 886),
(298, 'Barrio  providencia', 886),
(299, 'Barrio  uribe', 886),
(300, 'Barrio 14 de octubre', 886),
(301, 'Barrio 19 de enero', 886),
(302, 'Barrio 7 de agosto', 886),
(303, 'Barrio 8 de marzo', 886),
(304, 'Barrio alcazar', 886),
(305, 'Barrio alfonso lopez', 886),
(306, 'Barrio antonio narino', 886),
(307, 'Barrio arenales', 886),
(308, 'Barrio arrayanes', 886),
(309, 'Barrio belen', 886),
(310, 'Barrio belencito', 886),
(311, 'Barrio bello horizonte', 886),
(312, 'Barrio berlin', 886),
(313, 'Barrio bosques de gibraltar', 886),
(314, 'Barrio boyaca', 886),
(315, 'Barrio buenos aires bajo', 886),
(316, 'Barrio buenos aires plano', 886),
(317, 'Barrio calima', 886),
(318, 'Barrio cincuentenario', 886),
(319, 'Barrio colinas centro', 886),
(320, 'Barrio cooperativo', 886),
(321, 'Barrio corbones', 886),
(322, 'Barrio el bosque', 886),
(323, 'Barrio el emperador', 886),
(324, 'Barrio el nogal', 886),
(325, 'Barrio el paraiso', 886),
(326, 'Barrio el placer', 886),
(327, 'Barrio el porvenir', 886),
(328, 'Barrio el prado', 886),
(329, 'Barrio el recreo', 886),
(330, 'Barrio espana', 886),
(331, 'Barrio farallones', 886),
(332, 'Barrio gaitan', 886),
(333, 'Barrio gibraltar', 886),
(334, 'Barrio guayaquil', 886),
(335, 'Barrio jesus maria ocampo', 886),
(336, 'Barrio la anunciacion', 886),
(337, 'Barrio la arboleda', 886),
(338, 'Barrio la brasilia', 886),
(339, 'Barrio la cabana', 886),
(340, 'Barrio la clarita', 886),
(341, 'Barrio la esperanza', 886),
(342, 'Barrio la isabela', 886),
(343, 'Barrio la lorena', 886),
(344, 'Barrio la milagrosa', 886),
(345, 'Barrio la miranda', 886),
(346, 'Barrio la union', 886),
(347, 'Barrio las acacias', 886),
(348, 'Barrio las americas', 886),
(349, 'Barrio las margaritas', 886),
(350, 'Barrio las mercedes', 886),
(351, 'Barrio las palmas', 886),
(352, 'Barrio laureles', 886),
(353, 'Barrio los alamos', 886),
(354, 'Barrio los cambulos', 886),
(355, 'Barrio los libertadores', 886),
(356, 'Barrio los naranjos', 886),
(357, 'Barrio los profesionales', 886),
(358, 'Barrio los quindos', 886),
(359, 'Barrio loteros', 886),
(360, 'Barrio manuela beltran', 886),
(361, 'Barrio marco fidel suarez', 886),
(362, 'Barrio miraflores', 886),
(363, 'Barrio modelo', 886),
(364, 'Barrio monteprado', 886),
(365, 'Barrio montevideo', 886),
(366, 'Barrio nueva cecilia', 886),
(367, 'Barrio nueva libertad', 886),
(368, 'Barrio obrero', 886),
(369, 'Barrio patio bonito', 886),
(370, 'Barrio patio bonito bajo', 886),
(371, 'Barrio patricia', 886),
(372, 'Barrio piamonte', 886),
(373, 'Barrio pinares', 886),
(374, 'Barrio popular', 886),
(375, 'Barrio quindio', 886),
(376, 'Barrio rincon santo', 886),
(377, 'Barrio salazar', 886),
(378, 'Barrio san andres', 886),
(379, 'Barrio san fernando', 886),
(380, 'Barrio san jose', 886),
(381, 'Barrio san nicolas', 886),
(382, 'Barrio san vicente de paul', 886),
(383, 'Barrio santa helena', 886),
(384, 'Barrio santa maria', 886),
(385, 'Barrio santa rita', 886),
(386, 'Barrio santafe', 886),
(387, 'Barrio santander', 886),
(388, 'Barrio tigreros', 886),
(389, 'Barrio velez', 886),
(390, 'Barrio zuldemayda', 886),
(391, 'Sector  aborigenes', 886),
(392, 'Sector  av centenario', 886),
(393, 'Sector  bavaria', 886),
(394, 'Sector  centro', 886),
(395, 'Sector  coinca', 886),
(396, 'Sector  crq', 886),
(397, 'Sector  el coliseo', 886),
(398, 'Sector  el mirador', 886),
(399, 'Sector  estadio centenario', 886),
(400, 'Sector  jardines', 886),
(401, 'Sector  la aldea', 886),
(402, 'Sector  la florida', 886),
(403, 'Sector  la fogata', 886),
(404, 'Sector  la maria', 886),
(405, 'Sector  monterredondo', 886),
(406, 'Sector  norte avenida 19', 886),
(407, 'Sector  parque cafetero', 886),
(408, 'Sector  parque valencia', 886),
(409, 'Sector  proviteq', 886),
(410, 'Sector  quebrada la clarita-san jose', 886),
(411, 'Sector  regivit', 886),
(412, 'Sector  san juan', 886),
(413, 'Sector  san nicolas', 886),
(414, 'Sector  santa ana', 886),
(415, 'Sector  sinai', 886),
(416, 'Sector  tigreros', 886),
(417, 'Sector  tres esquinas', 886),
(418, 'Sector  yulima', 886),
(419, 'Urbanizacion  bosques de viena', 886),
(420, 'Urbanizacion  el limonar', 886),
(421, 'Urbanizacion  el silencio', 886),
(422, 'Urbanizacion  el tesorito', 886),
(423, 'Urbanizacion  la fachada', 886),
(424, 'Urbanizacion  la virginia', 886),
(425, 'Urbanizacion  los almendros', 886),
(426, 'Urbanizacion  nuevo recreo', 886),
(427, 'Urbanizacion  palmares del recreo', 886),
(428, 'Urbanizacion  primero de mayo', 886),
(429, 'Urbanizacion  sara', 886),
(430, 'Urbanizacion  venecia', 886),
(431, 'Urbanizacion  villa andrea', 886),
(432, 'Urbanizacion  villa celmira', 886),
(433, 'Urbanizacion  villa de las americas', 886),
(434, 'Urbanizacion  villa jardin', 886),
(435, 'Urbanizacion  villa maraveles', 886),
(436, 'Urbanizacion 13 de junio', 886),
(437, 'Urbanizacion aguazul', 886),
(438, 'Urbanizacion ahitamara', 886),
(439, 'Urbanizacion alameda del norte', 886),
(440, 'Urbanizacion alcazar del caf?', 886),
(441, 'Urbanizacion alejandria', 886),
(442, 'Urbanizacion altos de la pavona', 886),
(443, 'Urbanizacion arco iris', 886),
(444, 'Urbanizacion bambusa', 886),
(445, 'Urbanizacion baru', 886),
(446, 'Urbanizacion bosques de pinares', 886),
(447, 'Urbanizacion brasilia nueva', 886),
(448, 'Urbanizacion cabo de la vela', 886),
(449, 'Urbanizacion canas gordas', 886),
(450, 'Urbanizacion cano cristales', 886),
(451, 'Urbanizacion casablanca', 886),
(452, 'Urbanizacion castilla grande', 886),
(453, 'Urbanizacion centenario', 886),
(454, 'Urbanizacion chalets de monteblanco', 886),
(455, 'Urbanizacion ciudad dorada', 886),
(456, 'Urbanizacion ciudadela el poblado', 886),
(457, 'Urbanizacion ciudadela el sol', 886),
(458, 'Urbanizacion ciudadela la patria', 886),
(459, 'Urbanizacion ciudadela las colinas', 886),
(460, 'Urbanizacion ciudadela los andes', 886),
(461, 'Urbanizacion ciudadela nueva armenia', 886),
(462, 'Urbanizacion ciudadela nuevo horizonte', 886),
(463, 'Urbanizacion ciudadela puerto espejo', 886),
(464, 'Urbanizacion ciudadela simon bolivar', 886),
(465, 'Urbanizacion cristales', 886),
(466, 'Urbanizacion el carmelo', 886),
(467, 'Urbanizacion el cortijo', 886),
(468, 'Urbanizacion el jubileo', 886),
(469, 'Urbanizacion el palmar', 886),
(470, 'Urbanizacion el parque', 886),
(471, 'Urbanizacion el refugio', 886),
(472, 'Urbanizacion el remanso', 886),
(473, 'Urbanizacion el sinai', 886),
(474, 'Urbanizacion francisco jose de caldas', 886),
(475, 'Urbanizacion genesis', 886),
(476, 'Urbanizacion guaduales de la villa', 886),
(477, 'Urbanizacion guaduales del eden', 886),
(478, 'Urbanizacion la alhambra', 886),
(479, 'Urbanizacion la arcadia', 886),
(480, 'Urbanizacion la castilla', 886),
(481, 'Urbanizacion la cecilia', 886),
(482, 'Urbanizacion la cristalina', 886),
(483, 'Urbanizacion la divisa', 886),
(484, 'Urbanizacion la esmeralda', 886),
(485, 'Urbanizacion la gran bretana', 886),
(486, 'Urbanizacion la grecia', 886),
(487, 'Urbanizacion la irlanda', 886),
(488, 'Urbanizacion la linda', 886),
(489, 'Urbanizacion la mariela', 886),
(490, 'Urbanizacion la montana', 886),
(491, 'Urbanizacion la pavona', 886),
(492, 'Urbanizacion la rivera', 886),
(493, 'Urbanizacion las brisas', 886),
(494, 'Urbanizacion las serranias', 886),
(495, 'Urbanizacion lindaraja', 886),
(496, 'Urbanizacion loma verde', 886),
(497, 'Urbanizacion lomas de la union', 886),
(498, 'Urbanizacion los arcades', 886),
(499, 'Urbanizacion los artesanos', 886),
(500, 'Urbanizacion los girasoles', 886),
(501, 'Urbanizacion los kioscos', 886),
(502, 'Urbanizacion los sauces', 886),
(503, 'Urbanizacion luis carlos galan sarmiento', 886),
(504, 'Urbanizacion manantiales', 886),
(505, 'Urbanizacion marbella', 886),
(506, 'Urbanizacion maria cristina', 886),
(507, 'Urbanizacion mercedes del norte', 886),
(508, 'Urbanizacion monteblanco', 886),
(509, 'Urbanizacion montecarlo', 886),
(510, 'Urbanizacion murano', 886),
(511, 'Urbanizacion nuestra senora de la paz', 886),
(512, 'Urbanizacion nuevo amanecer', 886),
(513, 'Urbanizacion nuevo berlin', 886),
(514, 'Urbanizacion nuevo recreo', 886),
(515, 'Urbanizacion nuevo sol', 886),
(516, 'Urbanizacion palmares del recreo', 886),
(517, 'Urbanizacion portal de pinares', 886),
(518, 'Urbanizacion portal del eden', 886),
(519, 'Urbanizacion primero de mayo', 886),
(520, 'Urbanizacion provivienda universal', 886),
(521, 'Urbanizacion quintas de juliana', 886),
(522, 'Urbanizacion quintas de la marina', 886),
(523, 'Urbanizacion quintas de los andes', 886),
(524, 'Urbanizacion rojas pinilla_1', 886),
(525, 'Urbanizacion rojas pinilla_2', 886),
(526, 'Urbanizacion san diego', 886),
(527, 'Urbanizacion san francisco', 886),
(528, 'Urbanizacion santa sofia', 886),
(529, 'Urbanizacion terranova el alba', 886),
(530, 'Urbanizacion tres esquinas', 886),
(531, 'Urbanizacion veracruz', 886),
(532, 'Urbanizacion villa alejandra', 886),
(533, 'Urbanizacion villa angela', 886),
(534, 'Urbanizacion villa angela_cordillera', 886),
(535, 'Urbanizacion villa carolina', 886),
(536, 'Urbanizacion villa claudia', 886),
(537, 'Urbanizacion villa de la vida y el trabajo', 886),
(538, 'Urbanizacion villa del caf?', 886),
(539, 'Urbanizacion villa del carmen', 886),
(540, 'Urbanizacion villa del centenario', 886),
(541, 'Urbanizacion villa hermosa', 886),
(542, 'Urbanizacion villa inglesa', 886),
(543, 'Urbanizacion villa italia', 886),
(544, 'Urbanizacion villa juliana', 886),
(545, 'Urbanizacion villa laura', 886),
(546, 'Urbanizacion villa liliana', 886),
(547, 'Urbanizacion villa marcela', 886),
(548, 'Urbanizacion villa sofia', 886),
(549, 'Urbanizacion villa ximena', 886),
(550, 'Urbanizacion vista hermosa', 886);

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
) ENGINE=InnoDB AUTO_INCREMENT=461 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `cargos`
--

INSERT INTO `cargos` (`idCargo`, `nombreTipoCargo`) VALUES
(231, 'Ajustador de electricista'),
(232, 'Asistente médico'),
(233, 'Avicultor'),
(234, 'Ingeniero catastral'),
(235, 'Ingeniero textil'),
(236, 'Instalador de material aislante e isonorizaci'),
(237, 'Instalador y reparadores de  líneas eléctrica'),
(238, 'Peluquero'),
(239, 'Abogado'),
(240, 'Acarreador de agua'),
(241, 'Acompañante de personas'),
(242, 'Actor'),
(243, 'Administrador de equipos informáticos'),
(244, 'Administrador de redes'),
(245, 'Administrador de sistemas'),
(246, 'Agente de seguros'),
(247, 'Agente de viajes'),
(248, 'Agricultor '),
(249, 'Agrónomo '),
(250, 'Ajustador e instalador en electrónica'),
(251, 'Albañil'),
(252, 'Alfarero'),
(253, 'Analista de gestión y organización '),
(254, 'Analista de infraestructura'),
(255, 'Analista de sistemas'),
(256, 'Analista financiero'),
(257, 'Antropólogo'),
(258, 'Aparejador y espalmador de cables'),
(259, 'Apelambrador'),
(260, 'Arquitecto'),
(261, 'Artesano '),
(262, 'Artista'),
(263, 'Asesor financiero de inversiones'),
(264, 'Asistente odontológico '),
(265, 'Asistente terapeuta'),
(266, 'Astrólogo'),
(267, 'Astrónomo'),
(268, 'Atleta'),
(269, 'Auditor contable'),
(270, 'Auditor de calidad.'),
(271, 'Auditores financieros'),
(272, 'Auxiliar contable'),
(273, 'Auxiliar de maestro'),
(274, 'Auxiliar de nómina'),
(275, 'Auxiliar de seguros'),
(276, 'Auxiliar de servicios estadísticos'),
(277, 'Auxiliar financiero '),
(278, 'Auxiliar laico'),
(279, 'Avicultor'),
(280, 'Ayudante de cocina'),
(281, 'Ayudante de elaboración de alimentos y bebida'),
(282, 'Bailarines'),
(283, 'Bárman'),
(284, 'Barnizador y afin'),
(285, 'Barrendero y afin'),
(286, 'Biólogo'),
(287, 'Bisutero'),
(288, 'Bombero'),
(289, 'Botánico'),
(290, 'Buzo'),
(291, 'Cajero'),
(292, 'Camarógrafo'),
(293, 'Cantante'),
(294, 'Carnicero'),
(295, 'Carpintero'),
(296, 'Carpinteros'),
(297, 'Cartógrafo'),
(298, 'Catador'),
(299, 'Cazador'),
(300, 'Ceramista'),
(301, 'Cestero mimbreras'),
(302, 'Chapista calderero'),
(303, 'Chef de cocina'),
(304, 'Clasificador de desechos'),
(305, 'Cobrador'),
(306, 'Cocinero'),
(307, 'Codificador de datos'),
(308, 'Comercialnte al por menor'),
(309, 'Comerciante al por mayor'),
(310, 'Compositor'),
(311, 'Conductor'),
(312, 'Constructor'),
(313, 'Consultor de tecnología'),
(314, 'Contadores'),
(315, 'Controlador de tráfico aéreo'),
(316, 'Coreógrafo'),
(317, 'Cortador de tela cuero y afines'),
(318, 'Costurero'),
(319, 'Criador de ganado'),
(320, 'Cristalera'),
(321, 'Cuidador de animales domésticos'),
(322, 'Cuidador de niños'),
(323, 'Decorador'),
(324, 'Deportista'),
(325, 'Desarrollador de software'),
(326, 'Detective privado'),
(327, 'Dibujante técnico'),
(328, 'Director de cine teatro y afines'),
(329, 'Diseñador gráfico y multimedia'),
(330, 'Diseñador y administrador de bases de datos'),
(331, 'Diseñador y decorador de interiores'),
(332, 'Docente'),
(333, 'Docente Universitario'),
(334, 'Ebanista'),
(335, 'Electricista de obra'),
(336, 'Empacador manual'),
(337, 'Encuadernador'),
(338, 'Entrevistador'),
(339, 'Epidemiólogo'),
(340, 'Escolta'),
(341, 'Escritor'),
(342, 'Escultor'),
(343, 'Especialista en métodos pedagógicos'),
(344, 'Especialista en tratamientos de belleza y afi'),
(345, 'Estadístico'),
(346, 'Evaluador de bienes raíces'),
(347, 'Fabricante de instrumentos musicales'),
(348, 'Fabricante de lácteos'),
(349, 'Farmacéutico'),
(350, 'Filósofo'),
(351, 'Físico'),
(352, 'Fisioterapeuta'),
(353, 'Fonoaudiólogo'),
(354, 'Fontanero'),
(355, 'Fotografo'),
(356, 'Fumigador'),
(357, 'Geólogo'),
(358, 'Grabador de datos'),
(359, 'Guardafrenos'),
(360, 'Guia de museos'),
(361, 'Guía de turismo'),
(362, 'Herrero'),
(363, 'Impresor'),
(364, 'Ingeniero aeronáutico'),
(365, 'Ingeniero automotriz'),
(366, 'Ingeniero civiles.'),
(367, 'Ingeniero de energía nuclear'),
(368, 'Ingeniero de minas'),
(369, 'ingeniero de salvamento marítimo'),
(370, 'Ingeniero de seguridad.'),
(371, 'Ingeniero de telecomunicaciones'),
(372, 'Ingeniero de tráfico'),
(373, 'Ingeniero electricistas'),
(374, 'Ingeniero eléctrico'),
(375, 'Ingeniero industriales'),
(376, 'Ingeniero marino'),
(377, 'Ingeniero Mecánico'),
(378, 'Ingeniero medio ambiental'),
(379, 'Ingeniero químico'),
(380, 'Ingenieros electrónicos'),
(381, 'Inspector de seguridad'),
(382, 'Instructor'),
(383, 'Instructor de conducción'),
(384, 'Instructor de educación física'),
(385, 'Instructor de tecnologías de la información'),
(386, 'Joyero'),
(387, 'Labrante'),
(388, 'Lavador de autos'),
(389, 'Lavandero'),
(390, 'Limpiador de fachadas'),
(391, 'Limpiador de ventanas'),
(392, 'Locutor'),
(393, 'Maquinista de locomotoras'),
(394, 'Maquinista en navegación'),
(395, 'Mecánico'),
(396, 'Médico'),
(397, 'Medico alternativo'),
(398, 'Mensajeros'),
(399, 'Mesero'),
(400, 'Meteorólogo'),
(401, 'Modelo de modas'),
(402, 'Moldeador y machero'),
(403, 'Montador de estructuras metálicas'),
(404, 'Músico'),
(405, 'Nutricionista'),
(406, 'Odontólogo'),
(407, 'Oficial de la construcción'),
(408, 'Oficios varios'),
(409, 'Operador audiométrico'),
(410, 'Operador de instalaciones de refinación de pe'),
(411, 'Operador de máquinas'),
(412, 'Operador de montacargas'),
(413, 'Operador turístico'),
(414, 'Operario de limpieza'),
(415, 'Optómetra'),
(416, 'Orfebre'),
(417, 'Organizador de conferencias y eventos'),
(418, 'Panadero'),
(419, 'Parrillero'),
(420, 'Periodistas'),
(421, 'Personal de servicios de protección'),
(422, 'Personal de servicios funerarios'),
(423, 'Pescador'),
(424, 'Piloto'),
(425, 'Pintor'),
(426, 'Profesional de gestión y de talento humano'),
(427, 'Profesional de la protección medio ambiental'),
(428, 'Psicólogo'),
(429, 'Publicista'),
(430, 'Químico'),
(431, 'Radiólogo oral'),
(432, 'Recolector de basura'),
(433, 'Relacionista publico'),
(434, 'Reparador'),
(435, 'Revisor fiscal '),
(436, 'Revocador'),
(437, 'Sastre'),
(438, 'Silvicultor'),
(439, 'Socilogo'),
(440, 'Soldador'),
(441, 'Sombrerero'),
(442, 'Supervisor'),
(443, 'Surtidor'),
(444, 'Tapicero'),
(445, 'Tejedor'),
(446, 'Telefonista'),
(447, 'Terapeuta'),
(448, 'Topógrafo'),
(449, 'Trabajador de cuidados personales a domicilio'),
(450, 'Trabajador de cultivos'),
(451, 'Trabajador de jardinería y horticultura'),
(452, 'Trabajador de servicios de transporte'),
(453, 'Trabajador forestal'),
(454, 'Trabajador pecuario'),
(455, 'Trabajador Social'),
(456, 'Vendedor'),
(457, 'Veterinarios'),
(458, 'Zapatero'),
(459, 'Zoólogo '),
(460, 'Zootecnista');

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
-- Estructura de tabla para la tabla `detalleimageninmueble`
--

DROP TABLE IF EXISTS `detalleimageninmueble`;
CREATE TABLE IF NOT EXISTS `detalleimageninmueble` (
  `iddetalleImagenInmueble` int(11) NOT NULL AUTO_INCREMENT,
  `imagenes_idimagen` int(11) NOT NULL,
  `inmuebles_idinmueble` int(11) NOT NULL,
  PRIMARY KEY (`iddetalleImagenInmueble`),
  KEY `fk_detalleImagenInmueble_imagenes1_idx` (`imagenes_idimagen`),
  KEY `fk_detalleImagenInmueble_inmuebles1_idx` (`inmuebles_idinmueble`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detallevideoinmueble`
--

DROP TABLE IF EXISTS `detallevideoinmueble`;
CREATE TABLE IF NOT EXISTS `detallevideoinmueble` (
  `iddetalleVideoInmueble` int(11) NOT NULL AUTO_INCREMENT,
  `videos_idvideo` int(11) NOT NULL,
  `inmuebles_idinmueble` int(11) NOT NULL,
  PRIMARY KEY (`iddetalleVideoInmueble`),
  KEY `fk_detalleVideoInmueble_videos1_idx` (`videos_idvideo`),
  KEY `fk_detalleVideoInmueble_inmuebles1_idx` (`inmuebles_idinmueble`)
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
  `cedulaEmpleado` int(11) NOT NULL,
  `idEsCivil` int(11) DEFAULT NULL,
  `idGeneroEmpleado` int(11) DEFAULT NULL,
  `idCiudadEmpleado` int(11) DEFAULT NULL,
  `idProfesionEmpleado` int(11) DEFAULT NULL,
  PRIMARY KEY (`idempleado`),
  KEY `fk_empleados_tiposEmpleados1_idx` (`idtipoEmpleado`),
  KEY `idEsCivil` (`idEsCivil`),
  KEY `idGeneroEmpleado` (`idGeneroEmpleado`),
  KEY `idCiudadEmpleado` (`idCiudadEmpleado`),
  KEY `idProfesionEmpleado` (`idProfesionEmpleado`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estadocivil`
--

DROP TABLE IF EXISTS `estadocivil`;
CREATE TABLE IF NOT EXISTS `estadocivil` (
  `idEstadoCivil` int(11) NOT NULL AUTO_INCREMENT,
  `nombreEstadoCivil` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`idEstadoCivil`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `estadocivil`
--

INSERT INTO `estadocivil` (`idEstadoCivil`, `nombreEstadoCivil`) VALUES
(15, 'Soltero'),
(16, 'Casado'),
(17, 'Viudo'),
(18, 'Separado'),
(19, 'Divorciado'),
(20, 'Unión marital de hec'),
(21, 'Comprometido');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estados`
--

DROP TABLE IF EXISTS `estados`;
CREATE TABLE IF NOT EXISTS `estados` (
  `idestado` int(11) NOT NULL AUTO_INCREMENT,
  `nombreEstado` varchar(45) NOT NULL,
  PRIMARY KEY (`idestado`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `estados`
--

INSERT INTO `estados` (`idestado`, `nombreEstado`) VALUES
(5, 'Registrado'),
(6, 'Publicado'),
(7, 'Arrendado'),
(8, 'Vendido');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estratos`
--

DROP TABLE IF EXISTS `estratos`;
CREATE TABLE IF NOT EXISTS `estratos` (
  `idestrato` int(11) NOT NULL AUTO_INCREMENT,
  `nombreEstrato` varchar(1) NOT NULL,
  PRIMARY KEY (`idestrato`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `estratos`
--

INSERT INTO `estratos` (`idestrato`, `nombreEstrato`) VALUES
(7, '1'),
(8, '2'),
(9, '3'),
(10, '4'),
(11, '5'),
(12, '6');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estructurascocinas`
--

DROP TABLE IF EXISTS `estructurascocinas`;
CREATE TABLE IF NOT EXISTS `estructurascocinas` (
  `idestructuraCocina` int(11) NOT NULL AUTO_INCREMENT,
  `nombreEstructuraCocina` varchar(45) NOT NULL,
  PRIMARY KEY (`idestructuraCocina`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `estructurascocinas`
--

INSERT INTO `estructurascocinas` (`idestructuraCocina`, `nombreEstructuraCocina`) VALUES
(3, 'Abierta'),
(4, 'Cerrada');

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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `generos`
--

INSERT INTO `generos` (`idGenero`, `nombreGenero`) VALUES
(5, 'Masculino'),
(6, 'Femenino');

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
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;

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
(19, 'Eventos', 'Client/event', 8, NULL, 6, '');

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
) ENGINE=InnoDB AUTO_INCREMENT=1673 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `profesiones`
--

INSERT INTO `profesiones` (`idprofesion`, `nombreProfesion`, `nivelProfesion_idnivelProfesion`) VALUES
(837, 'Administración agropecuaria', 1),
(838, 'Administración bancaria y financiera', 1),
(839, 'Administración de comercio exterior', 1),
(840, 'Administración de construcciones', 1),
(841, 'Administración de costos y auditoria', 1),
(842, 'Administración de empresas', 1),
(843, 'Administración de empresas agropecuarias', 1),
(844, 'Administración de la construcción', 1),
(845, 'Administración de obras civiles', 1),
(846, 'Administración de servicio de salud', 1),
(847, 'Administración empresarial e informática', 1),
(848, 'Administración hospitalaria', 1),
(849, 'Administración hotelera', 1),
(850, 'Administración industrial', 1),
(851, 'Administración informática', 1),
(852, 'Administración inmobiliaria', 1),
(853, 'Administración municipal', 1),
(854, 'Administración turística', 1),
(855, 'Administración turística y hotelera', 1),
(856, 'Administración y auditoria de sistemas', 1),
(857, 'Administración y avalúos de finca raíz', 1),
(858, 'Administración y finanzas', 1),
(859, 'Administración y mercadotecnia', 1),
(860, 'Administrativo en contabilidad y finanzas', 1),
(861, 'Administrativo en relaciones industriales', 1),
(862, 'Admón. Bancaria de instituciones financier', 1),
(863, 'Admón. De empresas con énfasis en agroindu', 1),
(864, 'Admón. De empresas de economía solidaria', 1),
(865, 'Admón. De planteles de educa. Básica primar', 1),
(866, 'Agropecuaria', 1),
(867, 'Análisis químico industrial', 1),
(868, 'Análisis y diseño de sistemas de computación', 1),
(869, 'Análisis y programación de computadores', 1),
(870, 'Arquitectura de interiores', 1),
(871, 'Arte grafico y publicitario', 1),
(872, 'Arte publicitario', 1),
(873, 'Arte y decoración', 1),
(874, 'Auxiliar de arquitectura e ingeniería', 1),
(875, 'Balística', 1),
(876, 'Catequesis', 1),
(877, 'Ciencias contables', 1),
(878, 'Ciencias de la computación', 1),
(879, 'Citohistologia', 1),
(880, 'Cocina internacional', 1),
(881, 'Comercio exterior', 1),
(882, 'Comercio internacional', 1),
(883, 'Comercio internacional y legislación aduan', 1),
(884, 'Comercio y negocios internacionales', 1),
(885, 'Computación', 1),
(886, 'Computación y sistemas', 1),
(887, 'Confección, acabados y supervisión', 1),
(888, 'Construcción y administración de obras civile', 1),
(889, 'Construcciones', 1),
(890, 'Contabilidad', 1),
(891, 'Contabilidad comercial', 1),
(892, 'Contabilidad sistematizada', 1),
(893, 'Contabilidad y costos', 1),
(894, 'Contabilidad y finanzas', 1),
(895, 'Contaduría', 1),
(896, 'Contaduría técnica', 1),
(897, 'Costos y contabilidad', 1),
(898, 'Dactiloscopia', 1),
(899, 'Decoración de espacios arquitectónicos', 1),
(900, 'Decoración y diseño de interiores', 1),
(901, 'Delineante y auxiliar de ingeniería mecani', 1),
(902, 'Delineantes de arquitectura  e ingeniería', 1),
(903, 'Delineantes de arquitectura y decoración', 1),
(904, 'Deporte y recreación', 1),
(905, 'Dibujo arquitectónico', 1),
(906, 'Dibujo arquitectónico y de ingeniería', 1),
(907, 'Dibujo arquitectónico y decoración', 1),
(908, 'Dibujo de ingeniería mecánica y arquitectu', 1),
(909, 'Dibujo publicitario', 1),
(910, 'Diseño asistido por computador', 1),
(911, 'Diseño de alta costura', 1),
(912, 'Diseño de ambientes', 1),
(913, 'Diseño de artes graficas', 1),
(914, 'Diseño de interiores', 1),
(915, 'Diseño de maquinas', 1),
(916, 'Diseño de modas', 1),
(917, 'Diseño e industria de la moda', 1),
(918, 'Diseño grafico', 1),
(919, 'Diseño industrial', 1),
(920, 'Diseño mecánico', 1),
(921, 'Diseño publicitario', 1),
(922, 'Diseño textil', 1),
(923, 'Diseño textil y de modas', 1),
(924, 'Diseño y confección de la moda', 1),
(925, 'Diseño y decoración de ambientes', 1),
(926, 'Diseño y decoración de espacios arquitectónic', 1),
(927, 'Diseño y producción de televisión', 1),
(928, 'Documento logia', 1),
(929, 'Educación artística', 1),
(930, 'Educación básica primaria bilingüe', 1),
(931, 'Educación especial', 1),
(932, 'Educación física', 1),
(933, 'Educación física y recreación', 1),
(934, 'Educación preescolar', 1),
(935, 'Electromecánica', 1),
(936, 'Electromedicina', 1),
(937, 'Electrónica', 1),
(938, 'Electrónica industrial', 1),
(939, 'Electrónica y telecomunicaciones', 1),
(940, 'Explosivos', 1),
(941, 'Finanzas y sistemas contables', 1),
(942, 'Fotografía', 1),
(943, 'Fotografía judicial', 1),
(944, 'Fotografía y camarografita', 1),
(945, 'Gestión de pequeñas y medianas empresas', 1),
(946, 'Gestión de servicios gerontológicos', 1),
(947, 'Gestión empresarial', 1),
(948, 'Hotelería', 1),
(949, 'Identificación de automotores', 1),
(950, 'Informática contable y financiera', 1),
(951, 'Informática gerencial', 1),
(952, 'Informática secretarial', 1),
(953, 'Ingeniería agropecuaria', 1),
(954, 'Ingeniería automotriz', 1),
(955, 'Ingeniería comercial', 1),
(956, 'Ingeniería de alimentos', 1),
(957, 'Ingeniería de sistemas', 1),
(958, 'Ingeniería industrial', 1),
(959, 'Ingeniería térmica', 1),
(960, 'Ingeniería textil', 1),
(961, 'Instrumentación quirúrgica', 1),
(962, 'Inteligencia', 1),
(963, 'Laboratorio dental', 1),
(964, 'Laboratorio medico', 1),
(965, 'Logística de producción y distribución', 1),
(966, 'Mantenimiento de computadores', 1),
(967, 'Mantenimiento electrónico', 1),
(968, 'Marketing internacional', 1),
(969, 'Mecánica automotriz', 1),
(970, 'Mercadeo e informática', 1),
(971, 'Mercadeo y comercialización', 1),
(972, 'Mercadeo y ventas', 1),
(973, 'Mercadeo, publicidad y ventas', 1),
(974, 'Mercado y finanzas', 1),
(975, 'Mercadotecnia', 1),
(976, 'Microempresas y cooperativas', 1),
(977, 'Minería', 1),
(978, 'Nuevas tecnologías informáticas', 1),
(979, 'Optometría', 1),
(980, 'Periodismo', 1),
(981, 'Periodismo deportivo', 1),
(982, 'Planimetría', 1),
(983, 'Policía judicial', 1),
(984, 'Procesos industriales', 1),
(985, 'Procesos mecánicos con énfasis producción agr', 1),
(986, 'Producción agropecuaria', 1),
(987, 'Producción de semillas', 1),
(988, 'Producción de televisión', 1),
(989, 'Producción y desarrollo industrial', 1),
(990, 'Programación de computadores', 1),
(991, 'Promoción social', 1),
(992, 'Publicidad', 1),
(993, 'Publicidad y diseño', 1),
(994, 'Publicidad y diseño publicitario', 1),
(995, 'Radiología medica', 1),
(996, 'Realización de video', 1),
(997, 'Recreación dirigida', 1),
(998, 'Recursos energéticos', 1),
(999, 'Relaciones industriales', 1),
(1000, 'Relaciones públicas y comunicación', 1),
(1001, 'Rendimiento deportivo', 1),
(1002, 'Salud ocupacional y seguridad industrial', 1),
(1003, 'Salud y rendimiento humano', 1),
(1004, 'Secretariado', 1),
(1005, 'Secretariado bilingüe', 1),
(1006, 'Secretariado bilingüe y de sistemas', 1),
(1007, 'Secretariado comercial', 1),
(1008, 'Secretariado contable de sistemas', 1),
(1009, 'Secretariado ejecutivo', 1),
(1010, 'Secretariado ejecutivo bilingüe', 1),
(1011, 'Secretariado ejecutivo de sistemas', 1),
(1012, 'Secretariado ejecutivo y de sistemas bilingüe', 1),
(1013, 'Secretariado gerencial', 1),
(1014, 'Seguridad e higiene industrial', 1),
(1015, 'Seguridad e higiene ocupacional', 1),
(1016, 'Servicios a bordo', 1),
(1017, 'Sistemas', 1),
(1018, 'Sistemas contables y financieros', 1),
(1019, 'Sistemas y análisis de la computación', 1),
(1020, 'Sistemas y computación', 1),
(1021, 'Sistematización', 1),
(1022, 'Técnicas agropecuarias', 1),
(1023, 'Técnicas forestales', 1),
(1024, 'Técnico de laboratorio', 1),
(1025, 'Técnico hotelero', 1),
(1026, 'Tecnología de plásticos', 1),
(1027, 'Telecomunicaciones', 1),
(1028, 'Topografía', 1),
(1029, 'Turismo', 1),
(1030, 'Agrícola', 2),
(1031, 'Agroindustrial', 2),
(1032, 'Agropecuaria', 2),
(1033, 'Bilingüe en administración de empresas', 2),
(1034, 'Bilingüe en comercio exterior', 2),
(1035, 'De alimentos', 2),
(1036, 'Deportiva', 2),
(1037, 'Eléctrica', 2),
(1038, 'Electrónica', 2),
(1039, 'Empresarial', 2),
(1040, 'Empresarial y de negocios', 2),
(1041, 'Acuicultura', 2),
(1042, 'Administración aeronáutica', 2),
(1043, 'Administración agropecuaria', 2),
(1044, 'Administración bancaria', 2),
(1045, 'Administración comercial', 2),
(1046, 'Administración comercial y financiera', 2),
(1047, 'Administración de empresas', 2),
(1048, 'Administración de empresas turísticas', 2),
(1049, 'Administración de la producción', 2),
(1050, 'Administración de la producción industrial', 2),
(1051, 'Administración de negocios', 2),
(1052, 'Administración de obras civiles', 2),
(1053, 'Administración de oficinas', 2),
(1054, 'Administración de oficinas bilingües', 2),
(1055, 'Administración de personal', 2),
(1056, 'Administración de redes de computadores', 2),
(1057, 'Administración de redes de datos', 2),
(1058, 'Administración de riesgos y seguros', 2),
(1059, 'Administración de seguros', 2),
(1060, 'Administración de servicios de salud', 2),
(1061, 'Administración de sistemas', 2),
(1062, 'Administración de sistemas de información', 2),
(1063, 'Administración de ventas', 2),
(1064, 'Administración del transporte', 2),
(1065, 'Administración del turismo social', 2),
(1066, 'Administración deportivas', 2),
(1067, 'Administración documental', 2),
(1068, 'Administración financiera', 2),
(1069, 'Administración hospitalaria', 2),
(1070, 'Administración hotelera', 2),
(1071, 'Administración industrial', 2),
(1072, 'Administración informática', 2),
(1073, 'Administración judicial', 2),
(1074, 'Administración municipal', 2),
(1075, 'Administración naviera y portuaria', 2),
(1076, 'Administración tributaria', 2),
(1077, 'Administración turística', 2),
(1078, 'Administración y finanzas', 2),
(1079, 'Admón. De aerolíneas y agencias de viaje', 2),
(1080, 'Admón. De empresas de economía solidaria', 2),
(1081, 'Admón. De negocios internacionales', 2),
(1082, 'Alimentos', 2),
(1083, 'Análisis y diseño de sistemas', 2),
(1084, 'Análisis y programación de computadores', 2),
(1085, 'Arte y decoración arquitectónica', 2),
(1086, 'Auditoria y control interno', 2),
(1087, 'Auditoria y costos', 2),
(1088, 'Automatización industrial', 2),
(1089, 'Banca e instituciones financieras', 2),
(1090, 'Café y diversificación', 2),
(1091, 'Cerámica', 2),
(1092, 'Cine y fotografía', 2),
(1093, 'Citohistologia', 2),
(1094, 'Comercio exterior', 2),
(1095, 'Comercio internacional', 2),
(1096, 'Computación', 2),
(1097, 'Computación grafica', 2),
(1098, 'Comunicación publicitaria', 2),
(1099, 'Comunicaciones aeronáuticas', 2),
(1100, 'Conmutación', 2),
(1101, 'Construcción', 2),
(1102, 'Construcción de obras civiles', 2),
(1103, 'Contabilidad', 2),
(1104, 'Contabilidad sistematizada', 2),
(1105, 'Contaduría', 2),
(1106, 'Contaduría publica', 2),
(1107, 'Control de calidad', 2),
(1108, 'Criminalística', 2),
(1109, 'Desarrollo del software', 2),
(1110, 'Dibujo arquitectónico de ingeniería', 2),
(1111, 'Dibujo industrial', 2),
(1112, 'Dirección de ventas', 2),
(1113, 'Dirección y producción de televisión', 2),
(1114, 'Diseño de interiores', 2),
(1115, 'Diseño de modas', 2),
(1116, 'Diseño grafico', 2),
(1117, 'Diseño industrial', 2),
(1118, 'Diseño textil', 2),
(1119, 'Diseño y decoración de espacios arqu', 2),
(1120, 'Docencia rural', 2),
(1121, 'Educación básica primaria', 2),
(1122, 'Educación especial', 2),
(1123, 'Educación física', 2),
(1124, 'Educación para el desarrollo de la c', 2),
(1125, 'Educación preescolar', 2),
(1126, 'Electricidad', 2),
(1127, 'Electricidad industrial', 2),
(1128, 'Electrificación y telefonía rural', 2),
(1129, 'Electromecánica', 2),
(1130, 'Electrónica aeronáutica', 2),
(1131, 'Electrónica y automatización industr', 2),
(1132, 'Electrónica y comunicaciones', 2),
(1133, 'Electrónica y telecomunicaciones', 2),
(1134, 'Electroquímica', 2),
(1135, 'Empresas turísticas y hoteleras', 2),
(1136, 'Estadística e informática', 2),
(1137, 'Estudios policiales', 2),
(1138, 'Finanzas y comercio internacional', 2),
(1139, 'Finanzas y sistemas contables', 2),
(1140, 'Fisioterapia', 2),
(1141, 'Gerontología', 2),
(1142, 'Gestión agropecuaria', 2),
(1143, 'Gestión bancaria y financiera', 2),
(1144, 'Gestión comercial y de negocios', 2),
(1145, 'Gestión de empresas asoc. Y organiz.', 2),
(1146, 'Gestión de obras civiles y construci', 2),
(1147, 'Gestión de servicios públicos sanita', 2),
(1148, 'Gestión de transportes', 2),
(1149, 'Gestión empresarial', 2),
(1150, 'Gestión empresarial y de negocios', 2),
(1151, 'Gestión industrial', 2),
(1152, 'Gestión informática', 2),
(1153, 'Gestión y administración de empresas', 2),
(1154, 'Higiene y seguridad industrial', 2),
(1155, 'Informática', 2),
(1156, 'Instrumentación industrial', 2),
(1157, 'Instrumentación quirúrgica', 2),
(1158, 'Instrumentación y controles industria', 2),
(1159, 'Investigación judicial', 2),
(1160, 'Laboratorio de prótesis dental', 2),
(1161, 'Laboratorio de rehabilitación dental', 2),
(1162, 'Laboratorio dental', 2),
(1163, 'Lácteos', 2),
(1164, 'Logística de producción distribución', 2),
(1165, 'Maderas', 2),
(1166, 'Mantenimiento aeronáutico', 2),
(1167, 'Mecánica automotriz', 2),
(1168, 'Medicina veterinaria y zootecnia', 2),
(1169, 'Mercadeo agropecuario', 2),
(1170, 'Mercadeo y comercialización', 2),
(1171, 'Mercadeo y finanzas', 2),
(1172, 'Mercadeo y negocios internacionales', 2),
(1173, 'Mercadeo y publicidad', 2),
(1174, 'Mercadeo y ventas', 2),
(1175, 'Mercadotecnia', 2),
(1176, 'Mercadotecnia y publicidad', 2),
(1177, 'Mercadotecnia y ventas', 2),
(1178, 'Minas', 2),
(1179, 'Minería', 2),
(1180, 'Negocios internacionales', 2),
(1181, 'Obras civiles', 2),
(1182, 'Periodismo', 2),
(1183, 'Plásticos', 2),
(1184, 'Producción agraria', 2),
(1185, 'Producción agrícola', 2),
(1186, 'Producción agropecuaria', 2),
(1187, 'Producción animal', 2),
(1188, 'Producción industrial', 2),
(1189, 'Promoción social', 2),
(1190, 'Publicidad', 2),
(1191, 'Publicidad y comercialización', 2),
(1192, 'Publicidad y comunicación', 2),
(1193, 'Publicidad y mercadeo', 2),
(1194, 'Química de productos vegetales', 2),
(1195, 'Química industrial', 2),
(1196, 'Radiología e imágenes', 2),
(1197, 'Recreación dirigida', 2),
(1198, 'Recursos hídricos', 2),
(1199, 'Recursos naturales renovables', 2),
(1200, 'Redes y comunicaciones de datos', 2),
(1201, 'Regencia de farmacia', 2),
(1202, 'Relaciones industriales', 2),
(1203, 'Salud comunitaria', 2),
(1204, 'Salud ocupacional', 2),
(1205, 'Saneamiento ambiental', 2),
(1206, 'Secretariado bilingüe', 2),
(1207, 'Secretariado bilingüe y computación', 2),
(1208, 'Secretariado comercial bilingüe', 2),
(1209, 'Secretariado ejecutivo', 2),
(1210, 'Secretariado ejecutivo bilingüe', 2),
(1211, 'Secretariado ejecutivo bilingüe espa', 2),
(1212, 'Secretariado ejecutivo con énfasis e', 2),
(1213, 'Seguridad aeronáutica', 2),
(1214, 'Seguridad e higiene ocupacional', 2),
(1215, 'Sistemas', 2),
(1216, 'Sistemas contables', 2),
(1217, 'Sistemas de información', 2),
(1218, 'Sistemas de información en salud', 2),
(1219, 'Sistemas industriales', 2),
(1220, 'Sistemas y computación', 2),
(1221, 'Sistematización de datos', 2),
(1222, 'Supervisión de industria y comercio', 2),
(1223, 'Terapia del lenguaje', 2),
(1224, 'Terapia recreativa', 2),
(1225, 'Terapia respiratoria', 2),
(1226, 'Textiles y moda', 2),
(1227, 'Topografía', 2),
(1228, 'Traducción turística', 2),
(1229, 'Tributación', 2),
(1230, 'Turismo recreativo', 2),
(1231, 'Turismo y relaciones industriales', 2),
(1232, 'Zootecnia', 2),
(1233, 'Forestal', 2),
(1234, 'Industrial', 2),
(1235, 'Mecánica', 2),
(1236, 'Naval en electromecánica', 2),
(1237, 'Naval en electrónica', 2),
(1238, 'Naviera', 2),
(1239, 'Pecuaria', 2),
(1240, 'Química', 2),
(1241, 'Textil', 2),
(1242, 'Abogado', 3),
(1243, 'Administración', 3),
(1244, 'Administración aeronáutica', 3),
(1245, 'Administración agroindustrial', 3),
(1246, 'Administración agropecuaria', 3),
(1247, 'Administración de comercio exterior', 3),
(1248, 'Administración de desarrollo agroindustrial', 3),
(1249, 'Administración de empresas', 3),
(1250, 'Administración de empresas agrarias', 3),
(1251, 'Administración de empresas agroindustriales', 3),
(1252, 'Administración de empresas agropecuarias', 3),
(1253, 'Administración de empresas cooperativas', 3),
(1254, 'Administración de empresas turísticas', 3),
(1255, 'Administración de empresas turísticas y hotel', 3),
(1256, 'Administración de instituciones de servicio', 3),
(1257, 'Administración de mercadeo agropecuario', 3),
(1258, 'Administración de negocios', 3),
(1259, 'Administración de negocios con énfasis en fin', 3),
(1260, 'Administración de obras civiles', 3),
(1261, 'Administración de recursos costeros y marinos', 3),
(1262, 'Administración de sistemas de información', 3),
(1263, 'Administración del desarrollo social', 3),
(1264, 'Administración del medio ambiente', 3),
(1265, 'Administración empresarial y publica', 3),
(1266, 'Administración en recursos humanos', 3),
(1267, 'Administración financiera', 3),
(1268, 'Administración financiera y de sistemas', 3),
(1269, 'Administración hotelera', 3),
(1270, 'Administración hotelera y de turismo', 3),
(1271, 'Administración industrial', 3),
(1272, 'Administración informática', 3),
(1273, 'Administración marítima', 3),
(1274, 'Administración para el desarrollo regional', 3),
(1275, 'Administración policial', 3),
(1276, 'Administración regional y urbana', 3),
(1277, 'Administración turística y hotelera', 3),
(1278, 'Administración y finanzas', 3),
(1279, 'Admon. Empresas nefas. Desarrollo de la capac', 3),
(1280, 'Agrología', 3),
(1281, 'Agronomía', 3),
(1282, 'Anatomopatologo', 3),
(1283, 'Antropología', 3),
(1284, 'Arquitectura', 3),
(1285, 'Arquitectura de interiores', 3),
(1286, 'Arquitectura y urbanismo', 3),
(1287, 'Artes escénicas', 3),
(1288, 'Artes musicales', 3),
(1289, 'Artes plásticas', 3),
(1290, 'Artes representativas', 3),
(1291, 'Bachiller académico', 3),
(1292, 'Bacteriología', 3),
(1293, 'Bacteriología y laboratorio clínico', 3),
(1294, 'Bellas artes', 3),
(1295, 'Bibliotecología', 3),
(1296, 'Bibliotecología y archivística', 3),
(1297, 'Biología con énfasis en biotecnología', 3),
(1298, 'Biología con énfasis en recursos naturales', 3),
(1299, 'Biología marina', 3),
(1300, 'Biología y química', 3),
(1301, 'Biólogo', 3),
(1302, 'Castellano - literatura', 3),
(1303, 'Ciencia política', 3),
(1304, 'Ciencias de enfermería y biología', 3),
(1305, 'Ciencias de la comercialización', 3),
(1306, 'Ciencias de la información y la documentación', 3),
(1307, 'Ciencias del deporte', 3),
(1308, 'Ciencias políticas', 3),
(1309, 'Ciencias políticas y administrativas', 3),
(1310, 'Cine y televisión', 3),
(1311, 'Comercio exterior', 3),
(1312, 'Comercio internacional', 3),
(1313, 'Comunicación social', 3),
(1314, 'Comunicación social énfasis en producción y a', 3),
(1315, 'Comunicación social formación básica en perio', 3),
(1316, 'Comunicación social institucional', 3),
(1317, 'Comunicación social- periodismo', 3),
(1318, 'Conservación y restauración de bienes muebles', 3),
(1319, 'Construcción', 3),
(1320, 'Contaduría publica', 3),
(1321, 'Contaduría pública- énfasis en sistemas y eco', 3),
(1322, 'Criminalística', 3),
(1323, 'Cultura física y deporte', 3),
(1324, 'Deporte y recreación', 3),
(1325, 'Derecho', 3),
(1326, 'Derecho ciencias políticas y sociales', 3),
(1327, 'Derecho y ciencias administrativas', 3),
(1328, 'Derecho y ciencias políticas', 3),
(1329, 'Derecho y ciencias sociales', 3),
(1330, 'Desarrollo familiar', 3),
(1331, 'Dibujo arquitectónico', 3),
(1332, 'Dirección musical', 3),
(1333, 'Dirección y producción de radio y televisión', 3),
(1334, 'Diseño de modas y textiles', 3),
(1335, 'Diseño grafico', 3),
(1336, 'Diseño industrial', 3),
(1337, 'Diseño visual', 3),
(1338, 'Ecología', 3),
(1339, 'Economía', 3),
(1340, 'Economía agraria', 3),
(1341, 'Economía agrícola', 3),
(1342, 'Economía de empresas', 3),
(1343, 'Economía general', 3),
(1344, 'Economía industrial', 3),
(1345, 'Economía y desarrollo', 3),
(1346, 'Educación musical', 3),
(1347, 'Ejecución instrumental', 3),
(1348, 'Enfermería', 3),
(1349, 'Enfermería comunitaria', 3),
(1350, 'Estadística', 3),
(1351, 'Estadística administrativa', 3),
(1352, 'Estadística e informática', 3),
(1353, 'Estudios diplomáticos en internacionales', 3),
(1354, 'Estudios en ciencia política', 3),
(1355, 'Estudios musicales', 3),
(1356, 'Estudios superiores en instrumento o canto', 3),
(1357, 'Farmacia', 3),
(1358, 'Filología e idiomas - alemán', 3),
(1359, 'Filología e idiomas - español', 3),
(1360, 'Filología e idiomas - francés', 3),
(1361, 'Filología e idiomas - humanidades', 3),
(1362, 'Filología e idiomas - ingles', 3),
(1363, 'Filología espa? Ola', 3),
(1364, 'Filosofía', 3),
(1365, 'Filosofía y humanidades', 3),
(1366, 'Filosofía y letras', 3),
(1367, 'Finanzas y comercio exterior', 3),
(1368, 'Finanzas y comercio internacional', 3),
(1369, 'Finanzas y negocios internacionales', 3),
(1370, 'Finanzas y relaciones internacionales', 3),
(1371, 'Física', 3),
(1372, 'Fisioterapia', 3),
(1373, 'Fonoaudiología', 3),
(1374, 'Geografía', 3),
(1375, 'Geología', 3),
(1376, 'Gerontología', 3),
(1377, 'Gestión empresarial', 3),
(1378, 'Guitarrista', 3),
(1379, 'Historia', 3),
(1380, 'Idiomas', 3),
(1381, 'Industrias pecuarias', 3),
(1382, 'Ingeniería administrativa', 3),
(1383, 'Ingeniería agrícola', 3),
(1384, 'Ingeniería agroindustrial', 3),
(1385, 'Ingeniería agronómica', 3),
(1386, 'Ingeniería ambiental', 3),
(1387, 'Ingeniería ambiental y sanitaria', 3),
(1388, 'Ingeniería biomédica', 3),
(1389, 'Ingeniería catastral y geodesia', 3),
(1390, 'Ingeniería civil', 3),
(1391, 'Ingeniería de alimentos', 3),
(1392, 'Ingeniería de diseño y automatización electró', 3),
(1393, 'Ingeniería de materiales', 3),
(1394, 'Ingeniería de mercados', 3),
(1395, 'Ingeniería de minas', 3),
(1396, 'Ingeniería de minas y metalurgia', 3),
(1397, 'Ingeniería de petróleos', 3),
(1398, 'Ingeniería de procesos', 3),
(1399, 'Ingeniería de producción', 3),
(1400, 'Ingeniería de producción agroindustrial', 3),
(1401, 'Ingeniería de recursos naturales y medio ambi', 3),
(1402, 'Ingeniería de sistemas', 3),
(1403, 'Ingeniería de sistemas con énfasis en admón. ', 3),
(1404, 'Ingeniería de sistemas con énfasis en softwar', 3),
(1405, 'Ingeniería de sistemas con énfasis en tele co', 3),
(1406, 'Ingeniería de sistemas de información', 3),
(1407, 'Ingeniería de sistemas y computación', 3),
(1408, 'Ingeniería de sistemas: énfasis en administra', 3),
(1409, 'Ingeniería de transporte y vías', 3),
(1410, 'Ingeniería del desarrollo ambiental', 3),
(1411, 'Ingeniería del medio ambiente', 3),
(1412, 'Ingeniería eléctrica', 3),
(1413, 'Ingeniería electricista', 3),
(1414, 'Ingeniería electromecánica', 3),
(1415, 'Ingeniería electrónica', 3),
(1416, 'Ingeniería electrónica y de computadores', 3),
(1417, 'Ingeniería electrónica y telecomunicaciones', 3),
(1418, 'Ingeniería en automatización industrial', 3),
(1419, 'Ingeniería en instrumentación y control', 3),
(1420, 'Ingeniería energética', 3),
(1421, 'Ingeniería financiera', 3),
(1422, 'Ingeniería forestal', 3),
(1423, 'Ingeniería geográfica', 3),
(1424, 'Ingeniería geológica', 3),
(1425, 'Ingeniería industrial', 3),
(1426, 'Ingeniería industrial de alimentos', 3),
(1427, 'Ingeniería mecánica', 3),
(1428, 'Ingeniería metalúrgica', 3),
(1429, 'Ingeniería naval - especialidad construccione', 3),
(1430, 'Ingeniería naval - especialidad electrónica', 3),
(1431, 'Ingeniería naval - especialidad mecánica', 3),
(1432, 'Ingeniería pesquera', 3),
(1433, 'Ingeniería química', 3),
(1434, 'Ingeniería sanitaria', 3),
(1435, 'Ingeniería telemática', 3),
(1436, 'Ingeniería textil', 3),
(1437, 'Instrumentación quirúrgica', 3),
(1438, 'Lenguas clásicas', 3),
(1439, 'Lic.  Educ. Especial- problemas del aprendiz.', 3),
(1440, 'Lic. Educ. Especial: problemas desarrollo y a', 3),
(1441, 'Lic. En ciencias religiosas énfasis catequesi', 3),
(1442, 'Lic. En ciencias sociales: gestión del desarr', 3),
(1443, 'Lic. En educación básica primaria:enf. En cie', 3),
(1444, 'Licenciatura educación preescolar y promoción', 3),
(1445, 'Licenciatura educación primaria y promoción d', 3),
(1446, 'Licenciatura en administración educativa', 3),
(1447, 'Licenciatura en administración y supervisión ', 3),
(1448, 'Licenciatura en agropecuarias', 3),
(1449, 'Licenciatura en arte dramático', 3),
(1450, 'Licenciatura en arte escénico', 3),
(1451, 'Licenciatura en artes graficas', 3),
(1452, 'Licenciatura en artes plásticas', 3),
(1453, 'Licenciatura en artes visuales', 3),
(1454, 'Licenciatura en bacteriología y ciencias natu', 3),
(1455, 'Licenciatura en básica primaria con énfasis e', 3),
(1456, 'Licenciatura en bellas artes', 3),
(1457, 'Licenciatura en biología', 3),
(1458, 'Licenciatura en biología y educación ambienta', 3),
(1459, 'Licenciatura en biología y química', 3),
(1460, 'Licenciatura en catequesis', 3),
(1461, 'Licenciatura en ciencias agropecuarias', 3),
(1462, 'Licenciatura en ciencias de la educación', 3),
(1463, 'Licenciatura en ciencias de la educación filo', 3),
(1464, 'Licenciatura en ciencias de la educación filo', 3),
(1465, 'Licenciatura en ciencias de la educación físi', 3),
(1466, 'Licenciatura en ciencias de la educación mate', 3),
(1467, 'Licenciatura en ciencias de la educación quím', 3),
(1468, 'Licenciatura en ciencias físicas', 3),
(1469, 'Licenciatura en ciencias naturales', 3),
(1470, 'Licenciatura en ciencias pedagógicas', 3),
(1471, 'Licenciatura en ciencias políticas y administ', 3),
(1472, 'Licenciatura en ciencias religiosa y éticas', 3),
(1473, 'Licenciatura en ciencias religiosas', 3),
(1474, 'Licenciatura en ciencias sociales', 3),
(1475, 'Licenciatura en ciencias sociales e historia', 3),
(1476, 'Licenciatura en ciencias sociales y construcc', 3),
(1477, 'Licenciatura en ciencias sociales y económica', 3),
(1478, 'Licenciatura en ciencias sociales y geografía', 3),
(1479, 'Licenciatura en comercio', 3),
(1480, 'Licenciatura en comercio y contaduría', 3),
(1481, 'Licenciatura en danzas y teatro', 3),
(1482, 'Licenciatura en decoración arquitectónico', 3),
(1483, 'Licenciatura en dibujo de la construcción', 3),
(1484, 'Licenciatura en dibujo mecánico', 3),
(1485, 'Licenciatura en didáctica y dificultades del ', 3),
(1486, 'Licenciatura en docencia comercial', 3),
(1487, 'Licenciatura en docencia de computadores', 3),
(1488, 'Licenciatura en docencia de procesos industri', 3),
(1489, 'Licenciatura en docencia de sistemas y comput', 3),
(1490, 'Licenciatura en docencia del área agropecuari', 3),
(1491, 'Licenciatura en docencia del diseño', 3),
(1492, 'Licenciatura en economía del hogar', 3),
(1493, 'Licenciatura en educa. Con especialidad en es', 3),
(1494, 'Licenciatura en educa. Esp. Audiov. Y psicope', 3),
(1495, 'Licenciatura en educa. Esp. Filosofía y letra', 3),
(1496, 'Licenciatura en educa. Espe. Tecnología indus', 3),
(1497, 'Licenciatura en educa. Mayores ingles y franc', 3),
(1498, 'Licenciatura en educación ambiental', 3),
(1499, 'Licenciatura en educación básica primaria', 3),
(1500, 'Licenciatura en educación- biología', 3),
(1501, 'Licenciatura en educación ciencias sociales', 3),
(1502, 'Licenciatura en educación de adultos', 3),
(1503, 'Licenciatura en educación electrónica', 3),
(1504, 'Licenciatura en educación electrotécnica', 3),
(1505, 'Licenciatura en educación español y comunicac', 3),
(1506, 'Licenciatura en educación español y lenguas', 3),
(1507, 'Licenciatura en educación especial', 3),
(1508, 'Licenciatura en educación especial- tiflologí', 3),
(1509, 'Licenciatura en educación especial: retardo e', 3),
(1510, 'Licenciatura en educación especialidad en mat', 3),
(1511, 'Licenciatura en educación física', 3),
(1512, 'Licenciatura en educación física y deportes', 3),
(1513, 'Licenciatura en educación física y recreación', 3),
(1514, 'Licenciatura en educación física ysalud', 3),
(1515, 'Licenciatura en educación francés', 3),
(1516, 'Licenciatura en educación- historia y filosof', 3),
(1517, 'Licenciatura en educación idiomas', 3),
(1518, 'Licenciatura en educación industrial', 3),
(1519, 'Licenciatura en educación infantil', 3),
(1520, 'Licenciatura en educación ingles', 3),
(1521, 'Licenciatura en educación mecánica industrial', 3),
(1522, 'Licenciatura en educación musical', 3),
(1523, 'Licenciatura en educación pedagogía musical', 3),
(1524, 'Licenciatura en educación preescolar', 3),
(1525, 'Licenciatura en educación preescolar y básica', 3),
(1526, 'Licenciatura en educación primaria', 3),
(1527, 'Licenciatura en educación psicología y pedago', 3),
(1528, 'Licenciatura en educación religiosa y moral', 3),
(1529, 'Licenciatura en educación rural', 3),
(1530, 'Licenciatura en educación teología', 3),
(1531, 'Licenciatura en educación y ciencias religios', 3),
(1532, 'Licenciatura en electricidad y electrónica', 3),
(1533, 'Licenciatura en electromecánica', 3),
(1534, 'Licenciatura en electrotecnia', 3),
(1535, 'Licenciatura en enseñanza de lenguas extranje', 3),
(1536, 'Licenciatura en español y literatura', 3),
(1537, 'Licenciatura en estudios bíblicos', 3),
(1538, 'Licenciatura en etnoeducacion y desarrollo co', 3),
(1539, 'Licenciatura en filología', 3),
(1540, 'Licenciatura en filología e idiomas ingles-fr', 3),
(1541, 'Licenciatura en filosofía', 3),
(1542, 'Licenciatura en filosofía con énfasis en teor', 3),
(1543, 'Licenciatura en filosofía e historia', 3),
(1544, 'Licenciatura en filosofía e idiomas', 3),
(1545, 'Licenciatura en filosofía y ciencias religios', 3),
(1546, 'Licenciatura en filosofía y humanidades', 3),
(1547, 'Licenciatura en filosofía y letras', 3),
(1548, 'Licenciatura en filosofía y teología', 3),
(1549, 'Licenciatura en física', 3),
(1550, 'Licenciatura en física y matemáticas', 3),
(1551, 'Licenciatura en formación estética', 3),
(1552, 'Licenciatura en geografía e historia', 3),
(1553, 'Licenciatura en historia', 3),
(1554, 'Licenciatura en historia de colombia', 3),
(1555, 'Licenciatura en historia y filosofía', 3),
(1556, 'Licenciatura en historia y filosofía', 3),
(1557, 'Licenciatura en idiomas', 3),
(1558, 'Licenciatura en idiomas español-ingles', 3),
(1559, 'Licenciatura en idiomas modernos español-fran', 3),
(1560, 'Licenciatura en idiomas modernos español-ingl', 3),
(1561, 'Licenciatura en informática', 3),
(1562, 'Licenciatura en informática educativa', 3),
(1563, 'Licenciatura en ingles', 3),
(1564, 'Licenciatura en ingles y humanidades', 3),
(1565, 'Licenciatura en lenguas modernar español y fr', 3),
(1566, 'Licenciatura en lenguas modernas', 3),
(1567, 'Licenciatura en lenguas modernas español e in', 3),
(1568, 'Licenciatura en lenguas modernas español fran', 3),
(1569, 'Licenciatura en lenguas modernas español ingl', 3),
(1570, 'Licenciatura en lenguas modernas ingles-franc', 3),
(1571, 'Licenciatura en lingüística y educación indíg', 3),
(1572, 'Licenciatura en lingüística y literatura', 3),
(1573, 'Licenciatura en literatura', 3),
(1574, 'Licenciatura en literatura y lengua espa? Ola', 3),
(1575, 'Licenciatura en matemáticas', 3),
(1576, 'Licenciatura en matemáticas y computación', 3),
(1577, 'Licenciatura en matemáticas y estadística', 3),
(1578, 'Licenciatura en matemáticas y física', 3),
(1579, 'Licenciatura en mecánica industrial', 3),
(1580, 'Licenciatura en música', 3),
(1581, 'Licenciatura en nutrición y dietética', 3),
(1582, 'Licenciatura en orientación y consejería', 3),
(1583, 'Licenciatura en pedagogía', 3),
(1584, 'Licenciatura en pedagogía infantil y familiar', 3),
(1585, 'Licenciatura en pedagogía para la salud', 3),
(1586, 'Licenciatura en pedagogía reeducativa', 3),
(1587, 'Licenciatura en pedagogía social y comunitari', 3),
(1588, 'Licenciatura en pedagogía y psicología', 3),
(1589, 'Licenciatura en preescolar', 3),
(1590, 'Licenciatura en producción agropecuaria', 3),
(1591, 'Licenciatura en promoción de  la comunidad', 3),
(1592, 'Licenciatura en psicología', 3),
(1593, 'Licenciatura en psicología educativa', 3),
(1594, 'Licenciatura en psicología y administración e', 3),
(1595, 'Licenciatura en psicología y filosofía', 3),
(1596, 'Licenciatura en psicopedagogía', 3),
(1597, 'Licenciatura en psicopedagogía y filosofía', 3),
(1598, 'Licenciatura en química', 3),
(1599, 'Licenciatura en química y biología', 3),
(1600, 'Licenciatura en sociales', 3),
(1601, 'Licenciatura en supervisión educativa', 3),
(1602, 'Licenciatura en tecnología educativa', 3),
(1603, 'Licenciatura en tecnología industrial', 3),
(1604, 'Licenciatura en teología', 3),
(1605, 'Lingüística y literatura', 3),
(1606, 'Literatura', 3),
(1607, 'Maestría en composición musical', 3),
(1608, 'Maestro en piano', 3),
(1609, 'Manejo agroforestal', 3),
(1610, 'Manejo agrologico y de post-cosecha', 3),
(1611, 'Matemáticas', 3),
(1612, 'Matemáticas y física', 3),
(1613, 'Medicina general', 3),
(1614, 'Medicina veterinaria', 3),
(1615, 'Medicina y cirugía', 3),
(1616, 'Medicina y neurocirugía', 3),
(1617, 'Medicina y radiología', 3),
(1618, 'Mercadeo', 3),
(1619, 'Mercadeo con énfasis en negocios internaciona', 3),
(1620, 'Mercadeo nacional e internacional', 3),
(1621, 'Mercadeo publicidad y ventas', 3),
(1622, 'Mercadeo y publicidad', 3),
(1623, 'Mercadología', 3),
(1624, 'Mercadotecnia', 3),
(1625, 'Mercadotecnia agroindustrial', 3),
(1626, 'Metalistería', 3),
(1627, 'Microbiología', 3),
(1628, 'Microbiología agrícola y veterinaria', 3),
(1629, 'Microbiología con énfasis en alimentos', 3),
(1630, 'Microbiología industrial', 3),
(1631, 'Música', 3),
(1632, 'Música canto', 3),
(1633, 'Música instrumental', 3),
(1634, 'Música instrumento', 3),
(1635, 'Negocios internacionales', 3),
(1636, 'Neurología infantil', 3),
(1637, 'Normalista superior', 3),
(1638, 'Nutricionista dietista', 3),
(1639, 'Oceanografía', 3),
(1640, 'Odontología', 3),
(1641, 'Optometría', 3),
(1642, 'Patología clínica', 3),
(1643, 'Pintura', 3),
(1644, 'Planeación para el desarrollo social', 3),
(1645, 'Profesional en  lenguas modernas', 3),
(1646, 'Profesional en ciencia de la información y la', 3),
(1647, 'Psicología', 3),
(1648, 'Psicología organizacional', 3),
(1649, 'Psicólogo', 3),
(1650, 'Psicopedagogía y administración educativa', 3),
(1651, 'Psiquiatría', 3),
(1652, 'Publicidad', 3),
(1653, 'Publicidad y mercadeo', 3),
(1654, 'Química', 3),
(1655, 'Química de alimentos', 3),
(1656, 'Química farmacéutica', 3),
(1657, 'Química y farmacia', 3),
(1658, 'Químico', 3),
(1659, 'Recreación', 3),
(1660, 'Relaciones económicas internacionales', 3),
(1661, 'Sacerdote', 3),
(1662, 'Sociología', 3),
(1663, 'Teatro', 3),
(1664, 'Teología', 3),
(1665, 'Terapia física', 3),
(1666, 'Terapia ocupacional', 3),
(1667, 'Terapia respiratoria', 3),
(1668, 'Terapias psicosociales', 3),
(1669, 'Textiles', 3),
(1670, 'Trabajo social', 3),
(1671, 'Traducción e interpretación ruso - español', 3),
(1672, 'Traducción simultanea', 3);

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
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tipoactividadeconomicaarrendatario`
--

INSERT INTO `tipoactividadeconomicaarrendatario` (`idtipoLaborArrendatario`, `nombreTipoLaboraArrendatario`) VALUES
(8, 'Asalariado'),
(9, 'Estudiante'),
(10, 'Socio'),
(11, 'Pensionado'),
(12, 'Jubilado'),
(13, 'Rentista'),
(14, 'Otro');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipoidentificacion`
--

DROP TABLE IF EXISTS `tipoidentificacion`;
CREATE TABLE IF NOT EXISTS `tipoidentificacion` (
  `idtipoIdentificacion` int(11) NOT NULL AUTO_INCREMENT,
  `nombreTipoIdentificacion` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idtipoIdentificacion`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tipoidentificacion`
--

INSERT INTO `tipoidentificacion` (`idtipoIdentificacion`, `nombreTipoIdentificacion`) VALUES
(4, 'Cedula de ciudadania'),
(5, 'Cedula Nit'),
(6, 'Cedula de extranjería');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipopersonacliente`
--

DROP TABLE IF EXISTS `tipopersonacliente`;
CREATE TABLE IF NOT EXISTS `tipopersonacliente` (
  `idtipoPersonCliente` int(11) NOT NULL AUTO_INCREMENT,
  `nombreTipoPersonaCliente` varchar(45) NOT NULL COMMENT 'Tipo persona Juridica o natural',
  PRIMARY KEY (`idtipoPersonCliente`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tipopersonacliente`
--

INSERT INTO `tipopersonacliente` (`idtipoPersonCliente`, `nombreTipoPersonaCliente`) VALUES
(3, 'Natural'),
(4, 'Jurídica');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tiporeferencia`
--

DROP TABLE IF EXISTS `tiporeferencia`;
CREATE TABLE IF NOT EXISTS `tiporeferencia` (
  `idtipoReferencia` int(11) NOT NULL AUTO_INCREMENT,
  `nombreTipoReferencia` varchar(45) NOT NULL,
  PRIMARY KEY (`idtipoReferencia`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tiporeferencia`
--

INSERT INTO `tiporeferencia` (`idtipoReferencia`, `nombreTipoReferencia`) VALUES
(3, 'Personal'),
(4, 'Familiar');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tiposclientes`
--

DROP TABLE IF EXISTS `tiposclientes`;
CREATE TABLE IF NOT EXISTS `tiposclientes` (
  `idtipoCliente` int(11) NOT NULL AUTO_INCREMENT,
  `nombreTipoCliente` varchar(45) NOT NULL,
  PRIMARY KEY (`idtipoCliente`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tiposclientes`
--

INSERT INTO `tiposclientes` (`idtipoCliente`, `nombreTipoCliente`) VALUES
(5, 'Comprador'),
(6, 'Vendedor'),
(7, 'Arrendador'),
(8, 'Arrendatario');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tiposcocinas`
--

DROP TABLE IF EXISTS `tiposcocinas`;
CREATE TABLE IF NOT EXISTS `tiposcocinas` (
  `idtipoCocina` int(11) NOT NULL AUTO_INCREMENT,
  `nombreTipoCocina` varchar(45) NOT NULL,
  PRIMARY KEY (`idtipoCocina`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tiposcocinas`
--

INSERT INTO `tiposcocinas` (`idtipoCocina`, `nombreTipoCocina`) VALUES
(4, 'Gas'),
(5, 'Eléctrica'),
(6, 'Mixta');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tiposcortinas`
--

DROP TABLE IF EXISTS `tiposcortinas`;
CREATE TABLE IF NOT EXISTS `tiposcortinas` (
  `idtipoCortina` int(11) NOT NULL AUTO_INCREMENT,
  `nombreTipoCortina` varchar(45) NOT NULL,
  PRIMARY KEY (`idtipoCortina`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tiposcortinas`
--

INSERT INTO `tiposcortinas` (`idtipoCortina`, `nombreTipoCortina`) VALUES
(3, 'Cortinas'),
(4, 'Persianas');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tiposdestacados`
--

DROP TABLE IF EXISTS `tiposdestacados`;
CREATE TABLE IF NOT EXISTS `tiposdestacados` (
  `idtipoDestacado` int(11) NOT NULL AUTO_INCREMENT,
  `nombreDestacado` varchar(45) NOT NULL,
  PRIMARY KEY (`idtipoDestacado`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tiposdestacados`
--

INSERT INTO `tiposdestacados` (`idtipoDestacado`, `nombreDestacado`) VALUES
(4, 'Alto'),
(5, 'Medio'),
(6, 'Bajo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tiposempleados`
--

DROP TABLE IF EXISTS `tiposempleados`;
CREATE TABLE IF NOT EXISTS `tiposempleados` (
  `idtipoEmpleado` int(11) NOT NULL AUTO_INCREMENT,
  `nombreTipoEmpleado` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idtipoEmpleado`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tiposempleados`
--

INSERT INTO `tiposempleados` (`idtipoEmpleado`, `nombreTipoEmpleado`) VALUES
(9, 'Gerente'),
(10, 'Secretaria'),
(11, 'Abogado'),
(12, 'Contador'),
(13, 'Auxiliar de arrendamientos'),
(14, 'Asesor comercial'),
(15, 'Mensajero');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tiposempresas`
--

DROP TABLE IF EXISTS `tiposempresas`;
CREATE TABLE IF NOT EXISTS `tiposempresas` (
  `idtipoEmpresa` int(11) NOT NULL AUTO_INCREMENT,
  `nombreTipoEmpresa` varchar(45) NOT NULL COMMENT 'privada, mixta, publica, sector solidario',
  PRIMARY KEY (`idtipoEmpresa`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tiposempresas`
--

INSERT INTO `tiposempresas` (`idtipoEmpresa`, `nombreTipoEmpresa`) VALUES
(5, 'Privada'),
(6, 'Pública'),
(7, 'Mixta'),
(8, 'Sector Solidario');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tiposeventos`
--

DROP TABLE IF EXISTS `tiposeventos`;
CREATE TABLE IF NOT EXISTS `tiposeventos` (
  `idtipoEvento` int(11) NOT NULL AUTO_INCREMENT,
  `nombreTipoEvento` varchar(45) NOT NULL,
  PRIMARY KEY (`idtipoEvento`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tiposeventos`
--

INSERT INTO `tiposeventos` (`idtipoEvento`, `nombreTipoEvento`) VALUES
(7, 'Visita inmueble'),
(8, 'Reunión interna'),
(9, 'Reunión externa'),
(10, 'Firma contrato'),
(11, 'Firma promesa compra venta'),
(12, 'Firma escrituras');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tiposinmuebles`
--

DROP TABLE IF EXISTS `tiposinmuebles`;
CREATE TABLE IF NOT EXISTS `tiposinmuebles` (
  `idtipoInmueble` int(11) NOT NULL AUTO_INCREMENT,
  `nombreTipoInmueble` varchar(45) NOT NULL,
  PRIMARY KEY (`idtipoInmueble`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tiposinmuebles`
--

INSERT INTO `tiposinmuebles` (`idtipoInmueble`, `nombreTipoInmueble`) VALUES
(7, 'Casa'),
(8, 'Apartamento'),
(9, 'Local'),
(10, 'Bodega'),
(11, 'Oficina'),
(12, 'Otro');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tiposofertas`
--

DROP TABLE IF EXISTS `tiposofertas`;
CREATE TABLE IF NOT EXISTS `tiposofertas` (
  `idtipoOferta` int(11) NOT NULL AUTO_INCREMENT,
  `nombreTipoOferta` varchar(45) NOT NULL,
  PRIMARY KEY (`idtipoOferta`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tiposofertas`
--

INSERT INTO `tiposofertas` (`idtipoOferta`, `nombreTipoOferta`) VALUES
(3, 'Arriendo'),
(4, 'Venta'),
(5, 'vacacional');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipospisos`
--

DROP TABLE IF EXISTS `tipospisos`;
CREATE TABLE IF NOT EXISTS `tipospisos` (
  `idtipoPiso` int(11) NOT NULL AUTO_INCREMENT,
  `nombreTipoPiso` varchar(45) NOT NULL,
  PRIMARY KEY (`idtipoPiso`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tipospisos`
--

INSERT INTO `tipospisos` (`idtipoPiso`, `nombreTipoPiso`) VALUES
(15, 'Madera'),
(16, 'Porcelanato'),
(17, 'Hormigon'),
(18, 'Mosaicos'),
(19, 'Piedra'),
(20, 'Alfombra'),
(21, 'Laminado'),
(22, 'Bambú'),
(23, 'Madera'),
(24, 'Linóleo'),
(25, 'Cerámica'),
(26, 'Vinilo'),
(27, 'Caucho'),
(28, 'Concreto');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipossociedad`
--

DROP TABLE IF EXISTS `tipossociedad`;
CREATE TABLE IF NOT EXISTS `tipossociedad` (
  `idtipoSociedad` int(11) NOT NULL AUTO_INCREMENT,
  `nombreTipoSociedad` varchar(45) NOT NULL,
  PRIMARY KEY (`idtipoSociedad`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tipossociedad`
--

INSERT INTO `tipossociedad` (`idtipoSociedad`, `nombreTipoSociedad`) VALUES
(8, 'Anonima'),
(9, 'Limitada'),
(10, 'Mixta'),
(11, 'Extranjera'),
(12, 'Publica'),
(13, 'Cooperativa'),
(14, 'Unipersonal');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tiposvigilancias`
--

DROP TABLE IF EXISTS `tiposvigilancias`;
CREATE TABLE IF NOT EXISTS `tiposvigilancias` (
  `idtipoVigilancia` int(11) NOT NULL AUTO_INCREMENT,
  `nombreTipoVigilancia` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idtipoVigilancia`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tiposvigilancias`
--

INSERT INTO `tiposvigilancias` (`idtipoVigilancia`, `nombreTipoVigilancia`) VALUES
(5, 'Vigilancia 24/7'),
(6, 'Diruna'),
(7, 'Nocturna'),
(8, 'Sin vigilancia');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tiposvistas`
--

DROP TABLE IF EXISTS `tiposvistas`;
CREATE TABLE IF NOT EXISTS `tiposvistas` (
  `idtipoVista` int(11) NOT NULL AUTO_INCREMENT,
  `nombreTipoVista` varchar(45) NOT NULL,
  PRIMARY KEY (`idtipoVista`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tiposvistas`
--

INSERT INTO `tiposvistas` (`idtipoVista`, `nombreTipoVista`) VALUES
(3, 'Interior'),
(4, 'Exterior');

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
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `zonas`
--

INSERT INTO `zonas` (`idzona`, `nombreZona`) VALUES
(10, 'Norte'),
(11, 'Centro'),
(12, 'Sur'),
(13, 'Oriente'),
(14, 'Occidente'),
(15, 'NorOriente'),
(16, 'NorOccidente'),
(17, 'SurOriente'),
(18, 'SurOccidente');

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
-- Filtros para la tabla `detalleimageninmueble`
--
ALTER TABLE `detalleimageninmueble`
  ADD CONSTRAINT `fk_detalleImagenInmueble_imagenes1` FOREIGN KEY (`imagenes_idimagen`) REFERENCES `imagenes` (`idimagen`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_detalleImagenInmueble_inmuebles1` FOREIGN KEY (`inmuebles_idinmueble`) REFERENCES `inmuebles` (`idinmueble`) ON DELETE NO ACTION ON UPDATE NO ACTION;

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
