select
	smn_base.smn_auxiliar.aux_descripcion,
		smn_comercial.smn_afiliados.smn_afiliados_id,
	${field}
from
	smn_base.smn_auxiliar,
	smn_comercial.smn_afiliados
where
	smn_base.smn_auxiliar.smn_auxiliar_id = smn_comercial.smn_afiliados.afi_auxiliar_rf and
		smn_comercial.smn_afiliados.smn_afiliados_id is not null
	${filter}
	
	
