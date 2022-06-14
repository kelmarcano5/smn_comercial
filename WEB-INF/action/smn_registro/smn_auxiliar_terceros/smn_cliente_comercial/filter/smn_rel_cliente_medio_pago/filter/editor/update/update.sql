UPDATE smn_comercial.smn_rel_cliente_medio_pago SET
	smn_cliente_id=${fld:smn_cliente_id},
	smn_medio_pago_rf=${fld:smn_medio_pago_rf}

WHERE
	smn_rel_cliente_medio_pago_id=${fld:id}

