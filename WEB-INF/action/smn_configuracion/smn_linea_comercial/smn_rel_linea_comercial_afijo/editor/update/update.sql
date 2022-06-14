UPDATE smn_comercial.smn_rel_linea_comercial_afijo SET
	smn_linea_comercial_id=${fld:smn_linea_comercial_id},
	smn_activo_rf=${fld:smn_activo_rf},
	rla_estatus=${fld:rla_estatus},
	rla_vigencia=${fld:rla_vigencia},
	rla_idioma='${def:locale}',
	rla_usuario='${def:user}',
	rla_fecha_registro={d '${def:date}'},
	rla_hora='${def:time}'

WHERE
	smn_rel_linea_comercial_afijo_id=${fld:id}

