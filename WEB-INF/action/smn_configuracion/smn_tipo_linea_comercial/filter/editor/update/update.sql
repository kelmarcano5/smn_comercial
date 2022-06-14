UPDATE smn_comercial.smn_tipo_linea_comercial SET
	tlc_codigo=${fld:tlc_codigo},
	tlc_nombre=${fld:tlc_nombre},
	tlc_naturaleza=${fld:tlc_naturaleza},
	tlc_vigencia=${fld:tlc_vigencia},
	tlc_estatus=${fld:tlc_estatus},
	tlc_idioma='${def:locale}',
	tlc_usuario='${def:user}',
	tlc_fecha_registro={d '${def:date}'},
	tlc_hora='${def:time}'

WHERE
	smn_tipo_linea_comercial_id=${fld:id}

