select
	case
	when smn_comercial.smn_pedido_detalle.pde_naturaleza='IT' then '${lbl:b_item}'
	when smn_comercial.smn_pedido_detalle.pde_naturaleza='SE' then '${lbl:b_services}'
	when smn_comercial.smn_pedido_detalle.pde_naturaleza='AF' then '${lbl:b_actfij}'
	end as pde_naturaleza,
	smn_comercial.smn_pedido_detalle.*
from
	smn_comercial.smn_pedido_detalle
where
	smn_pedido_detalle_id = ${fld:id}
