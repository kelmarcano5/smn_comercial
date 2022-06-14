select
select
select
select
	case
	when smn_comercial.smn_orden_servicio_detalle.smn_tipo_componente='RE' then 'Relacionado'
	when smn_comercial.smn_orden_servicio_detalle.smn_tipo_componente='IN' then 'Independiente'
	end as smn_tipo_componente,
select
select
select
	case
	when smn_comercial.smn_orden_servicio_detalle.osd_estatus='RE' then '${lbl:b_registrado}'
	when smn_comercial.smn_orden_servicio_detalle.osd_estatus='GE' then '${lbl:b_generada}'
	end as osd_estatus,
	smn_comercial.smn_orden_servicio_detalle.*
from
	smn_comercial.smn_orden_servicio_detalle,
	smn_comercial.smn_orden_cab_det_servicio
where
		smn_comercial.smn_orden_servicio_detalle.smn_orden_cab_det_servicio_id=smn_comercial.smn_orden_cab_det_servicio.smn_orden_cab_det_servicio_id and
		smn_comercial.smn_orden_cab_det_servicio.smn_orden_cab_det_servicio_id=${fld:id}
