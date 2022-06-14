select
		smn_comercial.smn_gestion.ges_codigo
from
		smn_comercial.smn_gestion
where
		upper(smn_comercial.smn_gestion.ges_codigo) = upper(${fld:ges_codigo})
