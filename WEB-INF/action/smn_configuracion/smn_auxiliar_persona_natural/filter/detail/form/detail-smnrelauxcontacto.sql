select
select
	smn_base.smn_rel_aux_contacto.*
from
	smn_base.smn_rel_aux_contacto,
	smn_base.smn_auxiliar
where
		smn_base.smn_rel_aux_contacto.smn_auxiliar_id=smn_base.smn_auxiliar.smn_auxiliar_id and
		smn_base.smn_auxiliar.smn_auxiliar_id=${fld:id}
