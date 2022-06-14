select
	smn_comercial.smn_pedido_detalle.smn_pedido_detalle_id,
	smn_comercial.smn_pedido_detalle.smn_pedido_cabecera_id,
	smn_comercial.smn_pedido_detalle.pde_cantidad_pedido,
	smn_comercial.smn_pedido_detalle.pde_cantidad_aprobada,
	smn_comercial.smn_pedido_detalle.pde_precio,
	smn_comercial.smn_pedido_detalle.pde_monto,
	smn_comercial.smn_pedido_detalle.pde_fecha_registro,
	smn_base.smn_item.itm_nombre as catalogo,
	smn_comercial.smn_pedido_detalle.smn_descripcion_ingrediente as descripcion,
	smn_comercial.smn_pedido_detalle.pde_cantidad_aprobada as cantidad,
	smn_comercial.smn_pedido_detalle.pde_observaciones as requerimientos,
	smn_comercial.smn_pedido_detalle.pde_precio,
	smn_comercial.smn_pedido_cabecera.pca_numero_pedido as numeropedido,
		smn_comercial.smn_pedido_cabecera.pca_descripcion as descripcion_cab,
	smn_comercial.smn_pedido_cabecera.pca_estatus as pca_estatus_val,
	smn_comercial.smn_pedido_cabecera.smn_sucursal_rf as sucursal,
	smn_comercial.smn_pedido_cabecera.smn_entidad_rf as entidad,
	smn_comercial.smn_pedido_cabecera.smn_cliente_id as cliente,
		comp.aux_descripcion as comprador,
			smn_comercial.smn_pedido_detalle.pde_monto as monto
	
from
	smn_comercial.smn_pedido_detalle
	left outer join smn_base.smn_item on smn_base.smn_item.smn_item_id = smn_comercial.smn_pedido_detalle.smn_item_rf
	left outer join smn_comercial.smn_pedido_cabecera on 
	smn_comercial.smn_pedido_cabecera.smn_pedido_cabecera_id = smn_comercial.smn_pedido_detalle.smn_pedido_cabecera_id
	left outer join smn_comercial.smn_cliente on smn_comercial.smn_cliente.smn_cliente_id = smn_comercial.smn_pedido_cabecera.smn_cliente_id
	left outer join smn_base.smn_usuarios on smn_base.smn_usuarios.smn_usuarios_id = smn_comercial.smn_pedido_cabecera.smn_usuario_rf 
	left outer join smn_seguridad.s_user on smn_seguridad.s_user.user_id = smn_base.smn_usuarios.smn_user_rf
	left outer join smn_base.smn_v_usuarios on smn_base.smn_v_usuarios.smn_usuarios_id = smn_comercial.smn_pedido_cabecera.smn_usuario_rf 
	left outer join smn_base.smn_auxiliar on smn_base.smn_auxiliar.smn_auxiliar_id = smn_comercial.smn_cliente.smn_auxiliar_rf
	left outer join smn_base.smn_auxiliar comp on comp.smn_auxiliar_id = smn_comercial.smn_pedido_cabecera.smn_auxiliar_rf
where
	smn_comercial.smn_pedido_detalle.smn_pedido_cabecera_id=${fld:id2}
