UPDATE smn_comercial.smn_rel_cliente_forma_pago SET
	smn_cliente_id=${fld:smn_cliente_id},
	smn_forma_pago_rf=${fld:smn_forma_pago_rf},
	rcf_estatus=${fld:rcf_estatus},
	rcf_vigencia=${fld:rcf_vigencia},
	rcf_idioma='${def:locale}',
	rcf_usuario='${def:user}',
	rcf_fecha_registro={d '${def:date}'},
	rcf_hora='${def:time}'

WHERE
	smn_rel_cliente_forma_pago_id=${fld:id}

