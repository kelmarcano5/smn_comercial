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
	${seq:currval@smn_comercial.seq_smn_rel_linea_comercial_item},
	${fld:smn_linea_comercial_id},
	${fld:smn_item_rf},
	${fld:rli_estatus},
	${fld:rli_vigencia},
	'${def:locale}',
	'${def:user}',
	{d '${def:date}'},
	'${def:time}'
)
