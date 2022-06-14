select
	*
from
	smn_base.smn_auxiliar_persona_contacto
	left outer join smn_base.smn_auxiliar on smn_base.smn_auxiliar.smn_auxiliar_id=smn_base.smn_auxiliar_persona_contacto.smn_auxiliar_rf
	left outer join smn_base.smn_clase_auxiliar on smn_base.smn_clase_auxiliar.smn_clase_auxiliar_id=smn_base.smn_auxiliar_persona_contacto.smn_clase_auxiliar_rf
where
	smn_base.smn_auxiliar_persona_contacto.smn_auxiliar_rf= ${fld:id}


