UPDATE smn_comercial.smn_factura_descuentos_retenciones SET
	smn_factura_detalle_id=${fld:smn_factura_detalle_id},
	smn_descuentos_retenciones_rf=${fld:smn_descuentos_retenciones_rf},
	fdr_monto_base_ml=${fld:fdr_monto_base_ml},
	fdr_porcentaje_descuento=${fld:fdr_porcentaje_descuento},
	fdr_monto_descuento_ml=${fld:fdr_monto_descuento_ml},
	smn_moneda_rf=${fld:smn_moneda_rf},
	smn_tasa_rf=${fld:smn_tasa_rf},
	fdr_monto_descuento_ma=${fld:fdr_monto_descuento_ma},
	fdr_idioma='${def:locale}',
	fdr_usuario='${def:user}',
	fdr_fecha_registro={d '${def:date}'},
	fdr_hora='${def:time}'

WHERE
	smn_factura_descuentos_retenciones_id=${fld:id}

