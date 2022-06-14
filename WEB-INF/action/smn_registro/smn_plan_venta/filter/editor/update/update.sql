UPDATE smn_comercial.smn_plan_venta SET
	smn_entidades_rf=${fld:smn_entidades_rf},
	smn_sucursal_rf=${fld:smn_sucursal_rf},
	smn_area_servicio_rf=${fld:smn_area_servicio_rf},
	smn_unidad_servicio_rf=${fld:smn_unidad_servicio_rf},
	smn_almacen_rf=${fld:smn_almacen_rf},
	smn_documento_id=${fld:smn_documento_id},
	smn_servicio_rf=${fld:smn_servicio_rf},
	smn_item_rf=${fld:smn_item_rf},
	plv_semestre_rf=${fld:plv_semestre_rf},
	plv_trimestre_rf=${fld:plv_trimestre_rf},
	plv_mes_rf=${fld:plv_mes_rf},
	plv_semana_rf=${fld:plv_semana_rf},
	plv_fecha=${fld:plv_fecha},
	plv_cantidad_rf=${fld:plv_cantidad_rf},
	plv_precio_rf=${fld:plv_precio_rf},
	plv_monto_rf=${fld:plv_monto_rf},
	plv_precio_ma_rf=${fld:plv_precio_ma_rf},
	plv_monto_ma_rf=${fld:plv_monto_ma_rf},
	smn_moneda_rf=${fld:smn_moneda_rf},
	smn_tasa_rf=${fld:smn_tasa_rf},
	plv_idioma='${def:locale}',
	plv_usuario='${def:user}',
	plv_fecha_registro={d '${def:date}'},
	plv_hora='${def:time}'

WHERE
	smn_plan_venta_id=${fld:id}

