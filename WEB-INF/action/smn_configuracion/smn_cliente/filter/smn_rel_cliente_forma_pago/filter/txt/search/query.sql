select
		smn_comercial.smn_rel_cliente_forma_pago.smn_rel_cliente_forma_pago_id,
	smn_comercial.smn_cliente.smn_cliente_id,
	smn_comercial.smn_cliente.cli_nacional_ext as cli_nacional_ext_pl0,
select
		smn_comercial.smn_rel_cliente_forma_pago.smn_rel_cliente_forma_pago_id,
select
		smn_comercial.smn_rel_cliente_forma_pago.smn_rel_cliente_forma_pago_id,
	case
	when smn_comercial.smn_rel_cliente_forma_pago.rcf_estatus='AC' then '${lbl:b_account_type_active}'
	when smn_comercial.smn_rel_cliente_forma_pago.rcf_estatus='IN' then '${lbl:b_inactive}'
	end as rcf_estatus,
	smn_comercial.smn_rel_cliente_forma_pago.smn_cliente_id,
	smn_comercial.smn_rel_cliente_forma_pago.smn_forma_pago_rf,
	smn_comercial.smn_rel_cliente_forma_pago.rcf_estatus,
	smn_comercial.smn_rel_cliente_forma_pago.rcf_vigencia,
	smn_comercial.smn_rel_cliente_forma_pago.rcf_idioma,
	smn_comercial.smn_rel_cliente_forma_pago.rcf_usuario,
	smn_comercial.smn_rel_cliente_forma_pago.rcf_fecha_registro,
	smn_comercial.smn_rel_cliente_forma_pago.rcf_hora,
		smn_comercial.smn_rel_cliente_forma_pago.smn_rel_cliente_forma_pago_id
	
from
	smn_comercial.smn_cliente,
	smn_comercial.smn_rel_cliente_forma_pago
where
	smn_comercial.smn_cliente.smn_cliente_id=smn_comercial.smn_rel_cliente_forma_pago.smn_cliente_id
order by
		smn_rel_cliente_forma_pago_id
