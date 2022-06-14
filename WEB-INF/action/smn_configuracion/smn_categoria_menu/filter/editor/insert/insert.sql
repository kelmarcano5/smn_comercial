INSERT INTO smn_comercial.smn_categoria_menu
(
	smn_categoria_menu_id,
	cam_codigo,
	cam_descripcion,
	cam_estatus,
	cam_fecha_vigencia,
	cam_idioma,
	cam_usuario,
	cam_fecha_registro,
	cam_hora
)
VALUES
(
	${seq:currval@smn_comercial.seq_smn_categoria_menu},
	${fld:cam_codigo},
	${fld:cam_descripcion},
	${fld:cam_estatus},
	{d '${def:date}'},
	'${def:locale}',
	'${def:user}',
	{d '${def:date}'},
	'${def:time}'
)
