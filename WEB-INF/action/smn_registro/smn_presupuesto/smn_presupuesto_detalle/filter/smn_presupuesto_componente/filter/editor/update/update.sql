UPDATE smn_comercial.smn_presupuesto_componente SET
	smn_presupuesto_detalle_id=${fld:smn_presupuesto_detalle_id},
	smn_presupuesto_id=${fld:smn_presupuesto_id},
	smn_servicios_rf=${fld:smn_servicios_rf},
	smn_tipos_componentes_rf=${fld:smn_tipos_componentes_rf},
	smn_componentes_rf=${fld:smn_componentes_rf},
	smn_grupo_prestador_rf=${fld:smn_grupo_prestador_rf},
	smn_prestadores_servicios_rf=${fld:smn_prestadores_servicios_rf},
	prc_porcentaje_prestador=${fld:prc_porcentaje_prestador},
	prc_forma_calculo_rf=${fld:prc_forma_calculo_rf},
	prc_visible_rf=${fld:prc_visible_rf},
	prc_cantidad=${fld:prc_cantidad},
	prc_precio_ml=${fld:prc_precio_ml},
	prc_precio_ma=${fld:prc_precio_ma},
	smn_moneda_rf=${fld:smn_moneda_rf},
	prc_monto_ml=${fld:prc_monto_ml},
	prc_monto_ma=${fld:prc_monto_ma},
	prc_monto_impuesto_ml=${fld:prc_monto_impuesto_ml},
	prc_monto_impuesto_ma=${fld:prc_monto_impuesto_ma},
	prc_monto_descuento_ml=${fld:prc_monto_descuento_ml},
	prc_monto_descuento_ma=${fld:prc_monto_descuento_ma},
	smn_incrementos_porcentaje_rf=${fld:smn_incrementos_porcentaje_rf},
	prc_monto_incremento_ml=${fld:prc_monto_incremento_ml},
	prc_monto_incremento_ma=${fld:prc_monto_incremento_ma},
	prc_monto_neto_ml=${fld:prc_monto_neto_ml},
	prc_monto_neto_ma=${fld:prc_monto_neto_ma},
	prc_idioma='${def:locale}',
	prc_usuario='${def:user}',
	prc_fecha_registro={d '${def:date}'},
	prc_hora='${def:time}'

WHERE
	smn_presupuesto_componente_id=${fld:id}

