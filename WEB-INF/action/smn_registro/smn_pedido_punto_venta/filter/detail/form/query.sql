select
	smn_comercial.smn_pedido_cabecera.smn_pedido_cabecera_id,
	case
		when smn_comercial.smn_pedido_cabecera.pca_estatus='RE' then '${lbl:b_register}'
		when smn_comercial.smn_pedido_cabecera.pca_estatus='GE' then '${lbl:b_generated}'
		when smn_comercial.smn_pedido_cabecera.pca_estatus='AN' then '${lbl:b_anulated}'
	end as pca_estatus,
	case
		when smn_comercial.smn_pedido_cabecera.pca_estatus_pago='PE' then '${lbl:b_pending}'
		when smn_comercial.smn_pedido_cabecera.pca_estatus_pago='PP' then '${lbl:b_partial_aprobated}'
		when smn_comercial.smn_pedido_cabecera.pca_estatus_pago='PA' then '${lbl:b_paid}'
	end as pca_estatus_pago,
	smn_comercial.smn_documento.dcf_codigo ||' - '|| smn_comercial.smn_documento.dcf_descripcion as smn_documento_id,
	smn_comercial.smn_pedido_cabecera.pca_numero_pedido,
	smn_comercial.smn_pedido_cabecera.smn_oferta_id,
	smn_base.smn_auxiliar.aux_codigo ||' - '|| smn_base.smn_auxiliar.aux_descripcion as smn_cliente_id,
	smn_base.smn_v_usuarios.usr_nombres ||' - '|| smn_base.smn_v_usuarios.usr_apellidos as smn_usuario_rf,
	smn_comercial.smn_pedido_cabecera.pca_descripcion,
	smn_base.smn_entidades.ent_codigo ||' - '|| smn_base.smn_entidades.ent_descripcion_corta as smn_entidad_rf,
	smn_base.smn_sucursales.suc_codigo ||' - '|| smn_base.smn_sucursales.suc_nombre as smn_sucursal_rf,
	smn_base.smn_areas_servicios.ase_codigo ||' - '|| smn_base.smn_areas_servicios.ase_descripcion as smn_area_servicio_rf,
	smn_base.smn_unidades_servicios.uns_codigo ||' - '|| smn_base.smn_unidades_servicios.uns_descripcion as smn_unidad_servicio_rf,
	smn_base.smn_almacen.alm_codigo ||' - '|| smn_base.smn_almacen.alm_nombre as smn_almacen_rf,
	smn_base.smn_centro_costo.cco_codigo ||' - '|| smn_base.smn_centro_costo.cco_descripcion_corta as smn_centro_costo_rf,
	smn_comercial.smn_pedido_cabecera.smn_mov_caja_cabecera_id,
	smn_comercial.smn_centro_facturacion.cfc_nombre as smn_centro_facturacion_id,
	smn_comercial.smn_sub_centro_facturacion.smn_rol_id as smn_sub_centro_facturacion_id,
	smn_comercial.smn_tipo_linea_comercial.tlc_nombre as smn_tipo_linea_comercial_id,
	smn_comercial.smn_linea_comercial.lco_nombre as smn_linea_comercial_id,
	smn_base.smn_monedas.mon_nombre as smn_moneda_rf,
	smn_comercial.smn_pedido_cabecera.pca_monto_pedido_ml,
	smn_comercial.smn_pedido_cabecera.pca_monto_impuesto_ml,
	smn_comercial.smn_pedido_cabecera.pca_monto_descuento_ml,
	smn_comercial.smn_pedido_cabecera.pca_monto_bonificacion_ml,
	smn_comercial.smn_pedido_cabecera.pca_monto_neto_ml,
	smn_comercial.smn_pedido_cabecera.pca_monto_impuesto_ma,
	smn_comercial.smn_pedido_cabecera.pca_monto_descuento_ma,
	smn_comercial.smn_pedido_cabecera.pca_monto_bonificacion_ma,
	smn_comercial.smn_pedido_cabecera.pca_monto_neto_ma,
	smn_comercial.smn_pedido_cabecera.pca_monto_pedido_ma,
	smn_base.smn_tasas_de_cambio.tca_tasa_cambio as smn_tasa_rf,
	smn_comercial.smn_pedido_cabecera.pca_fecha_requerida,
	smn_comercial.smn_pedido_cabecera.pca_fecha_vencimiento,
	smn_comercial.smn_pedido_cabecera.pca_fecha_registro,
	smn_comercial.smn_pedido_cabecera.pca_numero_pedido as numeropedido,
	smn_comercial.smn_pedido_cabecera.smn_oferta_id as oferta,
	smn_comercial.smn_pedido_cabecera.smn_sucursal_rf as sucursal,
	smn_comercial.smn_pedido_cabecera.smn_entidad_rf as entidad,
	smn_comercial.smn_pedido_cabecera.smn_cliente_id as cliente,
	smn_comercial.smn_pedido_cabecera.smn_mov_caja_cabecera_id as caja,
	smn_comercial.smn_pedido_cabecera.smn_documento_id as documento,
	smn_comercial.smn_cliente.smn_auxiliar_rf as auxiliar,
	smn_comercial.smn_pedido_cabecera.pca_monto_pedido_ml,
	smn_comercial.smn_pedido_cabecera.pca_monto_impuesto_ml,
	smn_comercial.smn_pedido_cabecera.pca_monto_descuento_ml,
	smn_comercial.smn_pedido_cabecera.pca_monto_bonificacion_ml,
	smn_comercial.smn_pedido_cabecera.pca_monto_neto_ml,
	smn_comercial.smn_pedido_cabecera.pca_monto_impuesto_ma,
	smn_comercial.smn_pedido_cabecera.pca_monto_descuento_ma,
	smn_comercial.smn_pedido_cabecera.pca_monto_bonificacion_ma,
	smn_comercial.smn_pedido_cabecera.pca_monto_neto_ma,
	smn_comercial.smn_pedido_cabecera.pca_monto_pedido_ma,
	smn_comercial.smn_pedido_cabecera.smn_pedido_cabecera_id as pedidoid,
	smn_comercial.smn_pedido_cabecera.pca_monto_neto_ml as monto,
	smn_comercial.smn_pedido_cabecera.pca_cantidad * smn_comercial.smn_pedido_cabecera.pca_monto_pedido_ml as montoneto
	
