with row as (select smn_base.smn_item.smn_item_id, smn_inventario.smn_control_item.coi_saldo_final_existencia as cantidad_existente, smn_inventario.smn_control_item.coi_cantidad_reservada as cantidad_reserva, smn_inventario.smn_control_item.coi_fecha_movimiento
from smn_inventario.smn_control_item 
inner join smn_base.smn_item on smn_base.smn_item.smn_item_id = smn_inventario.smn_control_item.smn_item_id 
where smn_inventario.smn_control_item.smn_item_id=${fld:cod_itm}  and smn_inventario.smn_control_item.coi_fecha_movimiento=(SELECT MAX(smn_inventario.smn_control_item.coi_fecha_movimiento) from smn_inventario.smn_control_item WHERE smn_inventario.smn_control_item.smn_item_id=${fld:cod_itm})
)
update smn_inventario.smn_control_item
set
coi_saldo_final_existencia=-row.cantidad_existente - ${fld:cant_ped},
coi_cantidad_reservada=${fld:cant_ped}  
from row
where
smn_inventario.smn_control_item.smn_item_id = ${fld:cod_itm}  and smn_inventario.smn_control_item.coi_fecha_movimiento=(SELECT MAX(smn_inventario.smn_control_item.coi_fecha_movimiento) from smn_inventario.smn_control_item WHERE smn_inventario.smn_control_item.smn_item_id=${fld:cod_itm})