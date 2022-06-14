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
	${seq:nextval@smn_comercial.seq_smn_rel_usuario_linea_comercial},
	?,
	?,
	?,
	?,
	'${def:locale}',
	'${def:user}',
	{d '${def:date}'},
	'${def:time}'
)
