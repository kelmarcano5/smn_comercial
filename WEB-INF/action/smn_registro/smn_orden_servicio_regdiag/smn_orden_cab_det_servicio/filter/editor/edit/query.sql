select	
	smn_comercial.smn_orden_cab_det_servicio.*
from
	smn_comercial.smn_orden_cab_det_servicio 
	inner join smn_comercial.smn_orden_servicio on smn_comercial.smn_orden_servicio.smn_orden_servicio_id = smn_comercial.smn_orden_cab_det_servicio.smn_orden_servicio_id
where
	smn_comercial.smn_orden_cab_det_servicio.smn_orden_cab_det_servicio_id = ${fld:id} 
	


