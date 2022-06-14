select DISTINCT
	smn_comercial.smn_orden_servicio_detalle.smn_orden_servicio_detalle_id,
	case
		when smn_comercial.smn_orden_servicio_detalle.smn_tipo_componente='SE' then 'Servicio'
		when smn_comercial.smn_orden_servicio_detalle.smn_tipo_componente='IT' then 'Item'
		when smn_comercial.smn_orden_servicio_detalle.smn_tipo_componente='CO' then 'Componentes'
	end as smn_tipo_componente,
	case
		when smn_comercial.smn_orden_servicio_detalle.osd_estatus='RE' then 'Registrado'
		when smn_comercial.smn_orden_servicio_detalle.osd_estatus='GE' then '${lbl:b_generada}'
		when smn_comercial.smn_orden_servicio_detalle.osd_estatus='DV' then 'Devolucion'
		when smn_comercial.smn_orden_servicio_detalle.osd_estatus='AP' then 'Aprobado'
		when smn_comercial.smn_orden_servicio_detalle.osd_estatus='RC' then 'Recibido'
	end as osd_estatus,
	smn_comercial.smn_orden_servicio_detalle.smn_orden_cab_det_servicio_id,
	smn_comercial.smn_orden_servicio_detalle.smn_item_rf,
	smn_comercial.smn_orden_servicio_detalle.osd_cantidad,
	smn_inventario.smn_control_item.coi_valor_final as dde_costo_ml,
	smn_inventario.smn_control_item.coi_valor_final_ma as dde_costo_ma,
	smn_comercial.smn_orden_servicio_detalle.osd_fecha_registro
from
	smn_comercial.smn_orden_servicio_detalle
	inner join smn_comercial.smn_orden_cab_det_servicio on smn_comercial.smn_orden_cab_det_servicio.smn_orden_cab_det_servicio_id = 	smn_comercial.smn_orden_servicio_detalle.smn_orden_cab_det_servicio_id
	inner join smn_inventario.smn_caracteristica_item on smn_inventario.smn_caracteristica_item.smn_item_rf = smn_comercial.smn_orden_servicio_detalle.smn_item_rf
	inner join smn_inventario.smn_control_item on smn_inventario.smn_control_item.smn_item_id = smn_inventario.smn_caracteristica_item.smn_item_rf
where 
	smn_comercial.smn_orden_cab_det_servicio.smn_orden_servicio_id =${fld:id2} 