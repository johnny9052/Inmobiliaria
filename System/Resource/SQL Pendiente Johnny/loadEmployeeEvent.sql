DROP FUNCTION IF EXISTS loadEmployeeEvent;

DELIMITER //
CREATE FUNCTION loadEmployeeEvent (vid INT) RETURNS VARCHAR (200)
    READS SQL DATA
    DETERMINISTIC
    COMMENT 'Funcion que trae el empleado que atiende un evento'
BEGIN 
    
    DECLARE vemployee VARCHAR (200) DEFAULT '';      
    SET vemployee = SELECT CONCAT(emp.primerNombreEmpleado, ' ', 
							emp.segundoNombreEmpleado, ' ', emp.primerApellidoEmpleado , ' ', 
							emp.segundoApellidoEmpleado) as nombreempleado 
							FROM empleados 
							inner join detalleeventosempleados as det on det.eventosclientes_ideventoCliente = vid
							inner join empleados as emp on emp.idempleado = det.empleados_idempleado
							inner join eventosclientes as eve on eve.ideventoCliente = vid
							where eve.clientes_cedulaCliente = vid limit 1;
    RETURN vemployee;
END//
DELIMITER ;
