select
	smn_comercial.smn_pedido_detalle.smn_pedido_detalle_id,
		smn_comercial.smn_pedido_cabecera.smn_pedido_cabecera_id as numero_documento,
	smn_base.smn_item.itm_nombre as item,
	smn_comercial.smn_catalogo_item_comercio.cic_tiempo_sug_preparacion as tiempo,
	smn_comercial.smn_documento.dcf_descripcion as documento,
	smn_comercial.smn_pedido_detalle.pde_cantidad_pedido as cantidad,
	smn_comercial.smn_pedido_detalle.pde_monto as monto,
	case
	when smn_comercial.smn_pedido_cabecera.pca_estatus='SO' then '${lbl:b_solicitada}'
	when smn_comercial.smn_pedido_cabecera.pca_estatus='AC' then '${lbl:b_aprobada_comercio}'
	when smn_comercial.smn_pedido_cabecera.pca_estatus='AS' then '${lbl:b_aprobada_solicitante}'
	when smn_comercial.smn_pedido_cabecera.pca_estatus='EP' then '${lbl:b_en_proceso}'
	when smn_comercial.smn_pedido_cabecera.pca_estatus='DE' then '${lbl:b_despachado}'
	when smn_comercial.smn_pedido_cabecera.pca_estatus='EN' then '${lbl:b_entregado}'
	when smn_comercial.smn_pedido_cabecera.pca_estatus='RE' then '${lbl:b_rechazado}'
	end as estatus_proceso,
	smn_comercial.smn_pedido_cabecera.smn_pedido_cabecera_id,
	smn_comercial.smn_pedido_detalle.pde_fecha_registro as fecha_registro
from
	smn_comercial.smn_pedido_detalle	
	left outer join smn_comercial.smn_pedido_cabecera on smn_comercial.smn_pedido_cabecera.smn_pedido_cabecera_id = smn_comercial.smn_pedido_detalle.smn_pedido_cabecera_id
	left outer join smn_base.smn_unidad_medida on smn_base.smn_unidad_medida.smn_unidad_medida_id = smn_comercial.smn_pedido_detalle.smn_unidad_medida_rf
	left outer join smn_base.smn_monedas on smn_base.smn_monedas.smn_monedas_id = smn_comercial.smn_pedido_detalle.smn_moneda_rf
	left outer join smn_comercial.smn_catalogo_item_comercio 
	on smn_comercial.smn_catalogo_item_comercio.smn_item_rf = smn_comercial.smn_pedido_detalle.smn_item_rf
	left outer join smn_base.smn_item on smn_base.smn_item.smn_item_id = smn_comercial.smn_catalogo_item_comercio.smn_item_rf
	left outer join smn_comercial.smn_documento on smn_comercial.smn_documento.smn_documento_id = smn_comercial.smn_pedido_cabecera.smn_documento_id
WHERE	
	 smn_comercial.smn_pedido_cabecera smn_pedido_cabecera_id = ${fld:id} and smn_comercial.smn_pedido_cabecera.pca_estatus='EP'


