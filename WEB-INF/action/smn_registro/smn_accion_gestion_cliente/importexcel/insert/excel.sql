INSERT INTO smn_comercial.smn_accion_gestion_cliente
(
	smn_accion_gestion_cliente_id,
	smn_rel_oferta_cliente_id,
	smn_accion_id,
	ago_estatus_proceso,
	ago_fecha_seguimiento,
	ago_fecha_aprobacion,
	ago_fecha_vigencia_desde,
	ago_fecha_vigencia_hasta,
	ago_fecha_cierre,
	ago_fecha_registro
)
VALUES
(
	${seq:nextval@smn_comercial.seq_smn_accion_gestion_cliente},
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
