select
	smn_comercial.smn_rel_cliente_agenda.smn_rel_cliente_agenda_id,
	smn_base.smn_auxiliar.aux_codigo ||' - '|| smn_base.smn_auxiliar.aux_descripcion as smn_cliente_id,
	smn_base.smn_agenda.age_codigo ||' - '|| smn_base.smn_agenda.age_descripcion smn_agenda_rf
from
	smn_comercial.smn_rel_cliente_agenda
	left outer join smn_comercial.smn_cliente on smn_comercial.smn_cliente.smn_cliente_id = smn_comercial.smn_rel_cliente_agenda.smn_cliente_id
	left outer join smn_base.smn_auxiliar on smn_base.smn_auxiliar.smn_auxiliar_id = smn_comercial.smn_cliente.smn_auxiliar_rf
	inner join smn_base.smn_agenda on smn_base.smn_agenda.smn_agenda_id = smn_comercial.smn_rel_cliente_agenda.smn_agenda_rf

where
	smn_rel_cliente_agenda_id is not null
	${filter} and smn_comercial.smn_rel_cliente_agenda.smn_cliente_id=${fld:id2}
order by
		smn_rel_cliente_agenda_id
