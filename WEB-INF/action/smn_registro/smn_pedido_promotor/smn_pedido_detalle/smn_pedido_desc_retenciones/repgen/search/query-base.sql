select
		smn_comercial.smn_pedido_desc_retenciones.smn_pedido_desc_retenciones_id,
	${field}
from
	smn_comercial.smn_pedido_desc_retenciones
where
		smn_comercial.smn_pedido_desc_retenciones.smn_pedido_desc_retenciones_id is not null
	${filter}
	
	
