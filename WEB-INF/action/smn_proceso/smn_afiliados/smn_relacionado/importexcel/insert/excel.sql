INSERT INTO smn_comercial.smn_relacionado
(
	smn_relacionado_id,
	smn_afiliados_id,
	rel_auxiliar_rf,
	rel_fecha_inicio,
	rel_fecha_final,
	rel_fecha_desafiliado,
	rel_estatus,
	rel_fecha_registro
)
VALUES
(
	${seq:nextval@smn_comercial.seq_smn_relacionado},
	?,
	?,
	?,
	?,
	?,
	?,
	{d '${def:date}'}
)
