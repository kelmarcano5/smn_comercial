INSERT INTO smn_comercial.smn_rel_usuario_linea_comercial
(
	smn_rel_usuario_linea_comercial_id,
	smn_linea_comercial_id,
	smn_usuario_rf,
	rlu_estatus,
	rlu_vigencia,
	rlu_idioma,
	rlu_usuario,
	rlu_fecha_registro,
	rlu_hora
)
VALUES
(
	${seq:currval@smn_comercial.seq_smn_rel_usuario_linea_comercial},
	${fld:smn_linea_comercial_id},
	${fld:smn_usuario_rf},
	${fld:rlu_estatus},
	${fld:rlu_vigencia},
	'${def:locale}',
	'${def:user}',
	{d '${def:date}'},
	'${def:time}'
)
