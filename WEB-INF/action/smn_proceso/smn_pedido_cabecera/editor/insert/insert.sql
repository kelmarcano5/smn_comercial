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
	pca_estatus,
	pca_fecha_vencimiento,
	pca_idioma,
	pca_usuario,
	pca_fecha_registro,
	pca_hora
)
VALUES
(
	${seq:nextval@smn_comercial.seq_smn_numero_pedido},
	${fld:smn_documento_id},
	${fld:pca_numero_pedido},
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
	${fld:smn_almacen_rf},
	${fld:smn_centro_costo_rf},
	'RE',
	${fld:pca_fecha_vencimiento},
	'${def:locale}',
	'${def:user}',
	{d '${def:date}'},
	'${def:time}'
)
