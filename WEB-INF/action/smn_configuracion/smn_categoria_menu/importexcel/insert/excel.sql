INSERT INTO smn_comercial.smn_categoria_menu
(
	smn_categoria_menu_id,
	cam_codigo,
	cam_descripcion,
	cam_estatus,
	cam_fecha_vigencia,
	cam_fecha_registro
)
VALUES
(
	${seq:nextval@smn_comercial.seq_smn_categoria_menu},
	?,
	?,
	?,
	?,
	{d '${def:date}'}
)
