INSERT INTO smn_comercial.smn_rel_linea_comercial_item
(
	smn_rel_linea_comercial_item_id,
	smn_linea_comercial_id,
	smn_item_rf,
	rli_estatus,
	rli_vigencia,
	rli_idioma,
	rli_usuario,
	rli_fecha_registro,
	rli_hora
)
VALUES
(
	${seq:nextval@smn_comercial.seq_smn_rel_linea_comercial_item},
	?,
	?,
	?,
	?,
	'${def:locale}',
	'${def:user}',
	{d '${def:date}'},
	'${def:time}'
)
