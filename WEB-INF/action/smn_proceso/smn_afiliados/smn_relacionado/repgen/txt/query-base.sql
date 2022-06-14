select
	smn_base.smn_auxiliar.aux_descripcion,
	${field}
from
	smn_base.smn_auxiliar,
	smn_comercial.smn_relacionado
where
	smn_base.smn_auxiliar.smn_auxiliar_id = smn_comercial.smn_relacionado.rel_auxiliar_rf and
		smn_comercial.smn_relacionado.smn_relacionado_id is not null
