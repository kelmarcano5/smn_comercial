select
	smn_comercial.smn_pedido_detalle.smn_pedido_detalle_id,
	smn_comercial.smn_pedido_detalle.smn_pedido_cabecera_id,
	smn_comercial.smn_pedido_detalle.smn_mov_caja_cabecera_id,
	smn_comercial.smn_pedido_detalle.pde_cantidad_oferta,
	smn_comercial.smn_pedido_detalle.pde_cantidad_pedido,
	smn_comercial.smn_pedido_detalle.pde_cantidad_aprobada,
	smn_comercial.smn_pedido_detalle.pde_precio,
	smn_comercial.smn_pedido_detalle.pde_monto,
	smn_comercial.smn_pedido_detalle.pde_fecha_registro,
	smn_base.smn_item.itm_nombre as catalogo,
	smn_comercial.smn_pedido_detalle.pde_especificaciones_pedido as descripcion,
	smn_comercial.smn_pedido_detalle.pde_cantidad_aprobada as cantidad,
	smn_comercial.smn_pedido_detalle.pde_observaciones as requerimientos,
	smn_comercial.smn_pedido_detalle.pde_precio,
	smn_comercial.smn_pedido_detalle.pde_cantidad_aprobada*smn_comercial.smn_pedido_detalle.pde_precio as sed_monto_moneda_local
	
from
	smn_comercial.smn_pedido_detalle
	inner join smn_comercial.smn_catalogo_item_comercio on smn_comercial.smn_catalogo_item_comercio.smn_catalogo_item_comercio_id = smn_comercial.smn_pedido_detalle.smn_catalogo_item_comercio_id
	inner join smn_base.smn_item on smn_base.smn_item.smn_item_id = smn_comercial.smn_catalogo_item_comercio.smn_item_rf
where
	smn_pedido_detalle_id is not null
	${filter}
order by
		smn_pedido_detalle_id
