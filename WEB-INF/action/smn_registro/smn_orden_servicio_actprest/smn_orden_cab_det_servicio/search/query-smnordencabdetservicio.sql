select DISTINCT
		smn_comercial.smn_orden_cab_det_servicio.smn_orden_cab_det_servicio_id,
	smn_comercial.smn_orden_servicio.smn_orden_servicio_id,
	smn_base.smn_servicios.svc_descripcion as ors_descripcion_pl0,
	case
	when smn_comercial.smn_orden_cab_det_servicio.ocd_estatus='RE' then 'Registrada'
	when smn_comercial.smn_orden_cab_det_servicio.ocd_estatus='GE' then '${lbl:b_generated}'
	when smn_comercial.smn_orden_cab_det_servicio.ocd_estatus='AP' then '${lbl:b_aprobated}'
	when smn_comercial.smn_orden_cab_det_servicio.ocd_estatus='TE' then 'Terminada'
	when smn_comercial.smn_orden_cab_det_servicio.ocd_estatus='RZ' then 'Rechazada'
	when smn_comercial.smn_orden_cab_det_servicio.ocd_estatus='SO' then 'Solicitada'
	end as ocd_estatus,
	smn_comercial.smn_orden_cab_det_servicio.ocd_estatus as estatus,
	smn_comercial.smn_orden_cab_det_servicio.ocd_observacion,
	smn_comercial.smn_rel_orden_servicio.smn_servicios_rf,
	smn_comercial.smn_orden_cab_det_servicio.ocd_fecha_registro,
	smn_comercial.smn_orden_cab_det_servicio.ocd_fecha_inicio,
	smn_comercial.smn_orden_cab_det_servicio.ocd_fecha_culminacion,
	smn_comercial.smn_orden_cab_det_servicio.ocd_horas_laboradas
	
from
	smn_comercial.smn_orden_cab_det_servicio
	inner join smn_comercial.smn_orden_servicio on smn_comercial.smn_orden_servicio.smn_orden_servicio_id = smn_comercial.smn_orden_cab_det_servicio.smn_orden_servicio_id
	left join smn_comercial.smn_rel_orden_servicio on smn_comercial.smn_rel_orden_servicio.smn_orden_servicio_id = smn_comercial.smn_orden_cab_det_servicio.smn_orden_servicio_id
	left join smn_base.smn_servicios on smn_base.smn_servicios.smn_servicios_id = smn_comercial.smn_rel_orden_servicio.smn_servicios_rf
	left outer join smn_base.smn_componentes on smn_base.smn_componentes.smn_servicios_rf = smn_base.smn_servicios.smn_servicios_id
where
	smn_comercial.smn_orden_cab_det_servicio.smn_orden_servicio_id=${fld:id2}