select
	smn_comercial.smn_envio_oferta.*
from
	smn_comercial.smn_envio_oferta
where
	smn_envio_oferta_id = ${fld:id}
