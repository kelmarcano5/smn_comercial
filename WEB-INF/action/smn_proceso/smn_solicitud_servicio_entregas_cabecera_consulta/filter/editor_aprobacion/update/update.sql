UPDATE smn_entrega.smn_solicitud_servicio_entregas_cabecera SET
	sec_estatus_proceso='AS',
	sec_idioma='${def:locale}',
	sec_usuario='${def:user}',
	sec_fecha_registro={d '${def:date}'},
	sec_hora='${def:time}',
	sec_hora_inicio_preparacion=${fld:sec_hora_inicio_preparacion}

WHERE
	smn_solicitud_servicio_entregas_cabecera_id=${fld:id}

