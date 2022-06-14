UPDATE smn_comercial.smn_imagen_item_comercio SET
	smn_catalogo_item_comercio_id=${fld:smn_catalogo_item_comercio_id},
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
	smn_imagen_item_comercio_id=${fld:id}

