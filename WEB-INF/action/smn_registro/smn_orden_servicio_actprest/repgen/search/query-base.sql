select
		smn_comercial.smn_orden_servicio.smn_orden_servicio_id,
	${field}
from
	smn_comercial.smn_orden_servicio
where
		smn_comercial.smn_orden_servicio.smn_orden_servicio_id is not null
	${filter}
	
	
