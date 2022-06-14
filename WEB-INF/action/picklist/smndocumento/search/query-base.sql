select	
	smn_comercial.smn_documento.*
from
	smn_comercial.smn_documento 
where
	smn_documento_id is not null
	${filter}