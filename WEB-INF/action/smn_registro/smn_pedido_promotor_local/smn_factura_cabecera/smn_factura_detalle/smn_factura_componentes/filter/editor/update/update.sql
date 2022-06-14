UPDATE smn_comercial.smn_factura_componentes SET
	smn_factura_detalle_id=${fld:smn_factura_detalle_id},
	smn_grupo_componente_rf=${fld:smn_grupo_componente_rf},
	smn_componente_rf=${fld:smn_componente_rf},
	fco_es_prestador_servicio=${fld:fco_es_prestador_servicio},
	smn_clase_auxiliar_rf=${fld:smn_clase_auxiliar_rf},
	smn_auxiliar_rf=${fld:smn_auxiliar_rf},
	smn_item_rf=${fld:smn_item_rf},
	smn_servicio_rf=${fld:smn_servicio_rf},
	fco_forma_calculo=${fld:fco_forma_calculo},
	fco_cantidad=${fld:fco_cantidad},
	smn_precio_ml_rf=${fld:smn_precio_ml_rf},
	fco_monto_ml=${fld:fco_monto_ml},
	smn_moneda_rf=${fld:smn_moneda_rf},
	smn_tasa_rf=${fld:smn_tasa_rf},
	smn_precio_ma=${fld:smn_precio_ma},
	smn_monto_ma=${fld:smn_monto_ma},
	fco_imprime=${fld:fco_imprime},
	smn_grupo_titulo_impresion_rf=${fld:smn_grupo_titulo_impresion_rf},
	smn_tipo_gasto_rf=${fld:smn_tipo_gasto_rf},
	smn_sub_tipo_gasto_rf=${fld:smn_sub_tipo_gasto_rf},
	fco_estatus=${fld:fco_estatus},
	fco_idioma='${def:locale}',
	fco_usuario='${def:user}',
	fco_fecha_registro={d '${def:date}'},
	fco_hora='${def:time}'

WHERE
	smn_factura_componente_id=${fld:id}

