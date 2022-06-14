select
		smn_comercial.smn_envio_oferta.eof_descripcion
from
		smn_comercial.smn_envio_oferta
where
		upper(smn_comercial.smn_envio_oferta.eof_descripcion) = upper(${fld:eof_descripcion})
