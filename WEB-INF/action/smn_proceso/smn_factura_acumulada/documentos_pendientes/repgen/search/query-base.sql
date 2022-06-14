select
		smn_cobranzas.smn_mov_documento_cob_cab.smn_mov_documento_cob_cab_id,
	${field}
from
	smn_cobranzas.smn_mov_documento_cob_cab
where
		smn_cobranzas.smn_mov_documento_cob_cab.smn_mov_documento_cob_cab_id is not null
	${filter}
	
	
