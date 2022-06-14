select
		smn_comercial.smn_prospecto.pro_codigo
from
		smn_comercial.smn_prospecto
where
		upper(smn_comercial.smn_prospecto.pro_codigo) = upper(${fld:pro_codigo})
