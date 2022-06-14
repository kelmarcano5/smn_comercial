INSERT INTO smn_comercial.smn_factura_impuestos
(
	smn_factura_impuestos_id,
	smn_factura_detalle_id,
	smn_codigos_impuestos_rf,
	fai_monto_base_ml,
	fai_porcentaje_impuesto,
	fai_monto_impuesto_ml,
	smn_moneda_rf,
	smn_tasa_rf,
	fai_monto_impuesto_ma,
	fai_fecha_registro
)
VALUES
(
	${seq:nextval@smn_comercial.seq_smn_factura_impuestos},
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
