select
		smn_comercial.smn_prospecto.smn_prospecto_id,
	${field}
from
	smn_comercial.smn_prospecto
where
		smn_comercial.smn_prospecto.smn_prospecto_id is not null
	${filter}
	
	
