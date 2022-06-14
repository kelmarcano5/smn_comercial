select
		smn_comercial.smn_orden_servicio_detalle.smn_orden_servicio_detalle_id,
	case
	when smn_comercial.smn_orden_servicio_detalle.smn_tipo_componente='RE' then 'Relacionado'
	when smn_comercial.smn_orden_servicio_detalle.smn_tipo_componente='IN' then 'Independiente'
	end as smn_tipo_componente,
	case
	when smn_comercial.smn_orden_servicio_detalle.osd_estatus='RE' then '${lbl:b_registrado}'
	when smn_comercial.smn_orden_servicio_detalle.osd_estatus='GE' then '${lbl:b_generada}'
	end as osd_estatus,
	smn_comercial.smn_orden_servicio_detalle.smn_orden_cab_det_servicio_id,
	smn_comercial.smn_orden_servicio_detalle.smn_servicios_rf,
	smn_comercial.smn_orden_servicio_detalle.smn_item_rf,
	smn_comercial.smn_orden_servicio_detalle.smn_componentes_rf,
	smn_comercial.smn_orden_servicio_detalle.osd_cantidad,
	smn_comercial.smn_orden_servicio_detalle.smn_grupo_prestador_rf,
	smn_comercial.smn_orden_servicio_detalle.smn_prestador_servicio_rf,
	smn_comercial.smn_orden_servicio_detalle.smn_nivel_estructura_rf,
	smn_comercial.smn_orden_servicio_detalle.osd_fecha_registro
	
from
	smn_comercial.smn_orden_servicio_detalle
	inner join smn_base.smn_servicios on smn_base.smn_servicios.smn_servicios_id = smn_comercial.smn_orden_servicio_detalle.smn_servicios_rf
	left join smn_base.smn_item on smn_base.smn_item.smn_item_id = smn_comercial.smn_orden_servicio_detalle.smn_item_rf
	left join smn_base.smn_componentes on smn_base.smn_componentes.smn_componentes_id = smn_comercial.smn_orden_servicio_detalle.smn_componentes_rf
	left join smn_base.smn_grupos_prestadores on smn_base.smn_grupos_prestadores.smn_grupos_prestadores_id = smn_comercial.smn_orden_servicio_detalle.smn_grupo_prestador_rf
	left join smn_base.smn_prestadores_servicios on smn_base.smn_prestadores_servicios.smn_prestadores_servicios_id = smn_comercial.smn_orden_servicio_detalle.smn_prestador_servicio_rf
	left join smn_base.smn_nivel_estructura on smn_base.smn_nivel_estructura.smn_nivel_estructura_id = smn_comercial.smn_orden_servicio_detalle.smn_nivel_estructura_rf
where
	smn_orden_servicio_detalle_id = ${fld:id}
