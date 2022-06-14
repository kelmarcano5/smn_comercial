select
	smn_comercial.smn_rel_cliente_medio_pago.smn_rel_cliente_medio_pago_id,
		smn_base.smn_auxiliar.aux_codigo ||' - '|| smn_base.smn_auxiliar.aux_descripcion as smn_cliente_id,
	smn_base.smn_medio_pago.mpa_codigo ||' - '|| smn_base.smn_medio_pago.mpa_descripcion as smn_medio_pago_rf
from
	smn_comercial.smn_rel_cliente_medio_pago
	inner join smn_comercial.smn_cliente on smn_comercial.smn_cliente.smn_cliente_id = smn_comercial.smn_rel_cliente_medio_pago.smn_cliente_id
			left outer join smn_base.smn_auxiliar on smn_base.smn_auxiliar.smn_auxiliar_id = smn_comercial.smn_cliente.smn_auxiliar_rf
	inner join smn_base.smn_medio_pago on smn_base.smn_medio_pago.smn_medio_pago_id = smn_comercial.smn_rel_cliente_medio_pago.smn_medio_pago_rf

where
	smn_comercial.smn_rel_cliente_medio_pago.smn_cliente_id=${fld:id2}