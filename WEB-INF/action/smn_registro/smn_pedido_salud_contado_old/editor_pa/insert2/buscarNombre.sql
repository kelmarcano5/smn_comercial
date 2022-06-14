select
		smn_base.smn_auxiliar.aux_rif
from
		smn_base.smn_auxiliar
where
		upper(smn_base.smn_auxiliar.aux_rif) = upper(${fld:aux_rif})
