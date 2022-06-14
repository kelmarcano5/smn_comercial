INSERT INTO smn_comercial.smn_tipo_pedido
(
	smn_tipo_pedido_id,
	tpp_codigo,
	tpp_descripcion,
	tpp_estatus,
	tpp_fecha_vigencia,
	tpp_idioma,
	tpp_usuario,
	tpp_fecha_registro,
	tpp_hora
)
VALUES
(
	${seq:currval@smn_comercial.seq_smn_tipo_pedido},
	${fld:tpp_codigo},
	${fld:tpp_descripcion},
	${fld:tpp_estatus},
	${fld:tpp_fecha_vigencia},
	'${def:locale}',
	'${def:user}',
	{d '${def:date}'},
	'${def:time}'
)
