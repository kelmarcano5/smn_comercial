select
	case
		when smn_comercial.smn_rel_cliente_forma_pago.rcf_estatus='AC' then '${lbl:b_account_type_active}'
		when smn_comercial.smn_rel_cliente_forma_pago.rcf_estatus='IN' then '${lbl:b_inactive}'
	end as rcf_estatus,
	smn_base.smn_auxiliar.aux_descripcion as smn_cliente_id,
	smn_base.smn_formas_pago.fop_descripcion as smn_forma_pago_rf,
	smn_comercial.smn_rel_cliente_forma_pago.rcf_vigencia,
	smn_comercial.smn_rel_cliente_forma_pago.rcf_fecha_registro,
	smn_comercial.smn_rel_cliente_forma_pago.smn_rel_cliente_forma_pago_id
from
	smn_comercial.smn_rel_cliente_forma_pago
	inner join smn_comercial.smn_cliente on smn_comercial.smn_cliente.smn_cliente_id = 	smn_comercial.smn_rel_cliente_forma_pago.smn_cliente_id
	inner join smn_base.smn_auxiliar on smn_base.smn_auxiliar.smn_auxiliar_id = smn_comercial.smn_cliente.smn_auxiliar_rf
	inner join smn_base.smn_formas_pago on smn_base.smn_formas_pago.smn_formas_pago_id = smn_comercial.smn_rel_cliente_forma_pago.smn_forma_pago_rf
where
	smn_comercial.smn_cliente.smn_cliente_id=smn_comercial.smn_rel_cliente_forma_pago.smn_cliente_id
	and
	smn_rel_cliente_forma_pago_id = ${fld:id}
