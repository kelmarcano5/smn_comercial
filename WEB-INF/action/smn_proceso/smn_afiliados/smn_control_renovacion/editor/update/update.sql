UPDATE smn_comercial.smn_control_renovacion SET
	smn_afiliado_id=${fld:smn_afiliado_id},
	smn_pedido_id=${fld:smn_pedido_id},
	crn_fecha_renovacion=${fld:crn_fecha_renovacion},
	crn_fecha_vigencia_hasta=${fld:crn_fecha_vigencia_hasta},
	crn_estatus=${fld:crn_estatus},
	crn_idioma='${def:locale}',
	crn_usuario='${def:user}',
	crn_fecha_registro={d '${def:date}'},
	crn_hora='${def:time}'

WHERE
	smn_control_renovacion_id=${fld:id}

