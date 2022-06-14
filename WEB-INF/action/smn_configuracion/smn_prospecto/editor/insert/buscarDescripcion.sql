select
		smn_comercial.smn_prospecto.pro_descripcion
from
		smn_comercial.smn_prospecto
where
		upper(smn_comercial.smn_prospecto.pro_descripcion) = upper(${fld:pro_descripcion})
