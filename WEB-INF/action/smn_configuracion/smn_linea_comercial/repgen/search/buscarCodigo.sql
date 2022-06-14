select
		smn_comercial.smn_linea_comercial.lco_codigo
from
		smn_comercial.smn_linea_comercial
where
		upper(smn_comercial.smn_linea_comercial.lco_codigo) = upper(${fld:lco_codigo})
