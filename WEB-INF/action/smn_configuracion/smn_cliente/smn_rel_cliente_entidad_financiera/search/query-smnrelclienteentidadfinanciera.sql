
select
	case
		when smn_comercial.smn_rel_cliente_entidad_financiera.cef_estatus='AC' then '${lbl:b_account_type_active}'
		when smn_comercial.smn_rel_cliente_entidad_financiera.cef_estatus='IN' then '${lbl:b_inactive}'
	end as cef_estatus,
	smn_base.smn_auxiliar.aux_descripcion as smn_cliente_id,
	smn_base.smn_entidades_financieras.efi_nombre as smn_entidad_financiera_rf,
	smn_base.smn_tipo_cuenta_banco.tcb_descripcion as smn_tipo_cuenta_banco_rf,
	smn_comercial.smn_rel_cliente_entidad_financiera.cef_numero_cuenta,
	smn_comercial.smn_rel_cliente_entidad_financiera.cef_vigencia,
	smn_comercial.smn_rel_cliente_entidad_financiera.cef_fecha_registro,
	smn_comercial.smn_rel_cliente_entidad_financiera.smn_rel_cliente_entidad_financiera_id
	
from
		smn_comercial.smn_rel_cliente_entidad_financiera
	inner join smn_comercial.smn_cliente on smn_comercial.smn_cliente.smn_cliente_id = 	smn_comercial.smn_rel_cliente_entidad_financiera.smn_cliente_id
	inner join smn_base.smn_auxiliar on smn_base.smn_auxiliar.smn_auxiliar_id = smn_comercial.smn_cliente.smn_auxiliar_rf
	inner join smn_base.smn_tipo_cuenta_banco on smn_base.smn_tipo_cuenta_banco.smn_tipo_cuenta_banco_id = smn_comercial.smn_rel_cliente_entidad_financiera.smn_tipo_cuenta_banco_rf
	inner join smn_base.smn_entidades_financieras on smn_base.smn_entidades_financieras.smn_entidades_financieras_id = smn_comercial.smn_rel_cliente_entidad_financiera.smn_entidad_financiera_rf
where
	smn_comercial.smn_rel_cliente_entidad_financiera.smn_cliente_id=${fld:id2}
