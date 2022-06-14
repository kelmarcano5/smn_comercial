UPDATE smn_comercial.smn_pedido_componentes SET
	smn_pedido_detalle_id=${fld:smn_pedido_detalle_id},
	smn_mov_caja_detalle_id=${fld:smn_mov_caja_detalle_id},
	smn_pedido_cabecera_id=${fld:smn_pedido_cabecera_id},
	smn_grupo_componente_rf=${fld:smn_grupo_componente_rf},
	pco_tipo_componente=${fld:pco_tipo_componente},
	smn_componente_rf=${fld:smn_componente_rf},
	pco_es_prestador_servicio=${fld:pco_es_prestador_servicio},
	smn_clase_auxiliar_rf=${fld:smn_clase_auxiliar_rf},
	smn_auxiliar_rf=${fld:smn_auxiliar_rf},
	pco_naturaleza=${fld:pco_naturaleza},
	smn_item_rf=${fld:smn_item_rf},
	smn_servicio_rf=${fld:smn_servicio_rf},
	pco_cantidad=${fld:pco_cantidad},
	smn_precio_ml_rf=${fld:smn_precio_ml_rf},
	pco_monto_ml=${fld:pco_monto_ml},
	smn_moneda_rf=${fld:smn_moneda_rf},
	smn_tasa_rf=${fld:smn_tasa_rf},
	smn_precio_ma=${fld:smn_precio_ma},
	smn_monto_ma=${fld:smn_monto_ma},
	pco_imprime=${fld:pco_imprime},
	smn_grupo_titulo_impresion_rf=${fld:smn_grupo_titulo_impresion_rf},
	smn_tipo_gasto_rf=${fld:smn_tipo_gasto_rf},
	smn_sub_tipo_gasto_rf=${fld:smn_sub_tipo_gasto_rf},
	pco_estatus=${fld:pco_estatus},
	pco_idioma='${def:locale}',
	pco_usuario='${def:user}',
	pco_fecha_registro={d '${def:date}'},
	pco_hora='${def:time}'

WHERE
	smn_pedido_componentes_id=${fld:id}

