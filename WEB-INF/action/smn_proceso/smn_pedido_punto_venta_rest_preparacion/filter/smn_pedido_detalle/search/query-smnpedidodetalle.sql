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
	smn_comercial.smn_pedido_detalle.smn_descripcion_ingrediente as descripcion,
	smn_comercial.smn_pedido_detalle.pde_cantidad_aprobada as cantidad,
	smn_comercial.smn_pedido_detalle.pde_observaciones as requerimientos,
	smn_comercial.smn_pedido_detalle.pde_precio,
	smn_comercial.smn_pedido_cabecera.pca_numero_pedido as numeropedido,
	smn_comercial.smn_pedido_cabecera.smn_oferta_id as oferta,
	smn_comercial.smn_pedido_cabecera.smn_sucursal_rf as sucursal,
	smn_comercial.smn_pedido_cabecera.smn_entidad_rf as entidad,
	smn_comercial.smn_pedido_cabecera.smn_cliente_id as cliente,
	smn_comercial.smn_pedido_cabecera.smn_mov_caja_cabecera_id as caja,
	smn_comercial.smn_pedido_cabecera.smn_documento_id as documento,
	smn_comercial.smn_pedido_detalle.pde_cantidad_aprobada*smn_comercial.smn_pedido_detalle.pde_precio as sed_monto_moneda_local
	
from
	smn_comercial.smn_pedido_detalle
	inner join smn_comercial.smn_catalogo_item_comercio on smn_comercial.smn_catalogo_item_comercio.smn_catalogo_item_comercio_id = smn_comercial.smn_pedido_detalle.smn_catalogo_item_comercio_id
	inner join smn_base.smn_item on smn_base.smn_item.smn_item_id = smn_comercial.smn_catalogo_item_comercio.smn_item_rf
		inner join smn_comercial.smn_pedido_cabecera on 
	smn_comercial.smn_pedido_cabecera.smn_pedido_cabecera_id = smn_comercial.smn_pedido_detalle.smn_pedido_cabecera_id
where
	smn_comercial.smn_pedido_detalle.smn_pedido_cabecera_id=${fld:id2}
