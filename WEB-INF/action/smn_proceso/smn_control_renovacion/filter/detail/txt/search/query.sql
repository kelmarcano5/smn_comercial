select
	case
	when smn_comercial.smn_control_renovacion.crn_estatus='AC' then '${lbl:b_active}'
	when smn_comercial.smn_control_renovacion.crn_estatus='IN' then '${lbl:b_inactive}'
	end as crn_estatus_combo,
	smn_comercial.smn_control_renovacion.*
from
	smn_comercial.smn_control_renovacion
where
	smn_control_renovacion_id = ${fld:id}
