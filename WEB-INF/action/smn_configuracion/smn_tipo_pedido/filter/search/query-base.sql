select
	case
		when smn_comercial.smn_tipo_pedido.tpp_estatus='AC' then '${lbl:b_active}'
		when smn_comercial.smn_tipo_pedido.tpp_estatus='IN' then '${lbl:b_inactive}'
	end as tpp_estatus,
	smn_comercial.smn_tipo_pedido.tpp_codigo,
	smn_comercial.smn_tipo_pedido.tpp_descripcion,
	smn_comercial.smn_tipo_pedido.tpp_fecha_vigencia,
	smn_comercial.smn_tipo_pedido.tpp_fecha_registro,
		smn_comercial.smn_tipo_pedido.smn_tipo_pedido_id
	
from
	smn_comercial.smn_tipo_pedido
where
	smn_tipo_pedido_id is not null
	${filter}
order by
		smn_tipo_pedido_id
