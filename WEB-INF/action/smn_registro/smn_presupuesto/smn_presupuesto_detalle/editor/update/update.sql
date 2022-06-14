UPDATE smn_comercial.smn_presupuesto_detalle SET 
	smn_presupuesto_id=${fld:smn_presupuesto_id},
	smn_servicios_rf=${fld:smn_servicios_rf},
	prd_cantidad=${fld:prd_cantidad},
	prd_precio=${fld:prd_precio},
	smn_moneda_rf=${fld:smn_moneda_rf},
	prd_precio_ma=${fld:prd_precio_ma},
	prd_monto_moneda_local=${fld:prd_monto_moneda_local},
	prd_moneda_alterna=${fld:prd_moneda_alterna},
	prd_idioma='${def:locale}',
	prd_usuario='${def:user}',
	prd_fecha_registro={d '${def:date}'},
	prd_hora='${def:time}',
	smn_tipo_componentes_rf=${fld:smn_tipo_componentes_rf},
	smn_componentes_rf=${fld:smn_componentes_rf},
	smn_codigo_descuento_rf=${fld:smn_codigo_descuento_rf},
	smn_tasa_rf=${fld:smn_tasa_rf},
	prd_observaciones=${fld:prd_observaciones},
	smn_item_rf=${fld:smn_item_rf},
	prd_monto_descuento_ml=${fld:prd_monto_descuento_ml},
	prd_monto_neto_ml=${fld:prd_monto_neto_ml},
	prd_monto_impuesto_ml=${fld:prd_monto_impuesto_ml},
	prd_monto_descuento_ma=${fld:prd_monto_descuento_ma},
	prd_monto_neto_ma=${fld:prd_monto_neto_ma},
	prd_monto_impuesto_ma=${fld:prd_monto_impuesto_ma},
	prd_monto_incremento_ml=${fld:prd_monto_incremento_ml},
	prd_monto_incremento_ma=${fld:prd_monto_incremento_ma},
	smn_incrementos_rf=${fld:smn_incrementos_rf},
	prd_estatus=${fld:prd_estatus}

WHERE
	smn_presupuesto_detalle_id=${fld:id};

UPDATE smn_comercial.smn_presupuesto SET
	pre_monto_ml = pre_monto_ml - ${fld:prd_monto_moneda_local2}
WHERE smn_presupuesto_id=${fld:smn_presupuesto_id};

UPDATE smn_comercial.smn_presupuesto SET
	pre_monto_ml = pre_monto_ml + ${fld:prd_monto_moneda_local}
WHERE smn_presupuesto_id=${fld:smn_presupuesto_id};

UPDATE smn_comercial.smn_presupuesto SET
	pre_monto_ma = pre_monto_ma + ${fld:prd_moneda_alterna}
WHERE smn_presupuesto_id=${fld:smn_presupuesto_id};

UPDATE smn_comercial.smn_presupuesto SET
	smn_moneda_rf = ${fld:smn_moneda_rf}
WHERE smn_presupuesto_id=${fld:smn_presupuesto_id};

