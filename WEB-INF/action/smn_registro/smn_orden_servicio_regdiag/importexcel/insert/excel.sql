INSERT INTO smn_comercial.smn_orden_servicio
(
	smn_orden_servicio_id,
	smn_documento_id,
	ors_numero,
	smn_cliente_id,
	ors_descripcion,
	ors_fecha_inicial,
	ors_fecha_final,
	ors_hora_inicial,
	ors_hora_final,
	smn_prestador_servicio_rf,
	ors_observacion,
	ors_estatus,
	ors_fecha_registro
)
VALUES
(
	${seq:nextval@smn_comercial.seq_smn_orden_servicio},
	?,
	?,
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