UPDATE smn_comercial.smn_rel_cliente_contacto SET
	smn_cliente_id=${fld:smn_cliente_id},
	smn_contacto_rf=${fld:smn_contacto_rf}

WHERE
	smn_rel_cliente_contacto_id=${fld:id}

