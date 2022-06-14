select
		smn_comercial.smn_tipo_linea_comercial.tlc_nombre
from
		smn_comercial.smn_tipo_linea_comercial
where
		upper(smn_comercial.smn_tipo_linea_comercial.tlc_nombre) = upper(${fld:tlc_nombre})
