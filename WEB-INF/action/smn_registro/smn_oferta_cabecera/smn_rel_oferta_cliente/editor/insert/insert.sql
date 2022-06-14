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
	roc_idioma,
	roc_usuario,
	roc_fecha_registro,
	roc_hora
)
VALUES
(
	${seq:currval@smn_comercial.seq_smn_rel_oferta_cliente},
	${fld:smn_oferta_id},
	${fld:smn_cliente_id},
	${fld:roc_estatus_proceso},
	${fld:roc_fecha_aprobacion},
	{d '${def:date}'},
	{d '${def:date}'},
	${fld:roc_fecha_cierre},
	'${def:locale}',
	'${def:user}',
	{d '${def:date}'},
	'${def:time}'
)
