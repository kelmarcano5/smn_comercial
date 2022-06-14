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
		pca_monto_pedido_ml,
		pca_monto_neto_ml,
		smn_moneda_rf,
		smn_tasa_rf,
		pca_monto_pedido_ma,
		pca_monto_neto_ma,
		pca_estatus,
		pca_estatus_pago,
		pca_fecha_vencimiento,
		pca_idioma,
		pca_usuario,
		pca_fecha_registro,
		pca_hora,
		smn_auxiliar_rf,
		smn_modulo_rf,
		pca_segmentada
	)
	SELECT
	nextval('smn_comercial.seq_smn_pedido_cabecera'),
	smn_comercial.smn_pedido_cabecera.smn_documento_id,
	nextval('smn_comercial.seq_smn_numero_pedido'),
	smn_comercial.smn_pedido_cabecera.smn_mov_caja_cabecera_id,
	smn_comercial.smn_pedido_cabecera.smn_oferta_id,
	smn_comercial.smn_pedido_cabecera.smn_cliente_id,
	smn_comercial.smn_pedido_cabecera.smn_usuario_rf,
	smn_comercial.smn_pedido_cabecera.pca_descripcion,
	smn_comercial.smn_pedido_cabecera.pca_fecha_requerida,
	smn_comercial.smn_pedido_cabecera.smn_entidad_rf,
	case when smn_comercial.smn_pedido_cabecera.smn_sucursal_rf is null then 0 else smn_comercial.smn_pedido_cabecera.smn_sucursal_rf end as smn_sucursal_rf,
	case when smn_comercial.smn_pedido_cabecera.smn_area_servicio_rf is null then 0 else smn_comercial.smn_pedido_cabecera.smn_area_servicio_rf end as smn_area_servicio_rf,
	smn_comercial.smn_pedido_cabecera.smn_unidad_servicio_rf,
	smn_comercial.smn_pedido_cabecera.smn_almacen_rf,
	smn_comercial.smn_pedido_cabecera.smn_centro_costo_rf,
	smn_comercial.smn_pedido_cabecera.smn_centro_facturacion_id,
	smn_comercial.smn_pedido_cabecera.smn_tipo_linea_comercial_id,
	smn_comercial.smn_pedido_cabecera.smn_linea_comercial_id,
	smn_comercial.smn_pedido_cabecera.pca_monto_pedido_ml,
	smn_comercial.smn_pedido_cabecera.pca_monto_neto_ml,
	smn_comercial.smn_pedido_cabecera.smn_moneda_rf,
	smn_comercial.smn_pedido_cabecera.smn_tasa_rf,
	smn_comercial.smn_pedido_cabecera.pca_monto_pedido_ma,
	smn_comercial.smn_pedido_cabecera.pca_monto_neto_ma,
	smn_comercial.smn_pedido_cabecera.pca_estatus,
	smn_comercial.smn_pedido_cabecera.pca_estatus_pago,
	smn_comercial.smn_pedido_cabecera.pca_fecha_vencimiento,
	'${def:locale}',
	'${def:user}',
	{d '${def:date}'},
	'${def:time}',
	smn_comercial.smn_pedido_cabecera.smn_auxiliar_rf,
	smn_comercial.smn_pedido_cabecera.smn_modulo_rf,
	'SI'
	from 
		smn_comercial.smn_pedido_cabecera
	where 
		smn_comercial.smn_pedido_cabecera.smn_pedido_cabecera_id=${fld:id}