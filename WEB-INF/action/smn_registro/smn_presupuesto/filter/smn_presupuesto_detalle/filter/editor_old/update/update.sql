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
	prd_hora='${def:time}'

WHERE
	smn_presupuesto_detalle_id=${fld:id}

