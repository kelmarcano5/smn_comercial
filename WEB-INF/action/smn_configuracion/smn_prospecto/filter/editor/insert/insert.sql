INSERT INTO smn_comercial.smn_prospecto
(
	smn_prospecto_id,
	pro_codigo,
	pro_descripcion,
	pro_email,
	pro_movil,
	pro_fijo,
	pro_referido,
	pro_estatus,
	pro_vigencia,
	pro_idioma,
	pro_usuario,
	pro_fecha_registro,
	pro_hora,
	smn_direccion_rf,
	smn_tipo_contactos_rf,
	pro_descripcion_contacto
)
VALUES
(
	${seq:currval@smn_comercial.seq_smn_prospecto},
	${fld:pro_codigo},
	${fld:pro_descripcion},
	${fld:pro_email},
	${fld:pro_movil},
	${fld:pro_fijo},
	${fld:pro_referido},
	'AC',
	{d '${def:date}'},
	'${def:locale}',
	'${def:user}',
	{d '${def:date}'},
	'${def:time}',
	${fld:smn_direccion_rf},
	${fld:smn_tipo_contactos_rf},
	${fld:pro_descripcion_contacto}
)
