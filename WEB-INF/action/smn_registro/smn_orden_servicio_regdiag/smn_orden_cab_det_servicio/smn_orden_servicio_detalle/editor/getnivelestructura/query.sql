select DISTINCT smn_base.smn_nivel_estructura.smn_nivel_estructura_id as id, smn_base.smn_nivel_estructura.nes_codigo ||' - '|| smn_base.smn_nivel_estructura.nes_nombre as item
from smn_base.smn_nivel_estructura
inner join smn_base.smn_item on smn_base.smn_item.smn_nivel_estructura_id = smn_base.smn_nivel_estructura.smn_nivel_estructura_id 
where smn_base.smn_item.smn_nivel_estructura_id=(select smn_base.smn_componentes.smn_item_rf from smn_base.smn_componentes where smn_base.smn_componentes.smn_componentes_id =${fld:id})
