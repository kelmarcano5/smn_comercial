select smn_base.smn_item.smn_item_id as id, smn_base.smn_item.itm_codigo||' - '|| smn_base.smn_item.itm_nombre as item
from smn_base.smn_item
inner join smn_base.smn_nivel_estructura 
on smn_base.smn_nivel_estructura.smn_nivel_estructura_id = smn_base.smn_item.smn_nivel_estructura_id
where smn_base.smn_item.smn_nivel_estructura_id=${fld:id}