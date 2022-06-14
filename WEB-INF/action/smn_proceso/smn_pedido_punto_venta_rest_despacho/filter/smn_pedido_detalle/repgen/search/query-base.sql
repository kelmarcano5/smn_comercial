select
		smn_comercial.smn_pedido_detalle.smn_pedido_detalle_id,
	${field}
from
	smn_comercial.smn_pedido_detalle
where
		smn_comercial.smn_pedido_detalle.smn_pedido_detalle_id is not null
	${filter}
	
	
