UPDATE smn_comercial.smn_rel_cliente_cond_financiera SET
	smn_cliente_id=${fld:smn_cliente_id},
	smn_condicion_financiera_rf=${fld:smn_condicion_financiera_rf},
	rcc_estatus=${fld:rcc_estatus},
	rcc_vigencia={d '${def:date}'},
	rcc_idioma='${def:locale}',
	rcc_usuario='${def:user}',
	rcc_fecha_registro={d '${def:date}'},
	rcc_hora='${def:time}'

WHERE
	smn_rel_cliente_cond_financiera_id=${fld:id}

