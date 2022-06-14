select
		smn_comercial.smn_rel_cliente_servicio.smn_rel_cliente_servicio_id,
	${field}
from
	smn_comercial.smn_rel_cliente_servicio
where
		smn_comercial.smn_rel_cliente_servicio.smn_rel_cliente_servicio_id is not null
	${filter}
	
	
