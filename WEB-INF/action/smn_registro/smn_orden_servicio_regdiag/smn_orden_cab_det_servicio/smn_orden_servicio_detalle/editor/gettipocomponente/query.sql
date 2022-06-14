select smn_base.smn_nivel_estructura.nes_tipo as tipo
from smn_base.smn_item
inner join smn_base.smn_nivel_estructura 
on smn_base.smn_nivel_estructura.smn_nivel_estructura_id = smn_base.smn_item.smn_nivel_estructura_id
where smn_base.smn_item.smn_item_id=${fld:id}