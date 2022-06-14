UPDATE smn_comercial.smn_pedido_desc_retenciones SET
	smn_pedido_detalle_id=${fld:smn_pedido_detalle_id},
	smn_descuentos_retenciones_rf=${fld:smn_descuentos_retenciones_rf},
	pim_monto_base_ml=${fld:pim_monto_base_ml},
	pim_porcentaje_retencion=${fld:pim_porcentaje_retencion},
	pim_monto_descuento_retencion=${fld:pim_monto_descuento_retencion},
	smn_moneda_rf=${fld:smn_moneda_rf},
	smn_tasa_rf=${fld:smn_tasa_rf},
	pim_monto_descuento_ma=${fld:pim_monto_descuento_ma},
	pim_idioma='${def:locale}',
	pim_usuario='${def:user}',
	pim_fecha_registro={d '${def:date}'},
	pim_hora='${def:time}'

WHERE
	smn_pedido_desc_retenciones_id=${fld:id}

