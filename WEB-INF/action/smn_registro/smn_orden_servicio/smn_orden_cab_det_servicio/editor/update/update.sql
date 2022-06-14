UPDATE smn_comercial.smn_orden_cab_det_servicio SET
	smn_orden_servicio_id=${fld:smn_orden_servicio_id},
	ocd_estatus=${fld:ocd_estatus},
	ocd_observacion=${fld:ocd_observacion},
	ocd_idioma='${def:locale}',
	ocd_usuario='${def:user}',
	ocd_fecha_registro={d '${def:date}'},
	ocd_hora='${def:time}'

WHERE
	smn_orden_cab_det_servicio_id=${fld:id}

