select
		smn_comercial.smn_rel_pedido_fecha_entrega.smn_rel_pedido_fecha_entrega_id,
	${field}
from
	smn_comercial.smn_rel_pedido_fecha_entrega
where
		smn_comercial.smn_rel_pedido_fecha_entrega.smn_rel_pedido_fecha_entrega_id is not null
	${filter}
	
	
