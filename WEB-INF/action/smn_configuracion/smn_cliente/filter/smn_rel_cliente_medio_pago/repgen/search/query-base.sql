select
		smn_comercial.smn_rel_cliente_medio_pago.smn_rel_cliente_medio_pago_id,
	${field}
from
	smn_comercial.smn_rel_cliente_medio_pago
where
		smn_comercial.smn_rel_cliente_medio_pago.smn_rel_cliente_medio_pago_id is not null
	${filter}
	
	
