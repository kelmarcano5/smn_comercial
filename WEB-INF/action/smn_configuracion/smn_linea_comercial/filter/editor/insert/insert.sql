INSERT INTO smn_comercial.smn_linea_comercial
(
	smn_linea_comercial_id,
	smn_tipo_linea_comercial_id,
	lco_codigo,
	lco_nombre,
	lco_vigencia,
	lco_estatus,
	lco_idioma,
	lco_usuario,
	lco_fecha_registro,
	lco_hora
)
VALUES
(
	${seq:currval@smn_comercial.seq_smn_linea_comercial},
	${fld:smn_tipo_linea_comercial_id},
	${fld:lco_codigo},
	${fld:lco_nombre},
	${fld:lco_vigencia},
	${fld:lco_estatus},
	'${def:locale}',
	'${def:user}',
	{d '${def:date}'},
	'${def:time}'
)
