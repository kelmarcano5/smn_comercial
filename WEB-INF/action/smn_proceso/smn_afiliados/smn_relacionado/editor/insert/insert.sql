INSERT INTO smn_comercial.smn_relacionado
(
	smn_relacionado_id,
	smn_afiliados_id,
	rel_auxiliar_rf,
	rel_fecha_inicio,
	rel_fecha_final,
	rel_fecha_desafiliado,
	rel_estatus,
	rel_idioma,
	rel_usuario,
	rel_fecha_registro,
	rel_hora
)
VALUES
(
	${seq:currval@smn_comercial.seq_smn_relacionado},
	${fld:smn_afiliados_id},
	${fld:rel_auxiliar_rf},
	${fld:rel_fecha_inicio},
	${fld:rel_fecha_final},
	${fld:rel_fecha_desafiliado},
	${fld:rel_estatus},
	'${def:locale}',
	'${def:user}',
	{d '${def:date}'},
	'${def:time}'
)
