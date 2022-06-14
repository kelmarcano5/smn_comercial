select
	smn_comercial.smn_pedido_componentes.*
from
	smn_comercial.smn_pedido_detalle,
	smn_comercial.smn_pedido_componentes
where
	smn_comercial.smn_pedido_detalle.smn_pedido_detalle_id=smn_comercial.smn_pedido_componentes.smn_pedido_detalle_id
	and
	smn_pedido_componentes_id = ${fld:id}
