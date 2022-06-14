select	
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
	smn_comercial.smn_orden_servicio,
	smn_comercial.smn_orden_cab_det_servicio 
where
	smn_comercial.smn_orden_servicio.smn_orden_servicio_id=smn_comercial.smn_orden_cab_det_servicio.smn_orden_servicio_id 
 and 
	smn_orden_cab_det_servicio_id = ${fld:id}
