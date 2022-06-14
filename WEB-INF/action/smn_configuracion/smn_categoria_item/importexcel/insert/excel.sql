INSERT INTO smn_comercial.smn_categoria_item
(
	smn_categoria_item_id,
	cai_codigo,
	cai_descripcion,
	cai_estatus,
	cai_fecha_vigencia,
	cai_fecha_registro
)
VALUES
(
	${seq:nextval@smn_comercial.seq_smn_categoria_item},
	?,
	?,
	?,
	?,
	{d '${def:date}'}
)
