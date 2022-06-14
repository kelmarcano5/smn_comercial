select
		smn_comercial.smn_gestion.ges_descripcion
from
		smn_comercial.smn_gestion
where
		upper(smn_comercial.smn_gestion.ges_descripcion) = upper(${fld:ges_descripcion})