from
	smn_comercial.smn_pedido_cabecera
	left outer join smn_base.smn_entidades on smn_base.smn_entidades.smn_entidades_id = smn_comercial.smn_pedido_cabecera.smn_entidad_rf
	left outer join smn_base.smn_sucursales on smn_base.smn_sucursales.smn_sucursales_id = smn_comercial.smn_pedido_cabecera.smn_sucursal_rf
	left outer join smn_base.smn_areas_servicios on smn_base.smn_areas_servicios.smn_areas_servicios_id = smn_comercial.smn_pedido_cabecera.smn_area_servicio_rf
	left outer join smn_base.smn_unidades_servicios on smn_base.smn_unidades_servicios.smn_unidades_servicios_id = smn_comercial.smn_pedido_cabecera.smn_unidad_servicio_rf
	left outer join smn_base.smn_almacen on smn_base.smn_almacen.smn_almacen_id = smn_comercial.smn_pedido_cabecera.smn_almacen_rf
	left outer join smn_base.smn_centro_costo on smn_base.smn_centro_costo.smn_centro_costo_id = smn_comercial.smn_pedido_cabecera.smn_centro_costo_rf
	left outer join smn_comercial.smn_cliente on smn_comercial.smn_cliente.smn_cliente_id = smn_comercial.smn_pedido_cabecera.smn_cliente_id
	left outer join smn_base.smn_usuarios on smn_base.smn_usuarios.smn_usuarios_id = smn_comercial.smn_pedido_cabecera.smn_usuario_rf 
	left outer join smn_seguridad.s_user on smn_seguridad.s_user.user_id = smn_base.smn_usuarios.smn_user_rf
	left outer join smn_base.smn_v_usuarios on smn_base.smn_v_usuarios.smn_usuarios_id = smn_comercial.smn_pedido_cabecera.smn_usuario_rf 
	left outer join smn_base.smn_auxiliar on smn_base.smn_auxiliar.smn_auxiliar_id = smn_comercial.smn_cliente.smn_auxiliar_rf
	left outer join smn_comercial.smn_documento on smn_comercial.smn_documento.smn_documento_id = smn_comercial.smn_pedido_cabecera.smn_documento_id
	left outer join smn_comercial.smn_centro_facturacion on smn_comercial.smn_centro_facturacion.smn_centro_facturacion_id = smn_comercial.smn_pedido_cabecera.smn_centro_facturacion_id
	left outer join smn_comercial.smn_sub_centro_facturacion on smn_comercial.smn_sub_centro_facturacion.smn_sub_centro_facturacion_id = smn_comercial.smn_pedido_cabecera.smn_sub_centro_facturacion_id
	left outer join smn_comercial.smn_tipo_linea_comercial on smn_comercial.smn_tipo_linea_comercial.smn_tipo_linea_comercial_id = smn_comercial.smn_pedido_cabecera.smn_tipo_linea_comercial_id
	left outer join smn_comercial.smn_linea_comercial on smn_comercial.smn_linea_comercial.smn_linea_comercial_id = smn_comercial.smn_pedido_cabecera.smn_linea_comercial_id
	left outer join smn_base.smn_monedas on smn_base.smn_monedas.smn_monedas_id = smn_comercial.smn_pedido_cabecera.smn_moneda_rf
	left outer join smn_base.smn_tasas_de_cambio on smn_base.smn_tasas_de_cambio.smn_tasas_de_cambio_id = smn_comercial.smn_pedido_cabecera.smn_tasa_rf
where
	smn_pedido_cabecera_id = ${fld:id}
