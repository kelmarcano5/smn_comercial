UPDATE smn_comercial.smn_afiliados SET
	afi_estatus='AP'
WHERE
	smn_afiliados_id=${fld:id}
AND afi_fecha_final>=current_date;

UPDATE smn_comercial.smn_control_cupo_afiliado SET 
	cca_estatus='DI'
WHERE
	smn_afiliados_id=${fld:id}
