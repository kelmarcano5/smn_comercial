INSERT INTO smn_comercial.smn_gestion
(
	smn_gestion_id,
	ges_codigo,
	ges_descripcion,
	smn_accion_id,
	ges_estatus,
	ges_vigencia,
	ges_idioma,
	ges_usuario,
	ges_fecha_registro,
	ges_hora
)
VALUES
(
	${seq:currval@smn_comercial.seq_smn_gestion},
	${fld:ges_codigo},
	${fld:ges_descripcion},
	${fld:smn_accion_id},
	${fld:ges_estatus},
	${fld:ges_vigencia},
	'${def:locale}',
	'${def:user}',
	{d '${def:date}'},
	'${def:time}'
)
