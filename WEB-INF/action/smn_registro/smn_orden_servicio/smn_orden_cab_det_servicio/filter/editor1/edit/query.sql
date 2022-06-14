select	
	smn_comercial.smn_orden_servicio.smn_orden_servicio_id, 
	smn_comercial.smn_orden_servicio.ors_descripcion as ors_descripcion_pl0,
	smn_comercial.smn_orden_cab_det_servicio.*
from
	smn_comercial.smn_orden_servicio,
	smn_comercial.smn_orden_cab_det_servicio 
where
	smn_comercial.smn_orden_servicio.smn_orden_servicio_id=smn_comercial.smn_orden_cab_det_servicio.smn_orden_servicio_id and
	smn_orden_cab_det_servicio_id = ${fld:id} 
	


