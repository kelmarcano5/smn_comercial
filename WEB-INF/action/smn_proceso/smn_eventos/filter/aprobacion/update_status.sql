UPDATE smn_comercial.smn_evento SET
	eve_estatus='AP'
WHERE
	smn_evento_id=${fld:id} 
	AND eve_fecha_inicial>=current_date
	--and eve_fecha_final<=current_date

