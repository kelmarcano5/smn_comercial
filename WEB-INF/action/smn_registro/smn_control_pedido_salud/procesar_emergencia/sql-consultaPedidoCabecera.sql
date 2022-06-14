select
	smn_comercial.smn_pedido_cabecera.smn_pedido_cabecera_id,
	case
		when smn_comercial.smn_pedido_cabecera.pca_estatus='RE' then '${lbl:b_register}'
		when smn_comercial.smn_pedido_cabecera.pca_estatus='AP' then '${lbl:b_aprobated}'
		when smn_comercial.smn_pedido_cabecera.pca_estatus='RZ' then '${lbl:b_refused}'
		when smn_comercial.smn_pedido_cabecera.pca_estatus='GE' then '${lbl:b_generated}'
		when smn_comercial.smn_pedido_cabecera.pca_estatus='PA' then '${lbl:b_partial_aprobated}'
	end as pca_estatus,
	smn_comercial.smn_pedido_cabecera.smn_oferta_id,
	smn_comercial.smn_pedido_cabecera.smn_documento_id,
	smn_comercial.smn_pedido_cabecera.pca_numero_pedido,
	smn_comercial.smn_documento.dcf_codigo ||' - '|| smn_comercial.smn_documento.dcf_descripcion as smn_documento_id_combo,
	smn_base.smn_auxiliar.aux_codigo ||' - '|| smn_base.smn_auxiliar.aux_descripcion as smn_cliente_id,
	smn_base.smn_v_usuarios.usr_nombres ||' - '|| smn_base.smn_v_usuarios.usr_apellidos as smn_usuario_rf_combo,
	smn_comercial.smn_pedido_cabecera.pca_descripcion,
	smn_base.smn_entidades.ent_codigo ||' - '|| smn_base.smn_entidades.ent_descripcion_corta as smn_entidad_rf_combo,
	smn_base.smn_areas_servicios.ase_codigo ||' - '|| smn_base.smn_areas_servicios.ase_descripcion as smn_area_servicio_rf_combo,
	smn_base.smn_almacen.alm_codigo ||' - '|| smn_base.smn_almacen.alm_nombre as smn_almacen_rf_combo,
	smn_base.smn_centro_costo.cco_codigo ||' - '|| smn_base.smn_centro_costo.cco_descripcion_corta as smn_centro_costo_rf_combo,
	smn_comercial.smn_pedido_cabecera.smn_mov_caja_cabecera_id,
	smn_comercial.smn_pedido_cabecera.pca_fecha_requerida,
	smn_comercial.smn_pedido_cabecera.pca_fecha_registro,
	smn_comercial.smn_pedido_cabecera.pca_numero_pedido as numeropedido,
	smn_comercial.smn_pedido_cabecera.smn_oferta_id as oferta,
	smn_comercial.smn_pedido_cabecera.smn_entidad_rf as entidad,
	smn_comercial.smn_pedido_cabecera.smn_cliente_id as cliente,
	smn_caja.smn_mov_caja_cabecera.smn_caja_id as caja,
	smn_comercial.smn_pedido_cabecera.smn_documento_id as documento,
	smn_comercial.smn_cliente.smn_auxiliar_rf as auxiliar,
	smn_comercial.smn_pedido_cabecera.smn_pedido_cabecera_id as pedidoid,
	smn_comercial.smn_pedido_detalle.pde_monto as monto,
	smn_comercial.smn_pedido_detalle.pde_cantidad_aprobada * smn_comercial.smn_pedido_detalle.pde_monto as montoneto,
	smn_comercial.smn_documento.dcf_gen_orden_despacho as despacho,
	smn_comercial.smn_pedido_cabecera.smn_tasa_rf,
	smn_comercial.smn_pedido_cabecera.smn_moneda_rf,
	smn_comercial.smn_pedido_cabecera.smn_centro_facturacion_id,
	smn_comercial.smn_pedido_cabecera.smn_linea_comercial_id,
	smn_comercial.smn_pedido_cabecera.smn_tipo_linea_comercial_id,
	smn_comercial.smn_pedido_cabecera.pca_monto_neto_ml,
	smn_comercial.smn_pedido_cabecera.pca_monto_neto_ma,
	smn_comercial.smn_pedido_cabecera.pca_monto_bonificacion_ml,
	smn_comercial.smn_pedido_cabecera.pca_monto_bonificacion_ma,
	smn_comercial.smn_pedido_cabecera.pca_monto_impuesto_ml,
	smn_comercial.smn_pedido_cabecera.pca_monto_impuesto_ma,
	smn_comercial.smn_pedido_cabecera.pca_monto_descuento_ma,
	smn_comercial.smn_pedido_detalle.smn_pedido_detalle_id,
	smn_comercial.smn_pedido_cabecera.pca_monto_descuento_ml,
	smn_comercial.smn_pedido_cabecera.pca_monto_pedido_ml,
	smn_comercial.smn_pedido_cabecera.pca_monto_pedido_ma,
	smn_comercial.smn_pedido_cabecera.smn_auxiliar_rf,
	case
		when smn_comercial.smn_control_fiscal_documento.smn_documento_id is null then 0 else smn_comercial.smn_control_fiscal_documento.smn_documento_id 
	end as documento_fiscal,
	smn_base.smn_modulos.mod_codigo as modulo,
		case
		when smn_base.smn_condicion_financiera.cfi_cant_dias is null then 0 else smn_base.smn_condicion_financiera.cfi_cant_dias
	end as cant_dias,
	smn_comercial.smn_documento.dcf_entrega_por_orden as entrega_por_orden,
	smn_comercial.smn_tipo_pedido.smn_tipo_pedido_id as tipo_pedido,
	case
		when smn_comercial.smn_pedido_cabecera.smn_sucursal_rf is null then 0 else smn_comercial.smn_pedido_cabecera.smn_sucursal_rf
	end as sucursal,
	case
		when smn_comercial.smn_pedido_cabecera.smn_unidad_servicio_rf is null then 0 else smn_comercial.smn_pedido_cabecera.smn_unidad_servicio_rf
	end as smn_unidad_servicio_rf,
		case
		when smn_comercial.smn_pedido_cabecera.pca_estatus_pago='PE' then '${lbl:b_pending}'
		when smn_comercial.smn_pedido_cabecera.pca_estatus_pago='PP' then '${lbl:b_partial_aprobated}'
		when smn_comercial.smn_pedido_cabecera.pca_estatus_pago='PA' then '${lbl:b_paid}'
		when smn_comercial.smn_pedido_cabecera.pca_estatus_pago='GE' then '${lbl:b_generated}'
	end as estatus_pago
	
