UPDATE smn_comercial.smn_factura_impuestos SET
	smn_factura_detalle_id=${fld:smn_factura_detalle_id},
	smn_codigos_impuestos_rf=${fld:smn_codigos_impuestos_rf},
	fai_monto_base_ml=${fld:fai_monto_base_ml},
	fai_porcentaje_impuesto=${fld:fai_porcentaje_impuesto},
	fai_monto_impuesto_ml=${fld:fai_monto_impuesto_ml},
	smn_moneda_rf=${fld:smn_moneda_rf},
	smn_tasa_rf=${fld:smn_tasa_rf},
	fai_monto_impuesto_ma=${fld:fai_monto_impuesto_ma},
	fai_idioma='${def:locale}',
	fai_usuario='${def:user}',
	fai_fecha_registro={d '${def:date}'},
	fai_hora='${def:time}'

WHERE
	smn_factura_impuestos_id=${fld:id}

