select
select
select
select
	case
	when smn_comercial.smn_sub_centro_facturacion.scf_estatus='AC' then '${lbl:b_account_type_active}'
	when smn_comercial.smn_sub_centro_facturacion.scf_estatus='IN' then '${lbl:b_inactive}'
	end as scf_estatus_combo,
	smn_comercial.smn_sub_centro_facturacion.*
from
	smn_comercial.smn_sub_centro_facturacion
where
	smn_sub_centro_facturacion_id = ${fld:id}
