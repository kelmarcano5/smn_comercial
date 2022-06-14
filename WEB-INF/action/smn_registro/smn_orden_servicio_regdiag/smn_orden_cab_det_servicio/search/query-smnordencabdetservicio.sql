select distinct
	smn_comercial.smn_orden_servicio.smn_orden_servicio_id,
	smn_comercial.smn_orden_servicio.ors_descripcion as ors_descripcion_pl0,
	case
	when smn_comercial.smn_rel_orden_servicio.ocd_estatus='RE' then 'Registrada'
	when smn_comercial.smn_rel_orden_servicio.ocd_estatus='GE' then '${lbl:b_generated}'
	when smn_comercial.smn_rel_orden_servicio.ocd_estatus='AP' then '${lbl:b_aprobated}'
	end as ocd_estatus,
	smn_base.smn_servicios.svc_codigo || ' - ' || smn_base.smn_servicios.svc_descripcion as smn_servicios_rf,
	smn_comercial.smn_rel_orden_servicio.smn_servicios_rf as smn_servicios_rf2
	
from
	smn_comercial.smn_rel_orden_servicio
	inner join smn_comercial.smn_orden_servicio on smn_comercial.smn_orden_servicio.smn_orden_servicio_id = smn_comercial.smn_rel_orden_servicio.smn_orden_servicio_id
	left join smn_base.smn_servicios on smn_base.smn_servicios.smn_servicios_id = smn_comercial.smn_rel_orden_servicio.smn_servicios_rf
	left join smn_base.smn_componentes on smn_base.smn_componentes.smn_servicios_rf = smn_base.smn_servicios.smn_servicios_id
where
	smn_comercial.smn_rel_orden_servicio.smn_orden_servicio_id=${fld:id2}