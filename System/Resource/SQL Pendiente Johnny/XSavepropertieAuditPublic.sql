DROP FUNCTION IF EXISTS savepropertieauditpublic;




DELIMITER //
CREATE FUNCTION savepropertieauditpublic (vusuario_id varchar(20), vid_register int, vdia varchar(20), vmes varchar(20), vanio varchar(5), vhora varchar(20),
vip varchar(20), vdispositivo varchar(20), vsistema_operativo varchar(20), vnavegador varchar(20)) RETURNS int(1)
    READS SQL DATA
    DETERMINISTIC
    COMMENT 'Funcion que almacena una auditoria de la busqueda de un inmueble en el portal'
BEGIN 
    DECLARE res INT DEFAULT 0;        
            insert into audit_propertie_search(usuario_id,id_register,dia,mes,anio,hora,ip,dispositivo,sistema_operativo,navegador)
            VALUES (vusuario_id,vid_register,vdia,vmes,vanio,vhora,vip,vdispositivo,vsistema_operativo,vnavegador);			       				
	    set res = 1;															 				 
	RETURN res;
	

END//
DELIMITER ;