select
	smn_comercial.smn_pedido_detalle.smn_pedido_detalle_id,
	smn_comercial.smn_pedido_detalle.pde_naturaleza as pde_naturaleza_pl0,
	smn_comercial.smn_pedido_imp_deducc_detalle.*
from
	smn_comercial.smn_pedido_detalle,
	smn_comercial.smn_pedido_imp_deducc_detalle
where
	smn_comercial.smn_pedido_detalle.smn_pedido_detalle_id=smn_comercial.smn_pedido_imp_deducc_detalle.smn_pedido_detalle_id
	and
	smn_pedido_imp_deducc_detalle_id = ${fld:id}
