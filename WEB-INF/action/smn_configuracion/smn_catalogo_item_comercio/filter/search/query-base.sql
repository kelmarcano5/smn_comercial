select
		smn_comercial.smn_catalogo_item_comercio.smn_catalogo_item_comercio_id,
	smn_base.smn_entidades.ent_descripcion_corta as smn_cliente_rf,
	smn_base.smn_item.itm_nombre as smn_item_rf,
	smn_base.smn_item.itm_nombre as smn_item_rf_des,
	smn_comercial.smn_catalogo_item_comercio.cic_tiempo_sug_preparacion,
	smn_comercial.smn_categoria_menu.cam_descripcion as smn_categoria_menu_id,
	smn_comercial.smn_categoria_item.cai_descripcion as smn_categoria_item_id_a,
	smn_comercial.smn_categoria_item.cai_descripcion as smn_categoria_item_id_b,
	smn_base.smn_baremos.bar_descripcion as smn_baremos_rf,
	smn_comercial.smn_catalogo_item_comercio.smn_item_rf as smn_item_rf2,
	smn_comercial.smn_catalogo_item_comercio.cic_maneja_ingredientes as maneja_ingredientes,
	smn_comercial.smn_catalogo_item_comercio.smn_unidad_medida_rf,
	smn_comercial.smn_catalogo_item_comercio.cic_fecha_registro
	
from
	smn_comercial.smn_catalogo_item_comercio
	left outer join smn_comercial.smn_categoria_menu on smn_comercial.smn_categoria_menu.smn_categoria_menu_id = smn_comercial.smn_catalogo_item_comercio.smn_categoria_menu_id
	left outer join smn_comercial.smn_categoria_item on smn_comercial.smn_categoria_item.smn_categoria_item_id = smn_comercial.smn_catalogo_item_comercio.smn_categoria_item_id_a
	left outer join smn_base.smn_baremos on smn_base.smn_baremos.smn_baremos_id = smn_comercial.smn_catalogo_item_comercio.smn_baremos_rf
	left outer join smn_base.smn_item on smn_base.smn_item.smn_item_id = smn_comercial.smn_catalogo_item_comercio.smn_item_rf
	inner join smn_base.smn_entidades on smn_base.smn_entidades.smn_entidades_id = smn_comercial.smn_catalogo_item_comercio.smn_cliente_rf
	inner join smn_base.smn_sucursales on smn_base.smn_sucursales.suc_empresa = smn_comercial.smn_catalogo_item_comercio.smn_cliente_rf
where
	smn_catalogo_item_comercio_id is not null
	${filter}
order by smn_base.smn_entidades.smn_entidades_id asc
