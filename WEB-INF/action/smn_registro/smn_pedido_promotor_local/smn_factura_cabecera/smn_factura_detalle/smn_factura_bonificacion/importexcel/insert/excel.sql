INSERT INTO smn_comercial.smn_factura_bonificacion
(
	smn_factura_bonificacion_id,
	smn_factura_detalle_id,
	smn_item_bonificar_rf,
	fbo_cantidad_origen,
	fbo_cantidad_bonificar,
	fbo_precio_original,
	fbo_monto,
	fbo_fecha_registro
)
VALUES
(
	${seq:nextval@smn_comercial.seq_smn_factura_bonificacion},
	?,
	?,
	?,
	?,
	?,
	?,
	{d '${def:date}'}
)
