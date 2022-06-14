INSERT INTO smn_comercial.smn_tipo_linea_comercial
(
	smn_tipo_linea_comercial_id,
	tlc_codigo,
	tlc_nombre,
	tlc_naturaleza,
	tlc_vigencia,
	tlc_estatus,
	tlc_idioma,
	tlc_usuario,
	tlc_fecha_registro,
	tlc_hora
)
VALUES
(
	${seq:currval@smn_comercial.seq_smn_tipo_linea_comercial},
	${fld:tlc_codigo},
	${fld:tlc_nombre},
	${fld:tlc_naturaleza},
	${fld:tlc_vigencia},
	${fld:tlc_estatus},
	'${def:locale}',
	'${def:user}',
	{d '${def:date}'},
	'${def:time}'
)
