select
	case
	when smn_comercial.smn_tipo_pedido.tpp_estatus='AC' then '${lbl:b_active}'
	when smn_comercial.smn_tipo_pedido.tpp_estatus='IN' then '${lbl:b_inactive}'
	end as tpp_estatus_combo,
	smn_comercial.smn_tipo_pedido.*
from
	smn_comercial.smn_tipo_pedido
where
	smn_tipo_pedido_id = ${fld:id}
