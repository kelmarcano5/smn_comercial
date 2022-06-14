INSERT INTO smn_comercial.smn_rel_centro_facturacion_usuario
(
	smn_rel_centro_facturacion_usuario_id,
	smn_centro_facturacion_id,
	smn_usuario_rf,
	rfu_vigencia,
	rfu_estatus,
	rfu_idioma,
	rfu_usuario,
	rfu_fecha_registro,
	rfu_hora
)
VALUES
(
	${seq:nextval@smn_comercial.seq_smn_rel_centro_facturacion_usuario},
	?,
	?,
	?,
	?,
	'${def:locale}',
	'${def:user}',
	{d '${def:date}'},
	'${def:time}'
)
