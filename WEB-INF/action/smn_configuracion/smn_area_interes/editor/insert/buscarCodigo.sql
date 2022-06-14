select
		smn_comercial.smn_area_interes.ari_codigo
from
		smn_comercial.smn_area_interes
where
		upper(smn_comercial.smn_area_interes.ari_codigo) = upper(${fld:ari_codigo})
