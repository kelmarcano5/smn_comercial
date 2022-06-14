INSERT INTO smn_entrega.smn_imagen_auxiliar
(
	smn_imagen_auxiliar_id,
	smn_auxiliar_rf,
	cca_descripcion,
	cca_imagen_data,
	filename,
	cca_imagen_size,
	content_type,
	cca_idioma,
	cca_usuario,
	cca_fecha_registro,
	cca_hora
)
VALUES
(
	${seq:nextval@smn_entrega.seq_smn_imagen_auxiliar},
	${fld:smn_auxiliar_rf},
	${fld:cca_descripcion},
	?,
	${fld:_filename},
	${fld:_filesize},
	${fld:_contenttype},
	'${def:locale}',
	'${def:user}',
	{d '${def:date}'},
	'${def:time}'
)
