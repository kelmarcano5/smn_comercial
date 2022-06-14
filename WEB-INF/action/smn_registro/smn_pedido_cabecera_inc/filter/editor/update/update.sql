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
	smn_tipo_linea_comercial_id=${fld:smn_tipo_linea_comercial_id},
	smn_linea_comercial_id=${fld:smn_linea_comercial_id},
	pca_estatus=${fld:pca_estatus},
	pca_fecha_vencimiento=${fld:pca_fecha_vencimiento},
	pca_idioma='${def:locale}',
	pca_usuario='${def:user}',
	pca_fecha_registro={d '${def:date}'},
	pca_hora='${def:time}',
<<<<<<< HEAD
<<<<<<< HEAD
	pca_vendedor=${fld:pca_vendedor}
=======
	pca_vendedor=${fld:pca_vendedor},
	pca_fecha_despacho=${fld:pca_fecha_despacho},
	smn_condicion_financiera_rf=${fld:smn_condicion_financiera_rf}
>>>>>>> a5898d36b06ae8eb52b4f79d47345249ded34511
=======
	pca_vendedor=${fld:pca_vendedor},
	pca_fecha_despacho=${fld:pca_fecha_despacho},
	smn_condicion_financiera_rf=${fld:smn_condicion_financiera_rf}
>>>>>>> a5898d36b06ae8eb52b4f79d47345249ded34511

WHERE
	smn_pedido_cabecera_id=${fld:id}

