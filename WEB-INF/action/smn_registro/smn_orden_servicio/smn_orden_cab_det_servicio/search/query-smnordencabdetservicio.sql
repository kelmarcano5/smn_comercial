select DISTINCT
		smn_comercial.smn_orden_cab_det_servicio.smn_orden_cab_det_servicio_id,
	smn_comercial.smn_orden_servicio.smn_orden_servicio_id,
	smn_comercial.smn_orden_servicio.ors_descripcion as ors_descripcion_pl0,
	case
	when smn_comercial.smn_orden_cab_det_servicio.ocd_estatus='RE' then 'Registrada'
	when smn_comercial.smn_orden_cab_det_servicio.ocd_estatus='GE' then '${lbl:b_generated}'
	when smn_comercial.smn_orden_cab_det_servicio.ocd_estatus='AP' then '${lbl:b_aprobated}'
	end as ocd_estatus,
	smn_comercial.smn_orden_cab_det_servicio.ocd_observacion,
	smn_comercial.smn_orden_cab_det_servicio.ocd_fecha_registro
	
from
	smn_comercial.smn_orden_cab_det_servicio
	inner join smn_comercial.smn_orden_servicio on smn_comercial.smn_orden_servicio.smn_orden_servicio_id = smn_comercial.smn_orden_cab_det_servicio.smn_orden_servicio_id
	inner join smn_comercial.smn_rel_orden_servicio on smn_comercial.smn_rel_orden_servicio.smn_orden_servicio_id = smn_comercial.smn_orden_cab_det_servicio.smn_orden_servicio_id
	inner join smn_base.smn_servicios on smn_base.smn_servicios.smn_servicios_id = smn_comercial.smn_rel_orden_servicio.smn_servicios_rf
	left outer join smn_base.smn_componentes on smn_base.smn_componentes.smn_servicios_rf = smn_base.smn_servicios.smn_servicios_id

where
	smn_comercial.smn_orden_cab_det_servicio.smn_orden_servicio_id=${fld:id2}