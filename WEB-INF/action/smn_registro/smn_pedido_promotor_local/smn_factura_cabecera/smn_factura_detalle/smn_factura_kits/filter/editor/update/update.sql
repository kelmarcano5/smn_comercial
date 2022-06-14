UPDATE smn_comercial.smn_factura_kits SET
	smn_factura_detalle_id=${fld:smn_factura_detalle_id},
	smn_item_origen_rf=${fld:smn_item_origen_rf},
	smn_item_destino_rf=${fld:smn_item_destino_rf},
	fki_cantidad=${fld:fki_cantidad},
	fki_precio_ml=${fld:fki_precio_ml},
	fki_monto_ml=${fld:fki_monto_ml},
	smn_moneda_rf=${fld:smn_moneda_rf},
	smn_tasa_rf=${fld:smn_tasa_rf},
	smn_precio_ma_rf=${fld:smn_precio_ma_rf},
	fki_monto_ma_rf=${fld:fki_monto_ma_rf},
	fki_estatus=${fld:fki_estatus},
	fki_idioma='${def:locale}',
	fki_usuario='${def:user}',
	fki_fecha_registro={d '${def:date}'},
	fki_hora='${def:time}'

WHERE
	smn_factura_kits_id=${fld:id}

