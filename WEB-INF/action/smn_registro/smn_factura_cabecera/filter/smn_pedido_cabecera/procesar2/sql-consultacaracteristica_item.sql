select 
 smn_caracteristica_item_id as caracteristica_item_id,
 smn_item_rf as item_id,
 cit_item_compuesto as item_compuesto
 from smn_inventario.smn_caracteristica_item
 where smn_item_rf=${fld:id_item}
