INSERT INTO smn_comercial.smn_rel_oferta_cliente
(
	smn_rel_oferta_cliente_id,
	smn_oferta_id,
	smn_cliente_id,
	roc_estatus_proceso,
	roc_fecha_aprobacion,
	roc_fecha_vigencia_desde,
	roc_fecha_vigencia_hasta,
	roc_fecha_cierre,
	roc_fecha_registro
)
VALUES
(
	${seq:nextval@smn_comercial.seq_smn_rel_oferta_cliente},
	?,
	?,
	?,
	?,
	?,
	?,
	?,
	{d '${def:date}'}
)
