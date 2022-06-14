UPDATE smn_comercial.smn_rel_cliente_area_interes SET
	smn_cliente_id=${fld:smn_cliente_id},
	smn_area_interes_id=${fld:smn_area_interes_id},
	rca_estatus=${fld:rca_estatus},
	rca_vigencia=${fld:rca_vigencia},
	rca_idioma='${def:locale}',
	rca_usuario='${def:user}',
	rca_fecha_registro={d '${def:date}'},
	rca_hora='${def:time}'

WHERE
	smn_rel_cliente_area_interes_id=${fld:id}

