UPDATE smn_comercial.smn_rel_usuario_linea_comercial SET
	smn_linea_comercial_id=${fld:smn_linea_comercial_id},
	smn_usuario_rf=${fld:smn_usuario_rf},
	rlu_estatus=${fld:rlu_estatus},
	rlu_vigencia=${fld:rlu_vigencia},
	rlu_idioma='${def:locale}',
	rlu_usuario='${def:user}',
	rlu_fecha_registro={d '${def:date}'},
	rlu_hora='${def:time}'

WHERE
	smn_rel_usuario_linea_comercial_id=${fld:id}

