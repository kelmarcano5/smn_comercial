INSERT INTO smn_comercial.smn_factura_kits
(
	smn_factura_kits_id,
	smn_factura_detalle_id,
	smn_item_origen_rf,
	smn_item_destino_rf,
	fki_cantidad,
	fki_precio_ml,
	fki_monto_ml,
	smn_moneda_rf,
	smn_tasa_rf,
	smn_precio_ma_rf,
	fki_monto_ma_rf,
	fki_estatus,
	fki_idioma,
	fki_usuario,
	fki_fecha_registro,
	fki_hora
)
VALUES
(
	${seq:currval@smn_comercial.seq_smn_factura_kits},
	${fld:smn_factura_detalle_id},
	${fld:smn_item_origen_rf},
	${fld:smn_item_destino_rf},
	${fld:fki_cantidad},
	${fld:fki_precio_ml},
	${fld:fki_monto_ml},
	${fld:smn_moneda_rf},
	${fld:smn_tasa_rf},
	${fld:smn_precio_ma_rf},
	${fld:fki_monto_ma_rf},
	${fld:fki_estatus},
	'${def:locale}',
	'${def:user}',
	{d '${def:date}'},
	'${def:time}'
)
