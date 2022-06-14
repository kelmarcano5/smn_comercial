
UPDATE smn_comercial.smn_evento SET
	eve_estatus='RZ' from smn_comercial.smn_reservas 
WHERE
	smn_comercial.smn_reservas.smn_evento_id=${fld:id} 
	and smn_comercial.smn_evento.smn_evento_id=${fld:id}  
	and smn_comercial.smn_reservas.res_estatus<>'AC'

	

