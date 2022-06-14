UPDATE smn_entrega.smn_imagen_auxiliar SET
	smn_auxiliar_rf=${fld:smn_auxiliar_rf},
	cca_descripcion=${fld:cca_descripcion},
	cca_imagen_data=?,
	filename=${fld:_filename},
	cca_imagen_size=${fld:_filesize},
	content_type=${fld:_contenttype},
	cca_idioma='${def:locale}',
	cca_usuario='${def:user}',
	cca_fecha_registro={d '${def:date}'},
	cca_hora='${def:time}'

WHERE
	smn_imagen_auxiliar_id=${fld:id}

