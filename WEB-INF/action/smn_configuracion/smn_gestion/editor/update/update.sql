UPDATE smn_comercial.smn_gestion SET
	ges_codigo=${fld:ges_codigo},
	ges_descripcion=${fld:ges_descripcion},
	smn_accion_id=${fld:smn_accion_id},
	ges_estatus=${fld:ges_estatus},
	ges_vigencia=${fld:ges_vigencia},
	ges_idioma='${def:locale}',
	ges_usuario='${def:user}',
	ges_fecha_registro={d '${def:date}'},
	ges_hora='${def:time}'

WHERE
	smn_gestion_id=${fld:id}

