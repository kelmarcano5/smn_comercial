select
	smn_comercial.smn_area_interes.ari_descripcion as smn_area_interes_id, 
	case
		when smn_comercial.smn_rel_cliente_area_interes.rca_estatus='AC' then '${lbl:b_account_type_active}'
		when smn_comercial.smn_rel_cliente_area_interes.rca_estatus='IN' then '${lbl:b_inactive}'
	end as rca_estatus,
	smn_base.smn_auxiliar.aux_descripcion as smn_cliente_id,
	smn_comercial.smn_rel_cliente_area_interes.rca_vigencia,
	smn_comercial.smn_rel_cliente_area_interes.rca_fecha_registro,
	smn_comercial.smn_rel_cliente_area_interes.smn_rel_cliente_area_interes_id
	
from
	smn_comercial.smn_rel_cliente_area_interes
	inner join smn_comercial.smn_area_interes on smn_comercial.smn_area_interes.smn_area_interes_id = smn_comercial.smn_rel_cliente_area_interes.smn_area_interes_id
	inner join smn_comercial.smn_cliente on smn_comercial.smn_cliente.smn_cliente_id = 	smn_comercial.smn_rel_cliente_area_interes.smn_cliente_id
	inner join smn_base.smn_auxiliar on smn_base.smn_auxiliar.smn_auxiliar_id = smn_comercial.smn_cliente.smn_auxiliar_rf

