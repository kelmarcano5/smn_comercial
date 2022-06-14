INSERT INTO smn_comercial.smn_imagen_cliente
(
	smn_imagen_cliente_id,
	smn_cliente_id,
	iic_descripcion,
	iic_imagen_data,
	filename,
	iic_imagen_size,
	content_type,
	iic_idioma,
	iic_usuario,
	iic_fecha_registro,
	iic_hora
)
VALUES
(
	${seq:nextval@smn_comercial.seq_smn_imagen_cliente},
	${fld:smn_cliente_id},
	${fld:iic_descripcion},
	?,
	${fld:_filename},
	${fld:_filesize},
	${fld:_contenttype},
	'${def:locale}',
	'${def:user}',
	{d '${def:date}'},
	'${def:time}'
)
