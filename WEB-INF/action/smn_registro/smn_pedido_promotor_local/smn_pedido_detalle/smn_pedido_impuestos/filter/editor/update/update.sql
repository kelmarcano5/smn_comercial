UPDATE smn_comercial.smn_pedido_impuestos SET
	smn_pedido_detalle_id=${fld:smn_pedido_detalle_id},
	smn_codigos_impuestos_rf=${fld:smn_codigos_impuestos_rf},
	pim_monto_base_ml=${fld:pim_monto_base_ml},
	pim_porcentaje_impuesto=${fld:pim_porcentaje_impuesto},
	pim_monto_sustraendo=${fld:pim_monto_sustraendo},
	pim_monto_impuesto=${fld:pim_monto_impuesto},
	smn_moneda_rf=${fld:smn_moneda_rf},
	smn_tasa_rf=${fld:smn_tasa_rf},
	pim_monto_impuesto_ma=${fld:pim_monto_impuesto_ma},
	pim_idioma='${def:locale}',
	pim_usuario='${def:user}',
	pim_fecha_registro={d '${def:date}'},
	pim_hora='${def:time}'

WHERE
	smn_pedido_impuestos_id=${fld:id}

