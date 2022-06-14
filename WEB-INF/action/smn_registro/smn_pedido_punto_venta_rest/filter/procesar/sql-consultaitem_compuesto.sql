select 
   smn_item_id as item_comp_id,
   icd_cantidad as cantidad_comp
from smn_inventario.smn_item_compuesto_detalle
where smn_caracteristica_item_id=${fld:id_caracteristica}