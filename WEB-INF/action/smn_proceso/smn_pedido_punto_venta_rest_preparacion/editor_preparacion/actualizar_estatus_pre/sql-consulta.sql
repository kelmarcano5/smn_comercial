select
	smn_comercial.smn_pedido_cabecera.smn_pedido_cabecera_id as numero_documento,
	case
	when smn_comercial.smn_pedido_cabecera.pca_estatus='DE' then 'dispatched'
	end as estatus,
	smn_comercial.smn_documento.dcf_descripcion as documento,
	smn_comercial.smn_pedido_cabecera.smn_pedido_cabecera_id as numero_documento,
	smn_base.smn_item.itm_nombre as item,
	smn_comercial.smn_pedido_detalle.smn_descripcion_ingrediente as ingrediente,
	smn_base.smn_v_auxiliar.smn_item as comprador,
	smn_comercial.smn_pedido_detalle.pde_especificaciones_pedido as requisitos,
	smn_comercial.smn_catalogo_item_comercio.cic_tiempo_sug_preparacion as tiempo,
	smn_comercial.smn_pedido_detalle.pde_cantidad_pedido as cantidad,
	--smn_comercial.smn_pedido_cabecera.ped_ as horai,
	smn_comercial.smn_pedido_cabecera.pca_hora_despacho as horad,
	smn_comercial.smn_documento.dcf_codigo||' - '|| smn_comercial.smn_documento.dcf_descripcion as smn_documento_id,
	smn_comercial.smn_pedido_cabecera.smn_documento_id as smn_documento_id1,
	smn_base.smn_formas_pago.smn_formas_pago_id as smn_forma_pago_rf1,
	smn_comercial.smn_pedido_cabecera.pca_descripcion,
	smn_comercial.smn_pedido_detalle.pde_fecha_registro as fecha_registro
	
from
	smn_comercial.smn_pedido_detalle
	left outer join smn_comercial.smn_pedido_cabecera on smn_comercial.smn_pedido_cabecera.smn_pedido_cabecera_id = smn_comercial.smn_pedido_detalle.smn_pedido_cabecera_id
	left outer join smn_base.smn_unidad_medida on smn_base.smn_unidad_medida.smn_unidad_medida_id = smn_comercial.smn_pedido_detalle.smn_unidad_medida_rf
	left outer join smn_base.smn_monedas on smn_base.smn_monedas.smn_monedas_id = smn_comercial.smn_pedido_detalle.smn_moneda_rf
	left outer join smn_comercial.smn_catalogo_item_comercio on smn_comercial.smn_catalogo_item_comercio.smn_catalogo_item_comercio_id = smn_comercial.smn_pedido_detalle.smn_catalogo_item_comercio_id	
	left outer join smn_base.smn_item on smn_base.smn_item.smn_item_id = smn_comercial.smn_catalogo_item_comercio.smn_item_rf
	left outer join smn_comercial.smn_documento on smn_comercial.smn_documento.smn_documento_id = smn_comercial.smn_pedido_cabecera.smn_documento_id
	left outer join smn_comercial.smn_cliente on smn_comercial.smn_cliente.smn_cliente_id = smn_comercial.smn_pedido_cabecera.smn_cliente_id
	left outer join smn_base.smn_auxiliar on smn_base.smn_auxiliar.smn_auxiliar_id = smn_comercial.smn_cliente.smn_auxiliar_rf
	left outer join smn_base.smn_v_auxiliar on smn_base.smn_v_auxiliar.smn_v_auxiliar_id = smn_comercial.smn_pedido_cabecera.smn_auxiliar_rf
	left outer join smn_comercial.smn_pago_punto_venta on smn_comercial.smn_pago_punto_venta.smn_pedido_cabecera_id = smn_comercial.smn_pedido_cabecera.smn_pedido_cabecera_id
	left outer join smn_base.smn_formas_pago on smn_base.smn_formas_pago.smn_formas_pago_id = smn_comercial.smn_pago_punto_venta.smn_forma_pago_rf
where 
	smn_comercial.smn_pedido_detalle.smn_pedido_cabecera_id=${fld:id}