DROP FUNCTION IF EXISTS loadIdEmployee;

DELIMITER //
CREATE FUNCTION loadIdEmployee (vnameemployee VARCHAR(200)) RETURNS INT
    READS SQL DATA
    DETERMINISTIC
    COMMENT 'Funcion que trae el empleado que atiende un evento'
BEGIN 
    
    DECLARE videmployee INT;      
    SET videmployee = (SELECT emp.idempleado as idempleado
							FROM empleados emp 
							where CONCAT(emp.primerNombreEmpleado, ' ', 
							emp.segundoNombreEmpleado, ' ', emp.primerApellidoEmpleado , ' ', 
							emp.segundoApellidoEmpleado) = vnameemployee limit 1);
    RETURN videmployee;
END//
DELIMITER ;