UPDATE smn_comercial.smn_presupuesto_impuesto SET
	smn_presupuesto_detalle_id=${fld:smn_presupuesto_detalle_id},
	smn_servicios_rf=${fld:smn_servicios_rf},
	smn_item_rf=${fld:smn_item_rf},
	smn_codigo_impuesto_id=${fld:smn_codigo_impuesto_id},
	pim_base_imponible_ml=${fld:pim_base_imponible_ml},
	pim_base_excenta_ml=${fld:pim_base_excenta_ml},
	pim_monto_impuesto_ml=${fld:pim_monto_impuesto_ml},
	pim_monto_sustraendo_ml=${fld:pim_monto_sustraendo_ml},
	pim_monto_neto_impuesto_ml=${fld:pim_monto_neto_impuesto_ml},
	smn_tasa_rf=${fld:smn_tasa_rf},
	smn_moneda_rf=${fld:smn_moneda_rf},
	pim_base_imponible_ma=${fld:pim_base_imponible_ma},
	pim_base_excenta_ma=${fld:pim_base_excenta_ma},
	pim_monto_impuesto_ma=${fld:pim_monto_impuesto_ma},
	pim_monto_sustraendo_ma=${fld:pim_monto_sustraendo_ma},
	pim_monto_neto_impuesto_ma=${fld:pim_monto_neto_impuesto_ma},
	pim_idioma='${def:locale}',
	pim_usuario='${def:user}',
	pim_fecha_registro={d '${def:date}'},
	pim_hora='${def:time}'

WHERE
	smn_presupuesto_impuesto_id=${fld:id}

