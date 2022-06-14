select
		smn_comercial.smn_cliente.smn_cliente_id,
	${field}
from
	smn_comercial.smn_cliente
where
		smn_comercial.smn_cliente.smn_cliente_id is not null
	${filter}
	
	
