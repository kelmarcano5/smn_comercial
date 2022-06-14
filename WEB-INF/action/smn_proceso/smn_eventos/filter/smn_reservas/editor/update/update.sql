UPDATE smn_comercial.smn_reservas SET
	smn_evento_id=${fld:smn_evento_id},
	smn_afiliado_id=${fld:smn_afiliado_id},
	smn_relacionado_id=${fld:smn_relacionado_id},
	res_cantidad=${fld:res_cantidad},
	res_estatus=${fld:res_estatus},
	res_idioma='${def:locale}',
	res_usuario='${def:user}',
	res_fecha_registro={d '${def:date}'},
	res_hora='${def:time}'

WHERE
	smn_reservas_id=${fld:id}

