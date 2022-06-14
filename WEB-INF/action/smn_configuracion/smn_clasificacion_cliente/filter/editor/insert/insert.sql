INSERT INTO smn_comercial.smn_clasificacion_cliente
(
	smn_clasificacion_cliente_id,
	ccl_codigo,
	ccl_descripcion,
	ccl_vigencia,
	ccl_estatus,
	ccl_idioma,
	ccl_usuario,
	ccl_fecha_registro,
	ccl_hora
)
VALUES
(
	${seq:currval@smn_comercial.seq_smn_clasificacion_cliente},
	${fld:ccl_codigo},
	${fld:ccl_descripcion},
	${fld:ccl_vigencia},
	${fld:ccl_estatus},
	'${def:locale}',
	'${def:user}',
	{d '${def:date}'},
	'${def:time}'
)
