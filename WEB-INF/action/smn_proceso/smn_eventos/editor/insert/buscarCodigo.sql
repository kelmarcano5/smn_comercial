select
		smn_comercial.smn_evento.eve_codigo
from
		smn_comercial.smn_evento
where
		upper(smn_comercial.smn_evento.eve_codigo) = upper(${fld:eve_codigo})
