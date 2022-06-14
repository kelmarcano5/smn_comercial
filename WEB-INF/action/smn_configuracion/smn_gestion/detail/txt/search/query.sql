select
	smn_comercial.smn_accion.smn_accion_id,
	smn_comercial.smn_accion.acc_codigo as acc_codigo_pl0,
select
	case
	when smn_comercial.smn_gestion.ges_estatus='AC' then '${lbl:b_active}'
	when smn_comercial.smn_gestion.ges_estatus='IN' then '${lbl:b_inactive}'
	end as ges_estatus_combo,
	smn_comercial.smn_gestion.*
from
	smn_comercial.smn_accion,
	smn_comercial.smn_gestion
where
	smn_comercial.smn_accion.smn_accion_id=smn_comercial.smn_gestion.smn_accion_id
	and
	smn_gestion_id = ${fld:id}
