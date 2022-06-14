INSERT INTO smn_comercial.smn_grupo_promotores_vendedores
(
	smn_grupo_promotores_vendedores_id,
	gpv_codigo,
	gpv_descripcion,
	gpv_estatus,
	gpv_vigencia,
	gpv_idioma,
	gpv_usuario,
	gpv_fecha_registro,
	gpv_hora
)
VALUES
(
	${seq:currval@smn_comercial.seq_smn_grupo_promotores_vendedores},
	${fld:gpv_codigo},
	${fld:gpv_descripcion},
	${fld:gpv_estatus},
	${fld:gpv_vigencia},
	'${def:locale}',
	'${def:user}',
	{d '${def:date}'},
	'${def:time}'
)
