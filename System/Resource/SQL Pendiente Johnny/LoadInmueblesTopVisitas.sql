DROP PROCEDURE IF EXISTS loadinmueblestopvisitas;

DELIMITER //
CREATE PROCEDURE loadinmueblestopvisitas (IN idfilter INT)
    COMMENT 'Procedimiento que carga los inmuebles mas visitados '
BEGIN
 
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
END//

DELIMITER ; 