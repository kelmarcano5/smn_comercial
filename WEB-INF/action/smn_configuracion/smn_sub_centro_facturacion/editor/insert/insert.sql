INSERT INTO smn_comercial.smn_sub_centro_facturacion
(
	smn_sub_centro_facturacion_id,
	smn_rol_id,
	smn_usuario_rf,
	smn_corporacion_rf,
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
	${fld:smn_rol_id},
	${fld:smn_usuario_rf},
	${fld:smn_corporacion_rf},
	${fld:scf_estatus},
	{d '${def:date}'},
	'${def:locale}',
	'${def:user}',
	{d '${def:date}'},
	'${def:time}'
)
