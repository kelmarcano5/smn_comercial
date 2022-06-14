INSERT INTO smn_comercial.smn_tipo_pedido
(
	smn_tipo_pedido_id,
	tpp_codigo,
	tpp_descripcion,
	tpp_estatus,
	tpp_fecha_vigencia,
	tpp_fecha_registro
)
VALUES
(
	${seq:nextval@smn_comercial.seq_smn_tipo_pedido},
	?,
	?,
	?,
	?,
	{d '${def:date}'}
)
