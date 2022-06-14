select
		smn_comercial.smn_linea_comercial.lco_nombre
from
		smn_comercial.smn_linea_comercial
where
		upper(smn_comercial.smn_linea_comercial.lco_nombre) = upper(${fld:lco_nombre})
