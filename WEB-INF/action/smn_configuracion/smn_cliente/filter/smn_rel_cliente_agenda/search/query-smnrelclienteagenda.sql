select
		smn_comercial.smn_rel_cliente_agenda.smn_rel_cliente_agenda_id,
	smn_base.smn_auxiliar.aux_descripcion as smn_cliente_id,
	smn_base.smn_agenda.age_descripcion as smn_agenda_rf
from
	smn_comercial.smn_rel_cliente_agenda
	inner join smn_base.smn_agenda on  smn_base.smn_agenda.smn_agenda_id = smn_comercial.smn_rel_cliente_agenda.smn_agenda_rf
	inner join smn_comercial.smn_cliente on smn_comercial.smn_cliente.smn_cliente_id = 	smn_comercial.smn_rel_cliente_agenda.smn_cliente_id
	inner join smn_base.smn_auxiliar on smn_base.smn_auxiliar.smn_auxiliar_id = smn_comercial.smn_cliente.smn_auxiliar_rf
where
	smn_comercial.smn_rel_cliente_agenda.smn_cliente_id = ${fld:id2}