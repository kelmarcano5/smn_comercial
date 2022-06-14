select
		smn_base.smn_auxiliar.aux_codigo
from
		smn_base.smn_auxiliar
where
		upper(smn_base.smn_auxiliar.aux_codigo) = upper(${fld:aux_codigo})
