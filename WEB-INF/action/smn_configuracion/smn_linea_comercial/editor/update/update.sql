UPDATE smn_comercial.smn_linea_comercial SET
	smn_tipo_linea_comercial_id=${fld:smn_tipo_linea_comercial_id},
	lco_codigo=${fld:lco_codigo},
	lco_nombre=${fld:lco_nombre},
	lco_vigencia=${fld:lco_vigencia},
	lco_estatus=${fld:lco_estatus},
	lco_idioma='${def:locale}',
	lco_usuario='${def:user}',
	lco_fecha_registro={d '${def:date}'},
	lco_hora='${def:time}'

WHERE
	smn_linea_comercial_id=${fld:id}

