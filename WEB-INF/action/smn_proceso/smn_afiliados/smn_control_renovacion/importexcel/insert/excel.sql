INSERT INTO smn_comercial.smn_control_renovacion
(
	smn_control_renovacion_id,
	smn_afiliado_id,
	smn_pedido_id,
	crn_fecha_renovacion,
	crn_fecha_vigencia_hasta,
	crn_estatus,
	crn_fecha_registro
)
VALUES
(
	${seq:nextval@smn_comercial.seq_smn_control_renovacion},
	?,
	?,
	?,
	?,
	?,
	{d '${def:date}'}
)
