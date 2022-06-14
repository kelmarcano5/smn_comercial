UPDATE smn_comercial.smn_pedido_imp_deducc_detalle SET
	smn_pedido_detalle_id=${fld:smn_pedido_detalle_id},
	smn_codigos_impuestos_rf=${fld:smn_codigos_impuestos_rf},
	pid_porcentaje_impuesto=${fld:pid_porcentaje_impuesto},
	pid_monto_sustraendo=${fld:pid_monto_sustraendo},
	pid_monto_impuesto=${fld:pid_monto_impuesto},
	smn_moneda_rf=${fld:smn_moneda_rf},
	smn_tasa_rf=${fld:smn_tasa_rf},
	pid_monto_imp_moneda_alterna=${fld:pid_monto_imp_moneda_alterna},
	smn_descuentos_retenciones_rf=${fld:smn_descuentos_retenciones_rf},
	pid_porcentaje_descuento_retencion=${fld:pid_porcentaje_descuento_retencion},
	pid_monto_descuento_retencion=${fld:pid_monto_descuento_retencion},
	pid_monto_desc_moneda_alterna=${fld:pid_monto_desc_moneda_alterna},
	pid_idioma='${def:locale}',
	pid_usuario='${def:user}',
	pid_fecha_registro={d '${def:date}'},
	pid_hora='${def:time}'

WHERE
	smn_pedido_imp_deducc_detalle_id=${fld:id}

