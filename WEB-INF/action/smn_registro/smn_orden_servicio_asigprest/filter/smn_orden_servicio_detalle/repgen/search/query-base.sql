select
		smn_comercial.smn_orden_servicio_detalle.smn_orden_servicio_detalle_id,
	${field}
from
	smn_comercial.smn_orden_servicio_detalle
where
		smn_comercial.smn_orden_servicio_detalle.smn_orden_servicio_detalle_id is not null
	${filter}
	
	
