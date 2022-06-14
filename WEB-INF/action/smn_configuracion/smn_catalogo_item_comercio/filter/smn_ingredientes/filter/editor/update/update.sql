UPDATE smn_comercial.smn_ingredientes SET
	smn_solicitud_servicio_entregas_detalle_id=${fld:smn_solicitud_servicio_entregas_detalle_id},
	smn_item_rf=${fld:smn_item_rf},
	smn_unidad_medida_rf=${fld:smn_unidad_medida_rf},
	igs_cantidad=${fld:igs_cantidad},
	igs_precio=${fld:igs_precio},
	smn_moneda_rf=${fld:smn_moneda_rf},
	igs_precio_ma=${fld:igs_precio_ma},
	igs_monto_moneda_local=${fld:igs_monto_moneda_local},
	igs_monto_moneda_alterna=${fld:igs_monto_moneda_alterna},
	igs_idioma='${def:locale}',
	igs_usuario='${def:user}',
	igs_fecha_registro={d '${def:date}'},
	igs_hora='${def:time}'

WHERE
	smn_ingredientes_id=${fld:id}

