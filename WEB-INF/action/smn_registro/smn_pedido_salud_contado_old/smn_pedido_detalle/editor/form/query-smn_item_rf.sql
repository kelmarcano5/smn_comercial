select smn_base.smn_item.smn_item_id as id, smn_base.smn_item.itm_nombre as item from smn_base.smn_item
inner join smn_comercial.smn_rel_linea_comercial_item on smn_comercial.smn_rel_linea_comercial_item.smn_item_rf = smn_base.smn_item.smn_item_id
inner join smn_comercial.smn_rel_centro_fac_linea on smn_comercial.smn_rel_centro_fac_linea.smn_linea_comercial_id = smn_comercial.smn_rel_linea_comercial_item.smn_linea_comercial_id
inner join smn_base.smn_baremos_detalle on smn_base.smn_baremos_detalle.smn_item_rf= smn_base.smn_item.smn_item_id
where smn_base.smn_baremos_detalle.bad_estatus='A' ORDER BY smn_base.smn_item.smn_item_id ASC
