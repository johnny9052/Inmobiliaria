DROP PROCEDURE IF EXISTS searcheventsclient;

DELIMITER //
CREATE PROCEDURE searcheventsclient(vid int)
BEGIN
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
END//
DELIMITER;
