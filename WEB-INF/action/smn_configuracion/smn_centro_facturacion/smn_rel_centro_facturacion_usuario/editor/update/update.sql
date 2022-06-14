UPDATE smn_comercial.smn_rel_centro_facturacion_usuario SET
	smn_centro_facturacion_id=${fld:smn_centro_facturacion_id},
	smn_usuario_rf=${fld:smn_usuario_rf},
	rfu_vigencia={d '${def:date}'},
	rfu_estatus=${fld:rfu_estatus},
	rfu_idioma='${def:locale}',
	rfu_usuario='${def:user}',
	rfu_fecha_registro={d '${def:date}'},
	rfu_hora='${def:time}'

WHERE
	smn_rel_centro_facturacion_usuario_id=${fld:id}