from
	smn_comercial.smn_pedido_cabecera
	inner join smn_comercial.smn_pedido_detalle on smn_comercial.smn_pedido_detalle.smn_pedido_cabecera_id = smn_comercial.smn_pedido_cabecera.smn_pedido_cabecera_id
	left join smn_comercial.smn_pedido_pagadores on smn_comercial.smn_pedido_pagadores.smn_pedido_cabecera_id = smn_comercial.smn_pedido_cabecera.smn_pedido_cabecera_id
	inner join smn_base.smn_entidades on smn_base.smn_entidades.smn_entidades_id = smn_comercial.smn_pedido_cabecera.smn_entidad_rf
	left join smn_base.smn_sucursales on smn_base.smn_sucursales.smn_sucursales_id = smn_comercial.smn_pedido_cabecera.smn_sucursal_rf
	left join smn_base.smn_areas_servicios on smn_base.smn_areas_servicios.smn_areas_servicios_id = smn_comercial.smn_pedido_cabecera.smn_area_servicio_rf
	left join smn_base.smn_unidades_servicios on smn_base.smn_unidades_servicios.smn_unidades_servicios_id = smn_comercial.smn_pedido_cabecera.smn_unidad_servicio_rf
	left join smn_base.smn_almacen on smn_base.smn_almacen.smn_almacen_id = smn_comercial.smn_pedido_cabecera.smn_almacen_rf
	left join smn_base.smn_centro_costo on smn_base.smn_centro_costo.smn_centro_costo_id = smn_comercial.smn_pedido_cabecera.smn_centro_costo_rf
	left join smn_comercial.smn_cliente on smn_comercial.smn_cliente.smn_cliente_id = smn_comercial.smn_pedido_cabecera.smn_cliente_id
	left join smn_base.smn_v_usuarios on smn_base.smn_v_usuarios.smn_usuarios_id = smn_comercial.smn_pedido_cabecera.smn_usuario_rf
	left join smn_base.smn_auxiliar on smn_base.smn_auxiliar.smn_auxiliar_id = smn_comercial.smn_cliente.smn_auxiliar_rf
	inner join smn_comercial.smn_documento on smn_comercial.smn_documento.smn_documento_id = smn_comercial.smn_pedido_cabecera.smn_documento_id
	left join smn_caja.smn_mov_caja_cabecera on smn_caja.smn_mov_caja_cabecera.smn_mov_caja_cabecera_id = smn_comercial.smn_pedido_cabecera.smn_mov_caja_cabecera_id
	left join smn_caja.smn_caja on smn_caja.smn_caja.smn_caja_id = smn_caja.smn_mov_caja_cabecera.smn_caja_id
	left join smn_comercial.smn_control_fiscal_documento on smn_comercial.smn_control_fiscal_documento.smn_documento_id=smn_comercial.smn_pedido_cabecera.smn_documento_id
	inner join smn_base.smn_documentos_generales on smn_base.smn_documentos_generales.smn_documentos_generales_id = smn_comercial.smn_documento.smn_documentos_generales_rf
	left join smn_base.smn_modulos on smn_base.smn_modulos.smn_modulos_id = cast(smn_comercial.smn_pedido_cabecera.smn_modulo_rf as INTEGER)
	left join smn_base.smn_condicion_financiera on smn_base.smn_condicion_financiera.smn_condicion_financiera_id = smn_comercial.smn_cliente.smn_condicion_financiera_rf
	left join smn_comercial.smn_tipo_pedido on smn_comercial.smn_tipo_pedido.smn_tipo_pedido_id = smn_comercial.smn_documento.smn_tipo_pedido_id
where 
	smn_comercial.smn_pedido_cabecera.smn_pedido_cabecera_id = ${fld:smn_pedido_cabecera_id} 
	AND smn_comercial.smn_pedido_cabecera.pca_estatus = 'PR' LIMIT 1
