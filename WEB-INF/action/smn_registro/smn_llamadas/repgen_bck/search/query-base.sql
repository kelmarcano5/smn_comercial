select
		smn_comercial.smn_llamadas.smn_llamadas_id,
	${field}
from
	smn_comercial.smn_llamadas
where
		smn_comercial.smn_llamadas.smn_llamadas_id is not null
	${filter}
	
	
