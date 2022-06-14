select
		smn_comercial.smn_envio_oferta.smn_envio_oferta_id,
	${field}
from
	smn_comercial.smn_envio_oferta
where
		smn_comercial.smn_envio_oferta.smn_envio_oferta_id is not null
	${filter}
	
	
