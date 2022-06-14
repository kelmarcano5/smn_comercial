UPDATE smn_comercial.smn_rel_linea_comercial_item SET
	smn_linea_comercial_id=${fld:smn_linea_comercial_id},
	smn_item_rf=${fld:smn_item_rf},
	rli_estatus=${fld:rli_estatus},
	rli_vigencia=${fld:rli_vigencia},
	rli_idioma='${def:locale}',
	rli_usuario='${def:user}',
	rli_fecha_registro={d '${def:date}'},
	rli_hora='${def:time}'

WHERE
	smn_rel_linea_comercial_item_id=${fld:id}

