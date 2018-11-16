DROP FUNCTION IF EXISTS saveemployee;

DELIMITER//
CREATE FUNCTION `saveemployee` (`vid` INT, `vfirstname` VARCHAR(50), `vsecondname` VARCHAR(50), `vfirstlastname` VARCHAR(50), `vsecondlastname` VARCHAR(50), `vdocumentnumber` VARCHAR(11), `vexpeditiondate` VARCHAR(50), `vbirthdate` VARCHAR(50), `vaddress` VARCHAR(45), `vhomephone` VARCHAR(10), `vmobilephone` VARCHAR(10), `vemail` VARCHAR(45), `vgender` INT, `vtypeemployee` INT, `vcityresidence` INT, `vprofession` INT, `vmaritalstatus` INT, `vcityexpedition` INT, `vfileidentification` VARCHAR(200), `vcitybirth` INT, `vmilitarycard` VARCHAR(20), `vbloodtype` INT, `vfilemilitarycard` VARCHAR(200), `vpensionFund` INT, `vseverancefund` INT, `varl` INT, `veps` INT, `vcompensationbox` INT, `vdisability` INT, `vimageemployee` VARCHAR(200), `vcontactname` VARCHAR(50), `vcontactphone` VARCHAR(10), `vcontactemail` VARCHAR(45)) RETURNS INT(1) 
	READS SQL DATA
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

	



END//