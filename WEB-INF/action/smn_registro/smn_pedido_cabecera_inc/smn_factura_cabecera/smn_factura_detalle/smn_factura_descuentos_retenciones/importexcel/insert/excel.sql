INSERT INTO smn_comercial.smn_factura_descuentos_retenciones
(
	smn_factura_descuentos_retenciones_id,
	smn_factura_detalle_id,
	smn_descuentos_retenciones_rf,
	fdr_monto_base_ml,
	fdr_porcentaje_descuento,
	fdr_monto_descuento_ml,
	smn_moneda_rf,
	smn_tasa_rf,
	fdr_monto_descuento_ma,
	fdr_fecha_registro
)
VALUES
(
	${seq:nextval@smn_comercial.seq_smn_factura_descuentos_retenciones},
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
