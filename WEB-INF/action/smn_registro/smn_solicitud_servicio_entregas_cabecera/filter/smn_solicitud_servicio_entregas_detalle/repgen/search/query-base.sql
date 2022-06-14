select
		smn_comercial.smn_solicitud_servicio_entregas_detalle.smn_solicitud_servicio_entregas_detalle_id,
	${field}
from
	smn_comercial.smn_solicitud_servicio_entregas_detalle
where
		smn_comercial.smn_solicitud_servicio_entregas_detalle.smn_solicitud_servicio_entregas_detalle_id is not null
	${filter}
	
	
