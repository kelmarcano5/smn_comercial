INSERT INTO smn_comercial.smn_sub_centro_facturacion
(
	smn_sub_centro_facturacion_id,
	smn_centro_facturacion_id,
	scf_codigo,
	scf_nombre,
	scf_estatus,
	scf_vigencia,
	scf_idioma,
	scf_usuario,
	scf_fecha_registro,
	scf_hora
)
VALUES
(
	${seq:currval@smn_comercial.seq_smn_sub_centro_facturacion},
	${fld:smn_centro_facturacion_id},
	${fld:scf_codigo},
	${fld:scf_nombre},
	${fld:scf_estatus},
	{d '${def:date}'},
	'${def:locale}',
	'${def:user}',
	{d '${def:date}'},
	'${def:time}'
)
