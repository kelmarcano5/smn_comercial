UPDATE smn_entrega.smn_solicitud_servicio_entregas_cabecera SET
	sec_observacion_servicio=${fld:sec_observacion_servicio},
	sec_estatus_proceso='RE',
	sec_idioma='${def:locale}',
	sec_usuario='${def:user}',
	sec_fecha_registro={d '${def:date}'},
	sec_hora='${def:time}'

WHERE
	smn_solicitud_servicio_entregas_cabecera_id=${fld:id}

