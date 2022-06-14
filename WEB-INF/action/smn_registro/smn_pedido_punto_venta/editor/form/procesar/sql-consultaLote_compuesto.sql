select smn_control_lote_id as id_lote,
       col_fecha_vencimiento as fecha_venc 
from smn_comercial.smn_pedido_detalle
  inner join smn_inventario.smn_caracteristica_item on smn_inventario.smn_caracteristica_item.smn_item_rf=smn_comercial.smn_pedido_detalle.smn_item_rf
  inner join smn_comercial.smn_pedido_cabecera on smn_comercial.smn_pedido_cabecera.smn_pedido_cabecera_id=smn_comercial.smn_pedido_detalle.smn_pedido_cabecera_id
  inner join smn_inventario.smn_caracteristica_almacen on smn_inventario.smn_caracteristica_almacen.smn_almacen_rf=smn_comercial.smn_pedido_cabecera.smn_almacen_rf
  left join smn_inventario.smn_control_lote on smn_inventario.smn_control_lote.smn_caracteristica_almacen_id=smn_inventario.smn_caracteristica_almacen.smn_caracteristica_almacen_id 
  
where 
  smn_inventario.smn_control_lote.smn_caracteristica_item_id=smn_inventario.smn_caracteristica_item.smn_caracteristica_item_id and
  smn_inventario.smn_control_lote.col_cantidad_final > 0 and
  smn_inventario.smn_control_lote.col_fecha_vencimiento > {d '${def:date}'} and
  smn_comercial.smn_pedido_detalle.smn_pedido_detalle_id=${fld:smn_pedido_detalle_id}
  order by col_fecha_vencimiento asc
  limit 1;