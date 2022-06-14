select
		smn_comercial.smn_tipo_pedido.tpp_codigo
from
		smn_comercial.smn_tipo_pedido
where
		upper(smn_comercial.smn_tipo_pedido.tpp_codigo) = upper(${fld:tpp_codigo})
