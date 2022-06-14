select
		smn_comercial.smn_rel_oferta_cliente.smn_rel_oferta_cliente_id,
	${field}
from
	smn_comercial.smn_rel_oferta_cliente
where
		smn_comercial.smn_rel_oferta_cliente.smn_rel_oferta_cliente_id is not null
	${filter}
	
	
