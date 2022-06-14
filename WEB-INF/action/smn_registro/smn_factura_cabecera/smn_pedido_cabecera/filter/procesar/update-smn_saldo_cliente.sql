UPDATE smn_cobranzas.smn_saldo_cliente SET
	scl_saldo_inicial_ml=${fld:scl_saldo_inicial_ml},
	scl_debitos_ml=${fld:scl_debitos_ml},
	scl_creditos_ml=${fld:scl_creditos_ml},
	scl_saldo_final_ml=${fld:scl_saldo_final_ml},
	scl_saldo_inicial_ma=${fld:scl_saldo_inicial_ma},
	scl_debitos_ma=${fld:scl_debitos_ma},
	scl_creditos_ma=${fld:scl_creditos_ma},
	scl_saldo_final_ma=${fld:scl_saldo_final_ma},
	scl_saldo_vencido_ml=${fld:scl_saldo_vencido_ml},
	scl_saldo_vencido_ma=${fld:scl_saldo_vencido_ma},
	scl_estatus='SO',
	scl_porcentaje_deuda_vencida=${fld:scl_porcentaje_deuda_vencida},
	scl_idioma='${def:locale}',
	scl_usuario='${def:user}',
	scl_fecha_registro={d '${def:date}'},
	scl_hora='${def:time}'
WHERE
	smn_saldo_cliente_id=${fld:smn_saldo_cliente_id}