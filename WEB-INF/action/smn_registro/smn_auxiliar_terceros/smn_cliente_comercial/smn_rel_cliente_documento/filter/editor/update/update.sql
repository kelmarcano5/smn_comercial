UPDATE smn_entrega.smn_rel_cliente_documento SET
	smn_documento_id=${fld:smn_documento_id},
	smn_cliente_id=${fld:smn_cliente_id}

WHERE
	smn_rel_cliente_documento_id=${fld:id}

