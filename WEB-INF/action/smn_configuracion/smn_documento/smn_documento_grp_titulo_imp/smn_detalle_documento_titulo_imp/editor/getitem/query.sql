(select smn_base.smn_item.smn_item_id as id, smn_base.smn_item.itm_codigo|| ' - ' || smn_base.smn_item.itm_nombre as item from smn_base.smn_item order by smn_base.smn_item.itm_nombre) 
