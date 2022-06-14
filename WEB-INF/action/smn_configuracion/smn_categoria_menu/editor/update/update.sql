UPDATE smn_comercial.smn_categoria_menu SET
	cam_codigo=${fld:cam_codigo},
	cam_descripcion=${fld:cam_descripcion},
	cam_estatus=${fld:cam_estatus},
	cam_fecha_vigencia={d '${def:date}'},
	cam_idioma='${def:locale}',
	cam_usuario='${def:user}',
	cam_fecha_registro={d '${def:date}'},
	cam_hora='${def:time}'

WHERE
	smn_categoria_menu_id=${fld:id}

