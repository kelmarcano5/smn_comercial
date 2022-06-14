select
		smn_comercial.smn_clasificacion_cliente.smn_clasificacion_cliente_id,
	${field}
from
	smn_comercial.smn_clasificacion_cliente
where
		smn_comercial.smn_clasificacion_cliente.smn_clasificacion_cliente_id is not null
	${filter}
	
	
