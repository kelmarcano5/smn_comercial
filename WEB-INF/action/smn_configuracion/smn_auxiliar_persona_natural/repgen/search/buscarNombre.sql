select
		smn_base.smn_auxiliar.aux_nombres
from
		smn_base.smn_auxiliar
where
		upper(smn_base.smn_auxiliar.aux_nombres) = upper(${fld:aux_nombres})
