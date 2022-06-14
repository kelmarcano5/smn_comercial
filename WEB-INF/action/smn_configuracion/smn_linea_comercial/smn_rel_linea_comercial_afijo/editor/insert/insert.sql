INSERT INTO smn_comercial.smn_rel_linea_comercial_afijo
(
	smn_rel_linea_comercial_afijo_id,
	smn_linea_comercial_id,
	smn_activo_rf,
	rla_estatus,
	rla_vigencia,
	rla_idioma,
	rla_usuario,
	rla_fecha_registro,
	rla_hora
)
VALUES
(
	${seq:currval@smn_comercial.seq_smn_rel_linea_comercial_afijo},
	${fld:smn_linea_comercial_id},
	${fld:smn_activo_rf},
	${fld:rla_estatus},
	${fld:rla_vigencia},
	'${def:locale}',
	'${def:user}',
	{d '${def:date}'},
	'${def:time}'
)
