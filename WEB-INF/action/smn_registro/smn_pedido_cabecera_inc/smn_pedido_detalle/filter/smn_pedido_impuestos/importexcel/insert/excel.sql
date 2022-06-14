INSERT INTO smn_comercial.smn_pedido_impuestos
(
	smn_pedido_impuestos_id,
	smn_pedido_detalle_id,
	smn_codigos_impuestos_rf,
	pim_monto_base_ml,
	pim_porcentaje_impuesto,
	pim_monto_sustraendo,
	pim_monto_impuesto,
	smn_moneda_rf,
	smn_tasa_rf,
	pim_monto_impuesto_ma,
	pim_fecha_registro
)
VALUES
(
	${seq:nextval@smn_comercial.seq_smn_pedido_impuestos},
	?,
	?,
	?,
	?,
	?,
	?,
	?,
	?,
	?,
	{d '${def:date}'}
)
