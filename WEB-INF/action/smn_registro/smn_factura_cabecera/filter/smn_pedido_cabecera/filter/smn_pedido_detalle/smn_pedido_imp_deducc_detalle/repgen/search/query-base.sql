select
		smn_comercial.smn_pedido_imp_deducc_detalle.smn_pedido_imp_deducc_detalle_id,
	${field}
from
	smn_comercial.smn_pedido_imp_deducc_detalle
where
		smn_comercial.smn_pedido_imp_deducc_detalle.smn_pedido_imp_deducc_detalle_id is not null
	${filter}
	
	
