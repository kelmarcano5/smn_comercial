select
		smn_comercial.smn_documento_grp_titulo_imp.smn_documento_grp_titulo_imp_id,
	${field}
from
	smn_comercial.smn_documento_grp_titulo_imp
where
		smn_comercial.smn_documento_grp_titulo_imp.smn_documento_grp_titulo_imp_id is not null
	${filter}
	
	
