UPDATE smn_comercial.smn_rel_cliente_usuario SET
	smn_cliente_id=${fld:smn_cliente_id},
	smn_usuario_rf=${fld:smn_usuario_rf}

WHERE
	smn_rel_cliente_usuario_id=${fld:id}

