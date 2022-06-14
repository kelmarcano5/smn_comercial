INSERT INTO smn_base.smn_rel_auxiliar_direccion
(
	smn_rel_auxiliar_direccion_id,
	smn_clase_auxiliar_id,
	smn_auxiliar_id,
	smn_direccion_id,
	rad_tipo_direccion,
	rad_status,
	rad_fecha_vigencia,
	smn_zona_rf,
	rad_idioma,
	rad_usuario,
	rad_fecha_registro,
	rad_hora
)
VALUES
(
	${seq:currval@smn_base.seq_smn_rel_auxiliar_direccion},
	${fld:smn_clase_auxiliar_id},
	${fld:smn_auxiliar_id},
	${fld:smn_direccion_id},
	${fld:rad_tipo_direccion},
	${fld:rad_status},
	${fld:rad_fecha_vigencia},
	${fld:smn_zona_rf},
	'${def:locale}',
	'${def:user}',
	{d '${def:date}'},
	'${def:time}'
)