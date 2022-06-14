select
		smn_entrega.smn_solicitud_servicio_entregas_cabecera.smn_solicitud_servicio_entregas_cabecera_id,
	${field}
from
	smn_entrega.smn_solicitud_servicio_entregas_cabecera
where
		smn_entrega.smn_solicitud_servicio_entregas_cabecera.smn_solicitud_servicio_entregas_cabecera_id is not null
	${filter}
	
	
