UPDATE smn_comercial.smn_rel_cliente_servicio SET
	smn_cliente_id=${fld:smn_cliente_id},
	smn_servicio_rf=${fld:smn_servicio_rf}

WHERE
	smn_rel_cliente_servicio_id=${fld:id}

