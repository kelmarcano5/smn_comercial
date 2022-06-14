select
	smn_comercial.smn_rel_cliente_cond_financiera.smn_rel_cliente_cond_financiera_id,
	case
	when smn_comercial.smn_rel_cliente_cond_financiera.rcc_estatus='AC' then '${lbl:b_active}'
	when smn_comercial.smn_rel_cliente_cond_financiera.rcc_estatus='IN' then '${lbl:b_inactive} '
	end as rcc_estatus,
	smn_base.smn_auxiliar.aux_codigo || ' - ' || smn_base.smn_auxiliar.aux_descripcion as smn_cliente_id,
	smn_base.smn_condicion_financiera.cfi_codigo ||' - '|| smn_base.smn_condicion_financiera.cfi_description as smn_condicion_financiera_rf,
	smn_comercial.smn_rel_cliente_cond_financiera.rcc_estatus,
	smn_comercial.smn_rel_cliente_cond_financiera.rcc_vigencia,
	smn_comercial.smn_rel_cliente_cond_financiera.rcc_fecha_registro	
from
	smn_comercial.smn_rel_cliente_cond_financiera
	inner join smn_comercial.smn_cliente on smn_comercial.smn_cliente.smn_cliente_id = smn_comercial.smn_rel_cliente_cond_financiera.smn_cliente_id
	inner join smn_base.smn_condicion_financiera on smn_base.smn_condicion_financiera.smn_condicion_financiera_id = smn_comercial.smn_rel_cliente_cond_financiera.smn_condicion_financiera_rf
	inner join smn_base.smn_auxiliar on smn_base.smn_auxiliar.smn_auxiliar_id = smn_comercial.smn_cliente.smn_auxiliar_rf

where
	smn_rel_cliente_cond_financiera_id = ${fld:id}
