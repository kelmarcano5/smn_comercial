select 
(select last_value FROM smn_comercial.seq_smn_catalogo_item_comercio) as producto_id,
smn_base.smn_item.itm_nombre as nombre,
smn_comercial.smn_catalogo_item_comercio.cic_descripcion as description,
smn_base.smn_baremos_detalle.bad_cantidad as quantity,
smn_base.smn_baremos_detalle.bad_precio_moneda_local as price,
smn_comercial.smn_cliente.smn_cliente_id as comercio,
smn_comercial.smn_categoria_menu.cam_descripcion as categoria_menu,
smn_comercial.smn_categoria_item.cai_descripcion as categoria_item,
case
	when smn_comercial.smn_catalogo_item_comercio.cic_maneja_ingredientes='SI' then 'true'
	when smn_comercial.smn_catalogo_item_comercio.cic_maneja_ingredientes='NO' then 'false'
end as adding,
smn_comercial.smn_catalogo_item_comercio.cic_tiempo_sug_preparacion as delivery_time
from smn_comercial.smn_catalogo_item_comercio 
inner join smn_comercial.smn_cliente on smn_comercial.smn_cliente.smn_cliente_id = smn_comercial.smn_catalogo_item_comercio.smn_cliente_rf 
inner join smn_base.smn_baremos on smn_base.smn_baremos.smn_baremos_id = smn_comercial.smn_catalogo_item_comercio.smn_baremos_rf
inner join smn_base.smn_baremos_detalle on smn_base.smn_baremos_detalle.smn_baremos_id = smn_base.smn_baremos.smn_baremos_id
inner join smn_base.smn_item on smn_base.smn_item.smn_item_id = smn_comercial.smn_catalogo_item_comercio.smn_item_rf
inner join smn_base.smn_auxiliar on smn_base.smn_auxiliar.smn_auxiliar_id = smn_comercial.smn_cliente.smn_auxiliar_rf
left outer join smn_comercial.smn_categoria_menu on smn_comercial.smn_categoria_menu.smn_categoria_menu_id = smn_comercial.smn_catalogo_item_comercio.smn_categoria_menu_id
left outer join smn_comercial.smn_categoria_item on smn_comercial.smn_categoria_item.smn_categoria_item_id = smn_comercial.smn_catalogo_item_comercio.smn_categoria_item_id_a
where smn_comercial.smn_catalogo_item_comercio.smn_item_rf = smn_base.smn_baremos_detalle.smn_item_rf and smn_comercial.smn_catalogo_item_comercio.smn_catalogo_item_comercio_id=${fld:id}