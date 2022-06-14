select
	case
	when smn_comercial.smn_control_cupo.ccu_estatus='AC' then '${lbl:b_active}'
	when smn_comercial.smn_control_cupo.ccu_estatus='CA' then '${lbl:b_cancelled}'
	end as ccu_estatus_combo,
	smn_comercial.smn_control_cupo.*
from
	smn_comercial.smn_control_cupo
where
	smn_control_cupo_id = ${fld:id}
