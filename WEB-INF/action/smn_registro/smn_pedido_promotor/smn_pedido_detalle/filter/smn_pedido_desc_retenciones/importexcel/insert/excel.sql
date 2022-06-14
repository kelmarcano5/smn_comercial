INSERT INTO smn_comercial.smn_pedido_desc_retenciones
(
	smn_pedido_desc_retenciones_id,
	smn_pedido_detalle_id,
	smn_descuentos_retenciones_rf,
	pim_monto_base_ml,
	pim_porcentaje_retencion,
	pim_monto_descuento_retencion,
	smn_moneda_rf,
	smn_tasa_rf,
	pim_monto_descuento_ma,
	pim_fecha_registro
)
VALUES
(
	${seq:nextval@smn_comercial.seq_smn_pedido_desc_retenciones},
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
