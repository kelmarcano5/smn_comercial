select
		smn_comercial.smn_ingredientes.smn_ingredientes_id,
	${field}
from
	smn_comercial.smn_ingredientes
where
		smn_comercial.smn_ingredientes.smn_ingredientes_id is not null
	${filter}
	
	
