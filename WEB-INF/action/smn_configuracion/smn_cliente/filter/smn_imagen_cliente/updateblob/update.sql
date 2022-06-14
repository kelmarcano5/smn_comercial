UPDATE smn_comercial.smn_imagen_cliente SET
	smn_cliente_id=${fld:smn_cliente_id},
	iic_descripcion=${fld:iic_descripcion},
	iic_imagen_data=?,
	filename=${fld:_filename},
	iic_imagen_size=${fld:_filesize},
	content_type=${fld:_contenttype},
	iic_idioma='${def:locale}',
	iic_usuario='${def:user}',
	iic_fecha_registro={d '${def:date}'},
	iic_hora='${def:time}'

WHERE
	smn_imagen_cliente_id=${fld:id}

