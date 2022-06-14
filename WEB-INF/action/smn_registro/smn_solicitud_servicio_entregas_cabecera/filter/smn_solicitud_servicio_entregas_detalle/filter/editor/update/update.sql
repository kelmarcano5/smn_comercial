UPDATE smn_comercial.smn_solicitud_servicio_entregas_detalle SET
	smn_solicitud_servicio_entregas_cabecera_id=${fld:smn_solicitud_servicio_entregas_cabecera_id},
	smn_catalogo_item_comercio_id=${fld:smn_catalogo_item_comercio_id},
	smn_unidad_medida_rf=${fld:smn_unidad_medida_rf},
	sed_tiempo_sug_preparacion=${fld:sed_tiempo_sug_preparacion},
	sed_cantidad=${fld:sed_cantidad},
	sed_requirimientos=${fld:sed_requirimientos},
	sed_precio_ml=${fld:sed_precio_ml},
	smn_moneda_rf=${fld:smn_moneda_rf},
	sed_precio_ma=${fld:sed_precio_ma},
	sed_monto_moneda_local=${fld:sed_monto_moneda_local},
	sed_monto_moneda_alterna=${fld:sed_monto_moneda_alterna},
	sed_idioma='${def:locale}',
	sed_usuario='${def:user}',
	sed_fecha_registro={d '${def:date}'},
	sed_hora='${def:time}'

WHERE
	smn_solicitud_servicio_entregas_detalle_id=${fld:id}

