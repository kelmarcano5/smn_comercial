UPDATE smn_comercial.smn_pedido_cabecera SET
	smn_documento_id=${fld:smn_documento_id},
	pca_numero_pedido=${fld:pca_numero_pedido},
	smn_mov_caja_cabecera_id=${fld:smn_mov_caja_cabecera_id},
	smn_oferta_id=${fld:smn_oferta_id},
	smn_cliente_id=${fld:smn_cliente_id},
	smn_usuario_rf=${fld:smn_usuario_rf},
	pca_descripcion=${fld:pca_descripcion},
	pca_fecha_requerida=${fld:pca_fecha_requerida},
	smn_entidad_rf=${fld:smn_entidad_rf},
	smn_sucursal_rf=${fld:smn_sucursal_rf},
	smn_area_servicio_rf=${fld:smn_area_servicio_rf},
	smn_unidad_servicio_rf=${fld:smn_unidad_servicio_rf},
	smn_almacen_rf=${fld:smn_almacen_rf},
	smn_centro_costo_rf=${fld:smn_centro_costo_rf},
	smn_centro_facturacion_id=${fld:smn_centro_facturacion_id},
	smn_sub_centro_facturacion_id=${fld:smn_sub_centro_facturacion_id},
	smn_tipo_linea_comercial_id=${fld:smn_tipo_linea_comercial_id},
	smn_linea_comercial_id=${fld:smn_linea_comercial_id},
	pca_monto_pedido_ml=${fld:pca_monto_pedido_ml},
	pca_monto_impuesto_ml=${fld:pca_monto_impuesto_ml},
	pca_monto_descuento_ml=${fld:pca_monto_descuento_ml},
	pca_monto_bonificacion_ml=${fld:pca_monto_bonificacion_ml},
	pca_monto_neto_ml=${fld:pca_monto_neto_ml},
	smn_moneda_rf=${fld:smn_moneda_rf},
	smn_tasa_rf=${fld:smn_tasa_rf},
	pca_monto_pedido_ma=${fld:pca_monto_pedido_ma},
	pca_monto_impuesto_ma=${fld:pca_monto_impuesto_ma},
	pca_monto_descuento_ma=${fld:pca_monto_descuento_ma},
	pca_monto_bonificacion_ma=${fld:pca_monto_bonificacion_ma},
	pca_monto_neto_ma=${fld:pca_monto_neto_ma},
	pca_estatus=${fld:pca_estatus},
	pca_estatus_pago=${fld:pca_estatus_pago},
	pca_fecha_vencimiento=${fld:pca_fecha_vencimiento},
	pca_idioma='${def:locale}',
	pca_usuario='${def:user}',
	pca_fecha_registro={d '${def:date}'},
	pca_hora='${def:time}'

WHERE
	smn_pedido_cabecera_id=${fld:id}


	