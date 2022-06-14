UPDATE smn_comercial.smn_rel_cliente_agenda SET
	smn_cliente_id=${fld:smn_cliente_id},
	smn_agenda_rf=${fld:smn_agenda_rf}

WHERE
	smn_rel_cliente_agenda_id=${fld:id}

