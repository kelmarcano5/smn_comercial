UPDATE smn_comercial.smn_tipo_documentos_fact SET
	tdf_codigo=${fld:tdf_codigo},
	tdf_nombre=${fld:tdf_nombre},
	tdf_naturaleza=${fld:tdf_naturaleza},
	tdf_vigencia=${fld:tdf_vigencia},
	tdf_estatus=${fld:tdf_estatus},
	tdf_idioma='${def:locale}',
	tdf_usuario='${def:user}',
	tdf_fecha_registro={d '${def:date}'},
	tdf_hora='${def:time}'

WHERE
	smn_tipo_documentos_fact_id=${fld:id}

