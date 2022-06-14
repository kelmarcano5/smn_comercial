INSERT INTO smn_comercial.smn_pedido_cabecera
(
	smn_pedido_cabecera_id,
	smn_documento_id,
	pca_numero_pedido,
	smn_mov_caja_cabecera_id,
	smn_oferta_id,
	smn_cliente_id,
	smn_usuario_rf,
	pca_descripcion,
	pca_fecha_requerida,
	smn_entidad_rf,
	smn_sucursal_rf,
	smn_area_servicio_rf,
	smn_unidad_servicio_rf,
	smn_almacen_rf,
	smn_centro_costo_rf,
	smn_centro_facturacion_id,
	smn_tipo_linea_comercial_id,
	smn_linea_comercial_id,
	pca_estatus,
	pca_estatus_pago,
	pca_fecha_vencimiento,
	pca_idioma,
	pca_usuario,
	pca_fecha_registro,
	pca_hora,
<<<<<<< HEAD
<<<<<<< HEAD
	pca_vendedor
=======
	pca_vendedor,
	smn_condicion_financiera_rf
>>>>>>> a5898d36b06ae8eb52b4f79d47345249ded34511
=======
	pca_vendedor,
	smn_condicion_financiera_rf
>>>>>>> a5898d36b06ae8eb52b4f79d47345249ded34511
)
VALUES
(
	${seq:currval@smn_comercial.seq_smn_pedido_cabecera},
	${fld:smn_documento_id},
	${seq:nextval@smn_comercial.seq_smn_numero_pedido},
	${fld:smn_mov_caja_cabecera_id},
	${fld:smn_oferta_id},
	${fld:smn_cliente_id},
	${fld:id_usuario},
	${fld:pca_descripcion},
	${fld:pca_fecha_requerida},
	${fld:smn_entidad_rf},
	${fld:smn_sucursal_rf},
	${fld:smn_area_servicio_rf},
	${fld:smn_unidad_servicio_rf},
	(SELECT smn_comercial.smn_centro_facturacion.smn_almacen_rf FROM smn_comercial.smn_centro_facturacion where smn_comercial.smn_centro_facturacion.smn_centro_facturacion_id=${fld:centro_facturacion}),
	${fld:smn_centro_costo_rf},
	${fld:smn_centro_facturacion_id},
	(select smn_comercial.smn_tipo_linea_comercial.smn_tipo_linea_comercial_id from smn_comercial.smn_rel_centro_fac_linea
	inner join smn_comercial.smn_linea_comercial on smn_comercial.smn_linea_comercial.smn_linea_comercial_id = smn_comercial.smn_rel_centro_fac_linea.smn_linea_comercial_id
	inner join smn_comercial.smn_tipo_linea_comercial on smn_comercial.smn_tipo_linea_comercial.smn_tipo_linea_comercial_id = smn_comercial.smn_linea_comercial.smn_tipo_linea_comercial_id
	where smn_comercial.smn_rel_centro_fac_linea.smn_centro_facturacion_id=${fld:smn_centro_facturacion_id}),
	(select smn_comercial.smn_rel_centro_fac_linea.smn_linea_comercial_id from smn_comercial.smn_rel_centro_fac_linea where  smn_comercial.smn_rel_centro_fac_linea.smn_centro_facturacion_id=${fld:smn_centro_facturacion_id}),
	'RE',
	'PE',
	${fld:pca_fecha_vencimiento},
	'${def:locale}',
	'${def:user}',
	{d '${def:date}'},
	'${def:time}',
<<<<<<< HEAD
<<<<<<< HEAD
	${fld:pca_vendedor}
=======
	${fld:pca_vendedor},
	${fld:smn_condicion_financiera_rf}
>>>>>>> a5898d36b06ae8eb52b4f79d47345249ded34511
=======
	${fld:pca_vendedor},
	${fld:smn_condicion_financiera_rf}
>>>>>>> a5898d36b06ae8eb52b4f79d47345249ded34511
)
