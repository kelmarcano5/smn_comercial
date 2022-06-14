UPDATE smn_comercial.smn_orden_servicio SET
	smn_documento_id=${fld:smn_documento_id},
	ors_numero=${fld:ors_numero},
	smn_cliente_id=${fld:smn_cliente_id},
	ors_descripcion=${fld:ors_descripcion},
	ors_fecha_inicial=${fld:ors_fecha_inicial},
	ors_fecha_final=${fld:ors_fecha_final},
	ors_hora_inicial=${fld:ors_hora_inicial},
	ors_hora_final=${fld:ors_hora_final},
	smn_prestador_servicio_rf=${fld:smn_prestador_servicio_rf},
	ors_observacion=${fld:ors_observacion},
	ors_estatus=${fld:ors_estatus},
	ors_idioma='${def:locale}',
	ors_usuario='${def:user}',
	ors_fecha_registro={d '${def:date}'},
	ors_hora='${def:time}'

WHERE
	smn_orden_servicio_id=${fld:id}

