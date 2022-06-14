select
		smn_comercial.smn_tipo_linea_comercial.tlc_codigo
from
		smn_comercial.smn_tipo_linea_comercial
where
		upper(smn_comercial.smn_tipo_linea_comercial.tlc_codigo) = upper(${fld:tlc_codigo})
