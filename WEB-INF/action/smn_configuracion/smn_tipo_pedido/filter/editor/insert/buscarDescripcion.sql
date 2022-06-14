select
		smn_comercial.smn_tipo_pedido.tpp_descripcion
from
		smn_comercial.smn_tipo_pedido
where
		upper(smn_comercial.smn_tipo_pedido.tpp_descripcion) = upper(${fld:tpp_descripcion})
