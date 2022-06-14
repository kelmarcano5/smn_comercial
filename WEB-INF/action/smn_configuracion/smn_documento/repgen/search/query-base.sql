select
		smn_comercial.smn_documento.smn_documento_id,
	${field}
from
	smn_comercial.smn_documento
where
		smn_comercial.smn_documento.smn_documento_id is not null
	${filter}
	
	
