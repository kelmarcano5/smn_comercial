select
		smn_comercial.smn_pedido_impuestos.smn_pedido_impuestos_id,
	${field}
from
	smn_comercial.smn_pedido_impuestos
where
		smn_comercial.smn_pedido_impuestos.smn_pedido_impuestos_id is not null
	${filter}
	
	
