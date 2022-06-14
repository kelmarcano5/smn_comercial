UPDATE smn_entrega.smn_solicitud_servicio_entregas_cabecera SET
	sec_hora_despacho='${def:time}',
	sec_estatus_proceso='DE',
	sec_idioma='${def:locale}',
	sec_usuario='${def:user}',
	sec_fecha_registro={d '${def:date}'},
	sec_hora='${def:time}'

WHERE
	smn_solicitud_servicio_entregas_cabecera_id=${fld:id}