INSERT INTO smn_comercial.smn_categoria_item
(
	smn_categoria_item_id,
	cai_codigo,
	cai_descripcion,
	cai_estatus,
	cai_fecha_vigencia,
	cai_idioma,
	cai_usuario,
	cai_fecha_registro,
	cai_hora
)
VALUES
(
	${seq:currval@smn_comercial.seq_smn_categoria_item},
	${fld:cai_codigo},
	${fld:cai_descripcion},
	${fld:cai_estatus},
	{d '${def:date}'},
	'${def:locale}',
	'${def:user}',
	{d '${def:date}'},
	'${def:time}'
)
