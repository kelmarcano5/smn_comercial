UPDATE smn_comercial.smn_rel_linea_comercial_servicio SET
	smn_linea_comercial_id=${fld:smn_linea_comercial_id},
	smn_servicio_rf=${fld:smn_servicio_rf},
	rls_estatus=${fld:rls_estatus},
	rls_vigencia=${fld:rls_vigencia},
	rls_idioma='${def:locale}',
	rls_usuario='${def:user}',
	rls_fecha_registro={d '${def:date}'},
	rls_hora='${def:time}'

WHERE
	smn_rel_linea_comercial_servicio_id=${fld:id}

