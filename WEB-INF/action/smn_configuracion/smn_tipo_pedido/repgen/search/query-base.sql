select
		smn_comercial.smn_tipo_pedido.smn_tipo_pedido_id,
	${field}
from
	smn_comercial.smn_tipo_pedido
where
		smn_comercial.smn_tipo_pedido.smn_tipo_pedido_id is not null
	${filter}
	
	
