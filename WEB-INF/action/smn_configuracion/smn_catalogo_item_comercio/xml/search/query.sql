select
		smn_comercial.smn_catalogo_item_comercio.smn_catalogo_item_comercio_id,
	case
	when smn_comercial.smn_catalogo_item_comercio.cic_origen='ES' then '${lbl:b_escaneado}'
	when smn_comercial.smn_catalogo_item_comercio.cic_origen='IM' then '${lbl:b_importado}'
	when smn_comercial.smn_catalogo_item_comercio.cic_origen='RE' then '${lbl:b_registrado}'
	end as cic_origen,
	smn_base.smn_auxiliar.aux_descripcion as smn_cliente_rf,
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
	left outer join smn_comercial.smn_cliente on smn_comercial.smn_cliente.smn_cliente_id = smn_comercial.smn_catalogo_item_comercio.smn_cliente_rf
	left outer join smn_comercial.smn_categoria_menu on smn_comercial.smn_categoria_menu.smn_categoria_menu_id = smn_comercial.smn_catalogo_item_comercio.smn_categoria_menu_id
	left outer join smn_comercial.smn_categoria_item on smn_comercial.smn_categoria_item.smn_categoria_item_id = smn_comercial.smn_catalogo_item_comercio.smn_categoria_item_id_a
	left outer join smn_base.smn_baremos on smn_base.smn_baremos.smn_baremos_id = smn_comercial.smn_catalogo_item_comercio.smn_baremos_rf
	left outer join smn_base.smn_item on smn_base.smn_item.smn_item_id = smn_comercial.smn_catalogo_item_comercio.smn_item_rf
	left outer join smn_base.smn_auxiliar on smn_base.smn_auxiliar.smn_auxiliar_id = smn_comercial.smn_cliente.smn_auxiliar_rf

