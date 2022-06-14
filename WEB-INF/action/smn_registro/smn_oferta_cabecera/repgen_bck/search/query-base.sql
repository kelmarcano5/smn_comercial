select
		smn_comercial.smn_oferta_cabecera.smn_oferta_cabecera_id,
	${field}
from
	smn_comercial.smn_oferta_cabecera
where
		smn_comercial.smn_oferta_cabecera.smn_oferta_cabecera_id is not null
	${filter}
	
	
