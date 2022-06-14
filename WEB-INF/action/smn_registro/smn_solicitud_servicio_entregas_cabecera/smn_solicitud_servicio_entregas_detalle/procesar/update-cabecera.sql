UPDATE smn_comercial.smn_solicitud_servicio_entregas_cabecera SET
	sec_tiempo_sug_preparacion=${fld:tiempo},
	sec_monto_ml=${fld:monto},
	sec_estatus_proceso='EP',
	sec_idioma='${def:locale}',
	sec_usuario='${def:user}',
	sec_fecha_registro={d '${def:date}'},
	sec_hora='${def:time}'

WHERE
	smn_solicitud_servicio_entregas_cabecera_id=${fld:id2}