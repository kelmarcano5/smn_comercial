select
		smn_comercial.smn_pedido_cabecera.smn_pedido_cabecera_id,
	${field}
from
	smn_comercial.smn_pedido_cabecera
where
		smn_comercial.smn_pedido_cabecera.smn_pedido_cabecera_id is not null
	${filter}
	
	
