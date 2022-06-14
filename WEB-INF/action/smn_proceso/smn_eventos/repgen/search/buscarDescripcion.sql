select
		smn_comercial.smn_evento.eve_descripcion_larga
from
		smn_comercial.smn_evento
where
		upper(smn_comercial.smn_evento.eve_descripcion_larga) = upper(${fld:eve_descripcion_larga})
