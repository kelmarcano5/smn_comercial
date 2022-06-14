INSERT INTO smn_comercial.smn_grupo_promotores_vendedores
(
	smn_grupo_promotores_vendedores_id,
	gpv_codigo,
	gpv_descripcion,
	gpv_estatus,
	gpv_vigencia,
	gpv_fecha_registro
)
VALUES
(
	${seq:nextval@smn_comercial.seq_smn_grupo_promotores_vendedores},
	?,
	?,
	?,
	?,
	{d '${def:date}'}
)
