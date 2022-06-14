select
		smn_comercial.smn_rel_centro_fac_documento.smn_rel_centro_fac_documento_id,
	${field}
from
	smn_comercial.smn_rel_centro_fac_documento
where
		smn_comercial.smn_rel_centro_fac_documento.smn_rel_centro_fac_documento_id is not null
	${filter}
	
	
