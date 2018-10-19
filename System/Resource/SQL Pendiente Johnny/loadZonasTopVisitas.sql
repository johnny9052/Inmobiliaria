DROP PROCEDURE IF EXISTS loadzonastopvisitas;

DELIMITER //
CREATE PROCEDURE loadzonastopvisitas (IN idfilter INT)
    COMMENT 'Procedimiento que carga las zonas mas visitadas '
BEGIN
 
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
END//

DELIMITER ; 