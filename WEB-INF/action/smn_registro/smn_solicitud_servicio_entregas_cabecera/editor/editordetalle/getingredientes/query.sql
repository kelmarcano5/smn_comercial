select smn_comercial.smn_ingredientes.smn_ingredientes_id as smn_ingredientes_id, smn_base.smn_item.itm_nombre as item, smn_comercial.smn_ingredientes.igs_precio as precio from smn_comercial.smn_ingredientes
inner join smn_comercial.smn_catalogo_item_comercio on smn_comercial.smn_catalogo_item_comercio.smn_item_rf = smn_comercial.smn_ingredientes.smn_item_rf
inner join smn_base.smn_item on smn_base.smn_item.smn_item_id = smn_comercial.smn_ingredientes.smn_solicitud_servicio_entregas_detalle_id
where smn_comercial.smn_catalogo_item_comercio.smn_catalogo_item_comercio_id=${fld:id}