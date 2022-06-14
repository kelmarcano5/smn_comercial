select
		smn_comercial.smn_accion_gestion_cliente.smn_accion_gestion_cliente_id,
	${field}
from
	smn_comercial.smn_accion_gestion_cliente
where
		smn_comercial.smn_accion_gestion_cliente.smn_accion_gestion_cliente_id is not null
	${filter}
	
	
