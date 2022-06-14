INSERT INTO smn_comercial.smn_ingredientes
(
	smn_ingredientes_id,
	smn_solicitud_servicio_entregas_detalle_id,
	smn_item_rf,
	smn_unidad_medida_rf,
	igs_cantidad,
	igs_precio,
	smn_moneda_rf,
	igs_precio_ma,
	igs_monto_moneda_local,
	igs_monto_moneda_alterna,
	igs_fecha_registro
)
VALUES
(
	${seq:nextval@smn_comercial.seq_smn_ingredientes},
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
