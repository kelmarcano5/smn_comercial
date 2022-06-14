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
	${seq:nextval@smn_comercial.seq_smn_clasificacion_cliente},
	?,
	?,
	?,
	?,
	'${def:locale}',
	'${def:user}',
	{d '${def:date}'},
	'${def:time}'
)
