select
		smn_comercial.smn_rel_cliente_documento.smn_rel_cliente_documento_id,
	${field}
from
	smn_comercial.smn_rel_cliente_documento
where
		smn_comercial.smn_rel_cliente_documento.smn_rel_cliente_documento_id is not null
	${filter}
	
	
