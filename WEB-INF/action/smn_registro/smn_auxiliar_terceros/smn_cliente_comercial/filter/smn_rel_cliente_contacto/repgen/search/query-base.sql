select
		smn_comercial.smn_rel_cliente_contacto.smn_rel_cliente_contacto_id,
	${field}
from
	smn_comercial.smn_rel_cliente_contacto
where
		smn_comercial.smn_rel_cliente_contacto.smn_rel_cliente_contacto_id is not null
	${filter}
	
	
