select
		smn_comercial.smn_area_interes.ari_descripcion
from
		smn_comercial.smn_area_interes
where
		upper(smn_comercial.smn_area_interes.ari_descripcion) = upper(${fld:ari_descripcion})
