select
		smn_comercial.smn_gestion.smn_gestion_id,
	${field}
from
	smn_comercial.smn_gestion
where
		smn_comercial.smn_gestion.smn_gestion_id is not null
	${filter}
	
	
