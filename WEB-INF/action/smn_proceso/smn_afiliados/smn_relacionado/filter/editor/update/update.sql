UPDATE smn_comercial.smn_relacionado SET
	smn_afiliados_id=${fld:smn_afiliados_id},
	rel_auxiliar_rf=${fld:rel_auxiliar_rf},
	rel_fecha_inicio=${fld:rel_fecha_inicio},
	rel_fecha_final=${fld:rel_fecha_final},
	rel_fecha_desafiliado=${fld:rel_fecha_desafiliado},
	rel_estatus=${fld:rel_estatus},
	rel_idioma='${def:locale}',
	rel_usuario='${def:user}',
	rel_fecha_registro={d '${def:date}'},
	rel_hora='${def:time}'

WHERE
	smn_relacionado_id=${fld:id}

