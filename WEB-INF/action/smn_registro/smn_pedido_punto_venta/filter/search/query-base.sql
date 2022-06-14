select DISTINCT
	smn_comercial.smn_pedido_cabecera.pca_monto_pedido_ml as monto_pedido,
	smn_comercial.smn_pedido_cabecera.smn_pedido_cabecera_id,
	case
		when smn_comercial.smn_pedido_cabecera.pca_estatus='RE' then '${lbl:b_register}'
		when smn_comercial.smn_pedido_cabecera.pca_estatus='GE' then '${lbl:b_generated}'
		when smn_comercial.smn_pedido_cabecera.pca_estatus='AN' then '${lbl:b_anulated}'
			when smn_comercial.smn_pedido_cabecera.pca_estatus='DE' then 'Despachada'
				when smn_comercial.smn_pedido_cabecera.pca_estatus='EP' then 'En Preparacion'
					when smn_comercial.smn_pedido_cabecera.pca_estatus='ED' then 'En Despacho'
	end as pca_estatus,
	case
		when smn_comercial.smn_pedido_cabecera.pca_estatus_pago='PE' then '${lbl:b_pending}'
		when smn_comercial.smn_pedido_cabecera.pca_estatus_pago='PP' then '${lbl:b_partial_aprobated}'
		when smn_comercial.smn_pedido_cabecera.pca_estatus_pago='PA' then '${lbl:b_paid}'
	end as pca_estatus_pago,
	smn_comercial.smn_documento.dcf_codigo ||' - '|| smn_comercial.smn_documento.dcf_descripcion as smn_documento_id,
	smn_comercial.smn_pedido_cabecera.pca_descripcion,
	smn_comercial.smn_centro_facturacion.cfc_nombre as smn_centro_facturacion_id,
	smn_comercial.smn_sub_centro_facturacion.scf_nombre as smn_sub_centro_facturacion_id,
	smn_comercial.smn_tipo_linea_comercial.tlc_nombre as smn_tipo_linea_comercial_id,
	smn_comercial.smn_linea_comercial.lco_nombre as smn_linea_comercial_id,
	smn_comercial.smn_pedido_cabecera.pca_fecha_registro,
	smn_comercial.smn_pedido_cabecera.pca_numero_pedido as numeropedido,
	smn_comercial.smn_pedido_cabecera.smn_sucursal_rf as sucursal,
	smn_comercial.smn_pedido_cabecera.smn_entidad_rf as entidad,
	smn_base.smn_auxiliar.aux_descripcion as cliente,
	smn_comercial.smn_pedido_cabecera.smn_documento_id as documento,
	smn_comercial.smn_cliente.smn_auxiliar_rf as auxiliar,
	smn_comercial.smn_pedido_cabecera.smn_pedido_cabecera_id as pedidoid,
	smn_comercial.smn_pedido_cabecera.pca_monto_neto_ml as monto,
	smn_comercial.smn_pedido_cabecera.pca_estatus as pca_estatus_val,
	smn_comercial.smn_pedido_cabecera.pca_tiempo_sug_preparacion as tiempo_inicio,
	smn_comercial.smn_pedido_cabecera.smn_pedido_cabecera_id as numero_documento,
	smn_comercial.smn_documento.dcf_descripcion as documento,
	smn_comercial.smn_pedido_cabecera.smn_centro_facturacion_id as centro_facturacion,
	smn_comercial.smn_pedido_cabecera.smn_entidad_rf as entidades,
	--smn_comercial.smn_pedido_detalle.pde_tiempo_sug_preparacion as tiempo_preparacion,
	smn_comercial.smn_pedido_cabecera.pca_hora_inicio_preparacion as hora_inicio,
	--smn_comercial.smn_pedido_detalle.smn_descripcion_ingrediente as extras,
	--smn_comercial.smn_pedido_detalle.pde_especificaciones_pedido as requisitos, 
	smn_comercial.smn_pedido_cabecera.pca_fecha_requerida,
	smn_comercial.smn_documento.smn_documento_id as documento_id,
	comp.aux_descripcion as comprador,
	smn_comercial.smn_pedido_cabecera.pca_cantidad as cantidad,
	smn_comercial.smn_pedido_cabecera.smn_linea_comercial_id,
	smn_comercial.smn_pedido_cabecera.pca_fecha_registro as fecha_registro
from
	smn_comercial.smn_pedido_cabecera
	--inner join smn_comercial.smn_pedido_cabecera on smn_comercial.smn_pedido_cabecera.smn_pedido_cabecera_id = smn_comercial.smn_pedido_detalle.smn_pedido_cabecera_id
	left outer join smn_comercial.smn_cliente on smn_comercial.smn_cliente.smn_cliente_id = smn_comercial.smn_pedido_cabecera.smn_cliente_id
	left outer join smn_base.smn_usuarios on smn_base.smn_usuarios.smn_usuarios_id = smn_comercial.smn_pedido_cabecera.smn_usuario_rf 
	left outer join smn_seguridad.s_user on smn_seguridad.s_user.user_id = smn_base.smn_usuarios.smn_user_rf
	left outer join smn_base.smn_v_usuarios on smn_base.smn_v_usuarios.smn_usuarios_id = smn_comercial.smn_pedido_cabecera.smn_usuario_rf 
	left outer join smn_base.smn_auxiliar on smn_base.smn_auxiliar.smn_auxiliar_id = smn_comercial.smn_cliente.smn_auxiliar_rf
	left outer join smn_base.smn_auxiliar comp on comp.smn_auxiliar_id = smn_comercial.smn_pedido_cabecera.smn_auxiliar_rf
	left outer join smn_comercial.smn_documento on smn_comercial.smn_documento.smn_documento_id = smn_comercial.smn_pedido_cabecera.smn_documento_id
	left outer join smn_comercial.smn_centro_facturacion on smn_comercial.smn_centro_facturacion.smn_centro_facturacion_id = smn_comercial.smn_pedido_cabecera.smn_centro_facturacion_id
	left outer join smn_comercial.smn_sub_centro_facturacion on smn_comercial.smn_sub_centro_facturacion.smn_sub_centro_facturacion_id = smn_comercial.smn_pedido_cabecera.smn_sub_centro_facturacion_id
	left outer join smn_comercial.smn_tipo_linea_comercial on smn_comercial.smn_tipo_linea_comercial.smn_tipo_linea_comercial_id = smn_comercial.smn_pedido_cabecera.smn_tipo_linea_comercial_id
	left outer join smn_comercial.smn_linea_comercial on smn_comercial.smn_linea_comercial.smn_linea_comercial_id = smn_comercial.smn_pedido_cabecera.smn_linea_comercial_id
	--left outer join smn_comercial.smn_catalogo_item_comercio on smn_comercial.smn_catalogo_item_comercio.smn_catalogo_item_comercio_id = smn_comercial.smn_pedido_detalle.smn_catalogo_item_comercio_id	
--	left outer join smn_base.smn_item it on it.smn_item_id = smn_comercial.smn_catalogo_item_comercio.smn_item_rf
where
	smn_comercial.smn_pedido_cabecera.smn_pedido_cabecera_id is not null and smn_comercial.smn_centro_facturacion.smn_centro_facturacion_id=${fld:centro_facturacion} and smn_comercial.smn_centro_facturacion.smn_entidades_rf=${fld:entidades}
	${filter}
order by smn_comercial.smn_pedido_cabecera.smn_pedido_cabecera_id DESC
