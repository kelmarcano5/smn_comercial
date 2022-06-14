	select 	smn_comercial.smn_pedido_cabecera.pca_monto_pedido_ml as monto_pedido,
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
	smn_comercial.smn_pedido_cabecera.pca_descripcion,
	smn_comercial.smn_pedido_cabecera.pca_fecha_registro,
	smn_comercial.smn_pedido_cabecera.pca_numero_pedido as numeropedido,
	smn_comercial.smn_pedido_cabecera.smn_sucursal_rf as sucursal,
	smn_comercial.smn_pedido_cabecera.smn_entidad_rf as entidad,
	smn_base.smn_auxiliar.aux_descripcion as cliente,
	smn_comercial.smn_pedido_cabecera.pca_monto_neto_ml,
	smn_comercial.smn_pedido_cabecera.pca_monto_neto_ma,
	comp.aux_descripcion as comprador,
	smn_comercial.smn_pedido_cabecera.pca_cantidad as cantidad,
	smn_base.smn_monedas.mon_simbolo,
	promo.aux_descripcion as promotor,
	smn_base.smn_auxiliar.aux_rif as rif,
	smn_base.smn_direccion.dir_descripcion as direccion,
	smn_base.smn_contactos.cnt_telefono_contacto as telefono,
	smn_comercial.smn_pedido_cabecera.pca_fecha_vencimiento as fecha_vencimiento

from
	smn_comercial.smn_pedido_cabecera
	left join smn_comercial.smn_cliente on smn_comercial.smn_cliente.smn_cliente_id = smn_comercial.smn_pedido_cabecera.smn_cliente_id
	left join smn_base.smn_usuarios on smn_base.smn_usuarios.smn_usuarios_id = smn_comercial.smn_pedido_cabecera.smn_usuario_rf 
	left join smn_seguridad.s_user on smn_seguridad.s_user.user_id = smn_base.smn_usuarios.smn_user_rf
	left join smn_base.smn_v_usuarios on smn_base.smn_v_usuarios.smn_usuarios_id = smn_comercial.smn_pedido_cabecera.smn_usuario_rf 
	left join smn_base.smn_auxiliar on smn_base.smn_auxiliar.smn_auxiliar_id = smn_comercial.smn_cliente.smn_auxiliar_rf
	left join smn_base.smn_auxiliar comp on comp.smn_auxiliar_id = smn_comercial.smn_pedido_cabecera.smn_auxiliar_rf
	left join smn_comercial.smn_documento on smn_comercial.smn_documento.smn_documento_id = smn_comercial.smn_pedido_cabecera.smn_documento_id
	left join smn_base.smn_monedas on smn_base.smn_monedas.smn_monedas_id = smn_comercial.smn_pedido_cabecera.smn_moneda_rf
	left join smn_comercial.smn_rol on smn_comercial.smn_rol.smn_usuarios_rf = smn_base.smn_usuarios.smn_usuarios_id
	left join smn_comercial.smn_cliente vend on vend.smn_promotor_rf = 	smn_comercial.smn_pedido_cabecera.pca_vendedor
	left join smn_base.smn_auxiliar promo on promo.smn_auxiliar_id = smn_comercial.smn_cliente.smn_promotor_rf
	left join smn_base.smn_direccion on smn_base.smn_direccion.smn_direccion_id = smn_base.smn_auxiliar.aux_direccion_rf
	left join smn_base.smn_contactos on smn_base.smn_contactos.smn_auxiliar_id = smn_base.smn_auxiliar.smn_auxiliar_id
where
	smn_comercial.smn_pedido_cabecera.smn_pedido_cabecera_id = ${fld:id}