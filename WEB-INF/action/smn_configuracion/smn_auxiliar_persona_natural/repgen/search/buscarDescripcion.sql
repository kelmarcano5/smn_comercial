select
		smn_base.smn_auxiliar.aux_descripcion
from
		smn_base.smn_auxiliar
where
		upper(smn_base.smn_auxiliar.aux_descripcion) = upper(${fld:aux_descripcion})
